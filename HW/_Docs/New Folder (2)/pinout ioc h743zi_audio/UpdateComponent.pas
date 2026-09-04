{ Altium 24.2 Script - Documented API Usage }
{ References: }
{ 1. ISch_Component Interface - Altium API Documentation }
{ 2. ISch_Lib Methods - Altium Scripting Guide }
procedure UpdateComponent;
var
    SchLib       : ISch_Lib;
    Component    : ISch_Component;
    NewPartArr   : array[1..17] of ISch_Component;
    R            : ISch_Rectangle;
    TextObj      : ISch_TextFrame;
    PinArr       : array[1..144] of ISch_Pin;
    i            : Integer;
begin
    // Get current schematic library (Documented method)
    SchLib := SchServer.GetCurrentSchDocument;
    if SchLib = nil then
    begin
        ShowMessage('Please open a schematic library first');
        Exit;
    end;

    // If Component_1 not found, use first component
    if Component = nil then
    begin
        if SchLib.GetPrimitiveCount('Component') > 0 then
            Component := SchLib.GetPrimitiveAt('Component', 0)
        else
        begin
            ShowMessage('No components found in this library');
            Exit;
        end;
    end;
    
// OR //

    // Create a library component (a page of the library is created).
    Component := SchServer.SchObjectFactory(eSchComponent, eCreate_Default);
    If Component = Nil Then Exit;


    // Set up parameters for the library component.
    Component.CurrentPartID := 1;
    Component.DisplayMode   := 0;

    // Define the LibReference and add the component to the library.
    Component.LibReference := 'Custom';
    

    // Initialize component as multi-part (Documented methods)
    Component.ComponentDescription := 'MCU with 144 pins' + #13#10 + 'Grouped by function';
    Component.Designator.Text      := 'U?';
    Component.LibReference := 'MCU_pinout';
    Component.PartCount := 17;
    
    

    // Part 1: DEBUG

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(3+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 1;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '1' + ': ' + 'DEBUG';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 1;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '109', 'DEBUG_JTCK-SWCLK'
    PinArr[109] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[109] = Nil Then Exit;
    PinArr[109].Designator := '109';
    PinArr[109].Name := 'DEBUG_JTCK-SWCLK';
    PinArr[109].OwnerPartId := 1;
    PinArr[109].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[109].Orientation := eRotate180;
    PinArr[109].Color       := $000000;
    //PinArr[109].ShowName := True;
    //PinArr[109].ShowDesignator := True;
    //PinArr[109].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[109]);
    // Pin '133', 'DEBUG_JTDO-SWO'
    PinArr[133] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[133] = Nil Then Exit;
    PinArr[133].Designator := '133';
    PinArr[133].Name := 'DEBUG_JTDO-SWO';
    PinArr[133].OwnerPartId := 1;
    PinArr[133].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[133].Orientation := eRotate180;
    PinArr[133].Color       := $000000;
    //PinArr[133].ShowName := True;
    //PinArr[133].ShowDesignator := True;
    //PinArr[133].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[133]);
    // Pin '105', 'DEBUG_JTMS-SWDIO'
    PinArr[105] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[105] = Nil Then Exit;
    PinArr[105].Designator := '105';
    PinArr[105].Name := 'DEBUG_JTMS-SWDIO';
    PinArr[105].OwnerPartId := 1;
    PinArr[105].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[105].Orientation := eRotate180;
    PinArr[105].Color       := $000000;
    //PinArr[105].ShowName := True;
    //PinArr[105].ShowDesignator := True;
    //PinArr[105].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[105]);

    

    // Part 2: FMC

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(40+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 2;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '2' + ': ' + 'FMC';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 2;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '10', 'FMC_A0'
    PinArr[10] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[10] = Nil Then Exit;
    PinArr[10].Designator := '10';
    PinArr[10].Name := 'FMC_A0';
    PinArr[10].OwnerPartId := 2;
    PinArr[10].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[10].Orientation := eRotate180;
    PinArr[10].Color       := $000000;
    //PinArr[10].ShowName := True;
    //PinArr[10].ShowDesignator := True;
    //PinArr[10].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[10]);
    // Pin '11', 'FMC_A1'
    PinArr[11] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[11] = Nil Then Exit;
    PinArr[11].Designator := '11';
    PinArr[11].Name := 'FMC_A1';
    PinArr[11].OwnerPartId := 2;
    PinArr[11].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[11].Orientation := eRotate180;
    PinArr[11].Color       := $000000;
    //PinArr[11].ShowName := True;
    //PinArr[11].ShowDesignator := True;
    //PinArr[11].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[11]);
    // Pin '12', 'FMC_A2'
    PinArr[12] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[12] = Nil Then Exit;
    PinArr[12].Designator := '12';
    PinArr[12].Name := 'FMC_A2';
    PinArr[12].OwnerPartId := 2;
    PinArr[12].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[12].Orientation := eRotate180;
    PinArr[12].Color       := $000000;
    //PinArr[12].ShowName := True;
    //PinArr[12].ShowDesignator := True;
    //PinArr[12].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[12]);
    // Pin '13', 'FMC_A3'
    PinArr[13] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[13] = Nil Then Exit;
    PinArr[13].Designator := '13';
    PinArr[13].Name := 'FMC_A3';
    PinArr[13].OwnerPartId := 2;
    PinArr[13].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[13].Orientation := eRotate180;
    PinArr[13].Color       := $000000;
    //PinArr[13].ShowName := True;
    //PinArr[13].ShowDesignator := True;
    //PinArr[13].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[13]);
    // Pin '14', 'FMC_A4'
    PinArr[14] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[14] = Nil Then Exit;
    PinArr[14].Designator := '14';
    PinArr[14].Name := 'FMC_A4';
    PinArr[14].OwnerPartId := 2;
    PinArr[14].Location := Point(MilsToCoord(0), MilsToCoord(-500));
    PinArr[14].Orientation := eRotate180;
    PinArr[14].Color       := $000000;
    //PinArr[14].ShowName := True;
    //PinArr[14].ShowDesignator := True;
    //PinArr[14].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[14]);
    // Pin '15', 'FMC_A5'
    PinArr[15] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[15] = Nil Then Exit;
    PinArr[15].Designator := '15';
    PinArr[15].Name := 'FMC_A5';
    PinArr[15].OwnerPartId := 2;
    PinArr[15].Location := Point(MilsToCoord(0), MilsToCoord(-600));
    PinArr[15].Orientation := eRotate180;
    PinArr[15].Color       := $000000;
    //PinArr[15].ShowName := True;
    //PinArr[15].ShowDesignator := True;
    //PinArr[15].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[15]);
    // Pin '50', 'FMC_A6'
    PinArr[50] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[50] = Nil Then Exit;
    PinArr[50].Designator := '50';
    PinArr[50].Name := 'FMC_A6';
    PinArr[50].OwnerPartId := 2;
    PinArr[50].Location := Point(MilsToCoord(0), MilsToCoord(-700));
    PinArr[50].Orientation := eRotate180;
    PinArr[50].Color       := $000000;
    //PinArr[50].ShowName := True;
    //PinArr[50].ShowDesignator := True;
    //PinArr[50].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[50]);
    // Pin '53', 'FMC_A7'
    PinArr[53] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[53] = Nil Then Exit;
    PinArr[53].Designator := '53';
    PinArr[53].Name := 'FMC_A7';
    PinArr[53].OwnerPartId := 2;
    PinArr[53].Location := Point(MilsToCoord(0), MilsToCoord(-800));
    PinArr[53].Orientation := eRotate180;
    PinArr[53].Color       := $000000;
    //PinArr[53].ShowName := True;
    //PinArr[53].ShowDesignator := True;
    //PinArr[53].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[53]);
    // Pin '54', 'FMC_A8'
    PinArr[54] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[54] = Nil Then Exit;
    PinArr[54].Designator := '54';
    PinArr[54].Name := 'FMC_A8';
    PinArr[54].OwnerPartId := 2;
    PinArr[54].Location := Point(MilsToCoord(0), MilsToCoord(-900));
    PinArr[54].Orientation := eRotate180;
    PinArr[54].Color       := $000000;
    //PinArr[54].ShowName := True;
    //PinArr[54].ShowDesignator := True;
    //PinArr[54].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[54]);
    // Pin '55', 'FMC_A9'
    PinArr[55] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[55] = Nil Then Exit;
    PinArr[55].Designator := '55';
    PinArr[55].Name := 'FMC_A9';
    PinArr[55].OwnerPartId := 2;
    PinArr[55].Location := Point(MilsToCoord(0), MilsToCoord(-1000));
    PinArr[55].Orientation := eRotate180;
    PinArr[55].Color       := $000000;
    //PinArr[55].ShowName := True;
    //PinArr[55].ShowDesignator := True;
    //PinArr[55].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[55]);
    // Pin '56', 'FMC_A10'
    PinArr[56] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[56] = Nil Then Exit;
    PinArr[56].Designator := '56';
    PinArr[56].Name := 'FMC_A10';
    PinArr[56].OwnerPartId := 2;
    PinArr[56].Location := Point(MilsToCoord(0), MilsToCoord(-1100));
    PinArr[56].Orientation := eRotate180;
    PinArr[56].Color       := $000000;
    //PinArr[56].ShowName := True;
    //PinArr[56].ShowDesignator := True;
    //PinArr[56].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[56]);
    // Pin '57', 'FMC_A11'
    PinArr[57] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[57] = Nil Then Exit;
    PinArr[57].Designator := '57';
    PinArr[57].Name := 'FMC_A11';
    PinArr[57].OwnerPartId := 2;
    PinArr[57].Location := Point(MilsToCoord(0), MilsToCoord(-1200));
    PinArr[57].Orientation := eRotate180;
    PinArr[57].Color       := $000000;
    //PinArr[57].ShowName := True;
    //PinArr[57].ShowDesignator := True;
    //PinArr[57].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[57]);
    // Pin '89', 'FMC_BA0'
    PinArr[89] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[89] = Nil Then Exit;
    PinArr[89].Designator := '89';
    PinArr[89].Name := 'FMC_BA0';
    PinArr[89].OwnerPartId := 2;
    PinArr[89].Location := Point(MilsToCoord(0), MilsToCoord(-1300));
    PinArr[89].Orientation := eRotate180;
    PinArr[89].Color       := $000000;
    //PinArr[89].ShowName := True;
    //PinArr[89].ShowDesignator := True;
    //PinArr[89].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[89]);
    // Pin '90', 'FMC_BA1'
    PinArr[90] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[90] = Nil Then Exit;
    PinArr[90].Designator := '90';
    PinArr[90].Name := 'FMC_BA1';
    PinArr[90].OwnerPartId := 2;
    PinArr[90].Location := Point(MilsToCoord(0), MilsToCoord(-1400));
    PinArr[90].Orientation := eRotate180;
    PinArr[90].Color       := $000000;
    //PinArr[90].ShowName := True;
    //PinArr[90].ShowDesignator := True;
    //PinArr[90].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[90]);
    // Pin '85', 'FMC_D0'
    PinArr[85] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[85] = Nil Then Exit;
    PinArr[85].Designator := '85';
    PinArr[85].Name := 'FMC_D0';
    PinArr[85].OwnerPartId := 2;
    PinArr[85].Location := Point(MilsToCoord(0), MilsToCoord(-1500));
    PinArr[85].Orientation := eRotate180;
    PinArr[85].Color       := $000000;
    //PinArr[85].ShowName := True;
    //PinArr[85].ShowDesignator := True;
    //PinArr[85].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[85]);
    // Pin '86', 'FMC_D1'
    PinArr[86] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[86] = Nil Then Exit;
    PinArr[86].Designator := '86';
    PinArr[86].Name := 'FMC_D1';
    PinArr[86].OwnerPartId := 2;
    PinArr[86].Location := Point(MilsToCoord(0), MilsToCoord(-1600));
    PinArr[86].Orientation := eRotate180;
    PinArr[86].Color       := $000000;
    //PinArr[86].ShowName := True;
    //PinArr[86].ShowDesignator := True;
    //PinArr[86].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[86]);
    // Pin '114', 'FMC_D2'
    PinArr[114] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[114] = Nil Then Exit;
    PinArr[114].Designator := '114';
    PinArr[114].Name := 'FMC_D2';
    PinArr[114].OwnerPartId := 2;
    PinArr[114].Location := Point(MilsToCoord(0), MilsToCoord(-1700));
    PinArr[114].Orientation := eRotate180;
    PinArr[114].Color       := $000000;
    //PinArr[114].ShowName := True;
    //PinArr[114].ShowDesignator := True;
    //PinArr[114].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[114]);
    // Pin '115', 'FMC_D3'
    PinArr[115] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[115] = Nil Then Exit;
    PinArr[115].Designator := '115';
    PinArr[115].Name := 'FMC_D3';
    PinArr[115].OwnerPartId := 2;
    PinArr[115].Location := Point(MilsToCoord(0), MilsToCoord(-1800));
    PinArr[115].Orientation := eRotate180;
    PinArr[115].Color       := $000000;
    //PinArr[115].ShowName := True;
    //PinArr[115].ShowDesignator := True;
    //PinArr[115].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[115]);
    // Pin '58', 'FMC_D4'
    PinArr[58] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[58] = Nil Then Exit;
    PinArr[58].Designator := '58';
    PinArr[58].Name := 'FMC_D4';
    PinArr[58].OwnerPartId := 2;
    PinArr[58].Location := Point(MilsToCoord(0), MilsToCoord(-1900));
    PinArr[58].Orientation := eRotate180;
    PinArr[58].Color       := $000000;
    //PinArr[58].ShowName := True;
    //PinArr[58].ShowDesignator := True;
    //PinArr[58].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[58]);
    // Pin '59', 'FMC_D5'
    PinArr[59] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[59] = Nil Then Exit;
    PinArr[59].Designator := '59';
    PinArr[59].Name := 'FMC_D5';
    PinArr[59].OwnerPartId := 2;
    PinArr[59].Location := Point(MilsToCoord(0), MilsToCoord(-2000));
    PinArr[59].Orientation := eRotate180;
    PinArr[59].Color       := $000000;
    //PinArr[59].ShowName := True;
    //PinArr[59].ShowDesignator := True;
    //PinArr[59].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[59]);
    // Pin '60', 'FMC_D6'
    PinArr[60] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[60] = Nil Then Exit;
    PinArr[60].Designator := '60';
    PinArr[60].Name := 'FMC_D6';
    PinArr[60].OwnerPartId := 2;
    PinArr[60].Location := Point(MilsToCoord(0), MilsToCoord(-2100));
    PinArr[60].Orientation := eRotate180;
    PinArr[60].Color       := $000000;
    //PinArr[60].ShowName := True;
    //PinArr[60].ShowDesignator := True;
    //PinArr[60].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[60]);
    // Pin '63', 'FMC_D7'
    PinArr[63] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[63] = Nil Then Exit;
    PinArr[63].Designator := '63';
    PinArr[63].Name := 'FMC_D7';
    PinArr[63].OwnerPartId := 2;
    PinArr[63].Location := Point(MilsToCoord(0), MilsToCoord(-2200));
    PinArr[63].Orientation := eRotate180;
    PinArr[63].Color       := $000000;
    //PinArr[63].ShowName := True;
    //PinArr[63].ShowDesignator := True;
    //PinArr[63].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[63]);
    // Pin '64', 'FMC_D8'
    PinArr[64] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[64] = Nil Then Exit;
    PinArr[64].Designator := '64';
    PinArr[64].Name := 'FMC_D8';
    PinArr[64].OwnerPartId := 2;
    PinArr[64].Location := Point(MilsToCoord(0), MilsToCoord(-2300));
    PinArr[64].Orientation := eRotate180;
    PinArr[64].Color       := $000000;
    //PinArr[64].ShowName := True;
    //PinArr[64].ShowDesignator := True;
    //PinArr[64].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[64]);
    // Pin '65', 'FMC_D9'
    PinArr[65] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[65] = Nil Then Exit;
    PinArr[65].Designator := '65';
    PinArr[65].Name := 'FMC_D9';
    PinArr[65].OwnerPartId := 2;
    PinArr[65].Location := Point(MilsToCoord(0), MilsToCoord(-2400));
    PinArr[65].Orientation := eRotate180;
    PinArr[65].Color       := $000000;
    //PinArr[65].ShowName := True;
    //PinArr[65].ShowDesignator := True;
    //PinArr[65].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[65]);
    // Pin '66', 'FMC_D10'
    PinArr[66] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[66] = Nil Then Exit;
    PinArr[66].Designator := '66';
    PinArr[66].Name := 'FMC_D10';
    PinArr[66].OwnerPartId := 2;
    PinArr[66].Location := Point(MilsToCoord(0), MilsToCoord(-2500));
    PinArr[66].Orientation := eRotate180;
    PinArr[66].Color       := $000000;
    //PinArr[66].ShowName := True;
    //PinArr[66].ShowDesignator := True;
    //PinArr[66].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[66]);
    // Pin '67', 'FMC_D11'
    PinArr[67] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[67] = Nil Then Exit;
    PinArr[67].Designator := '67';
    PinArr[67].Name := 'FMC_D11';
    PinArr[67].OwnerPartId := 2;
    PinArr[67].Location := Point(MilsToCoord(0), MilsToCoord(-2600));
    PinArr[67].Orientation := eRotate180;
    PinArr[67].Color       := $000000;
    //PinArr[67].ShowName := True;
    //PinArr[67].ShowDesignator := True;
    //PinArr[67].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[67]);
    // Pin '68', 'FMC_D12'
    PinArr[68] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[68] = Nil Then Exit;
    PinArr[68].Designator := '68';
    PinArr[68].Name := 'FMC_D12';
    PinArr[68].OwnerPartId := 2;
    PinArr[68].Location := Point(MilsToCoord(0), MilsToCoord(-2700));
    PinArr[68].Orientation := eRotate180;
    PinArr[68].Color       := $000000;
    //PinArr[68].ShowName := True;
    //PinArr[68].ShowDesignator := True;
    //PinArr[68].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[68]);
    // Pin '77', 'FMC_D13'
    PinArr[77] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[77] = Nil Then Exit;
    PinArr[77].Designator := '77';
    PinArr[77].Name := 'FMC_D13';
    PinArr[77].OwnerPartId := 2;
    PinArr[77].Location := Point(MilsToCoord(0), MilsToCoord(-2800));
    PinArr[77].Orientation := eRotate180;
    PinArr[77].Color       := $000000;
    //PinArr[77].ShowName := True;
    //PinArr[77].ShowDesignator := True;
    //PinArr[77].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[77]);
    // Pin '78', 'FMC_D14'
    PinArr[78] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[78] = Nil Then Exit;
    PinArr[78].Designator := '78';
    PinArr[78].Name := 'FMC_D14';
    PinArr[78].OwnerPartId := 2;
    PinArr[78].Location := Point(MilsToCoord(0), MilsToCoord(-2900));
    PinArr[78].Orientation := eRotate180;
    PinArr[78].Color       := $000000;
    //PinArr[78].ShowName := True;
    //PinArr[78].ShowDesignator := True;
    //PinArr[78].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[78]);
    // Pin '79', 'FMC_D15'
    PinArr[79] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[79] = Nil Then Exit;
    PinArr[79].Designator := '79';
    PinArr[79].Name := 'FMC_D15';
    PinArr[79].OwnerPartId := 2;
    PinArr[79].Location := Point(MilsToCoord(0), MilsToCoord(-3000));
    PinArr[79].Orientation := eRotate180;
    PinArr[79].Color       := $000000;
    //PinArr[79].ShowName := True;
    //PinArr[79].ShowDesignator := True;
    //PinArr[79].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[79]);
    // Pin '141', 'FMC_NBL0'
    PinArr[141] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[141] = Nil Then Exit;
    PinArr[141].Designator := '141';
    PinArr[141].Name := 'FMC_NBL0';
    PinArr[141].OwnerPartId := 2;
    PinArr[141].Location := Point(MilsToCoord(0), MilsToCoord(-3100));
    PinArr[141].Orientation := eRotate180;
    PinArr[141].Color       := $000000;
    //PinArr[141].ShowName := True;
    //PinArr[141].ShowDesignator := True;
    //PinArr[141].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[141]);
    // Pin '142', 'FMC_NBL1'
    PinArr[142] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[142] = Nil Then Exit;
    PinArr[142].Designator := '142';
    PinArr[142].Name := 'FMC_NBL1';
    PinArr[142].OwnerPartId := 2;
    PinArr[142].Location := Point(MilsToCoord(0), MilsToCoord(-3200));
    PinArr[142].Orientation := eRotate180;
    PinArr[142].Color       := $000000;
    //PinArr[142].ShowName := True;
    //PinArr[142].ShowDesignator := True;
    //PinArr[142].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[142]);
    // Pin '29', 'FMC_SDCKE0'
    PinArr[29] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[29] = Nil Then Exit;
    PinArr[29].Designator := '29';
    PinArr[29].Name := 'FMC_SDCKE0';
    PinArr[29].OwnerPartId := 2;
    PinArr[29].Location := Point(MilsToCoord(0), MilsToCoord(-3300));
    PinArr[29].Orientation := eRotate180;
    PinArr[29].Color       := $000000;
    //PinArr[29].ShowName := True;
    //PinArr[29].ShowDesignator := True;
    //PinArr[29].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[29]);
    // Pin '135', 'FMC_SDCKE1'
    PinArr[135] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[135] = Nil Then Exit;
    PinArr[135].Designator := '135';
    PinArr[135].Name := 'FMC_SDCKE1';
    PinArr[135].OwnerPartId := 2;
    PinArr[135].Location := Point(MilsToCoord(0), MilsToCoord(-3400));
    PinArr[135].Orientation := eRotate180;
    PinArr[135].Color       := $000000;
    //PinArr[135].ShowName := True;
    //PinArr[135].ShowDesignator := True;
    //PinArr[135].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[135]);
    // Pin '93', 'FMC_SDCLK'
    PinArr[93] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[93] = Nil Then Exit;
    PinArr[93].Designator := '93';
    PinArr[93].Name := 'FMC_SDCLK';
    PinArr[93].OwnerPartId := 2;
    PinArr[93].Location := Point(MilsToCoord(0), MilsToCoord(-3500));
    PinArr[93].Orientation := eRotate180;
    PinArr[93].Color       := $000000;
    //PinArr[93].ShowName := True;
    //PinArr[93].ShowDesignator := True;
    //PinArr[93].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[93]);
    // Pin '132', 'FMC_SDNCAS'
    PinArr[132] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[132] = Nil Then Exit;
    PinArr[132].Designator := '132';
    PinArr[132].Name := 'FMC_SDNCAS';
    PinArr[132].OwnerPartId := 2;
    PinArr[132].Location := Point(MilsToCoord(0), MilsToCoord(-3600));
    PinArr[132].Orientation := eRotate180;
    PinArr[132].Color       := $000000;
    //PinArr[132].ShowName := True;
    //PinArr[132].ShowDesignator := True;
    //PinArr[132].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[132]);
    // Pin '28', 'FMC_SDNE0'
    PinArr[28] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[28] = Nil Then Exit;
    PinArr[28].Designator := '28';
    PinArr[28].Name := 'FMC_SDNE0';
    PinArr[28].OwnerPartId := 2;
    PinArr[28].Location := Point(MilsToCoord(0), MilsToCoord(-3700));
    PinArr[28].Orientation := eRotate180;
    PinArr[28].Color       := $000000;
    //PinArr[28].ShowName := True;
    //PinArr[28].ShowDesignator := True;
    //PinArr[28].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[28]);
    // Pin '136', 'FMC_SDNE1'
    PinArr[136] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[136] = Nil Then Exit;
    PinArr[136].Designator := '136';
    PinArr[136].Name := 'FMC_SDNE1';
    PinArr[136].OwnerPartId := 2;
    PinArr[136].Location := Point(MilsToCoord(0), MilsToCoord(-3800));
    PinArr[136].Orientation := eRotate180;
    PinArr[136].Color       := $000000;
    //PinArr[136].ShowName := True;
    //PinArr[136].ShowDesignator := True;
    //PinArr[136].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[136]);
    // Pin '49', 'FMC_SDNRAS'
    PinArr[49] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[49] = Nil Then Exit;
    PinArr[49].Designator := '49';
    PinArr[49].Name := 'FMC_SDNRAS';
    PinArr[49].OwnerPartId := 2;
    PinArr[49].Location := Point(MilsToCoord(0), MilsToCoord(-3900));
    PinArr[49].Orientation := eRotate180;
    PinArr[49].Color       := $000000;
    //PinArr[49].ShowName := True;
    //PinArr[49].ShowDesignator := True;
    //PinArr[49].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[49]);
    // Pin '43', 'FMC_SDNWE'
    PinArr[43] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[43] = Nil Then Exit;
    PinArr[43].Designator := '43';
    PinArr[43].Name := 'FMC_SDNWE';
    PinArr[43].OwnerPartId := 2;
    PinArr[43].Location := Point(MilsToCoord(0), MilsToCoord(-4000));
    PinArr[43].Orientation := eRotate180;
    PinArr[43].Color       := $000000;
    //PinArr[43].ShowName := True;
    //PinArr[43].ShowDesignator := True;
    //PinArr[43].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[43]);

    

    // Part 3: GPIO

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(3+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 3;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '3' + ': ' + 'GPIO';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 3;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '7', 'GPIO_Output'
    PinArr[7] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[7] = Nil Then Exit;
    PinArr[7].Designator := '7';
    PinArr[7].Name := 'GPIO_Output';
    PinArr[7].OwnerPartId := 3;
    PinArr[7].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[7].Orientation := eRotate180;
    PinArr[7].Color       := $000000;
    //PinArr[7].ShowName := True;
    //PinArr[7].ShowDesignator := True;
    //PinArr[7].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[7]);
    // Pin '103', 'GPIO_Output'
    PinArr[103] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[103] = Nil Then Exit;
    PinArr[103].Designator := '103';
    PinArr[103].Name := 'GPIO_Output';
    PinArr[103].OwnerPartId := 3;
    PinArr[103].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[103].Orientation := eRotate180;
    PinArr[103].Color       := $000000;
    //PinArr[103].ShowName := True;
    //PinArr[103].ShowDesignator := True;
    //PinArr[103].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[103]);
    // Pin '104', 'GPIO_Output'
    PinArr[104] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[104] = Nil Then Exit;
    PinArr[104].Designator := '104';
    PinArr[104].Name := 'GPIO_Output';
    PinArr[104].OwnerPartId := 3;
    PinArr[104].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[104].Orientation := eRotate180;
    PinArr[104].Color       := $000000;
    //PinArr[104].ShowName := True;
    //PinArr[104].ShowDesignator := True;
    //PinArr[104].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[104]);

    

    // Part 4: GROUND

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(9+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 4;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '4' + ': ' + 'GROUND';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 4;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '16', 'VSS'
    PinArr[16] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[16] = Nil Then Exit;
    PinArr[16].Designator := '16';
    PinArr[16].Name := 'VSS';
    PinArr[16].OwnerPartId := 4;
    PinArr[16].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[16].Orientation := eRotate180;
    PinArr[16].Color       := $000000;
    //PinArr[16].ShowName := True;
    //PinArr[16].ShowDesignator := True;
    //PinArr[16].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[16]);
    // Pin '38', 'VSS'
    PinArr[38] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[38] = Nil Then Exit;
    PinArr[38].Designator := '38';
    PinArr[38].Name := 'VSS';
    PinArr[38].OwnerPartId := 4;
    PinArr[38].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[38].Orientation := eRotate180;
    PinArr[38].Color       := $000000;
    //PinArr[38].ShowName := True;
    //PinArr[38].ShowDesignator := True;
    //PinArr[38].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[38]);
    // Pin '51', 'VSS'
    PinArr[51] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[51] = Nil Then Exit;
    PinArr[51].Designator := '51';
    PinArr[51].Name := 'VSS';
    PinArr[51].OwnerPartId := 4;
    PinArr[51].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[51].Orientation := eRotate180;
    PinArr[51].Color       := $000000;
    //PinArr[51].ShowName := True;
    //PinArr[51].ShowDesignator := True;
    //PinArr[51].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[51]);
    // Pin '61', 'VSS'
    PinArr[61] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[61] = Nil Then Exit;
    PinArr[61].Designator := '61';
    PinArr[61].Name := 'VSS';
    PinArr[61].OwnerPartId := 4;
    PinArr[61].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[61].Orientation := eRotate180;
    PinArr[61].Color       := $000000;
    //PinArr[61].ShowName := True;
    //PinArr[61].ShowDesignator := True;
    //PinArr[61].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[61]);
    // Pin '83', 'VSS'
    PinArr[83] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[83] = Nil Then Exit;
    PinArr[83].Designator := '83';
    PinArr[83].Name := 'VSS';
    PinArr[83].OwnerPartId := 4;
    PinArr[83].Location := Point(MilsToCoord(0), MilsToCoord(-500));
    PinArr[83].Orientation := eRotate180;
    PinArr[83].Color       := $000000;
    //PinArr[83].ShowName := True;
    //PinArr[83].ShowDesignator := True;
    //PinArr[83].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[83]);
    // Pin '94', 'VSS'
    PinArr[94] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[94] = Nil Then Exit;
    PinArr[94].Designator := '94';
    PinArr[94].Name := 'VSS';
    PinArr[94].OwnerPartId := 4;
    PinArr[94].Location := Point(MilsToCoord(0), MilsToCoord(-600));
    PinArr[94].Orientation := eRotate180;
    PinArr[94].Color       := $000000;
    //PinArr[94].ShowName := True;
    //PinArr[94].ShowDesignator := True;
    //PinArr[94].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[94]);
    // Pin '107', 'VSS'
    PinArr[107] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[107] = Nil Then Exit;
    PinArr[107].Designator := '107';
    PinArr[107].Name := 'VSS';
    PinArr[107].OwnerPartId := 4;
    PinArr[107].Location := Point(MilsToCoord(0), MilsToCoord(-700));
    PinArr[107].Orientation := eRotate180;
    PinArr[107].Color       := $000000;
    //PinArr[107].ShowName := True;
    //PinArr[107].ShowDesignator := True;
    //PinArr[107].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[107]);
    // Pin '120', 'VSS'
    PinArr[120] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[120] = Nil Then Exit;
    PinArr[120].Designator := '120';
    PinArr[120].Name := 'VSS';
    PinArr[120].OwnerPartId := 4;
    PinArr[120].Location := Point(MilsToCoord(0), MilsToCoord(-800));
    PinArr[120].Orientation := eRotate180;
    PinArr[120].Color       := $000000;
    //PinArr[120].ShowName := True;
    //PinArr[120].ShowDesignator := True;
    //PinArr[120].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[120]);
    // Pin '130', 'VSS'
    PinArr[130] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[130] = Nil Then Exit;
    PinArr[130].Designator := '130';
    PinArr[130].Name := 'VSS';
    PinArr[130].OwnerPartId := 4;
    PinArr[130].Location := Point(MilsToCoord(0), MilsToCoord(-900));
    PinArr[130].Orientation := eRotate180;
    PinArr[130].Color       := $000000;
    //PinArr[130].ShowName := True;
    //PinArr[130].ShowDesignator := True;
    //PinArr[130].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[130]);

    

    // Part 5: I2C1

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(2+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 5;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '5' + ': ' + 'I2C1';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 5;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '139', 'I2C1_SCL'
    PinArr[139] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[139] = Nil Then Exit;
    PinArr[139].Designator := '139';
    PinArr[139].Name := 'I2C1_SCL';
    PinArr[139].OwnerPartId := 5;
    PinArr[139].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[139].Orientation := eRotate180;
    PinArr[139].Color       := $000000;
    //PinArr[139].ShowName := True;
    //PinArr[139].ShowDesignator := True;
    //PinArr[139].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[139]);
    // Pin '140', 'I2C1_SDA'
    PinArr[140] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[140] = Nil Then Exit;
    PinArr[140].Designator := '140';
    PinArr[140].Name := 'I2C1_SDA';
    PinArr[140].OwnerPartId := 5;
    PinArr[140].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[140].Orientation := eRotate180;
    PinArr[140].Color       := $000000;
    //PinArr[140].ShowName := True;
    //PinArr[140].ShowDesignator := True;
    //PinArr[140].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[140]);

    

    // Part 6: I2S

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(1+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 6;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '6' + ': ' + 'I2S';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 6;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '99', 'I2S_CKIN'
    PinArr[99] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[99] = Nil Then Exit;
    PinArr[99].Designator := '99';
    PinArr[99].Name := 'I2S_CKIN';
    PinArr[99].OwnerPartId := 6;
    PinArr[99].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[99].Orientation := eRotate180;
    PinArr[99].Color       := $000000;
    //PinArr[99].ShowName := True;
    //PinArr[99].ShowDesignator := True;
    //PinArr[99].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[99]);

    

    // Part 7: I2S3

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(5+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 7;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '7' + ': ' + 'I2S3';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 7;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '111', 'I2S3_CK'
    PinArr[111] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[111] = Nil Then Exit;
    PinArr[111].Designator := '111';
    PinArr[111].Name := 'I2S3_CK';
    PinArr[111].OwnerPartId := 7;
    PinArr[111].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[111].Orientation := eRotate180;
    PinArr[111].Color       := $000000;
    //PinArr[111].ShowName := True;
    //PinArr[111].ShowDesignator := True;
    //PinArr[111].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[111]);
    // Pin '97', 'I2S3_MCK'
    PinArr[97] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[97] = Nil Then Exit;
    PinArr[97].Designator := '97';
    PinArr[97].Name := 'I2S3_MCK';
    PinArr[97].OwnerPartId := 7;
    PinArr[97].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[97].Orientation := eRotate180;
    PinArr[97].Color       := $000000;
    //PinArr[97].ShowName := True;
    //PinArr[97].ShowDesignator := True;
    //PinArr[97].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[97]);
    // Pin '112', 'I2S3_SDI'
    PinArr[112] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[112] = Nil Then Exit;
    PinArr[112].Designator := '112';
    PinArr[112].Name := 'I2S3_SDI';
    PinArr[112].OwnerPartId := 7;
    PinArr[112].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[112].Orientation := eRotate180;
    PinArr[112].Color       := $000000;
    //PinArr[112].ShowName := True;
    //PinArr[112].ShowDesignator := True;
    //PinArr[112].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[112]);
    // Pin '113', 'I2S3_SDO'
    PinArr[113] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[113] = Nil Then Exit;
    PinArr[113].Designator := '113';
    PinArr[113].Name := 'I2S3_SDO';
    PinArr[113].OwnerPartId := 7;
    PinArr[113].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[113].Orientation := eRotate180;
    PinArr[113].Color       := $000000;
    //PinArr[113].ShowName := True;
    //PinArr[113].ShowDesignator := True;
    //PinArr[113].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[113]);
    // Pin '110', 'I2S3_WS'
    PinArr[110] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[110] = Nil Then Exit;
    PinArr[110].Designator := '110';
    PinArr[110].Name := 'I2S3_WS';
    PinArr[110].OwnerPartId := 7;
    PinArr[110].Location := Point(MilsToCoord(0), MilsToCoord(-500));
    PinArr[110].Orientation := eRotate180;
    PinArr[110].Color       := $000000;
    //PinArr[110].ShowName := True;
    //PinArr[110].ShowDesignator := True;
    //PinArr[110].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[110]);

    

    // Part 8: POWER

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(11+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 8;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '8' + ': ' + 'POWER';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 8;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '17', 'VDD'
    PinArr[17] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[17] = Nil Then Exit;
    PinArr[17].Designator := '17';
    PinArr[17].Name := 'VDD';
    PinArr[17].OwnerPartId := 8;
    PinArr[17].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[17].Orientation := eRotate180;
    PinArr[17].Color       := $000000;
    //PinArr[17].ShowName := True;
    //PinArr[17].ShowDesignator := True;
    //PinArr[17].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[17]);
    // Pin '30', 'VDD'
    PinArr[30] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[30] = Nil Then Exit;
    PinArr[30].Designator := '30';
    PinArr[30].Name := 'VDD';
    PinArr[30].OwnerPartId := 8;
    PinArr[30].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[30].Orientation := eRotate180;
    PinArr[30].Color       := $000000;
    //PinArr[30].ShowName := True;
    //PinArr[30].ShowDesignator := True;
    //PinArr[30].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[30]);
    // Pin '39', 'VDD'
    PinArr[39] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[39] = Nil Then Exit;
    PinArr[39].Designator := '39';
    PinArr[39].Name := 'VDD';
    PinArr[39].OwnerPartId := 8;
    PinArr[39].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[39].Orientation := eRotate180;
    PinArr[39].Color       := $000000;
    //PinArr[39].ShowName := True;
    //PinArr[39].ShowDesignator := True;
    //PinArr[39].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[39]);
    // Pin '52', 'VDD'
    PinArr[52] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[52] = Nil Then Exit;
    PinArr[52].Designator := '52';
    PinArr[52].Name := 'VDD';
    PinArr[52].OwnerPartId := 8;
    PinArr[52].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[52].Orientation := eRotate180;
    PinArr[52].Color       := $000000;
    //PinArr[52].ShowName := True;
    //PinArr[52].ShowDesignator := True;
    //PinArr[52].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[52]);
    // Pin '62', 'VDD'
    PinArr[62] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[62] = Nil Then Exit;
    PinArr[62].Designator := '62';
    PinArr[62].Name := 'VDD';
    PinArr[62].OwnerPartId := 8;
    PinArr[62].Location := Point(MilsToCoord(0), MilsToCoord(-500));
    PinArr[62].Orientation := eRotate180;
    PinArr[62].Color       := $000000;
    //PinArr[62].ShowName := True;
    //PinArr[62].ShowDesignator := True;
    //PinArr[62].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[62]);
    // Pin '72', 'VDD'
    PinArr[72] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[72] = Nil Then Exit;
    PinArr[72].Designator := '72';
    PinArr[72].Name := 'VDD';
    PinArr[72].OwnerPartId := 8;
    PinArr[72].Location := Point(MilsToCoord(0), MilsToCoord(-600));
    PinArr[72].Orientation := eRotate180;
    PinArr[72].Color       := $000000;
    //PinArr[72].ShowName := True;
    //PinArr[72].ShowDesignator := True;
    //PinArr[72].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[72]);
    // Pin '84', 'VDD'
    PinArr[84] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[84] = Nil Then Exit;
    PinArr[84].Designator := '84';
    PinArr[84].Name := 'VDD';
    PinArr[84].OwnerPartId := 8;
    PinArr[84].Location := Point(MilsToCoord(0), MilsToCoord(-700));
    PinArr[84].Orientation := eRotate180;
    PinArr[84].Color       := $000000;
    //PinArr[84].ShowName := True;
    //PinArr[84].ShowDesignator := True;
    //PinArr[84].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[84]);
    // Pin '108', 'VDD'
    PinArr[108] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[108] = Nil Then Exit;
    PinArr[108].Designator := '108';
    PinArr[108].Name := 'VDD';
    PinArr[108].OwnerPartId := 8;
    PinArr[108].Location := Point(MilsToCoord(0), MilsToCoord(-800));
    PinArr[108].Orientation := eRotate180;
    PinArr[108].Color       := $000000;
    //PinArr[108].ShowName := True;
    //PinArr[108].ShowDesignator := True;
    //PinArr[108].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[108]);
    // Pin '121', 'VDD'
    PinArr[121] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[121] = Nil Then Exit;
    PinArr[121].Designator := '121';
    PinArr[121].Name := 'VDD';
    PinArr[121].OwnerPartId := 8;
    PinArr[121].Location := Point(MilsToCoord(0), MilsToCoord(-900));
    PinArr[121].Orientation := eRotate180;
    PinArr[121].Color       := $000000;
    //PinArr[121].ShowName := True;
    //PinArr[121].ShowDesignator := True;
    //PinArr[121].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[121]);
    // Pin '131', 'VDD'
    PinArr[131] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[131] = Nil Then Exit;
    PinArr[131].Designator := '131';
    PinArr[131].Name := 'VDD';
    PinArr[131].OwnerPartId := 8;
    PinArr[131].Location := Point(MilsToCoord(0), MilsToCoord(-1000));
    PinArr[131].Orientation := eRotate180;
    PinArr[131].Color       := $000000;
    //PinArr[131].ShowName := True;
    //PinArr[131].ShowDesignator := True;
    //PinArr[131].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[131]);
    // Pin '144', 'VDD'
    PinArr[144] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[144] = Nil Then Exit;
    PinArr[144].Designator := '144';
    PinArr[144].Name := 'VDD';
    PinArr[144].OwnerPartId := 8;
    PinArr[144].Location := Point(MilsToCoord(0), MilsToCoord(-1100));
    PinArr[144].Orientation := eRotate180;
    PinArr[144].Color       := $000000;
    //PinArr[144].ShowName := True;
    //PinArr[144].ShowDesignator := True;
    //PinArr[144].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[144]);

    

    // Part 9: POWER_SPECIAL

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(10+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 9;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '9' + ': ' + 'POWER_SPECIAL';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 9;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '6', 'VBAT'
    PinArr[6] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[6] = Nil Then Exit;
    PinArr[6].Designator := '6';
    PinArr[6].Name := 'VBAT';
    PinArr[6].OwnerPartId := 9;
    PinArr[6].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[6].Orientation := eRotate180;
    PinArr[6].Color       := $000000;
    //PinArr[6].ShowName := True;
    //PinArr[6].ShowDesignator := True;
    //PinArr[6].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[6]);
    // Pin '25', 'NRST'
    PinArr[25] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[25] = Nil Then Exit;
    PinArr[25].Designator := '25';
    PinArr[25].Name := 'NRST';
    PinArr[25].OwnerPartId := 9;
    PinArr[25].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[25].Orientation := eRotate180;
    PinArr[25].Color       := $000000;
    //PinArr[25].ShowName := True;
    //PinArr[25].ShowDesignator := True;
    //PinArr[25].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[25]);
    // Pin '31', 'VSSA'
    PinArr[31] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[31] = Nil Then Exit;
    PinArr[31].Designator := '31';
    PinArr[31].Name := 'VSSA';
    PinArr[31].OwnerPartId := 9;
    PinArr[31].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[31].Orientation := eRotate180;
    PinArr[31].Color       := $000000;
    //PinArr[31].ShowName := True;
    //PinArr[31].ShowDesignator := True;
    //PinArr[31].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[31]);
    // Pin '32', 'VREF+'
    PinArr[32] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[32] = Nil Then Exit;
    PinArr[32].Designator := '32';
    PinArr[32].Name := 'VREF+';
    PinArr[32].OwnerPartId := 9;
    PinArr[32].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[32].Orientation := eRotate180;
    PinArr[32].Color       := $000000;
    //PinArr[32].ShowName := True;
    //PinArr[32].ShowDesignator := True;
    //PinArr[32].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[32]);
    // Pin '33', 'VDDA'
    PinArr[33] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[33] = Nil Then Exit;
    PinArr[33].Designator := '33';
    PinArr[33].Name := 'VDDA';
    PinArr[33].OwnerPartId := 9;
    PinArr[33].Location := Point(MilsToCoord(0), MilsToCoord(-500));
    PinArr[33].Orientation := eRotate180;
    PinArr[33].Color       := $000000;
    //PinArr[33].ShowName := True;
    //PinArr[33].ShowDesignator := True;
    //PinArr[33].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[33]);
    // Pin '71', 'VCAP'
    PinArr[71] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[71] = Nil Then Exit;
    PinArr[71].Designator := '71';
    PinArr[71].Name := 'VCAP';
    PinArr[71].OwnerPartId := 9;
    PinArr[71].Location := Point(MilsToCoord(0), MilsToCoord(-600));
    PinArr[71].Orientation := eRotate180;
    PinArr[71].Color       := $000000;
    //PinArr[71].ShowName := True;
    //PinArr[71].ShowDesignator := True;
    //PinArr[71].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[71]);
    // Pin '95', 'VDD33_USB'
    PinArr[95] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[95] = Nil Then Exit;
    PinArr[95].Designator := '95';
    PinArr[95].Name := 'VDD33_USB';
    PinArr[95].OwnerPartId := 9;
    PinArr[95].Location := Point(MilsToCoord(0), MilsToCoord(-700));
    PinArr[95].Orientation := eRotate180;
    PinArr[95].Color       := $000000;
    //PinArr[95].ShowName := True;
    //PinArr[95].ShowDesignator := True;
    //PinArr[95].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[95]);
    // Pin '106', 'VCAP'
    PinArr[106] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[106] = Nil Then Exit;
    PinArr[106].Designator := '106';
    PinArr[106].Name := 'VCAP';
    PinArr[106].OwnerPartId := 9;
    PinArr[106].Location := Point(MilsToCoord(0), MilsToCoord(-800));
    PinArr[106].Orientation := eRotate180;
    PinArr[106].Color       := $000000;
    //PinArr[106].ShowName := True;
    //PinArr[106].ShowDesignator := True;
    //PinArr[106].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[106]);
    // Pin '138', 'BOOT0'
    PinArr[138] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[138] = Nil Then Exit;
    PinArr[138].Designator := '138';
    PinArr[138].Name := 'BOOT0';
    PinArr[138].OwnerPartId := 9;
    PinArr[138].Location := Point(MilsToCoord(0), MilsToCoord(-900));
    PinArr[138].Orientation := eRotate180;
    PinArr[138].Color       := $000000;
    //PinArr[138].ShowName := True;
    //PinArr[138].ShowDesignator := True;
    //PinArr[138].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[138]);
    // Pin '143', 'PDR_ON'
    PinArr[143] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[143] = Nil Then Exit;
    PinArr[143].Designator := '143';
    PinArr[143].Name := 'PDR_ON';
    PinArr[143].OwnerPartId := 9;
    PinArr[143].Location := Point(MilsToCoord(0), MilsToCoord(-1000));
    PinArr[143].Orientation := eRotate180;
    PinArr[143].Color       := $000000;
    //PinArr[143].ShowName := True;
    //PinArr[143].ShowDesignator := True;
    //PinArr[143].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[143]);

    

    // Part 10: QUADSPI

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(6+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 10;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '10' + ': ' + 'QUADSPI';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 10;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '20', 'QUADSPI_BK1_IO0'
    PinArr[20] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[20] = Nil Then Exit;
    PinArr[20].Designator := '20';
    PinArr[20].Name := 'QUADSPI_BK1_IO0';
    PinArr[20].OwnerPartId := 10;
    PinArr[20].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[20].Orientation := eRotate180;
    PinArr[20].Color       := $000000;
    //PinArr[20].ShowName := True;
    //PinArr[20].ShowDesignator := True;
    //PinArr[20].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[20]);
    // Pin '21', 'QUADSPI_BK1_IO1'
    PinArr[21] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[21] = Nil Then Exit;
    PinArr[21].Designator := '21';
    PinArr[21].Name := 'QUADSPI_BK1_IO1';
    PinArr[21].OwnerPartId := 10;
    PinArr[21].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[21].Orientation := eRotate180;
    PinArr[21].Color       := $000000;
    //PinArr[21].ShowName := True;
    //PinArr[21].ShowDesignator := True;
    //PinArr[21].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[21]);
    // Pin '19', 'QUADSPI_BK1_IO2'
    PinArr[19] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[19] = Nil Then Exit;
    PinArr[19].Designator := '19';
    PinArr[19].Name := 'QUADSPI_BK1_IO2';
    PinArr[19].OwnerPartId := 10;
    PinArr[19].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[19].Orientation := eRotate180;
    PinArr[19].Color       := $000000;
    //PinArr[19].ShowName := True;
    //PinArr[19].ShowDesignator := True;
    //PinArr[19].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[19]);
    // Pin '18', 'QUADSPI_BK1_IO3'
    PinArr[18] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[18] = Nil Then Exit;
    PinArr[18].Designator := '18';
    PinArr[18].Name := 'QUADSPI_BK1_IO3';
    PinArr[18].OwnerPartId := 10;
    PinArr[18].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[18].Orientation := eRotate180;
    PinArr[18].Color       := $000000;
    //PinArr[18].ShowName := True;
    //PinArr[18].ShowDesignator := True;
    //PinArr[18].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[18]);
    // Pin '91', 'QUADSPI_BK1_NCS'
    PinArr[91] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[91] = Nil Then Exit;
    PinArr[91].Designator := '91';
    PinArr[91].Name := 'QUADSPI_BK1_NCS';
    PinArr[91].OwnerPartId := 10;
    PinArr[91].Location := Point(MilsToCoord(0), MilsToCoord(-500));
    PinArr[91].Orientation := eRotate180;
    PinArr[91].Color       := $000000;
    //PinArr[91].ShowName := True;
    //PinArr[91].ShowDesignator := True;
    //PinArr[91].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[91]);
    // Pin '22', 'QUADSPI_CLK'
    PinArr[22] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[22] = Nil Then Exit;
    PinArr[22].Designator := '22';
    PinArr[22].Name := 'QUADSPI_CLK';
    PinArr[22].OwnerPartId := 10;
    PinArr[22].Location := Point(MilsToCoord(0), MilsToCoord(-600));
    PinArr[22].Orientation := eRotate180;
    PinArr[22].Color       := $000000;
    //PinArr[22].ShowName := True;
    //PinArr[22].ShowDesignator := True;
    //PinArr[22].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[22]);

    

    // Part 11: SAI1

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(5+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 11;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '11' + ': ' + 'SAI1';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 11;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '3', 'SAI1_FS_A'
    PinArr[3] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[3] = Nil Then Exit;
    PinArr[3].Designator := '3';
    PinArr[3].Name := 'SAI1_FS_A';
    PinArr[3].OwnerPartId := 11;
    PinArr[3].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[3].Orientation := eRotate180;
    PinArr[3].Color       := $000000;
    //PinArr[3].ShowName := True;
    //PinArr[3].ShowDesignator := True;
    //PinArr[3].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[3]);
    // Pin '1', 'SAI1_MCLK_A'
    PinArr[1] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[1] = Nil Then Exit;
    PinArr[1].Designator := '1';
    PinArr[1].Name := 'SAI1_MCLK_A';
    PinArr[1].OwnerPartId := 11;
    PinArr[1].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[1].Orientation := eRotate180;
    PinArr[1].Color       := $000000;
    //PinArr[1].ShowName := True;
    //PinArr[1].ShowDesignator := True;
    //PinArr[1].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[1]);
    // Pin '4', 'SAI1_SCK_A'
    PinArr[4] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[4] = Nil Then Exit;
    PinArr[4].Designator := '4';
    PinArr[4].Name := 'SAI1_SCK_A';
    PinArr[4].OwnerPartId := 11;
    PinArr[4].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[4].Orientation := eRotate180;
    PinArr[4].Color       := $000000;
    //PinArr[4].ShowName := True;
    //PinArr[4].ShowDesignator := True;
    //PinArr[4].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[4]);
    // Pin '5', 'SAI1_SD_A'
    PinArr[5] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[5] = Nil Then Exit;
    PinArr[5].Designator := '5';
    PinArr[5].Name := 'SAI1_SD_A';
    PinArr[5].OwnerPartId := 11;
    PinArr[5].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[5].Orientation := eRotate180;
    PinArr[5].Color       := $000000;
    //PinArr[5].ShowName := True;
    //PinArr[5].ShowDesignator := True;
    //PinArr[5].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[5]);
    // Pin '2', 'SAI1_SD_B'
    PinArr[2] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[2] = Nil Then Exit;
    PinArr[2].Designator := '2';
    PinArr[2].Name := 'SAI1_SD_B';
    PinArr[2].OwnerPartId := 11;
    PinArr[2].Location := Point(MilsToCoord(0), MilsToCoord(-500));
    PinArr[2].Orientation := eRotate180;
    PinArr[2].Color       := $000000;
    //PinArr[2].ShowName := True;
    //PinArr[2].ShowDesignator := True;
    //PinArr[2].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[2]);

    

    // Part 12: SAI2

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(4+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 12;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '12' + ': ' + 'SAI2';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 12;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '81', 'SAI2_FS_A'
    PinArr[81] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[81] = Nil Then Exit;
    PinArr[81].Designator := '81';
    PinArr[81].Name := 'SAI2_FS_A';
    PinArr[81].OwnerPartId := 12;
    PinArr[81].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[81].Orientation := eRotate180;
    PinArr[81].Color       := $000000;
    //PinArr[81].ShowName := True;
    //PinArr[81].ShowDesignator := True;
    //PinArr[81].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[81]);
    // Pin '82', 'SAI2_SCK_A'
    PinArr[82] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[82] = Nil Then Exit;
    PinArr[82].Designator := '82';
    PinArr[82].Name := 'SAI2_SCK_A';
    PinArr[82].OwnerPartId := 12;
    PinArr[82].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[82].Orientation := eRotate180;
    PinArr[82].Color       := $000000;
    //PinArr[82].ShowName := True;
    //PinArr[82].ShowDesignator := True;
    //PinArr[82].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[82]);
    // Pin '80', 'SAI2_SD_A'
    PinArr[80] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[80] = Nil Then Exit;
    PinArr[80].Designator := '80';
    PinArr[80].Name := 'SAI2_SD_A';
    PinArr[80].OwnerPartId := 12;
    PinArr[80].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[80].Orientation := eRotate180;
    PinArr[80].Color       := $000000;
    //PinArr[80].ShowName := True;
    //PinArr[80].ShowDesignator := True;
    //PinArr[80].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[80]);
    // Pin '34', 'SAI2_SD_B'
    PinArr[34] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[34] = Nil Then Exit;
    PinArr[34].Designator := '34';
    PinArr[34].Name := 'SAI2_SD_B';
    PinArr[34].OwnerPartId := 12;
    PinArr[34].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[34].Orientation := eRotate180;
    PinArr[34].Color       := $000000;
    //PinArr[34].ShowName := True;
    //PinArr[34].ShowDesignator := True;
    //PinArr[34].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[34]);

    

    // Part 13: SPI1

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(4+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 13;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '13' + ': ' + 'SPI1';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 13;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '124', 'SPI1_MISO'
    PinArr[124] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[124] = Nil Then Exit;
    PinArr[124].Designator := '124';
    PinArr[124].Name := 'SPI1_MISO';
    PinArr[124].OwnerPartId := 13;
    PinArr[124].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[124].Orientation := eRotate180;
    PinArr[124].Color       := $000000;
    //PinArr[124].ShowName := True;
    //PinArr[124].ShowDesignator := True;
    //PinArr[124].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[124]);
    // Pin '123', 'SPI1_MOSI'
    PinArr[123] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[123] = Nil Then Exit;
    PinArr[123].Designator := '123';
    PinArr[123].Name := 'SPI1_MOSI';
    PinArr[123].OwnerPartId := 13;
    PinArr[123].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[123].Orientation := eRotate180;
    PinArr[123].Color       := $000000;
    //PinArr[123].ShowName := True;
    //PinArr[123].ShowDesignator := True;
    //PinArr[123].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[123]);
    // Pin '125', 'SPI1_NSS'
    PinArr[125] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[125] = Nil Then Exit;
    PinArr[125].Designator := '125';
    PinArr[125].Name := 'SPI1_NSS';
    PinArr[125].OwnerPartId := 13;
    PinArr[125].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[125].Orientation := eRotate180;
    PinArr[125].Color       := $000000;
    //PinArr[125].ShowName := True;
    //PinArr[125].ShowDesignator := True;
    //PinArr[125].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[125]);
    // Pin '126', 'SPI1_SCK'
    PinArr[126] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[126] = Nil Then Exit;
    PinArr[126].Designator := '126';
    PinArr[126].Name := 'SPI1_SCK';
    PinArr[126].OwnerPartId := 13;
    PinArr[126].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[126].Orientation := eRotate180;
    PinArr[126].Color       := $000000;
    //PinArr[126].ShowName := True;
    //PinArr[126].ShowDesignator := True;
    //PinArr[126].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[126]);

    

    // Part 14: SPI2

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(4+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 14;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '14' + ': ' + 'SPI2';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 14;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '75', 'SPI2_MISO'
    PinArr[75] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[75] = Nil Then Exit;
    PinArr[75].Designator := '75';
    PinArr[75].Name := 'SPI2_MISO';
    PinArr[75].OwnerPartId := 14;
    PinArr[75].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[75].Orientation := eRotate180;
    PinArr[75].Color       := $000000;
    //PinArr[75].ShowName := True;
    //PinArr[75].ShowDesignator := True;
    //PinArr[75].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[75]);
    // Pin '76', 'SPI2_MOSI'
    PinArr[76] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[76] = Nil Then Exit;
    PinArr[76].Designator := '76';
    PinArr[76].Name := 'SPI2_MOSI';
    PinArr[76].OwnerPartId := 14;
    PinArr[76].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[76].Orientation := eRotate180;
    PinArr[76].Color       := $000000;
    //PinArr[76].ShowName := True;
    //PinArr[76].ShowDesignator := True;
    //PinArr[76].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[76]);
    // Pin '73', 'SPI2_NSS'
    PinArr[73] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[73] = Nil Then Exit;
    PinArr[73].Designator := '73';
    PinArr[73].Name := 'SPI2_NSS';
    PinArr[73].OwnerPartId := 14;
    PinArr[73].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[73].Orientation := eRotate180;
    PinArr[73].Color       := $000000;
    //PinArr[73].ShowName := True;
    //PinArr[73].ShowDesignator := True;
    //PinArr[73].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[73]);
    // Pin '74', 'SPI2_SCK'
    PinArr[74] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[74] = Nil Then Exit;
    PinArr[74].Designator := '74';
    PinArr[74].Name := 'SPI2_SCK';
    PinArr[74].OwnerPartId := 14;
    PinArr[74].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[74].Orientation := eRotate180;
    PinArr[74].Color       := $000000;
    //PinArr[74].ShowName := True;
    //PinArr[74].ShowDesignator := True;
    //PinArr[74].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[74]);

    

    // Part 15: UNGROUPED

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(33+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 15;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '15' + ': ' + 'UNGROUPED';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 15;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '8', 'PC14-OSC32_IN (OSC32_IN)'
    PinArr[8] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[8] = Nil Then Exit;
    PinArr[8].Designator := '8';
    PinArr[8].Name := 'PC14-OSC32_IN (OSC32_IN)';
    PinArr[8].OwnerPartId := 15;
    PinArr[8].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[8].Orientation := eRotate180;
    PinArr[8].Color       := $000000;
    //PinArr[8].ShowName := True;
    //PinArr[8].ShowDesignator := True;
    //PinArr[8].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[8]);
    // Pin '9', 'PC15-OSC32_OUT (OSC32_OUT)'
    PinArr[9] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[9] = Nil Then Exit;
    PinArr[9].Designator := '9';
    PinArr[9].Name := 'PC15-OSC32_OUT (OSC32_OUT)';
    PinArr[9].OwnerPartId := 15;
    PinArr[9].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[9].Orientation := eRotate180;
    PinArr[9].Color       := $000000;
    //PinArr[9].ShowName := True;
    //PinArr[9].ShowDesignator := True;
    //PinArr[9].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[9]);
    // Pin '23', 'PH0-OSC_IN (PH0)'
    PinArr[23] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[23] = Nil Then Exit;
    PinArr[23].Designator := '23';
    PinArr[23].Name := 'PH0-OSC_IN (PH0)';
    PinArr[23].OwnerPartId := 15;
    PinArr[23].Location := Point(MilsToCoord(0), MilsToCoord(-300));
    PinArr[23].Orientation := eRotate180;
    PinArr[23].Color       := $000000;
    //PinArr[23].ShowName := True;
    //PinArr[23].ShowDesignator := True;
    //PinArr[23].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[23]);
    // Pin '24', 'PH1-OSC_OUT (PH1)'
    PinArr[24] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[24] = Nil Then Exit;
    PinArr[24].Designator := '24';
    PinArr[24].Name := 'PH1-OSC_OUT (PH1)';
    PinArr[24].OwnerPartId := 15;
    PinArr[24].Location := Point(MilsToCoord(0), MilsToCoord(-400));
    PinArr[24].Orientation := eRotate180;
    PinArr[24].Color       := $000000;
    //PinArr[24].ShowName := True;
    //PinArr[24].ShowDesignator := True;
    //PinArr[24].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[24]);
    // Pin '26', 'PC0'
    PinArr[26] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[26] = Nil Then Exit;
    PinArr[26].Designator := '26';
    PinArr[26].Name := 'PC0';
    PinArr[26].OwnerPartId := 15;
    PinArr[26].Location := Point(MilsToCoord(0), MilsToCoord(-500));
    PinArr[26].Orientation := eRotate180;
    PinArr[26].Color       := $000000;
    //PinArr[26].ShowName := True;
    //PinArr[26].ShowDesignator := True;
    //PinArr[26].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[26]);
    // Pin '27', 'PC1'
    PinArr[27] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[27] = Nil Then Exit;
    PinArr[27].Designator := '27';
    PinArr[27].Name := 'PC1';
    PinArr[27].OwnerPartId := 15;
    PinArr[27].Location := Point(MilsToCoord(0), MilsToCoord(-600));
    PinArr[27].Orientation := eRotate180;
    PinArr[27].Color       := $000000;
    //PinArr[27].ShowName := True;
    //PinArr[27].ShowDesignator := True;
    //PinArr[27].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[27]);
    // Pin '35', 'PA1'
    PinArr[35] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[35] = Nil Then Exit;
    PinArr[35].Designator := '35';
    PinArr[35].Name := 'PA1';
    PinArr[35].OwnerPartId := 15;
    PinArr[35].Location := Point(MilsToCoord(0), MilsToCoord(-700));
    PinArr[35].Orientation := eRotate180;
    PinArr[35].Color       := $000000;
    //PinArr[35].ShowName := True;
    //PinArr[35].ShowDesignator := True;
    //PinArr[35].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[35]);
    // Pin '40', 'PA4'
    PinArr[40] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[40] = Nil Then Exit;
    PinArr[40].Designator := '40';
    PinArr[40].Name := 'PA4';
    PinArr[40].OwnerPartId := 15;
    PinArr[40].Location := Point(MilsToCoord(0), MilsToCoord(-800));
    PinArr[40].Orientation := eRotate180;
    PinArr[40].Color       := $000000;
    //PinArr[40].ShowName := True;
    //PinArr[40].ShowDesignator := True;
    //PinArr[40].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[40]);
    // Pin '41', 'PA5'
    PinArr[41] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[41] = Nil Then Exit;
    PinArr[41].Designator := '41';
    PinArr[41].Name := 'PA5';
    PinArr[41].OwnerPartId := 15;
    PinArr[41].Location := Point(MilsToCoord(0), MilsToCoord(-900));
    PinArr[41].Orientation := eRotate180;
    PinArr[41].Color       := $000000;
    //PinArr[41].ShowName := True;
    //PinArr[41].ShowDesignator := True;
    //PinArr[41].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[41]);
    // Pin '42', 'PA6'
    PinArr[42] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[42] = Nil Then Exit;
    PinArr[42].Designator := '42';
    PinArr[42].Name := 'PA6';
    PinArr[42].OwnerPartId := 15;
    PinArr[42].Location := Point(MilsToCoord(0), MilsToCoord(-1000));
    PinArr[42].Orientation := eRotate180;
    PinArr[42].Color       := $000000;
    //PinArr[42].ShowName := True;
    //PinArr[42].ShowDesignator := True;
    //PinArr[42].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[42]);
    // Pin '44', 'PC4'
    PinArr[44] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[44] = Nil Then Exit;
    PinArr[44].Designator := '44';
    PinArr[44].Name := 'PC4';
    PinArr[44].OwnerPartId := 15;
    PinArr[44].Location := Point(MilsToCoord(0), MilsToCoord(-1100));
    PinArr[44].Orientation := eRotate180;
    PinArr[44].Color       := $000000;
    //PinArr[44].ShowName := True;
    //PinArr[44].ShowDesignator := True;
    //PinArr[44].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[44]);
    // Pin '45', 'PC5'
    PinArr[45] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[45] = Nil Then Exit;
    PinArr[45].Designator := '45';
    PinArr[45].Name := 'PC5';
    PinArr[45].OwnerPartId := 15;
    PinArr[45].Location := Point(MilsToCoord(0), MilsToCoord(-1200));
    PinArr[45].Orientation := eRotate180;
    PinArr[45].Color       := $000000;
    //PinArr[45].ShowName := True;
    //PinArr[45].ShowDesignator := True;
    //PinArr[45].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[45]);
    // Pin '46', 'PB0'
    PinArr[46] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[46] = Nil Then Exit;
    PinArr[46].Designator := '46';
    PinArr[46].Name := 'PB0';
    PinArr[46].OwnerPartId := 15;
    PinArr[46].Location := Point(MilsToCoord(0), MilsToCoord(-1300));
    PinArr[46].Orientation := eRotate180;
    PinArr[46].Color       := $000000;
    //PinArr[46].ShowName := True;
    //PinArr[46].ShowDesignator := True;
    //PinArr[46].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[46]);
    // Pin '47', 'PB1'
    PinArr[47] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[47] = Nil Then Exit;
    PinArr[47].Designator := '47';
    PinArr[47].Name := 'PB1';
    PinArr[47].OwnerPartId := 15;
    PinArr[47].Location := Point(MilsToCoord(0), MilsToCoord(-1400));
    PinArr[47].Orientation := eRotate180;
    PinArr[47].Color       := $000000;
    //PinArr[47].ShowName := True;
    //PinArr[47].ShowDesignator := True;
    //PinArr[47].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[47]);
    // Pin '48', 'PB2'
    PinArr[48] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[48] = Nil Then Exit;
    PinArr[48].Designator := '48';
    PinArr[48].Name := 'PB2';
    PinArr[48].OwnerPartId := 15;
    PinArr[48].Location := Point(MilsToCoord(0), MilsToCoord(-1500));
    PinArr[48].Orientation := eRotate180;
    PinArr[48].Color       := $000000;
    //PinArr[48].ShowName := True;
    //PinArr[48].ShowDesignator := True;
    //PinArr[48].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[48]);
    // Pin '69', 'PB10'
    PinArr[69] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[69] = Nil Then Exit;
    PinArr[69].Designator := '69';
    PinArr[69].Name := 'PB10';
    PinArr[69].OwnerPartId := 15;
    PinArr[69].Location := Point(MilsToCoord(0), MilsToCoord(-1600));
    PinArr[69].Orientation := eRotate180;
    PinArr[69].Color       := $000000;
    //PinArr[69].ShowName := True;
    //PinArr[69].ShowDesignator := True;
    //PinArr[69].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[69]);
    // Pin '70', 'PB11'
    PinArr[70] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[70] = Nil Then Exit;
    PinArr[70].Designator := '70';
    PinArr[70].Name := 'PB11';
    PinArr[70].OwnerPartId := 15;
    PinArr[70].Location := Point(MilsToCoord(0), MilsToCoord(-1700));
    PinArr[70].Orientation := eRotate180;
    PinArr[70].Color       := $000000;
    //PinArr[70].ShowName := True;
    //PinArr[70].ShowDesignator := True;
    //PinArr[70].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[70]);
    // Pin '87', 'PG2'
    PinArr[87] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[87] = Nil Then Exit;
    PinArr[87].Designator := '87';
    PinArr[87].Name := 'PG2';
    PinArr[87].OwnerPartId := 15;
    PinArr[87].Location := Point(MilsToCoord(0), MilsToCoord(-1800));
    PinArr[87].Orientation := eRotate180;
    PinArr[87].Color       := $000000;
    //PinArr[87].ShowName := True;
    //PinArr[87].ShowDesignator := True;
    //PinArr[87].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[87]);
    // Pin '88', 'PG3'
    PinArr[88] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[88] = Nil Then Exit;
    PinArr[88].Designator := '88';
    PinArr[88].Name := 'PG3';
    PinArr[88].OwnerPartId := 15;
    PinArr[88].Location := Point(MilsToCoord(0), MilsToCoord(-1900));
    PinArr[88].Orientation := eRotate180;
    PinArr[88].Color       := $000000;
    //PinArr[88].ShowName := True;
    //PinArr[88].ShowDesignator := True;
    //PinArr[88].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[88]);
    // Pin '92', 'PG7'
    PinArr[92] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[92] = Nil Then Exit;
    PinArr[92].Designator := '92';
    PinArr[92].Name := 'PG7';
    PinArr[92].OwnerPartId := 15;
    PinArr[92].Location := Point(MilsToCoord(0), MilsToCoord(-2000));
    PinArr[92].Orientation := eRotate180;
    PinArr[92].Color       := $000000;
    //PinArr[92].ShowName := True;
    //PinArr[92].ShowDesignator := True;
    //PinArr[92].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[92]);
    // Pin '96', 'PC6'
    PinArr[96] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[96] = Nil Then Exit;
    PinArr[96].Designator := '96';
    PinArr[96].Name := 'PC6';
    PinArr[96].OwnerPartId := 15;
    PinArr[96].Location := Point(MilsToCoord(0), MilsToCoord(-2100));
    PinArr[96].Orientation := eRotate180;
    PinArr[96].Color       := $000000;
    //PinArr[96].ShowName := True;
    //PinArr[96].ShowDesignator := True;
    //PinArr[96].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[96]);
    // Pin '98', 'PC8'
    PinArr[98] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[98] = Nil Then Exit;
    PinArr[98].Designator := '98';
    PinArr[98].Name := 'PC8';
    PinArr[98].OwnerPartId := 15;
    PinArr[98].Location := Point(MilsToCoord(0), MilsToCoord(-2200));
    PinArr[98].Orientation := eRotate180;
    PinArr[98].Color       := $000000;
    //PinArr[98].ShowName := True;
    //PinArr[98].ShowDesignator := True;
    //PinArr[98].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[98]);
    // Pin '100', 'PA8'
    PinArr[100] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[100] = Nil Then Exit;
    PinArr[100].Designator := '100';
    PinArr[100].Name := 'PA8';
    PinArr[100].OwnerPartId := 15;
    PinArr[100].Location := Point(MilsToCoord(0), MilsToCoord(-2300));
    PinArr[100].Orientation := eRotate180;
    PinArr[100].Color       := $000000;
    //PinArr[100].ShowName := True;
    //PinArr[100].ShowDesignator := True;
    //PinArr[100].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[100]);
    // Pin '116', 'PD2'
    PinArr[116] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[116] = Nil Then Exit;
    PinArr[116].Designator := '116';
    PinArr[116].Name := 'PD2';
    PinArr[116].OwnerPartId := 15;
    PinArr[116].Location := Point(MilsToCoord(0), MilsToCoord(-2400));
    PinArr[116].Orientation := eRotate180;
    PinArr[116].Color       := $000000;
    //PinArr[116].ShowName := True;
    //PinArr[116].ShowDesignator := True;
    //PinArr[116].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[116]);
    // Pin '117', 'PD3'
    PinArr[117] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[117] = Nil Then Exit;
    PinArr[117].Designator := '117';
    PinArr[117].Name := 'PD3';
    PinArr[117].OwnerPartId := 15;
    PinArr[117].Location := Point(MilsToCoord(0), MilsToCoord(-2500));
    PinArr[117].Orientation := eRotate180;
    PinArr[117].Color       := $000000;
    //PinArr[117].ShowName := True;
    //PinArr[117].ShowDesignator := True;
    //PinArr[117].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[117]);
    // Pin '118', 'PD4'
    PinArr[118] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[118] = Nil Then Exit;
    PinArr[118].Designator := '118';
    PinArr[118].Name := 'PD4';
    PinArr[118].OwnerPartId := 15;
    PinArr[118].Location := Point(MilsToCoord(0), MilsToCoord(-2600));
    PinArr[118].Orientation := eRotate180;
    PinArr[118].Color       := $000000;
    //PinArr[118].ShowName := True;
    //PinArr[118].ShowDesignator := True;
    //PinArr[118].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[118]);
    // Pin '119', 'PD5'
    PinArr[119] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[119] = Nil Then Exit;
    PinArr[119].Designator := '119';
    PinArr[119].Name := 'PD5';
    PinArr[119].OwnerPartId := 15;
    PinArr[119].Location := Point(MilsToCoord(0), MilsToCoord(-2700));
    PinArr[119].Orientation := eRotate180;
    PinArr[119].Color       := $000000;
    //PinArr[119].ShowName := True;
    //PinArr[119].ShowDesignator := True;
    //PinArr[119].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[119]);
    // Pin '122', 'PD6'
    PinArr[122] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[122] = Nil Then Exit;
    PinArr[122].Designator := '122';
    PinArr[122].Name := 'PD6';
    PinArr[122].OwnerPartId := 15;
    PinArr[122].Location := Point(MilsToCoord(0), MilsToCoord(-2800));
    PinArr[122].Orientation := eRotate180;
    PinArr[122].Color       := $000000;
    //PinArr[122].ShowName := True;
    //PinArr[122].ShowDesignator := True;
    //PinArr[122].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[122]);
    // Pin '127', 'PG12'
    PinArr[127] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[127] = Nil Then Exit;
    PinArr[127].Designator := '127';
    PinArr[127].Name := 'PG12';
    PinArr[127].OwnerPartId := 15;
    PinArr[127].Location := Point(MilsToCoord(0), MilsToCoord(-2900));
    PinArr[127].Orientation := eRotate180;
    PinArr[127].Color       := $000000;
    //PinArr[127].ShowName := True;
    //PinArr[127].ShowDesignator := True;
    //PinArr[127].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[127]);
    // Pin '128', 'PG13'
    PinArr[128] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[128] = Nil Then Exit;
    PinArr[128].Designator := '128';
    PinArr[128].Name := 'PG13';
    PinArr[128].OwnerPartId := 15;
    PinArr[128].Location := Point(MilsToCoord(0), MilsToCoord(-3000));
    PinArr[128].Orientation := eRotate180;
    PinArr[128].Color       := $000000;
    //PinArr[128].ShowName := True;
    //PinArr[128].ShowDesignator := True;
    //PinArr[128].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[128]);
    // Pin '129', 'PG14'
    PinArr[129] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[129] = Nil Then Exit;
    PinArr[129].Designator := '129';
    PinArr[129].Name := 'PG14';
    PinArr[129].OwnerPartId := 15;
    PinArr[129].Location := Point(MilsToCoord(0), MilsToCoord(-3100));
    PinArr[129].Orientation := eRotate180;
    PinArr[129].Color       := $000000;
    //PinArr[129].ShowName := True;
    //PinArr[129].ShowDesignator := True;
    //PinArr[129].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[129]);
    // Pin '134', 'PB4 (NJTRST)'
    PinArr[134] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[134] = Nil Then Exit;
    PinArr[134].Designator := '134';
    PinArr[134].Name := 'PB4 (NJTRST)';
    PinArr[134].OwnerPartId := 15;
    PinArr[134].Location := Point(MilsToCoord(0), MilsToCoord(-3200));
    PinArr[134].Orientation := eRotate180;
    PinArr[134].Color       := $000000;
    //PinArr[134].ShowName := True;
    //PinArr[134].ShowDesignator := True;
    //PinArr[134].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[134]);
    // Pin '137', 'PB7'
    PinArr[137] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[137] = Nil Then Exit;
    PinArr[137].Designator := '137';
    PinArr[137].Name := 'PB7';
    PinArr[137].OwnerPartId := 15;
    PinArr[137].Location := Point(MilsToCoord(0), MilsToCoord(-3300));
    PinArr[137].Orientation := eRotate180;
    PinArr[137].Color       := $000000;
    //PinArr[137].ShowName := True;
    //PinArr[137].ShowDesignator := True;
    //PinArr[137].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[137]);

    

    // Part 16: USART1

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(2+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 16;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '16' + ': ' + 'USART1';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 16;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '102', 'USART1_RX'
    PinArr[102] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[102] = Nil Then Exit;
    PinArr[102].Designator := '102';
    PinArr[102].Name := 'USART1_RX';
    PinArr[102].OwnerPartId := 16;
    PinArr[102].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[102].Orientation := eRotate180;
    PinArr[102].Color       := $000000;
    //PinArr[102].ShowName := True;
    //PinArr[102].ShowDesignator := True;
    //PinArr[102].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[102]);
    // Pin '101', 'USART1_TX'
    PinArr[101] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[101] = Nil Then Exit;
    PinArr[101].Designator := '101';
    PinArr[101].Name := 'USART1_TX';
    PinArr[101].OwnerPartId := 16;
    PinArr[101].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[101].Orientation := eRotate180;
    PinArr[101].Color       := $000000;
    //PinArr[101].ShowName := True;
    //PinArr[101].ShowDesignator := True;
    //PinArr[101].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[101]);

    

    // Part 17: USART2

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*(2+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := 17;
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '17' + ': ' + 'USART2';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := 17;
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
    // Pin '37', 'USART2_RX'
    PinArr[37] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[37] = Nil Then Exit;
    PinArr[37].Designator := '37';
    PinArr[37].Name := 'USART2_RX';
    PinArr[37].OwnerPartId := 17;
    PinArr[37].Location := Point(MilsToCoord(0), MilsToCoord(-100));
    PinArr[37].Orientation := eRotate180;
    PinArr[37].Color       := $000000;
    //PinArr[37].ShowName := True;
    //PinArr[37].ShowDesignator := True;
    //PinArr[37].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[37]);
    // Pin '36', 'USART2_TX'
    PinArr[36] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[36] = Nil Then Exit;
    PinArr[36].Designator := '36';
    PinArr[36].Name := 'USART2_TX';
    PinArr[36].OwnerPartId := 17;
    PinArr[36].Location := Point(MilsToCoord(0), MilsToCoord(-200));
    PinArr[36].Orientation := eRotate180;
    PinArr[36].Color       := $000000;
    //PinArr[36].ShowName := True;
    //PinArr[36].ShowDesignator := True;
    //PinArr[36].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[36]);

    

    
    SchLib.AddSchComponent(Component);
    // Send a system notification that a new component has been added to the library.
    SchServer.RobotManager.SendMessage(nil, c_BroadCast, SCHM_PrimitiveRegistration, Component.I_ObjectAddress);
    SchLib.CurrentSchComponent := Component;
    // Refresh library.
    SchLib.GraphicallyInvalidate;
        
    ShowMessage('Successfully updated component with 17 functional groups');
end;
