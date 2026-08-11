namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.Dimension;

page 90822 "ocpfDefaultDimensions"
{
    PageType = API;
    Caption = 'Default Dimensions — rules that define which dimension values are automatically suggested or required when posting transactions for a specific master record such as a customer, vendor, or item.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfDefaultDimension';
    EntitySetName = 'ocpfDefaultDimensions';
    SourceTable = "Default Dimension";
    ODataKeyFields = SystemId;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'ID';
                    ToolTip = 'Unique system-assigned identifier for this record. Used as the OData key.';
                    ApplicationArea = All;
                }
                field(tableId; Rec."Table ID")
                {
                    Caption = 'Table ID';
                    ToolTip = 'Specifies the table id for this default dimension record.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the no. for this default dimension record.';
                    ApplicationArea = All;
                }
                field(dimensionCode; Rec."Dimension Code")
                {
                    Caption = 'Dimension Code';
                    ToolTip = 'Specifies the dimension code for this default dimension record.';
                    ApplicationArea = All;
                }
                field(dimensionValueCode; Rec."Dimension Value Code")
                {
                    Caption = 'Dimension Value Code';
                    ToolTip = 'Specifies the dimension value code for this default dimension record.';
                    ApplicationArea = All;
                }
                field(valuePosting; Rec."Value Posting")
                {
                    Caption = 'Value Posting';
                    ToolTip = 'Specifies the value posting for this default dimension record.';
                    ApplicationArea = All;
                }
                field(tableCaption; Rec."Table Caption")
                {
                    Caption = 'Table Caption';
                    ToolTip = 'Specifies the table caption for this default dimension record.';
                    ApplicationArea = All;
                }
                field(multiSelectionAction; Rec."Multi Selection Action")
                {
                    Caption = 'Multi Selection Action';
                    ToolTip = 'Specifies the multi selection action for this default dimension record.';
                    ApplicationArea = All;
                }
                field(parentType; Rec."Parent Type")
                {
                    Caption = 'Parent Type';
                    ToolTip = 'Specifies the parent type for this default dimension record.';
                    ApplicationArea = All;
                }
                field(allowedValuesFilter; Rec."Allowed Values Filter")
                {
                    Caption = 'Allowed Values Filter';
                    ToolTip = 'Specifies the allowed values filter for this default dimension record.';
                    ApplicationArea = All;
                }
                field(dimensionValueName; Rec."Dimension Value Name")
                {
                    Caption = 'Dimension Value Name';
                    ToolTip = 'Specifies the dimension value name for this default dimension record.';
                    ApplicationArea = All;
                }
                field(parentId; Rec.ParentId)
                {
                    Caption = 'ParentId';
                    ToolTip = 'Specifies the parentid for this default dimension record.';
                    ApplicationArea = All;
                }
                field(dimensionId; Rec.DimensionId)
                {
                    Caption = 'DimensionId';
                    ToolTip = 'Specifies the dimensionid for this default dimension record.';
                    ApplicationArea = All;
                }
                field(dimensionValueId; Rec.DimensionValueId)
                {
                    Caption = 'DimensionValueId';
                    ToolTip = 'Specifies the dimensionvalueid for this default dimension record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}