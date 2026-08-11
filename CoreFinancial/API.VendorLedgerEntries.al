namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Purchases.Payables;

page 90808 "ocpfVendorLedgerEntries"
{
    PageType = API;
    Caption = 'Vendor Ledger Entries — open and closed payables transactions per vendor including purchase invoices, credit memos, and payments.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfVendorLedgerEntry';
    EntitySetName = 'ocpfVendorLedgerEntries';
    SourceTable = "Vendor Ledger Entry";
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
                    ToolTip = 'Specifies the entry no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the vendor no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies the document type for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the document no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(vendorName; Rec."Vendor Name")
                {
                    Caption = 'Vendor Name';
                    ToolTip = 'Specifies the vendor name for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the amount for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(remainingAmount; Rec."Remaining Amount")
                {
                    Caption = 'Remaining Amount';
                    ToolTip = 'Specifies the remaining amount for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(buyFromVendorNo; Rec."Buy-from Vendor No.")
                {
                    Caption = 'Buy-from Vendor No.';
                    ToolTip = 'Specifies the buy-from vendor no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(vendorPostingGroup; Rec."Vendor Posting Group")
                {
                    Caption = 'Vendor Posting Group';
                    ToolTip = 'Specifies the vendor posting group for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(purchaserCode; Rec."Purchaser Code")
                {
                    Caption = 'Purchaser Code';
                    ToolTip = 'Specifies the purchaser code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the user id for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the source code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(onHold; Rec."On Hold")
                {
                    Caption = 'On Hold';
                    ToolTip = 'Specifies the on hold for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(appliesToDocType; Rec."Applies-to Doc. Type")
                {
                    Caption = 'Applies-to Doc. Type';
                    ToolTip = 'Specifies the applies-to doc. type for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(appliesToDocNo; Rec."Applies-to Doc. No.")
                {
                    Caption = 'Applies-to Doc. No.';
                    ToolTip = 'Specifies the applies-to doc. no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(open; Rec.Open)
                {
                    Caption = 'Open';
                    ToolTip = 'Specifies the open for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Specifies the due date for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(pmtDiscountDate; Rec."Pmt. Discount Date")
                {
                    Caption = 'Pmt. Discount Date';
                    ToolTip = 'Specifies the pmt. discount date for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(originalPmtDiscPossible; Rec."Original Pmt. Disc. Possible")
                {
                    Caption = 'Original Pmt. Disc. Possible';
                    ToolTip = 'Specifies the original pmt. disc. possible for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(positive; Rec.Positive)
                {
                    Caption = 'Positive';
                    ToolTip = 'Specifies the positive for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(closedByEntryNo; Rec."Closed by Entry No.")
                {
                    Caption = 'Closed by Entry No.';
                    ToolTip = 'Specifies the closed by entry no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(closedAtDate; Rec."Closed at Date")
                {
                    Caption = 'Closed at Date';
                    ToolTip = 'Specifies the closed at date for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(closedByAmount; Rec."Closed by Amount")
                {
                    Caption = 'Closed by Amount';
                    ToolTip = 'Specifies the closed by amount for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(appliesToId; Rec."Applies-to ID")
                {
                    Caption = 'Applies-to ID';
                    ToolTip = 'Specifies the applies-to id for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(journalTemplName; Rec."Journal Templ. Name")
                {
                    Caption = 'Journal Template Name';
                    ToolTip = 'Specifies the journal templ. name for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                    ToolTip = 'Specifies the journal batch name for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                    ToolTip = 'Specifies the reason code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                    ToolTip = 'Specifies the bal. account type for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                    ToolTip = 'Specifies the bal. account no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(transactionNo; Rec."Transaction No.")
                {
                    Caption = 'Transaction No.';
                    ToolTip = 'Specifies the transaction no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    Caption = 'Debit Amount';
                    ToolTip = 'Specifies the debit amount for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    Caption = 'Credit Amount';
                    ToolTip = 'Specifies the credit amount for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                    ToolTip = 'Specifies the document date for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ToolTip = 'Specifies the external document no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(closedByCurrencyCode; Rec."Closed by Currency Code")
                {
                    Caption = 'Closed by Currency Code';
                    ToolTip = 'Specifies the closed by currency code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(closedByCurrencyAmount; Rec."Closed by Currency Amount")
                {
                    Caption = 'Closed by Currency Amount';
                    ToolTip = 'Specifies the closed by currency amount for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(adjustedCurrencyFactor; Rec."Adjusted Currency Factor")
                {
                    Caption = 'Adjusted Currency Factor';
                    ToolTip = 'Specifies the adjusted currency factor for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(originalCurrencyFactor; Rec."Original Currency Factor")
                {
                    Caption = 'Original Currency Factor';
                    ToolTip = 'Specifies the original currency factor for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(originalAmount; Rec."Original Amount")
                {
                    Caption = 'Original Amount';
                    ToolTip = 'Specifies the original amount for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(remainingPmtDiscPossible; Rec."Remaining Pmt. Disc. Possible")
                {
                    Caption = 'Remaining Pmt. Disc. Possible';
                    ToolTip = 'Specifies the remaining pmt. disc. possible for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(pmtDiscToleranceDate; Rec."Pmt. Disc. Tolerance Date")
                {
                    Caption = 'Pmt. Disc. Tolerance Date';
                    ToolTip = 'Specifies the pmt. disc. tolerance date for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(maxPaymentTolerance; Rec."Max. Payment Tolerance")
                {
                    Caption = 'Max. Payment Tolerance';
                    ToolTip = 'Specifies the max. payment tolerance for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(acceptedPaymentTolerance; Rec."Accepted Payment Tolerance")
                {
                    Caption = 'Accepted Payment Tolerance';
                    ToolTip = 'Specifies the accepted payment tolerance for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(acceptedPmtDiscTolerance; Rec."Accepted Pmt. Disc. Tolerance")
                {
                    Caption = 'Accepted Pmt. Disc. Tolerance';
                    ToolTip = 'Specifies the accepted pmt. disc. tolerance for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(amountToApply; Rec."Amount to Apply")
                {
                    Caption = 'Amount to Apply';
                    ToolTip = 'Specifies the amount to apply for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(iCPartnerCode; Rec."IC Partner Code")
                {
                    Caption = 'IC Partner Code';
                    ToolTip = 'Specifies the ic partner code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(applyingEntry; Rec."Applying Entry")
                {
                    Caption = 'Applying Entry';
                    ToolTip = 'Specifies the applying entry for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(reversed; Rec.Reversed)
                {
                    Caption = 'Reversed';
                    ToolTip = 'Specifies the reversed for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(reversedByEntryNo; Rec."Reversed by Entry No.")
                {
                    Caption = 'Reversed by Entry No.';
                    ToolTip = 'Specifies the reversed by entry no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(reversedEntryNo; Rec."Reversed Entry No.")
                {
                    Caption = 'Reversed Entry No.';
                    ToolTip = 'Specifies the reversed entry no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(prepayment; Rec.Prepayment)
                {
                    Caption = 'Prepayment';
                    ToolTip = 'Specifies the prepayment for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(creditorNo; Rec."Creditor No.")
                {
                    Caption = 'Creditor No.';
                    ToolTip = 'Specifies the creditor no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(paymentReference; Rec."Payment Reference")
                {
                    Caption = 'Payment Reference';
                    ToolTip = 'Specifies the payment reference for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    ToolTip = 'Specifies the payment method code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(appliesToExtDocNo; Rec."Applies-to Ext. Doc. No.")
                {
                    Caption = 'Applies-to Ext. Doc. No.';
                    ToolTip = 'Specifies the applies-to ext. doc. no. for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(invoiceReceivedDate; Rec."Invoice Received Date")
                {
                    Caption = 'Invoice Received Date';
                    ToolTip = 'Specifies the invoice received date for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(recipientBankAccount; Rec."Recipient Bank Account")
                {
                    Caption = 'Recipient Bank Account';
                    ToolTip = 'Specifies the recipient bank account for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(messageToRecipient; Rec."Message to Recipient")
                {
                    Caption = 'Message to Recipient';
                    ToolTip = 'Specifies the message to recipient for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(exportedToPaymentFile; Rec."Exported to Payment File")
                {
                    Caption = 'Exported to Payment File';
                    ToolTip = 'Specifies the exported to payment file for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the dimension set id for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                    ToolTip = 'Specifies the shortcut dimension 3 code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                    ToolTip = 'Specifies the shortcut dimension 4 code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Shortcut Dimension 5 Code';
                    ToolTip = 'Specifies the shortcut dimension 5 code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Shortcut Dimension 6 Code';
                    ToolTip = 'Specifies the shortcut dimension 6 code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 7 Code';
                    ToolTip = 'Specifies the shortcut dimension 7 code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                {
                    Caption = 'Shortcut Dimension 8 Code';
                    ToolTip = 'Specifies the shortcut dimension 8 code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(remitToCode; Rec."Remit-to Code")
                {
                    Caption = 'Remit-to Code';
                    ToolTip = 'Specifies the remit-to code for this vendor ledger entry record.';
                    ApplicationArea = All;
                }
                field(originalAmtLcy; Rec."Original Amt. (LCY)")
                {
                    Caption = 'Original Amt. (LCY)';
                    ToolTip = 'Specifies the amount that the entry originally consisted of, in LCY.';
                    ApplicationArea = All;
                }
                field(remainingAmtLcy; Rec."Remaining Amt. (LCY)")
                {
                    Caption = 'Remaining Amt. (LCY)';
                    ToolTip = 'Specifies the net amount of in the local currency. The amount is calculated using the Remaining Quantity, Line Discount %, and Unit Price (LCY) fields. ';
                    ApplicationArea = All;
                }
                field(amountLcy; Rec."Amount (LCY)")
                {
                    Caption = 'Amount (LCY)';
                    ToolTip = 'Specifies the amount of the entry in LCY.';
                    ApplicationArea = All;
                }
                field(purchaseLcy; Rec."Purchase (LCY)")
                {
                    Caption = 'Purchase (LCY)';
                    ToolTip = 'Specifies the Purchase (LCY).';
                    ApplicationArea = All;
                }
                field(invDiscountLcy; Rec."Inv. Discount (LCY)")
                {
                    Caption = 'Inv. Discount (LCY)';
                    ToolTip = 'Specifies the Inv. Discount (LCY).';
                    ApplicationArea = All;
                }
                field(pmtDiscRcdLcy; Rec."Pmt. Disc. Rcd.(LCY)")
                {
                    Caption = 'Pmt. Disc. Rcd.(LCY)';
                    ToolTip = 'Specifies the Pmt. Disc. Rcd.(LCY).';
                    ApplicationArea = All;
                }
                field(origPmtDiscPossibleLcy; Rec."Orig. Pmt. Disc. Possible(LCY)")
                {
                    Caption = 'Org. Pmt. Disc. Possible (LCY)';
                    ToolTip = 'Specifies the Org. Pmt. Disc. Possible (LCY).';
                    ApplicationArea = All;
                }
                field(closedByAmountLcy; Rec."Closed by Amount (LCY)")
                {
                    Caption = 'Closed by Amount (LCY)';
                    ToolTip = 'Specifies the Closed by Amount (LCY).';
                    ApplicationArea = All;
                }
                field(debitAmountLcy; Rec."Debit Amount (LCY)")
                {
                    Caption = 'Debit Amount (LCY)';
                    ToolTip = 'Specifies the total of the ledger entries that represent debits, expressed in LCY.';
                    ApplicationArea = All;
                }
                field(creditAmountLcy; Rec."Credit Amount (LCY)")
                {
                    Caption = 'Credit Amount (LCY)';
                    ToolTip = 'Specifies the total of the ledger entries that represent credits, expressed in LCY.';
                    ApplicationArea = All;
                }
                field(pmtToleranceLcy; Rec."Pmt. Tolerance (LCY)")
                {
                    Caption = 'Pmt. Tolerance (LCY)';
                    ToolTip = 'Specifies the Pmt. Tolerance (LCY).';
                    ApplicationArea = All;
                }
            }
        }
    }
}