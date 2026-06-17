namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Bank.BankAccount;

page 90834 "ocpfPaymentMethods"
{
    PageType = API;
    Caption = 'Payment Methods — define how invoices are paid (e.g., cash, bank transfer, cheque) and optionally link to a balancing G/L account.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfPaymentMethod';
    EntitySetName = 'ocpfPaymentMethods';
    SourceTable = "Payment Method";
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
                    ToolTip = 'Specifies the code for this payment method record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this payment method record.';
                    ApplicationArea = All;
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                    ToolTip = 'Specifies the bal. account type for this payment method record.';
                    ApplicationArea = All;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                    ToolTip = 'Specifies the bal. account no. for this payment method record.';
                    ApplicationArea = All;
                }
                field(directDebit; Rec."Direct Debit")
                {
                    Caption = 'Direct Debit';
                    ToolTip = 'Specifies the direct debit for this payment method record.';
                    ApplicationArea = All;
                }
                field(directDebitPmtTermsCode; Rec."Direct Debit Pmt. Terms Code")
                {
                    Caption = 'Direct Debit Pmt. Terms Code';
                    ToolTip = 'Specifies the direct debit pmt. terms code for this payment method record.';
                    ApplicationArea = All;
                }
                field(pmtExportLineDefinition; Rec."Pmt. Export Line Definition")
                {
                    Caption = 'Pmt. Export Line Definition';
                    ToolTip = 'Specifies the pmt. export line definition for this payment method record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this payment method record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}