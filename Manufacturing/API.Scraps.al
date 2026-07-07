namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Setup;

page 90950 "ocpfScraps"
{
    PageType = API;
    Caption = 'Scrap Codes — reasons for scrapped quantities in production output.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfScrap';
    EntitySetName = 'ocpfScraps';
    SourceTable = "Scrap";
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
                    ToolTip = 'Specifies a code to identify why an item has been scrapped.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description for the scrap code.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
