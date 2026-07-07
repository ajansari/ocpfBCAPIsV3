namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Routing;

page 90951 "ocpfRoutingLinks"
{
    PageType = API;
    Caption = 'Routing Links — codes that connect production BOM components to specific routing operations for just-in-time consumption.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfRoutingLink';
    EntitySetName = 'ocpfRoutingLinks';
    SourceTable = "Routing Link";
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
                    ToolTip = 'Specifies a routing link code.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for the routing link code.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
