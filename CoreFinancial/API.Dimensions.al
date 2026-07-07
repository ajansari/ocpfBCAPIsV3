namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.Dimension;

page 90820 "ocpfDimensions"
{
    PageType = API;
    Caption = 'Dimensions — named analytical axes (e.g., Department, Project, Cost Center) that can be attached to transactions for multi-dimensional financial reporting.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfDimension';
    EntitySetName = 'ocpfDimensions';
    SourceTable = Dimension;
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
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for this dimension record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this dimension record.';
                    ApplicationArea = All;
                }
                field(codeCaption; Rec."Code Caption")
                {
                    Caption = 'Code Caption';
                    ToolTip = 'Specifies the code caption for this dimension record.';
                    ApplicationArea = All;
                }
                field(filterCaption; Rec."Filter Caption")
                {
                    Caption = 'Filter Caption';
                    ToolTip = 'Specifies the filter caption for this dimension record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this dimension record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the blocked for this dimension record.';
                    ApplicationArea = All;
                }
                field(consolidationCode; Rec."Consolidation Code")
                {
                    Caption = 'Consolidation Code';
                    ToolTip = 'Specifies the consolidation code for this dimension record.';
                    ApplicationArea = All;
                }
                field(mapToIcDimensionCode; Rec."Map-to IC Dimension Code")
                {
                    Caption = 'Map-to IC Dimension Code';
                    ToolTip = 'Specifies the map-to ic dimension code for this dimension record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this dimension record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}