namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Routing;

page 90952 "ocpfStandardTasks"
{
    PageType = API;
    Caption = 'Standard Tasks — reusable operation descriptions that can be assigned to routing lines.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfStandardTask';
    EntitySetName = 'ocpfStandardTasks';
    SourceTable = "Standard Task";
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
                    ToolTip = 'Specifies the standard task code.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description of the standard task.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
