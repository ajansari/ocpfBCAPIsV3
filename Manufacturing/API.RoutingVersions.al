namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Routing;

page 90955 "ocpfRoutingVersions"
{
    PageType = API;
    Caption = 'Routing Versions — dated alternative versions of a routing.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfRoutingVersion';
    EntitySetName = 'ocpfRoutingVersions';
    SourceTable = "Routing Version";
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
                field(routingNo; Rec."Routing No.")
                {
                    Caption = 'Routing No.';
                    ToolTip = 'Specifies the Routing No..';
                    ApplicationArea = All;
                }
                field(versionCode; Rec."Version Code")
                {
                    Caption = 'Version Code';
                    ToolTip = 'Specifies the version code of the routing.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description for the routing version.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the starting date for this routing version.';
                    ApplicationArea = All;
                }
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the status of this routing version.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies in which order operations in the routing are performed.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the Last Date Modified.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the No. Series.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
