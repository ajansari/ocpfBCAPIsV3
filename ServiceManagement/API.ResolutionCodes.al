namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Maintenance;

page 90980 "ocpfResolutionCodes"
{
    PageType = API;
    Caption = 'Resolution Codes — how faults were resolved, used in service fault/resolution reporting.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfResolutionCode';
    EntitySetName = 'ocpfResolutionCodes';
    SourceTable = "Resolution Code";
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
                    ToolTip = 'Specifies a code for the resolution.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the resolution code.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
