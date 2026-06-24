namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.HumanResources.Payables;

page 90810 "ocpfEmployeeLedgerEntries"
{
    PageType = API;
    Caption = 'Employee Ledger Entries — expense and reimbursement transactions per employee.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfEmployeeLedgerEntry';
    EntitySetName = 'ocpfEmployeeLedgerEntries';
    SourceTable = "Employee Ledger Entry";
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
                    ToolTip = 'Specifies the entry no. for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(employeeNo; Rec."Employee No.")
                {
                    Caption = 'Employee No.';
                    ToolTip = 'Specifies the employee no. for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies the document type for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the document no. for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the amount for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(remainingAmount; Rec."Remaining Amount")
                {
                    Caption = 'Remaining Amount';
                    ToolTip = 'Specifies the remaining amount for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(employeePostingGroup; Rec."Employee Posting Group")
                {
                    Caption = 'Employee Posting Group';
                    ToolTip = 'Specifies the employee posting group for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(salespersPurchCode; Rec."Salespers./Purch. Code")
                {
                    Caption = 'Salespers./Purch. Code';
                    ToolTip = 'Specifies the salespers./purch. code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the user id for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the source code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(appliesToDocType; Rec."Applies-to Doc. Type")
                {
                    Caption = 'Applies-to Doc. Type';
                    ToolTip = 'Specifies the applies-to doc. type for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(appliesToDocNo; Rec."Applies-to Doc. No.")
                {
                    Caption = 'Applies-to Doc. No.';
                    ToolTip = 'Specifies the applies-to doc. no. for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(open; Rec.Open)
                {
                    Caption = 'Open';
                    ToolTip = 'Specifies the open for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(positive; Rec.Positive)
                {
                    Caption = 'Positive';
                    ToolTip = 'Specifies the positive for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(closedByEntryNo; Rec."Closed by Entry No.")
                {
                    Caption = 'Closed by Entry No.';
                    ToolTip = 'Specifies the closed by entry no. for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(closedAtDate; Rec."Closed at Date")
                {
                    Caption = 'Closed at Date';
                    ToolTip = 'Specifies the closed at date for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(closedByAmount; Rec."Closed by Amount")
                {
                    Caption = 'Closed by Amount';
                    ToolTip = 'Specifies the closed by amount for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(appliesToId; Rec."Applies-to ID")
                {
                    Caption = 'Applies-to ID';
                    ToolTip = 'Specifies the applies-to id for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(journalTemplName; Rec."Journal Templ. Name")
                {
                    Caption = 'Journal Template Name';
                    ToolTip = 'Specifies the journal templ. name for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                    ToolTip = 'Specifies the journal batch name for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                    ToolTip = 'Specifies the reason code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                    ToolTip = 'Specifies the bal. account type for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                    ToolTip = 'Specifies the bal. account no. for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(transactionNo; Rec."Transaction No.")
                {
                    Caption = 'Transaction No.';
                    ToolTip = 'Specifies the transaction no. for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    Caption = 'Debit Amount';
                    ToolTip = 'Specifies the debit amount for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    Caption = 'Credit Amount';
                    ToolTip = 'Specifies the credit amount for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(closedByCurrencyCode; Rec."Closed by Currency Code")
                {
                    Caption = 'Closed by Currency Code';
                    ToolTip = 'Specifies the closed by currency code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(closedByCurrencyAmount; Rec."Closed by Currency Amount")
                {
                    Caption = 'Closed by Currency Amount';
                    ToolTip = 'Specifies the closed by currency amount for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(adjustedCurrencyFactor; Rec."Adjusted Currency Factor")
                {
                    Caption = 'Adjusted Currency Factor';
                    ToolTip = 'Specifies the adjusted currency factor for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(originalCurrencyFactor; Rec."Original Currency Factor")
                {
                    Caption = 'Original Currency Factor';
                    ToolTip = 'Specifies the original currency factor for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(originalAmount; Rec."Original Amount")
                {
                    Caption = 'Original Amount';
                    ToolTip = 'Specifies the original amount for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(amountToApply; Rec."Amount to Apply")
                {
                    Caption = 'Amount to Apply';
                    ToolTip = 'Specifies the amount to apply for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(applyingEntry; Rec."Applying Entry")
                {
                    Caption = 'Applying Entry';
                    ToolTip = 'Specifies the applying entry for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(reversed; Rec.Reversed)
                {
                    Caption = 'Reversed';
                    ToolTip = 'Specifies the reversed for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(reversedByEntryNo; Rec."Reversed by Entry No.")
                {
                    Caption = 'Reversed by Entry No.';
                    ToolTip = 'Specifies the reversed by entry no. for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(reversedEntryNo; Rec."Reversed Entry No.")
                {
                    Caption = 'Reversed Entry No.';
                    ToolTip = 'Specifies the reversed entry no. for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(creditorNo; Rec."Creditor No.")
                {
                    Caption = 'Creditor No.';
                    ToolTip = 'Specifies the creditor no. for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(paymentReference; Rec."Payment Reference")
                {
                    Caption = 'Payment Reference';
                    ToolTip = 'Specifies the payment reference for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    ToolTip = 'Specifies the payment method code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(messageToRecipient; Rec."Message to Recipient")
                {
                    Caption = 'Message to Recipient';
                    ToolTip = 'Specifies the message to recipient for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(exportedToPaymentFile; Rec."Exported to Payment File")
                {
                    Caption = 'Exported to Payment File';
                    ToolTip = 'Specifies the exported to payment file for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the dimension set id for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                    ToolTip = 'Specifies the shortcut dimension 3 code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                    ToolTip = 'Specifies the shortcut dimension 4 code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Shortcut Dimension 5 Code';
                    ToolTip = 'Specifies the shortcut dimension 5 code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Shortcut Dimension 6 Code';
                    ToolTip = 'Specifies the shortcut dimension 6 code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 7 Code';
                    ToolTip = 'Specifies the shortcut dimension 7 code for this employee ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                {
                    Caption = 'Shortcut Dimension 8 Code';
                    ToolTip = 'Specifies the shortcut dimension 8 code for this employee ledger entry record.';
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