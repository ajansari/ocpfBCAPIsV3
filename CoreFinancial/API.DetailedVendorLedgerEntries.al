namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Purchases.Payables;

page 90809 "ocpfDtldVendorLedgEntries"
{
    PageType = API;
    Caption = 'Detailed Vendor Ledger Entries — granular application records showing how vendor payments and credit memos are applied to invoices, used for AP aging and reconciliation.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfDetailedVendorLedgerEntry';
    EntitySetName = 'ocpfDtldVendorLedgEntries';
    SourceTable = "Detailed Vendor Ledg. Entry";
    ODataKeyFields = SystemId;
    Editable = false;

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
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    ToolTip = 'Specifies the entry no. for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(vendorLedgerEntryNo; Rec."Vendor Ledger Entry No.")
                {
                    Caption = 'Vendor Ledger Entry No.';
                    ToolTip = 'Specifies the vendor ledger entry no. for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(entryType; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                    ToolTip = 'Specifies the entry type for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies the document type for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the document no. for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the amount for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the vendor no. for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the user id for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the source code for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(transactionNo; Rec."Transaction No.")
                {
                    Caption = 'Transaction No.';
                    ToolTip = 'Specifies the transaction no. for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                    ToolTip = 'Specifies the journal batch name for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                    ToolTip = 'Specifies the reason code for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    Caption = 'Debit Amount';
                    ToolTip = 'Specifies the debit amount for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    Caption = 'Credit Amount';
                    ToolTip = 'Specifies the credit amount for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(initialEntryDueDate; Rec."Initial Entry Due Date")
                {
                    Caption = 'Initial Entry Due Date';
                    ToolTip = 'Specifies the initial entry due date for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(initialEntryGlobalDim1; Rec."Initial Entry Global Dim. 1")
                {
                    Caption = 'Initial Entry Global Dim. 1';
                    ToolTip = 'Specifies the initial entry global dim. 1 for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(initialEntryGlobalDim2; Rec."Initial Entry Global Dim. 2")
                {
                    Caption = 'Initial Entry Global Dim. 2';
                    ToolTip = 'Specifies the initial entry global dim. 2 for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the gen. bus. posting group for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the gen. prod. posting group for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(useTax; Rec."Use Tax")
                {
                    Caption = 'Use Tax';
                    ToolTip = 'Specifies the use tax for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(vATBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ToolTip = 'Specifies the vat bus. posting group for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                    ToolTip = 'Specifies the vat prod. posting group for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(initialDocumentType; Rec."Initial Document Type")
                {
                    Caption = 'Initial Document Type';
                    ToolTip = 'Specifies the initial document type for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(appliedVendLedgerEntryNo; Rec."Applied Vend. Ledger Entry No.")
                {
                    Caption = 'Applied Vend. Ledger Entry No.';
                    ToolTip = 'Specifies the applied vend. ledger entry no. for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(unapplied; Rec.Unapplied)
                {
                    Caption = 'Unapplied';
                    ToolTip = 'Specifies the unapplied for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(unappliedByEntryNo; Rec."Unapplied by Entry No.")
                {
                    Caption = 'Unapplied by Entry No.';
                    ToolTip = 'Specifies the unapplied by entry no. for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(remainingPmtDiscPossible; Rec."Remaining Pmt. Disc. Possible")
                {
                    Caption = 'Remaining Pmt. Disc. Possible';
                    ToolTip = 'Specifies the remaining pmt. disc. possible for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(maxPaymentTolerance; Rec."Max. Payment Tolerance")
                {
                    Caption = 'Max. Payment Tolerance';
                    ToolTip = 'Specifies the max. payment tolerance for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(taxJurisdictionCode; Rec."Tax Jurisdiction Code")
                {
                    Caption = 'Tax Jurisdiction Code';
                    ToolTip = 'Specifies the tax jurisdiction code for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(applicationNo; Rec."Application No.")
                {
                    Caption = 'Application No.';
                    ToolTip = 'Specifies the application no. for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(ledgerEntryAmount; Rec."Ledger Entry Amount")
                {
                    Caption = 'Ledger Entry Amount';
                    ToolTip = 'Specifies the ledger entry amount for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(postingGroup; Rec."Posting Group")
                {
                    Caption = 'Vendor Posting Group';
                    ToolTip = 'Specifies the posting group for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
                field(exchRateAdjmtRegNo; Rec."Exch. Rate Adjmt. Reg. No.")
                {
                    Caption = 'Exch. Rate Adjmt. Reg. No.';
                    ToolTip = 'Specifies the exch. rate adjmt. reg. no. for this detailed vendor ledg. entry record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}