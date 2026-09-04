procedure PlaceComponentPartsWithHarnesses;
var
    CurrentLib     : ISch_Lib;
    SchDoc         : ISch_Document;
    Component      : ISch_Component;
    SchPart        : ISch_Component;
    Pin            : ISch_Pin;
    HarnessConn    : ISch_HarnessConnector;
    Port           : ISch_Port;
    NetLabel       : ISch_Label;
    Wire           : ISch_Wire;
    WS             : IWorkspace;
    Prj            : IProject;
    NewDoc         : IDocument;
    i, j           : Integer;
    BaseName       : String;
    FirstPinName   : String;
    PinNameParts   : TStringList;
    X, Y           : Integer;
    PartIndex      : Integer;
begin
    // Get current library
    CurrentLib := SchServer.GetCurrentSchDocument;
    if CurrentLib = nil then Exit;

    // Get selected component
    Component := CurrentLib.CurrentSchComponent;
    if Component = nil then
    begin
        ShowMessage('No component selected in library');
        Exit;
    end;

    // Get workspace and project
    WS := GetWorkspace;
    if WS = nil then Exit;

    Prj := WS.DM_FocusedProject;
    if Prj = nil then Exit;

    // Create new schematic document
    NewDoc := Prj.DM_CreateNewDocument('Sch', 'Harness Schematic.SchDoc');
    if NewDoc = nil then
    begin
        ShowMessage('Failed to create new schematic document');
        Exit;
    end;

    // Get schematic document interface
    SchDoc := SchServer.GetSchDocumentByPath(NewDoc.DM_FullPath);
    if SchDoc = nil then
    begin
        ShowMessage('Failed to access schematic document interface');
        Exit;
    end;

    // Initial coordinates
    X := 1000;
    Y := 1000;
    PartIndex := 0;

    // Process all parts of the component
    for i := 0 to Component.PartCount - 1 do
    begin
        // Place component part
        SchPart := SchServer.SchObjectFactory(eComponent, eCreate_Default);
        SchPart.LibReference := Component.LibReference;
        SchPart.PartID := i + 1;
        SchPart.Location := Point(X, Y);
        SchDoc.RegisterSchObjectInContainer(SchPart);
        SchServer.RobotManager.SendMessage(SchDoc.c_MessageQueue, c_BroadCast, SCHM_PrimitiveRegistration, SchPart);

        // Get first pin name
        FirstPinName := '';
        for j := 0 to SchPart.PinCount - 1 do
        begin
            Pin := SchPart.Pins[j];
            if Pin.ShowName and (Pin.Name <> '') then
            begin
                FirstPinName := Pin.Name;
                Break;
            end;
        end;

        if FirstPinName = '' then Continue;

        // Extract base name from first pin
        PinNameParts := TStringList.Create;
        try
            PinNameParts.Delimiter := '_';
            PinNameParts.DelimitedText := FirstPinName;
            if PinNameParts.Count > 0 then
                BaseName := PinNameParts[0]
            else
                BaseName := FirstPinName;
        finally
            PinNameParts.Free;
        end;

        // Create harness connector
        HarnessConn := SchServer.SchObjectFactory(eHarnessConnector, eCreate_Default);
        HarnessConn.Location := Point(X + 1000, Y);
        HarnessConn.Orientation := eRotate0;
        HarnessConn.Height := SchPart.PinCount * 100;
        HarnessConn.Name := BaseName;

        // Add harness entries
        for j := 0 to SchPart.PinCount - 1 do
        begin
            Pin := SchPart.Pins[j];
            HarnessConn.AddHarnessEntry(Pin.Name, eHarnessEntryType_Signal);
        end;

        SchDoc.RegisterSchObjectInContainer(HarnessConn);
        SchServer.RobotManager.SendMessage(SchDoc.c_MessageQueue, c_BroadCast, SCHM_PrimitiveRegistration, HarnessConn);

        // Create port
        Port := SchServer.SchObjectFactory(ePort, eCreate_Default);
        Port.Location := Point(X + 2000, Y);
        Port.Orientation := eRotate0;
        Port.Name := BaseName;
        Port.IOType := ePortIOType_Unspecified;
        Port.Width := 100;
        SchDoc.RegisterSchObjectInContainer(Port);
        SchServer.RobotManager.SendMessage(SchDoc.c_MessageQueue, c_BroadCast, SCHM_PrimitiveRegistration, Port);

        // Connect pins to harness with net labels
        for j := 0 to SchPart.PinCount - 1 do
        begin
            Pin := SchPart.Pins[j];

            // Create net label
            NetLabel := SchServer.SchObjectFactory(eLabel, eCreate_Default);
            NetLabel.Text := Pin.Name;
            NetLabel.Location := Point(Pin.Location.X + 200, Pin.Location.Y);
            NetLabel.Orientation := eRotate0;
            NetLabel.IsMirrored := False;
            SchDoc.RegisterSchObjectInContainer(NetLabel);
            SchServer.RobotManager.SendMessage(SchDoc.c_MessageQueue, c_BroadCast, SCHM_PrimitiveRegistration, NetLabel);

            // Create wire from pin to harness
            Wire := SchServer.SchObjectFactory(eWire, eCreate_Default);
            Wire.Vertices := TObjectList.Create;
            Wire.Vertices.Add(Point(Pin.Location.X + 100, Pin.Location.Y));
            Wire.Vertices.Add(Point(HarnessConn.Location.X, Pin.Location.Y));
            SchDoc.RegisterSchObjectInContainer(Wire);
            SchServer.RobotManager.SendMessage(SchDoc.c_MessageQueue, c_BroadCast, SCHM_PrimitiveRegistration, Wire);
        end;

        // Connect harness to port
        Wire := SchServer.SchObjectFactory(eWire, eCreate_Default);
        Wire.Vertices := TObjectList.Create;
        Wire.Vertices.Add(Point(HarnessConn.Location.X + 100, Y));
        Wire.Vertices.Add(Point(Port.Location.X - 100, Y));
        SchDoc.RegisterSchObjectInContainer(Wire);
        SchServer.RobotManager.SendMessage(SchDoc.c_MessageQueue, c_BroadCast, SCHM_PrimitiveRegistration, Wire);

        // Update coordinates for next part
        Y := Y + 2000;
        Inc(PartIndex);
    end;

    // Refresh the schematic
    SchDoc.GraphicallyInvalidate;
    SchDoc.UpdateDisplayForCurrentSheet;

    // Save the new document
    NewDoc.DM_Save;
end;
