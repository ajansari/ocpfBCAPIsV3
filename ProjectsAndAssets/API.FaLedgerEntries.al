namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.FixedAssets.Ledger;

page 90917 "ocpfFaLedgerEntries"
{
    PageType = API;
    Caption = 'Fixed asset ledger entries — posted FA acquisition, depreciation, and disposal.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfFaLedgerEntry';
    EntitySetName = 'ocpfFaLedgerEntries';
    SourceTable = "FA Ledger Entry";
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
                        ToolTip = 'Specifies the Entry No..';
                        ApplicationArea = All;
                }
                field(gLEntryNo; Rec."G/L Entry No.")
                    {
                        Caption = 'G/L Entry No.';
                        ToolTip = 'Specifies the G/L Entry No..';
                        ApplicationArea = All;
                }
                field(faNo; Rec."FA No.")
                    {
                        Caption = 'FA No.';
                        ToolTip = 'Specifies the number of the related fixed asset.';
                        ApplicationArea = All;
                }
                field(faPostingDate; Rec."FA Posting Date")
                    {
                        Caption = 'FA Posting Date';
                        ToolTip = 'Specifies the posting date of the related fixed asset transaction, such as a depreciation.';
                        ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                    {
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the entry';
                        ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                    {
                        Caption = 'Document Type';
                        ToolTip = 'Specifies the entry document type.';
                        ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                    {
                        Caption = 'Document Date';
                        ToolTip = 'Specifies the entry document date.';
                        ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                    {
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the document number on the entry.';
                        ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                    {
                        Caption = 'External Document No.';
                        ToolTip = 'Specifies the External Document No..';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies a description of the entry.';
                        ApplicationArea = All;
                }
                field(depreciationBookCode; Rec."Depreciation Book Code")
                    {
                        Caption = 'Depreciation Book Code';
                        ToolTip = 'Specifies the Depreciation Book Code.';
                        ApplicationArea = All;
                }
                field(faPostingCategory; Rec."FA Posting Category")
                    {
                        Caption = 'FA Posting Category';
                        ToolTip = 'Specifies the posting category assigned to the entry when it was posted.';
                        ApplicationArea = All;
                }
                field(faPostingType; Rec."FA Posting Type")
                    {
                        Caption = 'FA Posting Type';
                        ToolTip = 'Specifies the posting type, if Account Type field contains Fixed Asset.';
                        ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                    {
                        Caption = 'Amount';
                        ToolTip = 'Specifies the entry amount in currency.';
                        ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                    {
                        Caption = 'Debit Amount';
                        ToolTip = 'Specifies the Debit Amount.';
                        ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                    {
                        Caption = 'Credit Amount';
                        ToolTip = 'Specifies the Credit Amount.';
                        ApplicationArea = All;
                }
                field(reclassificationEntry; Rec."Reclassification Entry")
                    {
                        Caption = 'Reclassification Entry';
                        ToolTip = 'Specifies whether the entry was made to reclassify a fixed asset, for example, to change the dimension the fixed asset is linked to.';
                        ApplicationArea = All;
                }
                field(partOfBookValue; Rec."Part of Book Value")
                    {
                        Caption = 'Part of Book Value';
                        ToolTip = 'Specifies the Part of Book Value.';
                        ApplicationArea = All;
                }
                field(partOfDepreciableBasis; Rec."Part of Depreciable Basis")
                    {
                        Caption = 'Part of Depreciable Basis';
                        ToolTip = 'Specifies the Part of Depreciable Basis.';
                        ApplicationArea = All;
                }
                field(disposalCalculationMethod; Rec."Disposal Calculation Method")
                    {
                        Caption = 'Disposal Calculation Method';
                        ToolTip = 'Specifies the Disposal Calculation Method.';
                        ApplicationArea = All;
                }
                field(disposalEntryNo; Rec."Disposal Entry No.")
                    {
                        Caption = 'Disposal Entry No.';
                        ToolTip = 'Specifies the Disposal Entry No..';
                        ApplicationArea = All;
                }
                field(noOfDepreciationDays; Rec."No. of Depreciation Days")
                    {
                        Caption = 'No. of Depreciation Days';
                        ToolTip = 'Specifies the No. of Depreciation Days.';
                        ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                    {
                        Caption = 'Quantity';
                        ToolTip = 'Specifies the Quantity.';
                        ApplicationArea = All;
                }
                field(faNoBudgetedFaNo; Rec."FA No./Budgeted FA No.")
                    {
                        Caption = 'FA No./Budgeted FA No.';
                        ToolTip = 'Specifies the FA No./Budgeted FA No..';
                        ApplicationArea = All;
                }
                field(faSubclassCode; Rec."FA Subclass Code")
                    {
                        Caption = 'FA Subclass Code';
                        ToolTip = 'Specifies the FA Subclass Code.';
                        ApplicationArea = All;
                }
                field(faLocationCode; Rec."FA Location Code")
                    {
                        Caption = 'FA Location Code';
                        ToolTip = 'Specifies the FA Location Code.';
                        ApplicationArea = All;
                }
                field(faPostingGroup; Rec."FA Posting Group")
                    {
                        Caption = 'FA Posting Group';
                        ToolTip = 'Specifies the FA posting group of the related fixed asset transaction.';
                        ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                    {
                        Caption = 'Global Dimension 1 Code';
                        ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company';
                        ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                    {
                        Caption = 'Global Dimension 2 Code';
                        ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company';
                        ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                    {
                        Caption = 'Location Code';
                        ToolTip = 'Specifies the Location Code.';
                        ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                    {
                        Caption = 'User ID';
                        ToolTip = 'Specifies the User ID.';
                        ApplicationArea = All;
                }
                field(depreciationMethod; Rec."Depreciation Method")
                    {
                        Caption = 'Depreciation Method';
                        ToolTip = 'Specifies how depreciation is calculated for the depreciation book.';
                        ApplicationArea = All;
                }
                field(depreciationStartingDate; Rec."Depreciation Starting Date")
                    {
                        Caption = 'Depreciation Starting Date';
                        ToolTip = 'Specifies the date on which depreciation of the fixed asset starts.';
                        ApplicationArea = All;
                }
                field(straightLinePct; Rec."Straight-Line %")
                    {
                        Caption = 'Straight-Line %';
                        ToolTip = 'Specifies the Straight-Line %.';
                        ApplicationArea = All;
                }
                field(noOfDepreciationYears; Rec."No. of Depreciation Years")
                    {
                        Caption = 'No. of Depreciation Years';
                        ToolTip = 'Specifies the No. of Depreciation Years.';
                        ApplicationArea = All;
                }
                field(fixedDeprAmount; Rec."Fixed Depr. Amount")
                    {
                        Caption = 'Fixed Depr. Amount';
                        ToolTip = 'Specifies the Fixed Depr. Amount.';
                        ApplicationArea = All;
                }
                field(decliningBalancePct; Rec."Declining-Balance %")
                    {
                        Caption = 'Declining-Balance %';
                        ToolTip = 'Specifies the Declining-Balance %.';
                        ApplicationArea = All;
                }
                field(depreciationTableCode; Rec."Depreciation Table Code")
                    {
                        Caption = 'Depreciation Table Code';
                        ToolTip = 'Specifies the Depreciation Table Code.';
                        ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                    {
                        Caption = 'Journal Batch Name';
                        ToolTip = 'Specifies the Journal Batch Name.';
                        ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                    {
                        Caption = 'Source Code';
                        ToolTip = 'Specifies the Source Code.';
                        ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                    {
                        Caption = 'Reason Code';
                        ToolTip = 'Specifies the Reason Code.';
                        ApplicationArea = All;
                }
                field(transactionNo; Rec."Transaction No.")
                    {
                        Caption = 'Transaction No.';
                        ToolTip = 'Specifies the Transaction No..';
                        ApplicationArea = All;
                }
                field(balAccountType; Rec."Bal. Account Type")
                    {
                        Caption = 'Bal. Account Type';
                        ToolTip = 'Specifies the Bal. Account Type.';
                        ApplicationArea = All;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                    {
                        Caption = 'Bal. Account No.';
                        ToolTip = 'Specifies the Bal. Account No..';
                        ApplicationArea = All;
                }
                field(vatAmount; Rec."VAT Amount")
                    {
                        Caption = 'VAT Amount';
                        ToolTip = 'Specifies the VAT Amount.';
                        ApplicationArea = All;
                }
                field(genPostingType; Rec."Gen. Posting Type")
                    {
                        Caption = 'Gen. Posting Type';
                        ToolTip = 'Specifies the Gen. Posting Type.';
                        ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                    {
                        Caption = 'Gen. Bus. Posting Group';
                        ToolTip = 'Specifies the Gen. Bus. Posting Group.';
                        ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                    {
                        Caption = 'Gen. Prod. Posting Group';
                        ToolTip = 'Specifies the Gen. Prod. Posting Group.';
                        ApplicationArea = All;
                }
                field(faClassCode; Rec."FA Class Code")
                    {
                        Caption = 'FA Class Code';
                        ToolTip = 'Specifies the FA Class Code.';
                        ApplicationArea = All;
                }
                field(faExchangeRate; Rec."FA Exchange Rate")
                    {
                        Caption = 'FA Exchange Rate';
                        ToolTip = 'Specifies the FA Exchange Rate.';
                        ApplicationArea = All;
                }
                field(amountLcy; Rec."Amount (LCY)")
                    {
                        Caption = 'Amount (LCY)';
                        ToolTip = 'Specifies the Amount (LCY).';
                        ApplicationArea = All;
                }
                field(resultOnDisposal; Rec."Result on Disposal")
                    {
                        Caption = 'Result on Disposal';
                        ToolTip = 'Specifies the Result on Disposal.';
                        ApplicationArea = All;
                }
                field(correction; Rec.Correction)
                    {
                        Caption = 'Correction';
                        ToolTip = 'Specifies the Correction.';
                        ApplicationArea = All;
                }
                field(indexEntry; Rec."Index Entry")
                    {
                        Caption = 'Index Entry';
                        ToolTip = 'Specifies the Index Entry.';
                        ApplicationArea = All;
                }
                field(canceledFromFaNo; Rec."Canceled from FA No.")
                    {
                        Caption = 'Canceled from FA No.';
                        ToolTip = 'Specifies the Canceled from FA No..';
                        ApplicationArea = All;
                }
                field(depreciationEndingDate; Rec."Depreciation Ending Date")
                    {
                        Caption = 'Depreciation Ending Date';
                        ToolTip = 'Specifies the date on which depreciation of the fixed asset ends.';
                        ApplicationArea = All;
                }
                field(useFaLedgerCheck; Rec."Use FA Ledger Check")
                    {
                        Caption = 'Use FA Ledger Check';
                        ToolTip = 'Specifies the Use FA Ledger Check.';
                        ApplicationArea = All;
                }
                field(automaticEntry; Rec."Automatic Entry")
                    {
                        Caption = 'Automatic Entry';
                        ToolTip = 'Specifies the Automatic Entry.';
                        ApplicationArea = All;
                }
                field(deprStartingDateCustom1; Rec."Depr. Starting Date (Custom 1)")
                    {
                        Caption = 'Depr. Starting Date (Custom 1)';
                        ToolTip = 'Specifies the Depr. Starting Date (Custom 1).';
                        ApplicationArea = All;
                }
                field(deprEndingDateCustom1; Rec."Depr. Ending Date (Custom 1)")
                    {
                        Caption = 'Depr. Ending Date (Custom 1)';
                        ToolTip = 'Specifies the Depr. Ending Date (Custom 1).';
                        ApplicationArea = All;
                }
                field(accumDeprPctCustom1; Rec."Accum. Depr. % (Custom 1)")
                    {
                        Caption = 'Accum. Depr. % (Custom 1)';
                        ToolTip = 'Specifies the Accum. Depr. % (Custom 1).';
                        ApplicationArea = All;
                }
                field(deprPctThisYearCustom1; Rec."Depr. % this year (Custom 1)")
                    {
                        Caption = 'Depr. % this year (Custom 1)';
                        ToolTip = 'Specifies the Depr. % this year (Custom 1).';
                        ApplicationArea = All;
                }
                field(propertyClassCustom1; Rec."Property Class (Custom 1)")
                    {
                        Caption = 'Property Class (Custom 1)';
                        ToolTip = 'Specifies the Property Class (Custom 1).';
                        ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                    {
                        Caption = 'No. Series';
                        ToolTip = 'Specifies the No. Series.';
                        ApplicationArea = All;
                }
                field(taxAreaCode; Rec."Tax Area Code")
                    {
                        Caption = 'Tax Area Code';
                        ToolTip = 'Specifies the Tax Area Code.';
                        ApplicationArea = All;
                }
                field(taxLiable; Rec."Tax Liable")
                    {
                        Caption = 'Tax Liable';
                        ToolTip = 'Specifies the Tax Liable.';
                        ApplicationArea = All;
                }
                field(taxGroupCode; Rec."Tax Group Code")
                    {
                        Caption = 'Tax Group Code';
                        ToolTip = 'Specifies the Tax Group Code.';
                        ApplicationArea = All;
                }
                field(useTax; Rec."Use Tax")
                    {
                        Caption = 'Use Tax';
                        ToolTip = 'Specifies the Use Tax.';
                        ApplicationArea = All;
                }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                    {
                        Caption = 'VAT Bus. Posting Group';
                        ToolTip = 'Specifies the VAT Bus. Posting Group.';
                        ApplicationArea = All;
                }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
                    {
                        Caption = 'VAT Prod. Posting Group';
                        ToolTip = 'Specifies the VAT Prod. Posting Group.';
                        ApplicationArea = All;
                }
                field(reversed; Rec.Reversed)
                    {
                        Caption = 'Reversed';
                        ToolTip = 'Specifies the Reversed.';
                        ApplicationArea = All;
                }
                field(reversedByEntryNo; Rec."Reversed by Entry No.")
                    {
                        Caption = 'Reversed by Entry No.';
                        ToolTip = 'Specifies the Reversed by Entry No..';
                        ApplicationArea = All;
                }
                field(reversedEntryNo; Rec."Reversed Entry No.")
                    {
                        Caption = 'Reversed Entry No.';
                        ToolTip = 'Specifies the Reversed Entry No..';
                        ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                    {
                        Caption = 'Dimension Set ID';
                        ToolTip = 'Specifies the Dimension Set ID.';
                        ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                    {
                        Caption = 'Shortcut Dimension 3 Code';
                        ToolTip = 'Specifies the code for Shortcut Dimension 3, which is one of dimension codes that you set up in the General Ledger Setup window.';
                        ApplicationArea = All;
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                    {
                        Caption = 'Shortcut Dimension 4 Code';
                        ToolTip = 'Specifies the code for Shortcut Dimension 4, which is one of dimension codes that you set up in the General Ledger Setup window.';
                        ApplicationArea = All;
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                    {
                        Caption = 'Shortcut Dimension 5 Code';
                        ToolTip = 'Specifies the code for Shortcut Dimension 5, which is one of dimension codes that you set up in the General Ledger Setup window.';
                        ApplicationArea = All;
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                    {
                        Caption = 'Shortcut Dimension 6 Code';
                        ToolTip = 'Specifies the code for Shortcut Dimension 6, which is one of dimension codes that you set up in the General Ledger Setup window.';
                        ApplicationArea = All;
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                    {
                        Caption = 'Shortcut Dimension 7 Code';
                        ToolTip = 'Specifies the code for Shortcut Dimension 7, which is one of dimension codes that you set up in the General Ledger Setup window.';
                        ApplicationArea = All;
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                    {
                        Caption = 'Shortcut Dimension 8 Code';
                        ToolTip = 'Specifies the code for Shortcut Dimension 8, which is one of dimension codes that you set up in the General Ledger Setup window.';
                        ApplicationArea = All;
                }
                field(nonDedVatFaCost; Rec."Non-Ded. VAT FA Cost")
                    {
                        Caption = 'Non-Deductible VAT FA Cost';
                        ToolTip = 'Specifies the Non-Ded. VAT FA Cost.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
