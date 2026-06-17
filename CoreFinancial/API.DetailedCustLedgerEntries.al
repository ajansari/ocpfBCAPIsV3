namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.Receivables;

page 90807 "ocpfDetailedCustLedgerEntries"
{
    PageType = API;
    Caption = 'Detailed Customer Ledger Entries — granular application records showing how customer payments and credit memos are applied to invoices, used for AR aging and reconciliation.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfDetailedCustLedgerEntry';
    EntitySetName = 'ocpfDetailedCustLedgerEntries';
    SourceTable = "Detailed Cust. Ledg. Entry";
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
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                    ApplicationArea = All;
                }
                field(custLedgerEntryNo; Rec."Cust. Ledger Entry No.")
                {
                    Caption = 'Cust. Ledger Entry No.';
                    ToolTip = 'Specifies the entry number of the customer ledger entry that the detailed customer ledger entry line was created for.';
                    ApplicationArea = All;
                }
                field(entryType; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                    ToolTip = 'Specifies the entry type of the detailed customer ledger entry.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date of the detailed customer ledger entry.';
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies the document type of the detailed customer ledger entry.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the document number of the transaction that created the entry.';
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the amount of the detailed customer ledger entry.';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the customer account number to which the entry is posted.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the code for the currency if the amount is in a foreign currency.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                    ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the source code that specifies where the entry was created.';
                    ApplicationArea = All;
                }
                field(transactionNo; Rec."Transaction No.")
                {
                    Caption = 'Transaction No.';
                    ToolTip = 'Specifies the transaction no. for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                    ToolTip = 'Specifies the journal batch name for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                    ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the entry.';
                    ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    Caption = 'Debit Amount';
                    ToolTip = 'Specifies the total of the ledger entries that represent debits.';
                    ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    Caption = 'Credit Amount';
                    ToolTip = 'Specifies the total of the ledger entries that represent credits.';
                    ApplicationArea = All;
                }
                field(initialEntryDueDate; Rec."Initial Entry Due Date")
                {
                    Caption = 'Initial Entry Due Date';
                    ToolTip = 'Specifies the date on which the initial entry is due for payment.';
                    ApplicationArea = All;
                }
                field(initialEntryGlobalDim1; Rec."Initial Entry Global Dim. 1")
                {
                    Caption = 'Initial Entry Global Dim. 1';
                    ToolTip = 'Specifies the Global Dimension 1 code of the initial customer ledger entry.';
                    ApplicationArea = All;
                }
                field(initialEntryGlobalDim2; Rec."Initial Entry Global Dim. 2")
                {
                    Caption = 'Initial Entry Global Dim. 2';
                    ToolTip = 'Specifies the Global Dimension 2 code of the initial customer ledger entry.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the gen. bus. posting group for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the gen. prod. posting group for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(useTax; Rec."Use Tax")
                {
                    Caption = 'Use Tax';
                    ToolTip = 'Specifies the use tax for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(vATBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ToolTip = 'Specifies the vat bus. posting group for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                    ToolTip = 'Specifies the vat prod. posting group for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(initialDocumentType; Rec."Initial Document Type")
                {
                    Caption = 'Initial Document Type';
                    ToolTip = 'Specifies the document type that the initial customer ledger entry was created with.';
                    ApplicationArea = All;
                }
                field(appliedCustLedgerEntryNo; Rec."Applied Cust. Ledger Entry No.")
                {
                    Caption = 'Applied Cust. Ledger Entry No.';
                    ToolTip = 'Specifies the applied cust. ledger entry no. for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(unapplied; Rec.Unapplied)
                {
                    Caption = 'Unapplied';
                    ToolTip = 'Specifies whether the entry has been unapplied (undone) from the Unapply Customer Entries window by the entry no. shown in the Unapplied by Entry No. field.';
                    ApplicationArea = All;
                }
                field(unappliedByEntryNo; Rec."Unapplied by Entry No.")
                {
                    Caption = 'Unapplied by Entry No.';
                    ToolTip = 'Specifies the number of the correcting entry, if the original entry has been unapplied (undone) from the Unapply Customer Entries window.';
                    ApplicationArea = All;
                }
                field(remainingPmtDiscPossible; Rec."Remaining Pmt. Disc. Possible")
                {
                    Caption = 'Remaining Pmt. Disc. Possible';
                    ToolTip = 'Specifies the remaining pmt. disc. possible for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(maxPaymentTolerance; Rec."Max. Payment Tolerance")
                {
                    Caption = 'Max. Payment Tolerance';
                    ToolTip = 'Specifies the max. payment tolerance for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(taxJurisdictionCode; Rec."Tax Jurisdiction Code")
                {
                    Caption = 'Tax Jurisdiction Code';
                    ToolTip = 'Specifies the tax jurisdiction code for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(applicationNo; Rec."Application No.")
                {
                    Caption = 'Application No.';
                    ToolTip = 'Specifies the application no. for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(ledgerEntryAmount; Rec."Ledger Entry Amount")
                {
                    Caption = 'Ledger Entry Amount';
                    ToolTip = 'Specifies the ledger entry amount for this detailed cust. ledg. entry record.';
                    ApplicationArea = All;
                }
                field(postingGroup; Rec."Posting Group")
                {
                    Caption = 'Customer Posting Group';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(exchRateAdjmtRegNo; Rec."Exch. Rate Adjmt. Reg. No.")
                {
                    Caption = 'Exch. Rate Adjmt. Reg. No.';
                    ToolTip = 'Specifies the exch. rate adjmt. reg. no. for this detailed cust. ledg. entry record.';
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