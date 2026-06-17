namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.Customer;

page 90814 "ocpfCustomerPostingGroups"
{
    PageType = API;
    Caption = 'Customer Posting Groups — define which receivables and other G/L accounts are used when posting customer transactions.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfCustomerPostingGroup';
    EntitySetName = 'ocpfCustomerPostingGroups';
    SourceTable = "Customer Posting Group";
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
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the identifier for the customer posting group. This is what you choose when you assign the group to an entity or document.';
                    ApplicationArea = All;
                }
                field(receivablesAccount; Rec."Receivables Account")
                {
                    Caption = 'Receivables Account';
                    ToolTip = 'Specifies the general ledger account to use when you post receivables from customers in this posting group.';
                    ApplicationArea = All;
                }
                field(serviceChargeAcc; Rec."Service Charge Acc.")
                {
                    Caption = 'Service Charge Acc.';
                    ToolTip = 'Specifies the general ledger account to use when you post service charges for customers in this posting group.';
                    ApplicationArea = All;
                }
                field(paymentDiscDebitAcc; Rec."Payment Disc. Debit Acc.")
                {
                    Caption = 'Payment Disc. Debit Acc.';
                    ToolTip = 'Specifies the general ledger account to use when you post payment discounts granted to customers in this posting group.';
                    ApplicationArea = All;
                }
                field(invoiceRoundingAccount; Rec."Invoice Rounding Account")
                {
                    Caption = 'Invoice Rounding Account';
                    ToolTip = 'Specifies the general ledger account to use when you post amounts that result from invoice rounding when you post transactions for customers.';
                    ApplicationArea = All;
                }
                field(additionalFeeAccount; Rec."Additional Fee Account")
                {
                    Caption = 'Additional Fee Account';
                    ToolTip = 'Specifies the general ledger account to use when you post additional fees from reminders and finance charge memos for customers in this posting group.';
                    ApplicationArea = All;
                }
                field(interestAccount; Rec."Interest Account")
                {
                    Caption = 'Interest Account';
                    ToolTip = 'Specifies the general ledger account to use when you post interest from reminders and finance charge memos for customers in this posting group.';
                    ApplicationArea = All;
                }
                field(debitCurrApplnRndgAcc; Rec."Debit Curr. Appln. Rndg. Acc.")
                {
                    Caption = 'Debit Curr. Appln. Rndg. Acc.';
                    ToolTip = 'Specifies the general ledger account to use when you post rounding differences. These differences can occur when you apply entries in different currencies to one another.';
                    ApplicationArea = All;
                }
                field(creditCurrApplnRndgAcc; Rec."Credit Curr. Appln. Rndg. Acc.")
                {
                    Caption = 'Credit Curr. Appln. Rndg. Acc.';
                    ToolTip = 'Specifies the general ledger account to use when you post rounding differences. These differences can occur when you apply entries in different currencies to one another.';
                    ApplicationArea = All;
                }
                field(debitRoundingAccount; Rec."Debit Rounding Account")
                {
                    Caption = 'Debit Rounding Account';
                    ToolTip = 'Specifies the general ledger account to use when you post rounding differences from a remaining amount.';
                    ApplicationArea = All;
                }
                field(creditRoundingAccount; Rec."Credit Rounding Account")
                {
                    Caption = 'Credit Rounding Account';
                    ToolTip = 'Specifies the general ledger account to use when you post rounding differences from a remaining amount.';
                    ApplicationArea = All;
                }
                field(paymentDiscCreditAcc; Rec."Payment Disc. Credit Acc.")
                {
                    Caption = 'Payment Disc. Credit Acc.';
                    ToolTip = 'Specifies the general ledger account to use when you post reductions in payment discounts granted to customers in this posting group.';
                    ApplicationArea = All;
                }
                field(paymentToleranceDebitAcc; Rec."Payment Tolerance Debit Acc.")
                {
                    Caption = 'Payment Tolerance Debit Acc.';
                    ToolTip = 'Specifies the general ledger account to use when you post payment tolerance and payments for sales. This applies to this particular combination of business group and product group.';
                    ApplicationArea = All;
                }
                field(paymentToleranceCreditAcc; Rec."Payment Tolerance Credit Acc.")
                {
                    Caption = 'Payment Tolerance Credit Acc.';
                    ToolTip = 'Specifies the general ledger account to use when you post payment tolerance and payments for sales. This applies to this particular combination of business group and product group.';
                    ApplicationArea = All;
                }
                field(addFeePerLineAccount; Rec."Add. Fee per Line Account")
                {
                    Caption = 'Add. Fee per Line Account';
                    ToolTip = 'Specifies the general ledger account that additional fees are posted to.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for the customer posting group.';
                    ApplicationArea = All;
                }
                field(viewAllAccountsOnLookup; Rec."View All Accounts on Lookup")
                {
                    Caption = 'View All Accounts on Lookup';
                    ToolTip = 'Specifies that all possible accounts are shown when you look up from a field. If the check box is not selected, then only accounts related to the involved account category are shown.';
                    ApplicationArea = All;
                }
            }
        }
    }
}