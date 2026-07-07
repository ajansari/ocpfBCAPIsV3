namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Maintenance;

page 90976 "ocpfFaultAreas"
{
    PageType = API;
    Caption = 'Fault Areas — areas of a service item where faults occur, used in fault reporting.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfFaultArea';
    EntitySetName = 'ocpfFaultAreas';
    SourceTable = "Fault Area";
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
                    ToolTip = 'Specifies a code for the fault area.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the fault area.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
