namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Routing;

page 90953 "ocpfRoutingHeaders"
{
    PageType = API;
    Caption = 'Routings — headers describing the sequence of operations required to produce an item.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfRoutingHeader';
    EntitySetName = 'ocpfRoutingHeaders';
    SourceTable = "Routing Header";
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
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description for the routing header.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies the Description 2.';
                    ApplicationArea = All;
                }
                field(searchDescription; Rec."Search Description")
                {
                    Caption = 'Search Description';
                    ToolTip = 'Specifies a search description.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies when the routing card was last modified.';
                    ApplicationArea = All;
                }
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
                    ApplicationArea = All;
                }
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the status of this routing.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies in which order operations in the routing are performed.';
                    ApplicationArea = All;
                }
                field(versionNos; Rec."Version Nos.")
                {
                    Caption = 'Version Nos.';
                    ToolTip = 'Specifies the number series you want to use to create a new version of this routing.';
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
