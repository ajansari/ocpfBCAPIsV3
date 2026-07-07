namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Capacity;

page 90946 "ocpfCapacityUnitsOfMeasure"
{
    PageType = API;
    Caption = 'Capacity Units of Measure — time units (minutes, hours, days) used to express capacity and run times.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfCapacityUnitOfMeasure';
    EntitySetName = 'ocpfCapacityUnitsOfMeasure';
    SourceTable = "Capacity Unit of Measure";
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
                field(code; Rec."Code")
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the unit code.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description of the unit of measure.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type of unit of measure.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
