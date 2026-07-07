namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Setup;

page 90949 "ocpfStops"
{
    PageType = API;
    Caption = 'Stop Codes — reasons for production stops, used on output journal lines and capacity ledger entries.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfStop';
    EntitySetName = 'ocpfStops';
    SourceTable = "Stop";
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
                    ToolTip = 'Specifies a code to identify why a machine center has stopped.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description for the stop code.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
