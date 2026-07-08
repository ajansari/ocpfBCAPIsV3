namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.Pricing;

page 90889 "ocpfCustomerInvoiceDiscounts"
{
    PageType = API;
    Caption = 'Customer Invoice Discounts — invoice discount percentages and service charges by customer discount group and currency (the sales/customer invoice discount setup).';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_sales';
    APIVersion = 'v3.1';
    EntityName = 'ocpfCustomerInvoiceDiscount';
    EntitySetName = 'ocpfCustomerInvoiceDiscounts';
    SourceTable = "Cust. Invoice Disc.";
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
                    ToolTip = 'Specifies the code for this customer invoice discount record.';
                    ApplicationArea = All;
                }
                field(minimumAmount; Rec."Minimum Amount")
                {
                    Caption = 'Minimum Amount';
                    ToolTip = 'Specifies the minimum amount for this customer invoice discount record.';
                    ApplicationArea = All;
                }
                field(discountPct; Rec."Discount %")
                {
                    Caption = 'Discount %';
                    ToolTip = 'Specifies the discount % for this customer invoice discount record.';
                    ApplicationArea = All;
                }
                field(serviceCharge; Rec."Service Charge")
                {
                    Caption = 'Service Charge';
                    ToolTip = 'Specifies the service charge for this customer invoice discount record.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this customer invoice discount record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
