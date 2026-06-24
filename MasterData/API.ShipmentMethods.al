namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Foundation.Shipping;

page 90841 "ocpfShipmentMethods"
{
    PageType = API;
    Caption = 'Shipment Methods — define the terms of delivery (e.g., EXW, CIF, FOB) printed on sales and purchase documents.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfShipmentMethod';
    EntitySetName = 'ocpfShipmentMethods';
    SourceTable = "Shipment Method";
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
                    ToolTip = 'Specifies the code for this shipment method record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this shipment method record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this shipment method record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}