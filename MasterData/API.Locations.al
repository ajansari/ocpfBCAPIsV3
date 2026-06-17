namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Location;

page 90839 "ocpfLocations"
{
    PageType = API;
    Caption = 'Locations — physical or logical inventory locations (warehouses, bins, stores) where items are stocked and tracked.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfLocation';
    EntitySetName = 'ocpfLocations';
    SourceTable = Location;
    ODataKeyFields = SystemId;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'System ID';
                    ToolTip = 'Unique system-assigned identifier for this record. Used as the OData key.';
                    ApplicationArea = All;
                }
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for this location record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this location record.';
                    ApplicationArea = All;
                }
                field(defaultBinCode; Rec."Default Bin Code")
                {
                    Caption = 'Default Bin Code';
                    ToolTip = 'Specifies the default bin code for this location record.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies the name 2 for this location record.';
                    ApplicationArea = All;
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the address for this location record.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies the address 2 for this location record.';
                    ApplicationArea = All;
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city for this location record.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the phone no. for this location record.';
                    ApplicationArea = All;
                }
                field(phoneNo2; Rec."Phone No. 2")
                {
                    Caption = 'Phone No. 2';
                    ToolTip = 'Specifies the phone no. 2 for this location record.';
                    ApplicationArea = All;
                }
                field(telexNo; Rec."Telex No.")
                {
                    Caption = 'Telex No.';
                    ToolTip = 'Specifies the telex no. for this location record.';
                    ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the fax no. for this location record.';
                    ApplicationArea = All;
                }
                field(contact; Rec.Contact)
                {
                    Caption = 'Contact';
                    ToolTip = 'Specifies the contact for this location record.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the post code for this location record.';
                    ApplicationArea = All;
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the county for this location record.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the e-mail for this location record.';
                    ApplicationArea = All;
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Home Page';
                    ToolTip = 'Specifies the home page for this location record.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region code for this location record.';
                    ApplicationArea = All;
                }
                field(useAsInTransit; Rec."Use As In-Transit")
                {
                    Caption = 'Use As In-Transit';
                    ToolTip = 'Specifies the use as in-transit for this location record.';
                    ApplicationArea = All;
                }
                field(requirePutAway; Rec."Require Put-away")
                {
                    Caption = 'Require Put-away';
                    ToolTip = 'Specifies the require put-away for this location record.';
                    ApplicationArea = All;
                }
                field(requirePick; Rec."Require Pick")
                {
                    Caption = 'Require Pick';
                    ToolTip = 'Specifies the require pick for this location record.';
                    ApplicationArea = All;
                }
                field(crossDockDueDateCalc; Rec."Cross-Dock Due Date Calc.")
                {
                    Caption = 'Cross-Dock Due Date Calc.';
                    ToolTip = 'Specifies the cross-dock due date calc. for this location record.';
                    ApplicationArea = All;
                }
                field(useCrossDocking; Rec."Use Cross-Docking")
                {
                    Caption = 'Use Cross-Docking';
                    ToolTip = 'Specifies the use cross-docking for this location record.';
                    ApplicationArea = All;
                }
                field(requireReceive; Rec."Require Receive")
                {
                    Caption = 'Require Receive';
                    ToolTip = 'Specifies the require receive for this location record.';
                    ApplicationArea = All;
                }
                field(requireShipment; Rec."Require Shipment")
                {
                    Caption = 'Require Shipment';
                    ToolTip = 'Specifies the require shipment for this location record.';
                    ApplicationArea = All;
                }
                field(binMandatory; Rec."Bin Mandatory")
                {
                    Caption = 'Bin Mandatory';
                    ToolTip = 'Specifies the bin mandatory for this location record.';
                    ApplicationArea = All;
                }
                field(directedPutAwayAndPick; Rec."Directed Put-away and Pick")
                {
                    Caption = 'Directed Put-away and Pick';
                    ToolTip = 'Specifies the directed put-away and pick for this location record.';
                    ApplicationArea = All;
                }
                field(defaultBinSelection; Rec."Default Bin Selection")
                {
                    Caption = 'Default Bin Selection';
                    ToolTip = 'Specifies the default bin selection for this location record.';
                    ApplicationArea = All;
                }
                field(outboundWhseHandlingTime; Rec."Outbound Whse. Handling Time")
                {
                    Caption = 'Outbound Whse. Handling Time';
                    ToolTip = 'Specifies the outbound whse. handling time for this location record.';
                    ApplicationArea = All;
                }
                field(inboundWhseHandlingTime; Rec."Inbound Whse. Handling Time")
                {
                    Caption = 'Inbound Whse. Handling Time';
                    ToolTip = 'Specifies the inbound whse. handling time for this location record.';
                    ApplicationArea = All;
                }
                field(putAwayTemplateCode; Rec."Put-away Template Code")
                {
                    Caption = 'Put-away Template Code';
                    ToolTip = 'Specifies the put-away template code for this location record.';
                    ApplicationArea = All;
                }
                field(usePutAwayWorksheet; Rec."Use Put-away Worksheet")
                {
                    Caption = 'Use Put-away Worksheet';
                    ToolTip = 'Specifies the use put-away worksheet for this location record.';
                    ApplicationArea = All;
                }
                field(pickAccordingToFefo; Rec."Pick According to FEFO")
                {
                    Caption = 'Pick According to FEFO';
                    ToolTip = 'Specifies the pick according to fefo for this location record.';
                    ApplicationArea = All;
                }
                field(allowBreakbulk; Rec."Allow Breakbulk")
                {
                    Caption = 'Allow Breakbulk';
                    ToolTip = 'Specifies that an order can be fulfilled with items stored in alternate units of measure, if an item stored in the requested unit of measure is not found. This feature is applicable only with directed';
                    ApplicationArea = All;
                }
                field(binCapacityPolicy; Rec."Bin Capacity Policy")
                {
                    Caption = 'Bin Capacity Policy';
                    ToolTip = 'Specifies the bin capacity policy for this location record.';
                    ApplicationArea = All;
                }
                field(pickBinPolicy; Rec."Pick Bin Policy")
                {
                    Caption = 'Pick Bin Policy';
                    ToolTip = 'Specifies the pick bin policy for this location record.';
                    ApplicationArea = All;
                }
                field(checkWhseClass; Rec."Check Whse. Class")
                {
                    Caption = 'Check Warehouse Class';
                    ToolTip = 'Specifies the check whse. class for this location record.';
                    ApplicationArea = All;
                }
                field(putAwayBinPolicy; Rec."Put-away Bin Policy")
                {
                    Caption = 'Put-away Bin Policy';
                    ToolTip = 'Specifies the put-away bin policy for this location record.';
                    ApplicationArea = All;
                }
                field(openShopFloorBinCode; Rec."Open Shop Floor Bin Code")
                {
                    Caption = 'Open Shop Floor Bin Code';
                    ToolTip = 'Specifies the open shop floor bin code for this location record.';
                    ApplicationArea = All;
                }
                field(toProductionBinCode; Rec."To-Production Bin Code")
                {
                    Caption = 'To-Production Bin Code';
                    ToolTip = 'Specifies the to-production bin code for this location record.';
                    ApplicationArea = All;
                }
                field(fromProductionBinCode; Rec."From-Production Bin Code")
                {
                    Caption = 'From-Production Bin Code';
                    ToolTip = 'Specifies the from-production bin code for this location record.';
                    ApplicationArea = All;
                }
                field(adjustmentBinCode; Rec."Adjustment Bin Code")
                {
                    Caption = 'Adjustment Bin Code';
                    ToolTip = 'Specifies the adjustment bin code for this location record.';
                    ApplicationArea = All;
                }
                field(alwaysCreatePutAwayLine; Rec."Always Create Put-away Line")
                {
                    Caption = 'Always Create Put-away Line';
                    ToolTip = 'Specifies the always create put-away line for this location record.';
                    ApplicationArea = All;
                }
                field(alwaysCreatePickLine; Rec."Always Create Pick Line")
                {
                    Caption = 'Always Create Pick Line';
                    ToolTip = 'Specifies the always create pick line for this location record.';
                    ApplicationArea = All;
                }
                field(specialEquipment; Rec."Special Equipment")
                {
                    Caption = 'Special Equipment';
                    ToolTip = 'Specifies the special equipment for this location record.';
                    ApplicationArea = All;
                }
                field(receiptBinCode; Rec."Receipt Bin Code")
                {
                    Caption = 'Receipt Bin Code';
                    ToolTip = 'Specifies the receipt bin code for this location record.';
                    ApplicationArea = All;
                }
                field(shipmentBinCode; Rec."Shipment Bin Code")
                {
                    Caption = 'Shipment Bin Code';
                    ToolTip = 'Specifies the shipment bin code for this location record.';
                    ApplicationArea = All;
                }
                field(crossDockBinCode; Rec."Cross-Dock Bin Code")
                {
                    Caption = 'Cross-Dock Bin Code';
                    ToolTip = 'Specifies the cross-dock bin code for this location record.';
                    ApplicationArea = All;
                }
                field(toAssemblyBinCode; Rec."To-Assembly Bin Code")
                {
                    Caption = 'To-Assembly Bin Code';
                    ToolTip = 'Specifies the to-assembly bin code for this location record.';
                    ApplicationArea = All;
                }
                field(fromAssemblyBinCode; Rec."From-Assembly Bin Code")
                {
                    Caption = 'From-Assembly Bin Code';
                    ToolTip = 'Specifies the from-assembly bin code for this location record.';
                    ApplicationArea = All;
                }
                field(asmToOrderShptBinCode; Rec."Asm.-to-Order Shpt. Bin Code")
                {
                    Caption = 'Asm.-to-Order Shpt. Bin Code';
                    ToolTip = 'Specifies the asm.-to-order shpt. bin code for this location record.';
                    ApplicationArea = All;
                }
                field(toJobBinCode; Rec."To-Job Bin Code")
                {
                    Caption = 'To-Project Bin Code';
                    ToolTip = 'Specifies the to-job bin code for this location record.';
                    ApplicationArea = All;
                }
                field(asmConsumpWhseHandling; Rec."Asm. Consump. Whse. Handling")
                {
                    Caption = 'Asm. Consump. Whse. Handling';
                    ToolTip = 'Specifies the asm. consump. whse. handling for this location record.';
                    ApplicationArea = All;
                }
                field(jobConsumpWhseHandling; Rec."Job Consump. Whse. Handling")
                {
                    Caption = 'Project Consump. Whse. Handling';
                    ToolTip = 'Specifies the job consump. whse. handling for this location record.';
                    ApplicationArea = All;
                }
                field(baseCalendarCode; Rec."Base Calendar Code")
                {
                    Caption = 'Base Calendar Code';
                    ToolTip = 'Specifies the base calendar code for this location record.';
                    ApplicationArea = All;
                }
                field(useAdcs; Rec."Use ADCS")
                {
                    Caption = 'Use ADCS';
                    ToolTip = 'Specifies the use adcs for this location record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified DateTime';
                    ToolTip = 'Specifies the Last Modified DateTime.';
                    ApplicationArea = All;
                }
            }
        }
    }
}