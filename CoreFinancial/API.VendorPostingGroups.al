namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Purchases.Vendor;

page 90815 "ocpfVendorPostingGroups"
{
    PageType = API;
    Caption = 'Vendor Posting Groups — define which payables and other G/L accounts are used when posting vendor transactions.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfVendorPostingGroup';
    EntitySetName = 'ocpfVendorPostingGroups';
    SourceTable = "Vendor Posting Group";
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
                    ToolTip = 'Specifies the code for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(payablesAccount; Rec."Payables Account")
                {
                    Caption = 'Payables Account';
                    ToolTip = 'Specifies the payables account for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(serviceChargeAcc; Rec."Service Charge Acc.")
                {
                    Caption = 'Service Charge Acc.';
                    ToolTip = 'Specifies the service charge acc. for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(paymentDiscDebitAcc; Rec."Payment Disc. Debit Acc.")
                {
                    Caption = 'Payment Disc. Debit Acc.';
                    ToolTip = 'Specifies the payment disc. debit acc. for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(invoiceRoundingAccount; Rec."Invoice Rounding Account")
                {
                    Caption = 'Invoice Rounding Account';
                    ToolTip = 'Specifies the invoice rounding account for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(debitCurrApplnRndgAcc; Rec."Debit Curr. Appln. Rndg. Acc.")
                {
                    Caption = 'Debit Curr. Appln. Rndg. Acc.';
                    ToolTip = 'Specifies the debit curr. appln. rndg. acc. for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(creditCurrApplnRndgAcc; Rec."Credit Curr. Appln. Rndg. Acc.")
                {
                    Caption = 'Credit Curr. Appln. Rndg. Acc.';
                    ToolTip = 'Specifies the credit curr. appln. rndg. acc. for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(debitRoundingAccount; Rec."Debit Rounding Account")
                {
                    Caption = 'Debit Rounding Account';
                    ToolTip = 'Specifies the debit rounding account for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(creditRoundingAccount; Rec."Credit Rounding Account")
                {
                    Caption = 'Credit Rounding Account';
                    ToolTip = 'Specifies the credit rounding account for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(paymentDiscCreditAcc; Rec."Payment Disc. Credit Acc.")
                {
                    Caption = 'Payment Disc. Credit Acc.';
                    ToolTip = 'Specifies the payment disc. credit acc. for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(paymentToleranceDebitAcc; Rec."Payment Tolerance Debit Acc.")
                {
                    Caption = 'Payment Tolerance Debit Acc.';
                    ToolTip = 'Specifies the payment tolerance debit acc. for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(paymentToleranceCreditAcc; Rec."Payment Tolerance Credit Acc.")
                {
                    Caption = 'Payment Tolerance Credit Acc.';
                    ToolTip = 'Specifies the payment tolerance credit acc. for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this vendor posting group record.';
                    ApplicationArea = All;
                }
                field(viewAllAccountsOnLookup; Rec."View All Accounts on Lookup")
                {
                    Caption = 'View All Accounts on Lookup';
                    ToolTip = 'Specifies the view all accounts on lookup for this vendor posting group record.';
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