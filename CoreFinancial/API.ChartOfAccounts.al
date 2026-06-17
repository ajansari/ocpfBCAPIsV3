namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Account;

page 90800 "ocpfChartOfAccounts"
{
    PageType = API;
    Caption = 'Chart of Accounts — G/L accounts that define the financial structure and reporting categories of the company.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfChartOfAccount';
    EntitySetName = 'ocpfChartOfAccounts';
    SourceTable = "G/L Account";
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
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the no. for this g/l account record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this g/l account record.';
                    ApplicationArea = All;
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies the search name for this g/l account record.';
                    ApplicationArea = All;
                }
                field(accountType; Rec."Account Type")
                {
                    Caption = 'Account Type';
                    ToolTip = 'Specifies the account type for this g/l account record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this g/l account record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this g/l account record.';
                    ApplicationArea = All;
                }
                field(accountCategory; Rec."Account Category")
                {
                    Caption = 'Account Category';
                    ToolTip = 'Specifies the account category for this g/l account record.';
                    ApplicationArea = All;
                }
                field(incomeBalance; Rec."Income/Balance")
                {
                    Caption = 'Income/Balance';
                    ToolTip = 'Specifies the income/balance for this g/l account record.';
                    ApplicationArea = All;
                }
                field(debitCredit; Rec."Debit/Credit")
                {
                    Caption = 'Debit/Credit';
                    ToolTip = 'Specifies the debit/credit for this g/l account record.';
                    ApplicationArea = All;
                }
                field(no2; Rec."No. 2")
                {
                    Caption = 'No. 2';
                    ToolTip = 'Specifies the no. 2 for this g/l account record.';
                    ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the comment for this g/l account record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the blocked for this g/l account record.';
                    ApplicationArea = All;
                }
                field(directPosting; Rec."Direct Posting")
                {
                    Caption = 'Direct Posting';
                    ToolTip = 'Specifies the direct posting for this g/l account record.';
                    ApplicationArea = All;
                }
                field(reconciliationAccount; Rec."Reconciliation Account")
                {
                    Caption = 'Reconciliation Account';
                    ToolTip = 'Specifies the reconciliation account for this g/l account record.';
                    ApplicationArea = All;
                }
                field(newPage; Rec."New Page")
                {
                    Caption = 'New Page';
                    ToolTip = 'Specifies the new page for this g/l account record.';
                    ApplicationArea = All;
                }
                field(noOfBlankLines; Rec."No. of Blank Lines")
                {
                    Caption = 'No. of Blank Lines';
                    ToolTip = 'Specifies the no. of blank lines for this g/l account record.';
                    ApplicationArea = All;
                }
                field(indentation; Rec.Indentation)
                {
                    Caption = 'Indentation';
                    ToolTip = 'Specifies the indentation for this g/l account record.';
                    ApplicationArea = All;
                }
                field(sourceCurrencyCode; Rec."Source Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the source currency code for this g/l account record.';
                    ApplicationArea = All;
                }
                field(sourceCurrencyPosting; Rec."Source Currency Posting")
                {
                    Caption = 'Source Currency Posting';
                    ToolTip = 'Specifies the source currency posting for this g/l account record.';
                    ApplicationArea = All;
                }
                field(sourceCurrencyRevaluation; Rec."Source Currency Revaluation")
                {
                    Caption = 'Source Currency Revaluation';
                    ToolTip = 'Specifies the source currency revaluation for this g/l account record.';
                    ApplicationArea = All;
                }
                field(unrealizedRevaluation; Rec."Unrealized Revaluation")
                {
                    Caption = 'Unrealized Revaluation';
                    ToolTip = 'Specifies the unrealized revaluation for this g/l account record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this g/l account record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date modified for this g/l account record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this g/l account record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Filter; Rec."Global Dimension 1 Filter")
                {
                    Caption = 'Global Dimension 1 Filter';
                    ToolTip = 'Specifies the global dimension 1 filter for this g/l account record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Filter; Rec."Global Dimension 2 Filter")
                {
                    Caption = 'Global Dimension 2 Filter';
                    ToolTip = 'Specifies the global dimension 2 filter for this g/l account record.';
                    ApplicationArea = All;
                }
                field(balanceAtDate; Rec."Balance at Date")
                {
                    Caption = 'Balance at Date';
                    ToolTip = 'Specifies the balance at date for this g/l account record.';
                    ApplicationArea = All;
                }
                field(netChange; Rec."Net Change")
                {
                    Caption = 'Net Change';
                    ToolTip = 'Specifies the net change for this g/l account record.';
                    ApplicationArea = All;
                }
                field(budgetedAmount; Rec."Budgeted Amount")
                {
                    Caption = 'Budgeted Amount';
                    ToolTip = 'Specifies the budgeted amount for this g/l account record.';
                    ApplicationArea = All;
                }
                field(totaling; Rec.Totaling)
                {
                    Caption = 'Totaling';
                    ToolTip = 'Specifies the totaling for this g/l account record.';
                    ApplicationArea = All;
                }
                field(budgetFilter; Rec."Budget Filter")
                {
                    Caption = 'Budget Filter';
                    ToolTip = 'Specifies the budget filter for this g/l account record.';
                    ApplicationArea = All;
                }
                field(balance; Rec.Balance)
                {
                    Caption = 'Balance';
                    ToolTip = 'Specifies the balance for this g/l account record.';
                    ApplicationArea = All;
                }
                field(budgetAtDate; Rec."Budget at Date")
                {
                    Caption = 'Budget at Date';
                    ToolTip = 'Specifies the budget at date for this g/l account record.';
                    ApplicationArea = All;
                }
                field(consolTranslationMethod; Rec."Consol. Translation Method")
                {
                    Caption = 'Consol. Translation Method';
                    ToolTip = 'Specifies the consol. translation method for this g/l account record.';
                    ApplicationArea = All;
                }
                field(consolDebitAcc; Rec."Consol. Debit Acc.")
                {
                    Caption = 'Consol. Debit Acc.';
                    ToolTip = 'Specifies the consol. debit acc. for this g/l account record.';
                    ApplicationArea = All;
                }
                field(consolCreditAcc; Rec."Consol. Credit Acc.")
                {
                    Caption = 'Consol. Credit Acc.';
                    ToolTip = 'Specifies the consol. credit acc. for this g/l account record.';
                    ApplicationArea = All;
                }
                field(businessUnitFilter; Rec."Business Unit Filter")
                {
                    Caption = 'Business Unit Filter';
                    ToolTip = 'Specifies the business unit filter for this g/l account record.';
                    ApplicationArea = All;
                }
                field(genPostingType; Rec."Gen. Posting Type")
                {
                    Caption = 'Gen. Posting Type';
                    ToolTip = 'Specifies the gen. posting type for this g/l account record.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the gen. bus. posting group for this g/l account record.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the gen. prod. posting group for this g/l account record.';
                    ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    Caption = 'Debit Amount';
                    ToolTip = 'Specifies the debit amount for this g/l account record.';
                    ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    Caption = 'Credit Amount';
                    ToolTip = 'Specifies the credit amount for this g/l account record.';
                    ApplicationArea = All;
                }
                field(automaticExtTexts; Rec."Automatic Ext. Texts")
                {
                    Caption = 'Automatic Ext. Texts';
                    ToolTip = 'Specifies the automatic ext. texts for this g/l account record.';
                    ApplicationArea = All;
                }
                field(budgetedDebitAmount; Rec."Budgeted Debit Amount")
                {
                    Caption = 'Budgeted Debit Amount';
                    ToolTip = 'Specifies the budgeted debit amount for this g/l account record.';
                    ApplicationArea = All;
                }
                field(budgetedCreditAmount; Rec."Budgeted Credit Amount")
                {
                    Caption = 'Budgeted Credit Amount';
                    ToolTip = 'Specifies the budgeted credit amount for this g/l account record.';
                    ApplicationArea = All;
                }
                field(taxAreaCode; Rec."Tax Area Code")
                {
                    Caption = 'Tax Area Code';
                    ToolTip = 'Specifies the tax area code for this g/l account record.';
                    ApplicationArea = All;
                }
                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';
                    ToolTip = 'Specifies the tax liable for this g/l account record.';
                    ApplicationArea = All;
                }
                field(taxGroupCode; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';
                    ToolTip = 'Specifies the tax group code for this g/l account record.';
                    ApplicationArea = All;
                }
                field(vATBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ToolTip = 'Specifies the vat bus. posting group for this g/l account record.';
                    ApplicationArea = All;
                }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                    ToolTip = 'Specifies the vat prod. posting group for this g/l account record.';
                    ApplicationArea = All;
                }
                field(vATAmt; Rec."VAT Amt.")
                {
                    Caption = 'VAT Amt.';
                    ToolTip = 'Specifies the vat amt. for this g/l account record.';
                    ApplicationArea = All;
                }
                field(additionalCurrencyNetChange; Rec."Additional-Currency Net Change")
                {
                    Caption = 'Additional-Currency Net Change';
                    ToolTip = 'Specifies the additional-currency net change for this g/l account record.';
                    ApplicationArea = All;
                }
                field(addCurrencyBalanceAtDate; Rec."Add.-Currency Balance at Date")
                {
                    Caption = 'Add.-Currency Balance at Date';
                    ToolTip = 'Specifies the add.-currency balance at date for this g/l account record.';
                    ApplicationArea = All;
                }
                field(additionalCurrencyBalance; Rec."Additional-Currency Balance")
                {
                    Caption = 'Additional-Currency Balance';
                    ToolTip = 'Specifies the additional-currency balance for this g/l account record.';
                    ApplicationArea = All;
                }
                field(exchangeRateAdjustment; Rec."Exchange Rate Adjustment")
                {
                    Caption = 'Exchange Rate Adjustment';
                    ToolTip = 'Specifies the exchange rate adjustment for this g/l account record.';
                    ApplicationArea = All;
                }
                field(addCurrencyDebitAmount; Rec."Add.-Currency Debit Amount")
                {
                    Caption = 'Add.-Currency Debit Amount';
                    ToolTip = 'Specifies the add.-currency debit amount for this g/l account record.';
                    ApplicationArea = All;
                }
                field(addCurrencyCreditAmount; Rec."Add.-Currency Credit Amount")
                {
                    Caption = 'Add.-Currency Credit Amount';
                    ToolTip = 'Specifies the add.-currency credit amount for this g/l account record.';
                    ApplicationArea = All;
                }
                field(defaultIcPartnerGLAccNo; Rec."Default IC Partner G/L Acc. No")
                {
                    Caption = 'Default IC Partner G/L Acc. No';
                    ToolTip = 'Specifies the default ic partner g/l acc. no for this g/l account record.';
                    ApplicationArea = All;
                }
                field(omitDefaultDescrInJnl; Rec."Omit Default Descr. in Jnl.")
                {
                    Caption = 'Omit Default Descr. in Jnl.';
                    ToolTip = 'Specifies the omit default descr. in jnl. for this g/l account record.';
                    ApplicationArea = All;
                }
                field(sourceCurrencyNetChange; Rec."Source Currency Net Change")
                {
                    Caption = 'Source Currency Net Change';
                    ToolTip = 'Specifies the source currency net change for this g/l account record.';
                    ApplicationArea = All;
                }
                field(sourceCurrBalanceAtDate; Rec."Source Curr. Balance at Date")
                {
                    Caption = 'Source Curr. Balance at Date';
                    ToolTip = 'Specifies the source curr. balance at date for this g/l account record.';
                    ApplicationArea = All;
                }
                field(sourceCurrencyBalance; Rec."Source Currency Balance")
                {
                    Caption = 'Source Currency Balance';
                    ToolTip = 'Specifies the source currency balance for this g/l account record.';
                    ApplicationArea = All;
                }
                field(accountSubcategoryEntryNo; Rec."Account Subcategory Entry No.")
                {
                    Caption = 'Account Subcategory Entry No.';
                    ToolTip = 'Specifies the account subcategory entry no. for this g/l account record.';
                    ApplicationArea = All;
                }
                field(accountSubcategoryDescript; Rec."Account Subcategory Descript.")
                {
                    Caption = 'Account Subcategory Descript.';
                    ToolTip = 'Specifies the account subcategory descript. for this g/l account record.';
                    ApplicationArea = All;
                }
                field(vATReportingDateFilter; Rec."VAT Reporting Date Filter")
                {
                    Caption = 'VAT Reporting Date Filter';
                    ToolTip = 'Specifies the vat reporting date filter for this g/l account record.';
                    ApplicationArea = All;
                }
                field(excludeFromConsolidation; Rec."Exclude From Consolidation")
                {
                    Caption = 'Exclude from Consolidation';
                    ToolTip = 'Specifies the exclude from consolidation for this g/l account record.';
                    ApplicationArea = All;
                }
                field(dimensionSetIdFilter; Rec."Dimension Set ID Filter")
                {
                    Caption = 'Dimension Set ID Filter';
                    ToolTip = 'Specifies the dimension set id filter for this g/l account record.';
                    ApplicationArea = All;
                }
                field(costTypeNo; Rec."Cost Type No.")
                {
                    Caption = 'Cost Type No.';
                    ToolTip = 'Specifies the cost type no. for this g/l account record.';
                    ApplicationArea = All;
                }
                field(defaultDeferralTemplateCode; Rec."Default Deferral Template Code")
                {
                    Caption = 'Default Deferral Template Code';
                    ToolTip = 'Specifies the default deferral template code for this g/l account record.';
                    ApplicationArea = All;
                }
                field(aPIAccountType; Rec."API Account Type")
                {
                    Caption = 'API Account Type';
                    ToolTip = 'Specifies the api account type for this g/l account record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}