import csv
import os
from collections import defaultdict
import re

def parse_pinout_csv(csv_file):
    """Parse CubeMX-generated CSV pinout file with columns: Position,Name,Type,Signal"""
    pin_groups = defaultdict(list)
    total_pins = 0

    with open(csv_file, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            total_pins += 1
            pin_pos = row['Position'].strip()
            pin_name = row['Name'].strip()
            signal = row['Signal'].strip()
            pin_type = row['Type'].strip().upper()
            
            # Group power/ground pins
            if pin_name in ['POWER', 'VDD', 'VCC']:
                pin_groups['POWER'].append((pin_name, signal,pin_pos))
                continue
            elif pin_name in ['GND', 'VSS']:
                pin_groups['GROUND'].append((pin_name, signal,pin_pos))
                continue
            elif pin_name in ['VDDA', 'VREF+', 'VREF', 'NRST','VSSA','VBAT','VCAP','VDD33_USB','BOOT0','BOOT1','BOOT','PDR_ON']:
                pin_groups['POWER_SPECIAL'].append((pin_name, signal,pin_pos))
                continue
                
            # Group by first part of signal name (before underscore)
            if signal and '_' in signal:
                group = signal.split('_')[0]
                pin_groups[group].append((pin_name, signal,pin_pos))
            else:
                pin_groups['UNGROUPED'].append((pin_name, signal,pin_pos))
    
    # NEW: Sort pins within each group by signal name (e.g., FMC_D1, FMC_D2)
    #for group in pin_groups:
    #   pin_groups[group].sort(key=lambda x: x[1])  # Sort by signal name

        #######################################
    for group in pin_groups:
        pin_groups[group].sort(key=lambda x: natural_sort_key(x[1]))
       
    return pin_groups, total_pins


def natural_sort_key(signal_name):
    # Split into letters and numbers (e.g., "FMC_D10" -> ["FMC_D", 10])
    parts = re.split('([0-9]+)', signal_name)
    # Convert numbers to integers, leave strings as-is
    return [int(part) if part.isdigit() else part.lower() for part in parts]




def generate_altium_script(pin_groups, total_pins, output_script="UpdateComponent.pas"):
    """Generate Altium 24.2 script using documented API calls"""
    with open(output_script, 'w', encoding='utf-8') as f:
        # Header with documentation references
        header = """\
{ Altium 24.2 Script - Documented API Usage }
{ References: }
{ 1. ISch_Component Interface - Altium API Documentation }
{ 2. ISch_Lib Methods - Altium Scripting Guide }
procedure UpdateComponent;
var
    SchLib       : ISch_Lib;
    Component    : ISch_Component;
    NewPartArr   : array[1..%d] of ISch_Component;
    R            : ISch_Rectangle;
    TextObj      : ISch_TextFrame;
    PinArr       : array[1..%d] of ISch_Pin;
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
    Component.ComponentDescription := 'MCU with %d pins' + #13#10 + 'Grouped by function';
    Component.Designator.Text      := 'U?';
    Component.LibReference := 'MCU_pinout';
    Component.PartCount := %d;
    
    
""" % (len(pin_groups),total_pins, total_pins, len(pin_groups))
        f.write(header)

    #  Sort groups alphabetically by name (e.g., ADC1, FMC, UART2) ###
        spin_groups = sorted(pin_groups.items(), key=lambda x: x[0].upper())  # Case-insensiti
        
        # Create parts for each functional group
        #for part_idx, (group_name, pins) in enumerate(pin_groups.items(), 1):
        for part_idx, (group_name, pins) in enumerate(spin_groups, 1):
            part_header = """
    // Part {part_idx}: {group_name}

    // Create a rectangle object for the new part.
    R := SchServer.SchObjectFactory(eRectangle, eCreate_Default);
    // Define the rectangle parameters.
    R.LineWidth := eSmall;
    R.Location  := Point(MilsToCoord(0), MilsToCoord(0));
    R.Corner    := Point(MilsToCoord(2000), MilsToCoord(-100*({pins_in_group}+1)));
    R.Color     := $000080;    // Maroon
    R.AreaColor := $B0FFFF;    // Portafino
    R.IsSolid   := True;
    R.OwnerPartId          := {part_idx};
    Component.AddSchObject(R);

        // Create text object
    TextObj := SchServer.SchObjectFactory(eTextFrame, eCreate_Default);
    TextObj.Text := 'part ' + '{part_idx}' + ': ' + '{group_name}';  // Set text content
    TextObj.Location := Point(MilsToCoord(500), MilsToCoord(0));  // 
    TextObj.Corner :=  Point(MilsToCoord(2000), MilsToCoord(100));  // 
    //TextObj.IsBorderDisplayed := True;
    TextObj.IsSolid := False; // Fill color (set via AreaColor)
    //TextObj.FontID := 'Courier New';  // Font (optional)
    //TextObj.FontID := SchDoc.FontManager.GetFontID('Courier New', 10, False, False);
    //TextObj.Size := 10;  // Font size (points)
    TextObj.OwnerPartId   := {part_idx};
    Component.AddSchObject(TextObj);
    

    // Add pins to this part
""".format(part_idx=part_idx, group_name=group_name, pins_in_group = len(pins))
            f.write(part_header)

            for pin_num, (pin_name, signal, pin_pos) in enumerate(pins, 1):
                display_name = signal if signal else pin_name
                pin_code = """\
    // Pin '{designator}', '{name}'
    PinArr[{designator}] := SchServer.SchObjectFactory(ePin, eCreate_Default);
    If PinArr[{designator}] = Nil Then Exit;
    PinArr[{designator}].Designator := '{designator}';
    PinArr[{designator}].Name := '{name}';
    PinArr[{designator}].OwnerPartId := {owner};
    PinArr[{designator}].Location := Point(MilsToCoord({x}), MilsToCoord({y}));
    PinArr[{designator}].Orientation := eRotate180;
    PinArr[{designator}].Color       := $000000;
    //PinArr[{designator}].ShowName := True;
    //PinArr[{designator}].ShowDesignator := True;
    //PinArr[{designator}].OwnerPartDisplayMode := True;
    Component.AddSchObject(PinArr[{designator}]);
""".format(
                    designator=pin_pos,
                    name=display_name,
                    owner=part_idx,
                    y=-(pin_num * 100),
                    x=0,#part_idx * 100,
                    part_idx = part_idx
                )
                f.write(pin_code)

            f.write("""
    
""".format(part_idx = part_idx))

        # Finalize document
        footer = """
    
    SchLib.AddSchComponent(Component);
    // Send a system notification that a new component has been added to the library.
    SchServer.RobotManager.SendMessage(nil, c_BroadCast, SCHM_PrimitiveRegistration, Component.I_ObjectAddress);
    SchLib.CurrentSchComponent := Component;
    // Refresh library.
    SchLib.GraphicallyInvalidate;
        
    ShowMessage('Successfully updated component with {group_count} functional groups');
end;
""".format(group_count=len(pin_groups))
        f.write(footer)
#///////////////////////////////////////////////////////////////////////////////////////


if __name__ == "__main__":
    csv_file = "pinout.csv"  # Expected columns: Position,Name,Type,Signal
    output_script = "UpdateComponent.pas"
    component_name = "MCU_Pinout"  # Should match your LibReference
    
    if not os.path.exists(csv_file):
        print(f"Error: File '{csv_file}' not found!")
        print("Expected CSV format: Position,Name,Type,Signal")
    else:
        pin_groups, total_pins = parse_pinout_csv(csv_file)
        print(f"Found {total_pins} pins in {len(pin_groups)} groups:")
        for group, pins in sorted(pin_groups.items()):
            print(f"  {group}: {len(pins)} pins")
        
        generate_altium_script(pin_groups, total_pins, output_script)
        print(f"\nGenerated Altium scripts:")
        print(f"1. Library component creation: '{output_script}'")

        print("\nUsage instructions:")
        print("1. Open your schematic library (.SchLib) in Altium 24.2")
        print("2. Select 'Component_1'")
        print("3. Run the script from DXP → Run Script")
        print("4. First run 'UpdateComponent.pas' to create the library component")
        print("5. Then run 'CreateSchematic.pas' to create a schematic with the component and ports")
        print("6. Click on each component's parts, go Tools->SymbolWizard->PlaceSymbol (replace)")