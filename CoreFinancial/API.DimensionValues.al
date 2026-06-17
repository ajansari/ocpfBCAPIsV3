namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.Dimension;

page 90821 "ocpfDimensionValues"
{
    PageType = API;
    Caption = 'Dimension Values — the individual codes within a dimension (e.g., SALES, ADMIN within Department) used to tag transactions for reporting.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfDimensionValue';
    EntitySetName = 'ocpfDimensionValues';
    SourceTable = "Dimension Value";
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
                field(dimensionCode; Rec."Dimension Code")
                {
                    Caption = 'Dimension Code';
                    ToolTip = 'Specifies the dimension code for this dimension value record.';
                    ApplicationArea = All;
                }
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for this dimension value record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this dimension value record.';
                    ApplicationArea = All;
                }
                field(dimensionValueType; Rec."Dimension Value Type")
                {
                    Caption = 'Dimension Value Type';
                    ToolTip = 'Specifies the dimension value type for this dimension value record.';
                    ApplicationArea = All;
                }
                field(totaling; Rec.Totaling)
                {
                    Caption = 'Totaling';
                    ToolTip = 'Specifies the totaling for this dimension value record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the blocked for this dimension value record.';
                    ApplicationArea = All;
                }
                field(consolidationCode; Rec."Consolidation Code")
                {
                    Caption = 'Consolidation Code';
                    ToolTip = 'Specifies the consolidation code for this dimension value record.';
                    ApplicationArea = All;
                }
                field(indentation; Rec.Indentation)
                {
                    Caption = 'Indentation';
                    ToolTip = 'Specifies the indentation for this dimension value record.';
                    ApplicationArea = All;
                }
                field(globalDimensionNo; Rec."Global Dimension No.")
                {
                    Caption = 'Global Dimension No.';
                    ToolTip = 'Specifies the global dimension no. for this dimension value record.';
                    ApplicationArea = All;
                }
                field(mapToIcDimensionCode; Rec."Map-to IC Dimension Code")
                {
                    Caption = 'Map-to IC Dimension Code';
                    ToolTip = 'Specifies the map-to ic dimension code for this dimension value record.';
                    ApplicationArea = All;
                }
                field(mapToIcDimensionValueCode; Rec."Map-to IC Dimension Value Code")
                {
                    Caption = 'Map-to IC Dimension Value Code';
                    ToolTip = 'Specifies the map-to ic dimension value code for this dimension value record.';
                    ApplicationArea = All;
                }
                field(dimensionValueId; Rec."Dimension Value ID")
                {
                    Caption = 'Dimension Value ID';
                    ToolTip = 'Specifies the dimension value id for this dimension value record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this dimension value record.';
                    ApplicationArea = All;
                }
                field(dimensionId; Rec."Dimension Id")
                {
                    Caption = 'Dimension Id';
                    ToolTip = 'Specifies the dimension id for this dimension value record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}