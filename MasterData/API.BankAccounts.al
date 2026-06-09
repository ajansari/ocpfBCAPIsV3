namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Bank.BankAccount;

page 90830 "ocpfBankAccounts"
{
    PageType = API;
    Caption = 'Bank Accounts — company bank accounts used for posting payments and receipts, including balance and statement information.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfBankAccount';
    EntitySetName = 'ocpfBankAccounts';
    SourceTable = "Bank Account";
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
                    ToolTip = 'Specifies the no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this bank account record.';
                    ApplicationArea = All;
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies the search name for this bank account record.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies the name 2 for this bank account record.';
                    ApplicationArea = All;
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the address for this bank account record.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies the address 2 for this bank account record.';
                    ApplicationArea = All;
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city for this bank account record.';
                    ApplicationArea = All;
                }
                field(contact; Rec.Contact)
                {
                    Caption = 'Contact';
                    ToolTip = 'Specifies the contact for this bank account record.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the phone no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(telexNo; Rec."Telex No.")
                {
                    Caption = 'Telex No.';
                    ToolTip = 'Specifies the telex no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(bankAccountNo; Rec."Bank Account No.")
                {
                    Caption = 'Bank Account No.';
                    ToolTip = 'Specifies the bank account no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(transitNo; Rec."Transit No.")
                {
                    Caption = 'Transit No.';
                    ToolTip = 'Specifies the transit no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(territoryCode; Rec."Territory Code")
                {
                    Caption = 'Territory Code';
                    ToolTip = 'Specifies the territory code for this bank account record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this bank account record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this bank account record.';
                    ApplicationArea = All;
                }
                field(chainName; Rec."Chain Name")
                {
                    Caption = 'Chain Name';
                    ToolTip = 'Specifies the chain name for this bank account record.';
                    ApplicationArea = All;
                }
                field(minBalance; Rec."Min. Balance")
                {
                    Caption = 'Min. Balance';
                    ToolTip = 'Specifies the min. balance for this bank account record.';
                    ApplicationArea = All;
                }
                field(bankAccPostingGroup; Rec."Bank Acc. Posting Group")
                {
                    Caption = 'Bank Acc. Posting Group';
                    ToolTip = 'Specifies the bank acc. posting group for this bank account record.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this bank account record.';
                    ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                    ToolTip = 'Specifies the language code for this bank account record.';
                    ApplicationArea = All;
                }
                field(formatRegion; Rec."Format Region")
                {
                    Caption = 'Format Region';
                    ToolTip = 'Specifies the format region for this bank account record.';
                    ApplicationArea = All;
                }
                field(statisticsGroup; Rec."Statistics Group")
                {
                    Caption = 'Statistics Group';
                    ToolTip = 'Specifies the statistics group for this bank account record.';
                    ApplicationArea = All;
                }
                field(ourContactCode; Rec."Our Contact Code")
                {
                    Caption = 'Our Contact Code';
                    ToolTip = 'Specifies the our contact code for this bank account record.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region code for this bank account record.';
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the amount for this bank account record.';
                    ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the comment for this bank account record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the blocked for this bank account record.';
                    ApplicationArea = All;
                }
                field(lastStatementNo; Rec."Last Statement No.")
                {
                    Caption = 'Last Statement No.';
                    ToolTip = 'Specifies the last statement no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(lastPaymentStatementNo; Rec."Last Payment Statement No.")
                {
                    Caption = 'Last Payment Statement No.';
                    ToolTip = 'Specifies the last payment statement no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(pmtRecNoSeries; Rec."Pmt. Rec. No. Series")
                {
                    Caption = 'Payment Reconciliation No. Series';
                    ToolTip = 'Specifies the pmt. rec. no. series for this bank account record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date modified for this bank account record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this bank account record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Filter; Rec."Global Dimension 1 Filter")
                {
                    Caption = 'Global Dimension 1 Filter';
                    ToolTip = 'Specifies the global dimension 1 filter for this bank account record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Filter; Rec."Global Dimension 2 Filter")
                {
                    Caption = 'Global Dimension 2 Filter';
                    ToolTip = 'Specifies the global dimension 2 filter for this bank account record.';
                    ApplicationArea = All;
                }
                field(balance; Rec.Balance)
                {
                    Caption = 'Balance';
                    ToolTip = 'Specifies the balance for this bank account record.';
                    ApplicationArea = All;
                }
                field(netChange; Rec."Net Change")
                {
                    Caption = 'Net Change';
                    ToolTip = 'Specifies the net change for this bank account record.';
                    ApplicationArea = All;
                }
                field(totalOnChecks; Rec."Total on Checks")
                {
                    Caption = 'Total on Checks';
                    ToolTip = 'Specifies the total on checks for this bank account record.';
                    ApplicationArea = All;
                }
                field(useAsDefaultForCurrency; Rec."Use as Default for Currency")
                {
                    Caption = 'Use as Default for Currency';
                    ToolTip = 'Specifies the use as default for currency for this bank account record.';
                    ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the fax no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(telexAnswerBack; Rec."Telex Answer Back")
                {
                    Caption = 'Telex Answer Back';
                    ToolTip = 'Specifies the telex answer back for this bank account record.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the post code for this bank account record.';
                    ApplicationArea = All;
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the county for this bank account record.';
                    ApplicationArea = All;
                }
                field(lastCheckNo; Rec."Last Check No.")
                {
                    Caption = 'Last Check No.';
                    ToolTip = 'Specifies the last check no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(balanceLastStatement; Rec."Balance Last Statement")
                {
                    Caption = 'Balance Last Statement';
                    ToolTip = 'Specifies the balance last statement for this bank account record.';
                    ApplicationArea = All;
                }
                field(balanceAtDate; Rec."Balance at Date")
                {
                    Caption = 'Balance at Date';
                    ToolTip = 'Specifies the balance at date for this bank account record.';
                    ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    Caption = 'Debit Amount';
                    ToolTip = 'Specifies the debit amount for this bank account record.';
                    ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    Caption = 'Credit Amount';
                    ToolTip = 'Specifies the credit amount for this bank account record.';
                    ApplicationArea = All;
                }
                field(bankBranchNo; Rec."Bank Branch No.")
                {
                    Caption = 'Bank Branch No.';
                    ToolTip = 'Specifies the bank branch no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the e-mail for this bank account record.';
                    ApplicationArea = All;
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Home Page';
                    ToolTip = 'Specifies the home page for this bank account record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this bank account record.';
                    ApplicationArea = All;
                }
                field(checkReportId; Rec."Check Report ID")
                {
                    Caption = 'Check Report ID';
                    ToolTip = 'Specifies the check report id for this bank account record.';
                    ApplicationArea = All;
                }
                field(checkReportName; Rec."Check Report Name")
                {
                    Caption = 'Check Report Name';
                    ToolTip = 'Specifies the check report name for this bank account record.';
                    ApplicationArea = All;
                }
                field(iBAN; Rec.IBAN)
                {
                    Caption = 'IBAN';
                    ToolTip = 'Specifies the iban for this bank account record.';
                    ApplicationArea = All;
                }
                field(sWIFTCode; Rec."SWIFT Code")
                {
                    Caption = 'SWIFT Code';
                    ToolTip = 'Specifies the swift code for this bank account record.';
                    ApplicationArea = All;
                }
                field(bankStatementImportFormat; Rec."Bank Statement Import Format")
                {
                    Caption = 'Bank Statement Import Format';
                    ToolTip = 'Specifies the bank statement import format for this bank account record.';
                    ApplicationArea = All;
                }
                field(creditTransferMsgNos; Rec."Credit Transfer Msg. Nos.")
                {
                    Caption = 'Credit Transfer Msg. Nos.';
                    ToolTip = 'Specifies the credit transfer msg. nos. for this bank account record.';
                    ApplicationArea = All;
                }
                field(directDebitMsgNos; Rec."Direct Debit Msg. Nos.")
                {
                    Caption = 'Direct Debit Msg. Nos.';
                    ToolTip = 'Specifies the direct debit msg. nos. for this bank account record.';
                    ApplicationArea = All;
                }
                field(sEPADirectDebitExpFormat; Rec."SEPA Direct Debit Exp. Format")
                {
                    Caption = 'SEPA Direct Debit Exp. Format';
                    ToolTip = 'Specifies the sepa direct debit exp. format for this bank account record.';
                    ApplicationArea = All;
                }
                field(bankStmtServiceRecordId; Rec."Bank Stmt. Service Record ID")
                {
                    Caption = 'Bank Stmt. Service Record ID';
                    ToolTip = 'Specifies the bank stmt. service record id for this bank account record.';
                    ApplicationArea = All;
                }
                field(transactionImportTimespan; Rec."Transaction Import Timespan")
                {
                    Caption = 'Transaction Import Timespan';
                    ToolTip = 'Specifies the transaction import timespan for this bank account record.';
                    ApplicationArea = All;
                }
                field(automaticStmtImportEnabled; Rec."Automatic Stmt. Import Enabled")
                {
                    Caption = 'Automatic Stmt. Import Enabled';
                    ToolTip = 'Specifies the automatic stmt. import enabled for this bank account record.';
                    ApplicationArea = All;
                }
                field(intercompanyEnable; Rec.IntercompanyEnable)
                {
                    Caption = 'Enable for Intercompany transactions';
                    ToolTip = 'Specifies the intercompanyenable for this bank account record.';
                    ApplicationArea = All;
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                    ToolTip = 'Specifies the image for this bank account record.';
                    ApplicationArea = All;
                }
                field(creditorNo; Rec."Creditor No.")
                {
                    Caption = 'Creditor No.';
                    ToolTip = 'Specifies the creditor no. for this bank account record.';
                    ApplicationArea = All;
                }
                field(paymentExportFormat; Rec."Payment Export Format")
                {
                    Caption = 'Payment Export Format';
                    ToolTip = 'Specifies the payment export format for this bank account record.';
                    ApplicationArea = All;
                }
                field(bankClearingCode; Rec."Bank Clearing Code")
                {
                    Caption = 'Bank Clearing Code';
                    ToolTip = 'Specifies the bank clearing code for this bank account record.';
                    ApplicationArea = All;
                }
                field(bankClearingStandard; Rec."Bank Clearing Standard")
                {
                    Caption = 'Bank Clearing Standard';
                    ToolTip = 'Specifies the bank clearing standard for this bank account record.';
                    ApplicationArea = All;
                }
                field(matchToleranceType; Rec."Match Tolerance Type")
                {
                    Caption = 'Match Tolerance Type';
                    ToolTip = 'Specifies the match tolerance type for this bank account record.';
                    ApplicationArea = All;
                }
                field(matchToleranceValue; Rec."Match Tolerance Value")
                {
                    Caption = 'Match Tolerance Value';
                    ToolTip = 'Specifies the match tolerance value for this bank account record.';
                    ApplicationArea = All;
                }
                field(disableAutomaticPmtMatching; Rec."Disable Automatic Pmt Matching")
                {
                    Caption = 'Disable Automatic Payment Matching';
                    ToolTip = 'Specifies the disable automatic pmt matching for this bank account record.';
                    ApplicationArea = All;
                }
                field(disableBankRecOptimization; Rec."Disable Bank Rec. Optimization")
                {
                    Caption = 'Disable Bank Reconciliation Optimization';
                    ToolTip = 'Specifies the disable bank rec. optimization for this bank account record.';
                    ApplicationArea = All;
                }
                field(positivePayExportCode; Rec."Positive Pay Export Code")
                {
                    Caption = 'Positive Pay Export Code';
                    ToolTip = 'Specifies the positive pay export code for this bank account record.';
                    ApplicationArea = All;
                }
                field(checkTransmitted; Rec."Check Transmitted")
                {
                    Caption = 'Check Transmitted';
                    ToolTip = 'Specifies to check transmitted before posting the Payment Journal';
                    ApplicationArea = All;
                }
                field(mobilePhoneNo; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No.';
                    ToolTip = 'Specifies the mobile phone no. for this bank account record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}