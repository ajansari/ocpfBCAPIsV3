namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Purchases.Vendor;

page 90909 "ocpfVendorInvoiceDiscounts"
{
    PageType = API;
    Caption = 'Vendor Invoice Discounts — invoice discount percentages and service charges by vendor discount group and currency.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_purchasing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfVendorInvoiceDiscount';
    EntitySetName = 'ocpfVendorInvoiceDiscounts';
    SourceTable = "Vendor Invoice Disc.";
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
                    ToolTip = 'Specifies the code for this vendor invoice discount record.';
                    ApplicationArea = All;
                }
                field(minimumAmount; Rec."Minimum Amount")
                {
                    Caption = 'Minimum Amount';
                    ToolTip = 'Specifies the minimum amount for this vendor invoice discount record.';
                    ApplicationArea = All;
                }
                field(discountPct; Rec."Discount %")
                {
                    Caption = 'Discount %';
                    ToolTip = 'Specifies the discount % for this vendor invoice discount record.';
                    ApplicationArea = All;
                }
                field(serviceCharge; Rec."Service Charge")
                {
                    Caption = 'Service Charge';
                    ToolTip = 'Specifies the service charge for this vendor invoice discount record.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this vendor invoice discount record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
