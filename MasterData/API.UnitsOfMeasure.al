namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Foundation.UOM;

page 90837 "ocpfUnitsOfMeasure"
{
    PageType = API;
    Caption = 'Units of Measure — the base unit codes (e.g., PCS, KG, HR) used to quantify items, resources, and transactions.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfUnitOfMeasure';
    EntitySetName = 'ocpfUnitsOfMeasure';
    SourceTable = "Unit of Measure";
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
                    ToolTip = 'Specifies the code for this unit of measure record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this unit of measure record.';
                    ApplicationArea = All;
                }
                field(internationalStandardCode; Rec."International Standard Code")
                {
                    Caption = 'International Standard Code';
                    ToolTip = 'Specifies the international standard code for this unit of measure record.';
                    ApplicationArea = All;
                }
                field(symbol; Rec.Symbol)
                {
                    Caption = 'Symbol';
                    ToolTip = 'Specifies the symbol for this unit of measure record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this unit of measure record.';
                    ApplicationArea = All;
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dynamics 365 Sales';
                    ToolTip = 'Specifies the coupled to dataverse for this unit of measure record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}