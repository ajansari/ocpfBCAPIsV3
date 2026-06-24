namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.Dimension;

page 90823 "ocpfDimensionSetEntries"
{
    PageType = API;
    Caption = 'Dimension Set Entries — the resolved dimension value combinations stored against ledger entries and documents. Filter by Dimension Set ID to retrieve the dimensions on any posted transaction.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfDimensionSetEntry';
    EntitySetName = 'ocpfDimensionSetEntries';
    SourceTable = "Dimension Set Entry";
    ODataKeyFields = SystemId;
    Editable = false;

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
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the dimension set id for this dimension set entry record.';
                    ApplicationArea = All;
                }
                field(dimensionCode; Rec."Dimension Code")
                {
                    Caption = 'Dimension Code';
                    ToolTip = 'Specifies the dimension code for this dimension set entry record.';
                    ApplicationArea = All;
                }
                field(dimensionValueCode; Rec."Dimension Value Code")
                {
                    Caption = 'Dimension Value Code';
                    ToolTip = 'Specifies the dimension value code for this dimension set entry record.';
                    ApplicationArea = All;
                }
                field(dimensionValueId; Rec."Dimension Value ID")
                {
                    Caption = 'Dimension Value ID';
                    ToolTip = 'Specifies the dimension value id for this dimension set entry record.';
                    ApplicationArea = All;
                }
                field(dimensionName; Rec."Dimension Name")
                {
                    Caption = 'Dimension Name';
                    ToolTip = 'Specifies the dimension name for this dimension set entry record.';
                    ApplicationArea = All;
                }
                field(dimensionValueName; Rec."Dimension Value Name")
                {
                    Caption = 'Dimension Value Name';
                    ToolTip = 'Specifies the dimension value name for this dimension set entry record.';
                    ApplicationArea = All;
                }
                field(globalDimensionNo; Rec."Global Dimension No.")
                {
                    Caption = 'Shortcut Dimension No.';
                    ToolTip = 'Specifies the global dimension no. for this dimension set entry record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified DateTime';
                    ToolTip = 'Specifies the Last Modified DateTime.';
                    ApplicationArea = All;
                }
            }
        }
    }
}