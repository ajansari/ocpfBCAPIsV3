namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Ledger;

page 90801 "ocpfGeneralLedgerEntries"
{
    PageType = API;
    Caption = 'General Ledger Entries — individual posted transactions that make up the general ledger and form the basis of all financial reporting.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfGeneralLedgerEntry';
    EntitySetName = 'ocpfGeneralLedgerEntries';
    SourceTable = "G/L Entry";
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
                    ToolTip = 'Specifies the entry no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(gLAccountNo; Rec."G/L Account No.")
                {
                    Caption = 'G/L Account No.';
                    ToolTip = 'Specifies the g/l account no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies the document type for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the document no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                    ToolTip = 'Specifies the bal. account no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount (LCY)';
                    ToolTip = 'Specifies the amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(sourceCurrencyAmount; Rec."Source Currency Amount")
                {
                    Caption = 'Source Currency Amount';
                    ToolTip = 'Specifies the source currency amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(sourceCurrencyVatAmount; Rec."Source Currency VAT Amount")
                {
                    Caption = 'Source VAT Currency Amount';
                    ToolTip = 'Specifies the source currency vat amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(sourceCurrencyCode; Rec."Source Currency Code")
                {
                    Caption = 'Source Currency Code';
                    ToolTip = 'Specifies the source currency code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the user id for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the source code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(systemCreatedEntry; Rec."System-Created Entry")
                {
                    Caption = 'System-Created Entry';
                    ToolTip = 'Specifies the system-created entry for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(priorYearEntry; Rec."Prior-Year Entry")
                {
                    Caption = 'Prior-Year Entry';
                    ToolTip = 'Specifies the prior-year entry for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Project No.';
                    ToolTip = 'Specifies the job no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the quantity for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(vATAmount; Rec."VAT Amount")
                {
                    Caption = 'VAT Amount';
                    ToolTip = 'Specifies the vat amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(businessUnitCode; Rec."Business Unit Code")
                {
                    Caption = 'Business Unit Code';
                    ToolTip = 'Specifies the business unit code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                    ToolTip = 'Specifies the journal batch name for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                    ToolTip = 'Specifies the reason code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(genPostingType; Rec."Gen. Posting Type")
                {
                    Caption = 'Gen. Posting Type';
                    ToolTip = 'Specifies the gen. posting type for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the gen. bus. posting group for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the gen. prod. posting group for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                    ToolTip = 'Specifies the bal. account type for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(transactionNo; Rec."Transaction No.")
                {
                    Caption = 'Transaction No.';
                    ToolTip = 'Specifies the transaction no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    Caption = 'Debit Amount (LCY)';
                    ToolTip = 'Specifies the debit amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    Caption = 'Credit Amount (LCY)';
                    ToolTip = 'Specifies the credit amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                    ToolTip = 'Specifies the document date for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ToolTip = 'Specifies the external document no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(sourceType; Rec."Source Type")
                {
                    Caption = 'Source Type';
                    ToolTip = 'Specifies the source type for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                    ToolTip = 'Specifies the source no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(taxAreaCode; Rec."Tax Area Code")
                {
                    Caption = 'Tax Area Code';
                    ToolTip = 'Specifies the tax area code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';
                    ToolTip = 'Specifies the tax liable for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(taxGroupCode; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';
                    ToolTip = 'Specifies the tax group code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(useTax; Rec."Use Tax")
                {
                    Caption = 'Use Tax';
                    ToolTip = 'Specifies the use tax for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(vATBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ToolTip = 'Specifies the vat bus. posting group for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                    ToolTip = 'Specifies the vat prod. posting group for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(additionalCurrencyAmount; Rec."Additional-Currency Amount")
                {
                    Caption = 'Additional-Currency Amount';
                    ToolTip = 'Specifies the additional-currency amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(addCurrencyDebitAmount; Rec."Add.-Currency Debit Amount")
                {
                    Caption = 'Add.-Currency Debit Amount';
                    ToolTip = 'Specifies the add.-currency debit amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(addCurrencyCreditAmount; Rec."Add.-Currency Credit Amount")
                {
                    Caption = 'Add.-Currency Credit Amount';
                    ToolTip = 'Specifies the add.-currency credit amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(closeIncomeStatementDimId; Rec."Close Income Statement Dim. ID")
                {
                    Caption = 'Close Income Statement Dim. ID';
                    ToolTip = 'Specifies the close income statement dim. id for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(iCPartnerCode; Rec."IC Partner Code")
                {
                    Caption = 'IC Partner Code';
                    ToolTip = 'Specifies the ic partner code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(reversed; Rec.Reversed)
                {
                    Caption = 'Reversed';
                    ToolTip = 'Specifies the reversed for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(reversedByEntryNo; Rec."Reversed by Entry No.")
                {
                    Caption = 'Reversed by Entry No.';
                    ToolTip = 'Specifies the reversed by entry no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(reversedEntryNo; Rec."Reversed Entry No.")
                {
                    Caption = 'Reversed Entry No.';
                    ToolTip = 'Specifies the reversed entry no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(gLAccountName; Rec."G/L Account Name")
                {
                    Caption = 'G/L Account Name';
                    ToolTip = 'Specifies the g/l account name for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(journalTemplName; Rec."Journal Templ. Name")
                {
                    Caption = 'Journal Template Name';
                    ToolTip = 'Specifies the journal templ. name for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(vATReportingDate; Rec."VAT Reporting Date")
                {
                    Caption = 'VAT Date';
                    ToolTip = 'Specifies the vat reporting date for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the dimension set id for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                    ToolTip = 'Specifies the shortcut dimension 3 code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                    ToolTip = 'Specifies the shortcut dimension 4 code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Shortcut Dimension 5 Code';
                    ToolTip = 'Specifies the shortcut dimension 5 code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Shortcut Dimension 6 Code';
                    ToolTip = 'Specifies the shortcut dimension 6 code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 7 Code';
                    ToolTip = 'Specifies the shortcut dimension 7 code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                {
                    Caption = 'Shortcut Dimension 8 Code';
                    ToolTip = 'Specifies the shortcut dimension 8 code for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(lastDimCorrectionEntryNo; Rec."Last Dim. Correction Entry No.")
                {
                    Caption = 'Last Dim. Correction Entry No.';
                    ToolTip = 'Specifies the last dim. correction entry no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(lastDimCorrectionNode; Rec."Last Dim. Correction Node")
                {
                    Caption = 'Last Dim. Correction Node';
                    ToolTip = 'Specifies the last dim. correction node for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(dimensionChangesCount; Rec."Dimension Changes Count")
                {
                    Caption = 'Count of Dimension Changes';
                    ToolTip = 'Specifies the dimension changes count for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(allocationAccountNo; Rec."Allocation Account No.")
                {
                    Caption = 'Allocation Account No.';
                    ToolTip = 'Specifies the allocation account no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(allocJournalLineSystemid; Rec."Alloc. Journal Line SystemId")
                {
                    Caption = 'Allocation Journal Line SystemId';
                    ToolTip = 'Specifies the alloc. journal line systemid for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(prodOrderNo; Rec."Prod. Order No.")
                {
                    Caption = 'Prod. Order No.';
                    ToolTip = 'Specifies the prod. order no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(fAEntryType; Rec."FA Entry Type")
                {
                    Caption = 'FA Entry Type';
                    ToolTip = 'Specifies the fa entry type for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(fAEntryNo; Rec."FA Entry No.")
                {
                    Caption = 'FA Entry No.';
                    ToolTip = 'Specifies the fa entry no. for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the comment for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(nonDeductibleVatAmount; Rec."Non-Deductible VAT Amount")
                {
                    Caption = 'Non-Deductible VAT Amount';
                    ToolTip = 'Specifies the non-deductible vat amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(nonDeductibleVatAmountAcy; Rec."Non-Deductible VAT Amount ACY")
                {
                    Caption = 'Non-Deductible VAT Amount ACY';
                    ToolTip = 'Specifies the non-deductible vat amount acy for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(srcCurrNonDedVatAmount; Rec."Src. Curr. Non-Ded. VAT Amount")
                {
                    Caption = 'Source Currency Non-Deductible VAT Amount';
                    ToolTip = 'Specifies the src. curr. non-ded. vat amount for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(accountId; Rec."Account Id")
                {
                    Caption = 'Account Id';
                    ToolTip = 'Specifies the account id for this g/l entry record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDatetime; Rec."Last Modified DateTime")
                {
                    Caption = 'Last Modified DateTime';
                    ToolTip = 'Specifies the last modified datetime for this g/l entry record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}