namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.Pricing;

page 90888 "ocpfSalesLineDiscounts"
{
    PageType = API;
    Caption = 'Sales Line Discounts — line discount percentages by customer, item, and other sales pricing criteria.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_sales';
    APIVersion = 'v3.1';
    EntityName = 'ocpfSalesLineDiscount';
    EntitySetName = 'ocpfSalesLineDiscounts';
    SourceTable = "Sales Line Discount";
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
                    ToolTip = 'Specifies the code for this sales line discount record.';
                    ApplicationArea = All;
                }
                field(salesCode; Rec."Sales Code")
                {
                    Caption = 'Sales Code';
                    ToolTip = 'Specifies the sales code for this sales line discount record.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this sales line discount record.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the starting date for this sales line discount record.';
                    ApplicationArea = All;
                }
                field(lineDiscountPct; Rec."Line Discount %")
                {
                    Caption = 'Line Discount %';
                    ToolTip = 'Specifies the line discount % for this sales line discount record.';
                    ApplicationArea = All;
                }
                field(salesType; Rec."Sales Type")
                {
                    Caption = 'Sales Type';
                    ToolTip = 'Specifies the sales type for this sales line discount record.';
                    ApplicationArea = All;
                }
                field(minimumQuantity; Rec."Minimum Quantity")
                {
                    Caption = 'Minimum Quantity';
                    ToolTip = 'Specifies the minimum quantity for this sales line discount record.';
                    ApplicationArea = All;
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                    ToolTip = 'Specifies the ending date for this sales line discount record.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type for this sales line discount record.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies the unit of measure code for this sales line discount record.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant code for this sales line discount record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
