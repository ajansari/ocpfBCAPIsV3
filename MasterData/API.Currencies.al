namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.Currency;

page 90835 "ocpfCurrencies"
{
    PageType = API;
    Caption = 'Currencies — foreign currency codes with exchange rate settings used across sales, purchasing, and banking transactions.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfCurrency';
    EntitySetName = 'ocpfCurrencies';
    SourceTable = Currency;
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
                    ToolTip = 'Specifies the code for this currency record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date modified for this currency record.';
                    ApplicationArea = All;
                }
                field(lastDateAdjusted; Rec."Last Date Adjusted")
                {
                    Caption = 'Last Date Adjusted';
                    ToolTip = 'Specifies the last date adjusted for this currency record.';
                    ApplicationArea = All;
                }
                field(iSOCode; Rec."ISO Code")
                {
                    Caption = 'ISO Code';
                    ToolTip = 'Specifies the iso code for this currency record.';
                    ApplicationArea = All;
                }
                field(iSONumericCode; Rec."ISO Numeric Code")
                {
                    Caption = 'ISO Numeric Code';
                    ToolTip = 'Specifies the iso numeric code for this currency record.';
                    ApplicationArea = All;
                }
                field(unrealizedGainsAcc; Rec."Unrealized Gains Acc.")
                {
                    Caption = 'Unrealized Gains Acc.';
                    ToolTip = 'Specifies the unrealized gains acc. for this currency record.';
                    ApplicationArea = All;
                }
                field(realizedGainsAcc; Rec."Realized Gains Acc.")
                {
                    Caption = 'Realized Gains Acc.';
                    ToolTip = 'Specifies the realized gains acc. for this currency record.';
                    ApplicationArea = All;
                }
                field(unrealizedLossesAcc; Rec."Unrealized Losses Acc.")
                {
                    Caption = 'Unrealized Losses Acc.';
                    ToolTip = 'Specifies the unrealized losses acc. for this currency record.';
                    ApplicationArea = All;
                }
                field(realizedLossesAcc; Rec."Realized Losses Acc.")
                {
                    Caption = 'Realized Losses Acc.';
                    ToolTip = 'Specifies the realized losses acc. for this currency record.';
                    ApplicationArea = All;
                }
                field(invoiceRoundingPrecision; Rec."Invoice Rounding Precision")
                {
                    Caption = 'Invoice Rounding Precision';
                    ToolTip = 'Specifies the invoice rounding precision for this currency record.';
                    ApplicationArea = All;
                }
                field(invoiceRoundingType; Rec."Invoice Rounding Type")
                {
                    Caption = 'Invoice Rounding Type';
                    ToolTip = 'Specifies the invoice rounding type for this currency record.';
                    ApplicationArea = All;
                }
                field(amountRoundingPrecision; Rec."Amount Rounding Precision")
                {
                    Caption = 'Amount Rounding Precision';
                    ToolTip = 'Specifies the amount rounding precision for this currency record.';
                    ApplicationArea = All;
                }
                field(unitAmountRoundingPrecision; Rec."Unit-Amount Rounding Precision")
                {
                    Caption = 'Unit-Amount Rounding Precision';
                    ToolTip = 'Specifies the unit-amount rounding precision for this currency record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this currency record.';
                    ApplicationArea = All;
                }
                field(amountDecimalPlaces; Rec."Amount Decimal Places")
                {
                    Caption = 'Amount Decimal Places';
                    ToolTip = 'Specifies the amount decimal places for this currency record.';
                    ApplicationArea = All;
                }
                field(unitAmountDecimalPlaces; Rec."Unit-Amount Decimal Places")
                {
                    Caption = 'Unit-Amount Decimal Places';
                    ToolTip = 'Specifies the unit-amount decimal places for this currency record.';
                    ApplicationArea = All;
                }
                field(customerFilter; Rec."Customer Filter")
                {
                    Caption = 'Customer Filter';
                    ToolTip = 'Specifies the customer filter for this currency record.';
                    ApplicationArea = All;
                }
                field(vendorFilter; Rec."Vendor Filter")
                {
                    Caption = 'Vendor Filter';
                    ToolTip = 'Specifies the vendor filter for this currency record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Filter; Rec."Global Dimension 1 Filter")
                {
                    Caption = 'Global Dimension 1 Filter';
                    ToolTip = 'Specifies the global dimension 1 filter for this currency record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Filter; Rec."Global Dimension 2 Filter")
                {
                    Caption = 'Global Dimension 2 Filter';
                    ToolTip = 'Specifies the global dimension 2 filter for this currency record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this currency record.';
                    ApplicationArea = All;
                }
                field(custLedgEntriesInFilter; Rec."Cust. Ledg. Entries in Filter")
                {
                    Caption = 'Cust. Ledg. Entries in Filter';
                    ToolTip = 'Specifies the cust. ledg. entries in filter for this currency record.';
                    ApplicationArea = All;
                }
                field(customerBalance; Rec."Customer Balance")
                {
                    Caption = 'Customer Balance';
                    ToolTip = 'Specifies the customer balance for this currency record.';
                    ApplicationArea = All;
                }
                field(customerOutstandingOrders; Rec."Customer Outstanding Orders")
                {
                    Caption = 'Customer Outstanding Orders';
                    ToolTip = 'Specifies the customer outstanding orders for this currency record.';
                    ApplicationArea = All;
                }
                field(customerShippedNotInvoiced; Rec."Customer Shipped Not Invoiced")
                {
                    Caption = 'Customer Shipped Not Invoiced';
                    ToolTip = 'Specifies the customer shipped not invoiced for this currency record.';
                    ApplicationArea = All;
                }
                field(customerBalanceDue; Rec."Customer Balance Due")
                {
                    Caption = 'Customer Balance Due';
                    ToolTip = 'Specifies the customer balance due for this currency record.';
                    ApplicationArea = All;
                }
                field(vendorLedgEntriesInFilter; Rec."Vendor Ledg. Entries in Filter")
                {
                    Caption = 'Vendor Ledg. Entries in Filter';
                    ToolTip = 'Specifies the vendor ledg. entries in filter for this currency record.';
                    ApplicationArea = All;
                }
                field(vendorBalance; Rec."Vendor Balance")
                {
                    Caption = 'Vendor Balance';
                    ToolTip = 'Specifies the vendor balance for this currency record.';
                    ApplicationArea = All;
                }
                field(vendorOutstandingOrders; Rec."Vendor Outstanding Orders")
                {
                    Caption = 'Vendor Outstanding Orders';
                    ToolTip = 'Specifies the vendor outstanding orders for this currency record.';
                    ApplicationArea = All;
                }
                field(vendorAmtRcdNotInvoiced; Rec."Vendor Amt. Rcd. Not Invoiced")
                {
                    Caption = 'Vendor Amt. Rcd. Not Invoiced';
                    ToolTip = 'Specifies the vendor amt. rcd. not invoiced for this currency record.';
                    ApplicationArea = All;
                }
                field(vendorBalanceDue; Rec."Vendor Balance Due")
                {
                    Caption = 'Vendor Balance Due';
                    ToolTip = 'Specifies the vendor balance due for this currency record.';
                    ApplicationArea = All;
                }
                field(realizedGLGainsAccount; Rec."Realized G/L Gains Account")
                {
                    Caption = 'Realized G/L Gains Account';
                    ToolTip = 'Specifies the realized g/l gains account for this currency record.';
                    ApplicationArea = All;
                }
                field(realizedGLLossesAccount; Rec."Realized G/L Losses Account")
                {
                    Caption = 'Realized G/L Losses Account';
                    ToolTip = 'Specifies the realized g/l losses account for this currency record.';
                    ApplicationArea = All;
                }
                field(applnRoundingPrecision; Rec."Appln. Rounding Precision")
                {
                    Caption = 'Appln. Rounding Precision';
                    ToolTip = 'Specifies the appln. rounding precision for this currency record.';
                    ApplicationArea = All;
                }
                field(eMUCurrency; Rec."EMU Currency")
                {
                    Caption = 'EMU Currency';
                    ToolTip = 'Specifies the emu currency for this currency record.';
                    ApplicationArea = All;
                }
                field(currencyFactor; Rec."Currency Factor")
                {
                    Caption = 'Currency Factor';
                    ToolTip = 'Specifies the currency factor for this currency record.';
                    ApplicationArea = All;
                }
                field(residualGainsAccount; Rec."Residual Gains Account")
                {
                    Caption = 'Residual Gains Account';
                    ToolTip = 'Specifies the residual gains account for this currency record.';
                    ApplicationArea = All;
                }
                field(residualLossesAccount; Rec."Residual Losses Account")
                {
                    Caption = 'Residual Losses Account';
                    ToolTip = 'Specifies the residual losses account for this currency record.';
                    ApplicationArea = All;
                }
                field(convLcyRndgDebitAcc; Rec."Conv. LCY Rndg. Debit Acc.")
                {
                    Caption = 'Conv. LCY Rndg. Debit Acc.';
                    ToolTip = 'Specifies the conv. lcy rndg. debit acc. for this currency record.';
                    ApplicationArea = All;
                }
                field(convLcyRndgCreditAcc; Rec."Conv. LCY Rndg. Credit Acc.")
                {
                    Caption = 'Conv. LCY Rndg. Credit Acc.';
                    ToolTip = 'Specifies the conv. lcy rndg. credit acc. for this currency record.';
                    ApplicationArea = All;
                }
                field(maxVatDifferenceAllowed; Rec."Max. VAT Difference Allowed")
                {
                    Caption = 'Max. VAT Difference Allowed';
                    ToolTip = 'Specifies the max. vat difference allowed for this currency record.';
                    ApplicationArea = All;
                }
                field(vATRoundingType; Rec."VAT Rounding Type")
                {
                    Caption = 'VAT Rounding Type';
                    ToolTip = 'Specifies the vat rounding type for this currency record.';
                    ApplicationArea = All;
                }
                field(paymentTolerance; Rec."Payment Tolerance %")
                {
                    Caption = 'Payment Tolerance %';
                    ToolTip = 'Specifies the payment tolerance % for this currency record.';
                    ApplicationArea = All;
                }
                field(maxPaymentToleranceAmount; Rec."Max. Payment Tolerance Amount")
                {
                    Caption = 'Max. Payment Tolerance Amount';
                    ToolTip = 'Specifies the max. payment tolerance amount for this currency record.';
                    ApplicationArea = All;
                }
                field(symbol; Rec.Symbol)
                {
                    Caption = 'Symbol';
                    ToolTip = 'Specifies the symbol for this currency record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this currency record.';
                    ApplicationArea = All;
                }
                field(currencySymbolPosition; Rec."Currency Symbol Position")
                {
                    Caption = 'Currency Symbol Position';
                    ToolTip = 'Specifies the position of the currency symbol in relation to the amount.';
                    ApplicationArea = All;
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dataverse';
                    ToolTip = 'Specifies the coupled to dataverse for this currency record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}