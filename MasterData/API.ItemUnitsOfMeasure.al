namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Item;

page 90838 "ocpfItemUnitsOfMeasure"
{
    PageType = API;
    Caption = 'Item Units of Measure — per-item unit of measure conversions defining how many base units make up each alternate unit for a specific item.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfItemUnitOfMeasure';
    EntitySetName = 'ocpfItemUnitsOfMeasure';
    SourceTable = "Item Unit of Measure";
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
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the item no. for this item unit of measure record.';
                    ApplicationArea = All;
                }
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for this item unit of measure record.';
                    ApplicationArea = All;
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    ToolTip = 'Specifies the qty. per unit of measure for this item unit of measure record.';
                    ApplicationArea = All;
                }
                field(qtyRoundingPrecision; Rec."Qty. Rounding Precision")
                {
                    Caption = 'Qty. Rounding Precision';
                    ToolTip = 'Specifies the qty. rounding precision for this item unit of measure record.';
                    ApplicationArea = All;
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dynamics 365 Sales';
                    ToolTip = 'Specifies the coupled to dataverse for this item unit of measure record.';
                    ApplicationArea = All;
                }
                field(length; Rec.Length)
                {
                    Caption = 'Length';
                    ToolTip = 'Specifies the length for this item unit of measure record.';
                    ApplicationArea = All;
                }
                field(width; Rec.Width)
                {
                    Caption = 'Width';
                    ToolTip = 'Specifies the width for this item unit of measure record.';
                    ApplicationArea = All;
                }
                field(height; Rec.Height)
                {
                    Caption = 'Height';
                    ToolTip = 'Specifies the height for this item unit of measure record.';
                    ApplicationArea = All;
                }
                field(cubage; Rec.Cubage)
                {
                    Caption = 'Cubage';
                    ToolTip = 'Specifies the cubage for this item unit of measure record.';
                    ApplicationArea = All;
                }
                field(weight; Rec.Weight)
                {
                    Caption = 'Weight';
                    ToolTip = 'Specifies the weight for this item unit of measure record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}