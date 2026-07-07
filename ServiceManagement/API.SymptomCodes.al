namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Maintenance;

page 90977 "ocpfSymptomCodes"
{
    PageType = API;
    Caption = 'Symptom Codes — customer-reported symptoms used in service fault reporting.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfSymptomCode';
    EntitySetName = 'ocpfSymptomCodes';
    SourceTable = "Symptom Code";
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
                    ToolTip = 'Specifies a code for the symptom.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the symptom code.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
