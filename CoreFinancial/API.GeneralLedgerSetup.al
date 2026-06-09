namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Setup;

page 90802 "ocpfGeneralLedgerSetup"
{
    PageType = API;
    Caption = 'General Ledger Setup — company-wide configuration for the general ledger including local currency, rounding, and posting rules. Always returns a single record.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfGeneralLedgerSetup';
    EntitySetName = 'ocpfGeneralLedgerSetup';
    SourceTable = "General Ledger Setup";
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
                field(primaryKey; Rec."Primary Key")
                {
                    Caption = 'Primary Key';
                    ToolTip = 'Specifies the primary key for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(allowPostingFrom; Rec."Allow Posting From")
                {
                    Caption = 'Allow Posting From';
                    ToolTip = 'Specifies the allow posting from for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(allowPostingTo; Rec."Allow Posting To")
                {
                    Caption = 'Allow Posting To';
                    ToolTip = 'Specifies the allow posting to for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(registerTime; Rec."Register Time")
                {
                    Caption = 'Register Time';
                    ToolTip = 'Specifies the register time for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(allowDeferralPostingFrom; Rec."Allow Deferral Posting From")
                {
                    Caption = 'Allow Deferral Posting From';
                    ToolTip = 'Specifies the allow deferral posting from for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(allowDeferralPostingTo; Rec."Allow Deferral Posting To")
                {
                    Caption = 'Allow Deferral Posting To';
                    ToolTip = 'Specifies the allow deferral posting to for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(vATReportingDate; Rec."VAT Reporting Date")
                {
                    Caption = 'Default VAT Date';
                    ToolTip = 'Specifies the vat reporting date for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(vATReportingDateUsage; Rec."VAT Reporting Date Usage")
                {
                    Caption = 'VAT Date Usage';
                    ToolTip = 'Specifies the vat reporting date usage for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(pmtDiscExclVat; Rec."Pmt. Disc. Excl. VAT")
                {
                    Caption = 'Pmt. Disc. Excl. VAT';
                    ToolTip = 'Specifies the pmt. disc. excl. vat for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Filter; Rec."Global Dimension 1 Filter")
                {
                    Caption = 'Global Dimension 1 Filter';
                    ToolTip = 'Specifies the global dimension 1 filter for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Filter; Rec."Global Dimension 2 Filter")
                {
                    Caption = 'Global Dimension 2 Filter';
                    ToolTip = 'Specifies the global dimension 2 filter for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(custBalancesDue; Rec."Cust. Balances Due")
                {
                    Caption = 'Cust. Balances Due';
                    ToolTip = 'Specifies the cust. balances due for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(vendorBalancesDue; Rec."Vendor Balances Due")
                {
                    Caption = 'Vendor Balances Due';
                    ToolTip = 'Specifies the vendor balances due for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(unrealizedVat; Rec."Unrealized VAT")
                {
                    Caption = 'Unrealized VAT';
                    ToolTip = 'Specifies the unrealized vat for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(adjustForPaymentDisc; Rec."Adjust for Payment Disc.")
                {
                    Caption = 'Adjust for Payment Disc.';
                    ToolTip = 'Specifies the adjust for payment disc. for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(postWithJobQueue; Rec."Post with Job Queue")
                {
                    Caption = 'Post with Job Queue';
                    ToolTip = 'Specifies the post with job queue for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(jobQueueCategoryCode; Rec."Job Queue Category Code")
                {
                    Caption = 'Job Queue Category Code';
                    ToolTip = 'Specifies the job queue category code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(jobQueuePriorityForPost; Rec."Job Queue Priority for Post")
                {
                    Caption = 'Job Queue Priority for Post';
                    ToolTip = 'Specifies the job queue priority for post for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(postPrintWithJobQueue; Rec."Post & Print with Job Queue")
                {
                    Caption = 'Post & Print with Job Queue';
                    ToolTip = 'Specifies the post & print with job queue for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(jobQPrioForPostPrint; Rec."Job Q. Prio. for Post & Print")
                {
                    Caption = 'Job Q. Prio. for Post & Print';
                    ToolTip = 'Specifies the job q. prio. for post & print for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(notifyOnSuccess; Rec."Notify On Success")
                {
                    Caption = 'Notify On Success';
                    ToolTip = 'Specifies the notify on success for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(markCrMemosAsCorrections; Rec."Mark Cr. Memos as Corrections")
                {
                    Caption = 'Mark Cr. Memos as Corrections';
                    ToolTip = 'Specifies the mark cr. memos as corrections for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(localAddressFormat; Rec."Local Address Format")
                {
                    Caption = 'Local Address Format';
                    ToolTip = 'Specifies the local address format for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(localContAddrFormat; Rec."Local Cont. Addr. Format")
                {
                    Caption = 'Local Cont. Addr. Format';
                    ToolTip = 'Specifies the local cont. addr. format for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(reportOutputType; Rec."Report Output Type")
                {
                    Caption = 'Report Output Type';
                    ToolTip = 'Specifies the report output type for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(bankAccountNos; Rec."Bank Account Nos.")
                {
                    Caption = 'Bank Account Nos.';
                    ToolTip = 'Specifies the bank account nos. for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(summarizeGLEntries; Rec."Summarize G/L Entries")
                {
                    Caption = 'Summarize G/L Entries';
                    ToolTip = 'Specifies the summarize g/l entries for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(amountDecimalPlaces; Rec."Amount Decimal Places")
                {
                    Caption = 'Amount Decimal Places';
                    ToolTip = 'Specifies the amount decimal places for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(unitAmountDecimalPlaces; Rec."Unit-Amount Decimal Places")
                {
                    Caption = 'Unit-Amount Decimal Places';
                    ToolTip = 'Specifies the unit-amount decimal places for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(additionalReportingCurrency; Rec."Additional Reporting Currency")
                {
                    Caption = 'Additional Reporting Currency';
                    ToolTip = 'Specifies the additional reporting currency for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(vATTolerance; Rec."VAT Tolerance %")
                {
                    Caption = 'VAT Tolerance %';
                    ToolTip = 'Specifies the vat tolerance % for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(eMUCurrency; Rec."EMU Currency")
                {
                    Caption = 'EMU Currency';
                    ToolTip = 'Specifies the emu currency for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(lCYCode; Rec."LCY Code")
                {
                    Caption = 'LCY Code';
                    ToolTip = 'Specifies the ISO 3 letter currency code for the local currency.';
                    ApplicationArea = All;
                }
                field(vATExchangeRateAdjustment; Rec."VAT Exchange Rate Adjustment")
                {
                    Caption = 'VAT Exchange Rate Adjustment';
                    ToolTip = 'Specifies the vat exchange rate adjustment for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(amountRoundingPrecision; Rec."Amount Rounding Precision")
                {
                    Caption = 'Amount Rounding Precision';
                    ToolTip = 'Specifies the amount rounding precision for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(unitAmountRoundingPrecision; Rec."Unit-Amount Rounding Precision")
                {
                    Caption = 'Unit-Amount Rounding Precision';
                    ToolTip = 'Specifies the unit-amount rounding precision for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(applnRoundingPrecision; Rec."Appln. Rounding Precision")
                {
                    Caption = 'Appln. Rounding Precision';
                    ToolTip = 'Specifies the appln. rounding precision for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                    ToolTip = 'Specifies the shortcut dimension 1 code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                    ToolTip = 'Specifies the shortcut dimension 2 code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                    ToolTip = 'Specifies the shortcut dimension 3 code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                    ToolTip = 'Specifies the shortcut dimension 4 code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Shortcut Dimension 5 Code';
                    ToolTip = 'Specifies the shortcut dimension 5 code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Shortcut Dimension 6 Code';
                    ToolTip = 'Specifies the shortcut dimension 6 code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 7 Code';
                    ToolTip = 'Specifies the shortcut dimension 7 code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                {
                    Caption = 'Shortcut Dimension 8 Code';
                    ToolTip = 'Specifies the shortcut dimension 8 code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(maxVatDifferenceAllowed; Rec."Max. VAT Difference Allowed")
                {
                    Caption = 'Max. VAT Difference Allowed';
                    ToolTip = 'Specifies the max. vat difference allowed for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(vATRoundingType; Rec."VAT Rounding Type")
                {
                    Caption = 'VAT Rounding Type';
                    ToolTip = 'Specifies the vat rounding type for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(pmtDiscTolerancePosting; Rec."Pmt. Disc. Tolerance Posting")
                {
                    Caption = 'Pmt. Disc. Tolerance Posting';
                    ToolTip = 'Specifies the pmt. disc. tolerance posting for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(paymentDiscountGracePeriod; Rec."Payment Discount Grace Period")
                {
                    Caption = 'Payment Discount Grace Period';
                    ToolTip = 'Specifies the payment discount grace period for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(paymentTolerance; Rec."Payment Tolerance %")
                {
                    Caption = 'Payment Tolerance %';
                    ToolTip = 'Specifies the payment tolerance % for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(maxPaymentToleranceAmount; Rec."Max. Payment Tolerance Amount")
                {
                    Caption = 'Max. Payment Tolerance Amount';
                    ToolTip = 'Specifies the max. payment tolerance amount for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(allowGLAccDeletionBefore; Rec."Allow G/L Acc. Deletion Before")
                {
                    Caption = 'Check G/L Acc. Deletion After';
                    ToolTip = 'Specifies the allow g/l acc. deletion before for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(checkGLAccountUsage; Rec."Check G/L Account Usage")
                {
                    Caption = 'Check G/L Account Usage';
                    ToolTip = 'Specifies the check g/l account usage for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(paymentTolerancePosting; Rec."Payment Tolerance Posting")
                {
                    Caption = 'Payment Tolerance Posting';
                    ToolTip = 'Specifies the payment tolerance posting for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(pmtDiscToleranceWarning; Rec."Pmt. Disc. Tolerance Warning")
                {
                    Caption = 'Pmt. Disc. Tolerance Warning';
                    ToolTip = 'Specifies the pmt. disc. tolerance warning for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(paymentToleranceWarning; Rec."Payment Tolerance Warning")
                {
                    Caption = 'Payment Tolerance Warning';
                    ToolTip = 'Specifies the payment tolerance warning for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(lastIcTransactionNo; Rec."Last IC Transaction No.")
                {
                    Caption = 'Last IC Transaction No.';
                    ToolTip = 'Specifies the last ic transaction no. for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(billToSellToVatCalc; Rec."Bill-to/Sell-to VAT Calc.")
                {
                    Caption = 'Bill-to/Sell-to VAT Calc.';
                    ToolTip = 'Specifies the bill-to/sell-to vat calc. for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(blockDeletionOfGLAccounts; Rec."Block Deletion of G/L Accounts")
                {
                    Caption = 'Block Deletion of G/L Accounts';
                    ToolTip = 'Specifies the block deletion of g/l accounts for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(finRepForBalanceSheet; Rec."Fin. Rep. for Balance Sheet")
                {
                    Caption = 'Financial Report for Balance Sheet';
                    ToolTip = 'Specifies the fin. rep. for balance sheet for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(finRepForIncomeStmt; Rec."Fin. Rep. for Income Stmt.")
                {
                    Caption = 'Financial Report for Income Stmt.';
                    ToolTip = 'Specifies the fin. rep. for income stmt. for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(finRepForCashFlowStmt; Rec."Fin. Rep. for Cash Flow Stmt")
                {
                    Caption = 'Financial Report for Cash Flow Stmt';
                    ToolTip = 'Specifies the fin. rep. for cash flow stmt for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(finRepForRetainedEarn; Rec."Fin. Rep. for Retained Earn.")
                {
                    Caption = 'Financial Report for Retained Earn.';
                    ToolTip = 'Specifies the fin. rep. for retained earn. for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(taxInvoiceRenamingThreshold; Rec."Tax Invoice Renaming Threshold")
                {
                    Caption = 'Tax Invoice Renaming Threshold';
                    ToolTip = 'Specifies the tax invoice renaming threshold for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(reqCountryRegCodeInAddr; Rec."Req.Country/Reg. Code in Addr.")
                {
                    Caption = 'Require Country/Region Code in Address';
                    ToolTip = 'Specifies the req.country/reg. code in addr. for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(printVatSpecificationInLcy; Rec."Print VAT specification in LCY")
                {
                    Caption = 'Print VAT specification in LCY';
                    ToolTip = 'Specifies the print vat specification in lcy for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(prepaymentUnrealizedVat; Rec."Prepayment Unrealized VAT")
                {
                    Caption = 'Prepayment Unrealized VAT';
                    ToolTip = 'Specifies the prepayment unrealized vat for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(payrollTransImportFormat; Rec."Payroll Trans. Import Format")
                {
                    Caption = 'Payroll Trans. Import Format';
                    ToolTip = 'Specifies the payroll trans. import format for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(localCurrencySymbol; Rec."Local Currency Symbol")
                {
                    Caption = 'Local Currency Symbol';
                    ToolTip = 'Specifies the local currency symbol for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(localCurrencyDescription; Rec."Local Currency Description")
                {
                    Caption = 'Local Currency Description';
                    ToolTip = 'Specifies the local currency description for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(showAmounts; Rec."Show Amounts")
                {
                    Caption = 'Show Amounts';
                    ToolTip = 'Specifies the show amounts for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(postingPreviewType; Rec."Posting Preview Type")
                {
                    Caption = 'Posting Preview Type';
                    ToolTip = 'Specifies the posting preview type for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(sEPANonEuroExport; Rec."SEPA Non-Euro Export")
                {
                    Caption = 'SEPA Non-Euro Export';
                    ToolTip = 'Specifies the sepa non-euro export for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(sEPAExportWOBankAccData; Rec."SEPA Export w/o Bank Acc. Data")
                {
                    Caption = 'SEPA Export w/o Bank Acc. Data';
                    ToolTip = 'Specifies the sepa export w/o bank acc. data for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(journalTemplNameMandatory; Rec."Journal Templ. Name Mandatory")
                {
                    Caption = 'Journal Templ. Name Mandatory';
                    ToolTip = 'Specifies the journal templ. name mandatory for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(hidePaymentMethodCode; Rec."Hide Payment Method Code")
                {
                    Caption = 'Hide Payment Method Code';
                    ToolTip = 'Specifies the hide payment method code for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(enableDataCheck; Rec."Enable Data Check")
                {
                    Caption = 'Enable Data Check';
                    ToolTip = 'Specifies the enable data check for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(documentRetentionPeriod; Rec."Document Retention Period")
                {
                    Caption = 'Documents Retention Period';
                    ToolTip = 'Specifies the document retention period for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(applyJnlTemplateName; Rec."Apply Jnl. Template Name")
                {
                    Caption = 'Apply Jnl. Template Name';
                    ToolTip = 'Specifies the apply jnl. template name for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(applyJnlBatchName; Rec."Apply Jnl. Batch Name")
                {
                    Caption = 'Apply Jnl. Batch Name';
                    ToolTip = 'Specifies the apply jnl. batch name for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(jobWipJnlTemplateName; Rec."Job WIP Jnl. Template Name")
                {
                    Caption = 'Project WIP Jnl. Template Name';
                    ToolTip = 'Specifies the job wip jnl. template name for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(jobWipJnlBatchName; Rec."Job WIP Jnl. Batch Name")
                {
                    Caption = 'Project WIP Jnl. Batch Name';
                    ToolTip = 'Specifies the job wip jnl. batch name for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(adjustArcJnlTemplateName; Rec."Adjust ARC Jnl. Template Name")
                {
                    Caption = 'Adjust Add. Rep. Currency Jnl. Template Name';
                    ToolTip = 'Specifies the adjust arc jnl. template name for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(adjustArcJnlBatchName; Rec."Adjust ARC Jnl. Batch Name")
                {
                    Caption = 'Adjust Add. Rep. Currency Jnl. Batch Name';
                    ToolTip = 'Specifies the adjust arc jnl. batch name for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(bankAccReconTemplateName; Rec."Bank Acc. Recon. Template Name")
                {
                    Caption = 'Bank Acc. Recon. Template Name';
                    ToolTip = 'Specifies the bank acc. recon. template name for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(bankAccReconBatchName; Rec."Bank Acc. Recon. Batch Name")
                {
                    Caption = 'Bank Acc. Recon. Batch Name';
                    ToolTip = 'Specifies the bank acc. recon. batch name for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(controlVatPeriod; Rec."Control VAT Period")
                {
                    Caption = 'Control VAT Period';
                    ToolTip = 'Specifies the control vat period for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(allowQueryFromConsolid; Rec."Allow Query From Consolid.")
                {
                    Caption = 'Enable company as subsidiary';
                    ToolTip = 'Specifies the allow query from consolid. for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(accReceivablesCategory; Rec."Acc. Receivables Category")
                {
                    Caption = 'Account Receivables G/L Account Category';
                    ToolTip = 'Specifies the acc. receivables category for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(appDimensionPosting; Rec."App. Dimension Posting")
                {
                    Caption = 'Dimension Posting';
                    ToolTip = 'Specifies the app. dimension posting for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(hideCompanyBankAccount; Rec."Hide Company Bank Account")
                {
                    Caption = 'Hide Company Bank Account';
                    ToolTip = 'Specifies the hide company bank account for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(checkSourceCurrConsistency; Rec."Check Source Curr. Consistency")
                {
                    Caption = 'Check Source Curr. Consistency';
                    ToolTip = 'Specifies the check source curr. consistency for this general ledger setup record.';
                    ApplicationArea = All;
                }
                field(accPayablesCategory; Rec."Acc. Payables Category")
                {
                    Caption = 'Account Payables G/L Account Category';
                    ToolTip = 'Specifies the acc. payables category for this general ledger setup record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}