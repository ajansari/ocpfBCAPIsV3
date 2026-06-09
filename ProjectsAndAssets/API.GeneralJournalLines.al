namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Journal;

page 90921 "ocpfGeneralJournalLines"
{
    PageType = API;
    Caption = 'General journal lines — unposted journal lines ready for review and posting.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0';
    EntityName = 'ocpfGeneralJournalLine';
    EntitySetName = 'ocpfGeneralJournalLines';
    SourceTable = "Gen. Journal Line";
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
                field(journalTemplateName; Rec."Journal Template Name")
                    {
                        Caption = 'Journal Template Name';
                        ToolTip = 'Specifies the Journal Template Name.';
                        ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                    {
                        Caption = 'Line No.';
                        ToolTip = 'Specifies the Line No..';
                        ApplicationArea = All;
                }
                field(accountType; Rec."Account Type")
                    {
                        Caption = 'Account Type';
                        ToolTip = 'Specifies the Account Type.';
                        ApplicationArea = All;
                }
                field(accountNo; Rec."Account No.")
                    {
                        Caption = 'Account No.';
                        ToolTip = 'Specifies the Account No..';
                        ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                    {
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the Posting Date.';
                        ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                    {
                        Caption = 'Document Type';
                        ToolTip = 'Specifies the Document Type.';
                        ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                    {
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the Document No..';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(vatPct; Rec."VAT %")
                    {
                        Caption = 'VAT %';
                        ToolTip = 'Specifies the VAT %.';
                        ApplicationArea = All;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                    {
                        Caption = 'Bal. Account No.';
                        ToolTip = 'Specifies the Bal. Account No..';
                        ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                    {
                        Caption = 'Currency Code';
                        ToolTip = 'Specifies the Currency Code.';
                        ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                    {
                        Caption = 'Amount';
                        ToolTip = 'Specifies the Amount.';
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
                field(amountLcy; Rec."Amount (LCY)")
                    {
                        Caption = 'Amount (LCY)';
                        ToolTip = 'Specifies the Amount (LCY).';
                        ApplicationArea = All;
                }
                field(balanceLcy; Rec."Balance (LCY)")
                    {
                        Caption = 'Balance (LCY)';
                        ToolTip = 'Specifies the Balance (LCY).';
                        ApplicationArea = All;
                }
                field(currencyFactor; Rec."Currency Factor")
                    {
                        Caption = 'Currency Factor';
                        ToolTip = 'Specifies the Currency Factor.';
                        ApplicationArea = All;
                }
                field(salesPurchLcy; Rec."Sales/Purch. (LCY)")
                    {
                        Caption = 'Sales/Purch. (LCY)';
                        ToolTip = 'Specifies the Sales/Purch. (LCY).';
                        ApplicationArea = All;
                }
                field(profitLcy; Rec."Profit (LCY)")
                    {
                        Caption = 'Profit (LCY)';
                        ToolTip = 'Specifies the Profit (LCY).';
                        ApplicationArea = All;
                }
                field(invDiscountLcy; Rec."Inv. Discount (LCY)")
                    {
                        Caption = 'Inv. Discount (LCY)';
                        ToolTip = 'Specifies the Inv. Discount (LCY).';
                        ApplicationArea = All;
                }
                field(billToPayToNo; Rec."Bill-to/Pay-to No.")
                    {
                        Caption = 'Bill-to/Pay-to No.';
                        ToolTip = 'Specifies the Bill-to/Pay-to No..';
                        ApplicationArea = All;
                }
                field(postingGroup; Rec."Posting Group")
                    {
                        Caption = 'Posting Group';
                        ToolTip = 'Specifies the Posting Group.';
                        ApplicationArea = All;
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                    {
                        Caption = 'Shortcut Dimension 1 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 1 Code.';
                        ApplicationArea = All;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                    {
                        Caption = 'Shortcut Dimension 2 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 2 Code.';
                        ApplicationArea = All;
                }
                field(salespersPurchCode; Rec."Salespers./Purch. Code")
                    {
                        Caption = 'Salespers./Purch. Code';
                        ToolTip = 'Specifies the Salespers./Purch. Code.';
                        ApplicationArea = All;
                }
                field(pendingApproval; Rec."Pending Approval")
                    {
                        Caption = 'Pending Approval';
                        ToolTip = 'Specifies the Pending Approval.';
                        ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                    {
                        Caption = 'Source Code';
                        ToolTip = 'Specifies the Source Code.';
                        ApplicationArea = All;
                }
                field(systemCreatedEntry; Rec."System-Created Entry")
                    {
                        Caption = 'System-Created Entry';
                        ToolTip = 'Specifies the System-Created Entry.';
                        ApplicationArea = All;
                }
                field(yourReference; Rec."Your Reference")
                    {
                        Caption = 'Your Reference';
                        ToolTip = 'Specifies the Your Reference.';
                        ApplicationArea = All;
                }
                field(onHold; Rec."On Hold")
                    {
                        Caption = 'On Hold';
                        ToolTip = 'Specifies the On Hold.';
                        ApplicationArea = All;
                }
                field(appliesToDocType; Rec."Applies-to Doc. Type")
                    {
                        Caption = 'Applies-to Doc. Type';
                        ToolTip = 'Specifies the Applies-to Doc. Type.';
                        ApplicationArea = All;
                }
                field(appliesToDocNo; Rec."Applies-to Doc. No.")
                    {
                        Caption = 'Applies-to Doc. No.';
                        ToolTip = 'Specifies the Applies-to Doc. No..';
                        ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                    {
                        Caption = 'Due Date';
                        ToolTip = 'Specifies the Due Date.';
                        ApplicationArea = All;
                }
                field(pmtDiscountDate; Rec."Pmt. Discount Date")
                    {
                        Caption = 'Pmt. Discount Date';
                        ToolTip = 'Specifies the Pmt. Discount Date.';
                        ApplicationArea = All;
                }
                field(paymentDiscountPct; Rec."Payment Discount %")
                    {
                        Caption = 'Payment Discount %';
                        ToolTip = 'Specifies the Payment Discount %.';
                        ApplicationArea = All;
                }
                field(jobNo; Rec."Job No.")
                    {
                        Caption = 'Project No.';
                        ToolTip = 'Specifies the Job No..';
                        ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                    {
                        Caption = 'Quantity';
                        ToolTip = 'Specifies the Quantity.';
                        ApplicationArea = All;
                }
                field(vatAmount; Rec."VAT Amount")
                    {
                        Caption = 'VAT Amount';
                        ToolTip = 'Specifies the VAT Amount.';
                        ApplicationArea = All;
                }
                field(vatPosting; Rec."VAT Posting")
                    {
                        Caption = 'VAT Posting';
                        ToolTip = 'Specifies the VAT Posting.';
                        ApplicationArea = All;
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                    {
                        Caption = 'Payment Terms Code';
                        ToolTip = 'Specifies the Payment Terms Code.';
                        ApplicationArea = All;
                }
                field(appliesToId; Rec."Applies-to ID")
                    {
                        Caption = 'Applies-to ID';
                        ToolTip = 'Specifies the Applies-to ID.';
                        ApplicationArea = All;
                }
                field(businessUnitCode; Rec."Business Unit Code")
                    {
                        Caption = 'Business Unit Code';
                        ToolTip = 'Specifies the Business Unit Code.';
                        ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                    {
                        Caption = 'Journal Batch Name';
                        ToolTip = 'Specifies the Journal Batch Name.';
                        ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                    {
                        Caption = 'Reason Code';
                        ToolTip = 'Specifies the Reason Code.';
                        ApplicationArea = All;
                }
                field(recurringMethod; Rec."Recurring Method")
                    {
                        Caption = 'Recurring Method';
                        ToolTip = 'Specifies the Recurring Method.';
                        ApplicationArea = All;
                }
                field(expirationDate; Rec."Expiration Date")
                    {
                        Caption = 'Expiration Date';
                        ToolTip = 'Specifies the Expiration Date.';
                        ApplicationArea = All;
                }
                field(recurringFrequency; Rec."Recurring Frequency")
                    {
                        Caption = 'Recurring Frequency';
                        ToolTip = 'Specifies the Recurring Frequency.';
                        ApplicationArea = All;
                }
                field(allocatedAmtLcy; Rec."Allocated Amt. (LCY)")
                    {
                        Caption = 'Allocated Amt. (LCY)';
                        ToolTip = 'Specifies the Allocated Amt. (LCY).';
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
                field(vatCalculationType; Rec."VAT Calculation Type")
                    {
                        Caption = 'VAT Calculation Type';
                        ToolTip = 'Specifies the VAT Calculation Type.';
                        ApplicationArea = All;
                }
                field(eu3PartyTrade; Rec."EU 3-Party Trade")
                    {
                        Caption = 'EU 3-Party Trade';
                        ToolTip = 'Specifies the EU 3-Party Trade.';
                        ApplicationArea = All;
                }
                field(allowApplication; Rec."Allow Application")
                    {
                        Caption = 'Allow Application';
                        ToolTip = 'Specifies the Allow Application.';
                        ApplicationArea = All;
                }
                field(balAccountType; Rec."Bal. Account Type")
                    {
                        Caption = 'Bal. Account Type';
                        ToolTip = 'Specifies the Bal. Account Type.';
                        ApplicationArea = All;
                }
                field(balGenPostingType; Rec."Bal. Gen. Posting Type")
                    {
                        Caption = 'Bal. Gen. Posting Type';
                        ToolTip = 'Specifies the Bal. Gen. Posting Type.';
                        ApplicationArea = All;
                }
                field(balGenBusPostingGroup; Rec."Bal. Gen. Bus. Posting Group")
                    {
                        Caption = 'Bal. Gen. Bus. Posting Group';
                        ToolTip = 'Specifies the Bal. Gen. Bus. Posting Group.';
                        ApplicationArea = All;
                }
                field(balGenProdPostingGroup; Rec."Bal. Gen. Prod. Posting Group")
                    {
                        Caption = 'Bal. Gen. Prod. Posting Group';
                        ToolTip = 'Specifies the Bal. Gen. Prod. Posting Group.';
                        ApplicationArea = All;
                }
                field(balVatCalculationType; Rec."Bal. VAT Calculation Type")
                    {
                        Caption = 'Bal. VAT Calculation Type';
                        ToolTip = 'Specifies the Bal. VAT Calculation Type.';
                        ApplicationArea = All;
                }
                field(balVatPct; Rec."Bal. VAT %")
                    {
                        Caption = 'Bal. VAT %';
                        ToolTip = 'Specifies the Bal. VAT %.';
                        ApplicationArea = All;
                }
                field(balVatAmount; Rec."Bal. VAT Amount")
                    {
                        Caption = 'Bal. VAT Amount';
                        ToolTip = 'Specifies the Bal. VAT Amount.';
                        ApplicationArea = All;
                }
                field(bankPaymentType; Rec."Bank Payment Type")
                    {
                        Caption = 'Bank Payment Type';
                        ToolTip = 'Specifies the Bank Payment Type.';
                        ApplicationArea = All;
                }
                field(vatBaseAmount; Rec."VAT Base Amount")
                    {
                        Caption = 'VAT Base Amount';
                        ToolTip = 'Specifies the VAT Base Amount.';
                        ApplicationArea = All;
                }
                field(balVatBaseAmount; Rec."Bal. VAT Base Amount")
                    {
                        Caption = 'Bal. VAT Base Amount';
                        ToolTip = 'Specifies the Bal. VAT Base Amount.';
                        ApplicationArea = All;
                }
                field(correction; Rec.Correction)
                    {
                        Caption = 'Correction';
                        ToolTip = 'Specifies the Correction.';
                        ApplicationArea = All;
                }
                field(printPostedDocuments; Rec."Print Posted Documents")
                    {
                        Caption = 'Print Posted Documents';
                        ToolTip = 'Specifies the Print Posted Documents.';
                        ApplicationArea = All;
                }
                field(checkPrinted; Rec."Check Printed")
                    {
                        Caption = 'Check Printed';
                        ToolTip = 'Specifies the Check Printed.';
                        ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                    {
                        Caption = 'Document Date';
                        ToolTip = 'Specifies the Document Date.';
                        ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                    {
                        Caption = 'External Document No.';
                        ToolTip = 'Specifies the External Document No..';
                        ApplicationArea = All;
                }
                field(sourceType; Rec."Source Type")
                    {
                        Caption = 'Source Type';
                        ToolTip = 'Specifies the Source Type.';
                        ApplicationArea = All;
                }
                field(sourceNo; Rec."Source No.")
                    {
                        Caption = 'Source No.';
                        ToolTip = 'Specifies the Source No..';
                        ApplicationArea = All;
                }
                field(postingNoSeries; Rec."Posting No. Series")
                    {
                        Caption = 'Posting No. Series';
                        ToolTip = 'Specifies the Posting No. Series.';
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
                field(balTaxAreaCode; Rec."Bal. Tax Area Code")
                    {
                        Caption = 'Bal. Tax Area Code';
                        ToolTip = 'Specifies the Bal. Tax Area Code.';
                        ApplicationArea = All;
                }
                field(balTaxLiable; Rec."Bal. Tax Liable")
                    {
                        Caption = 'Bal. Tax Liable';
                        ToolTip = 'Specifies the Bal. Tax Liable.';
                        ApplicationArea = All;
                }
                field(balTaxGroupCode; Rec."Bal. Tax Group Code")
                    {
                        Caption = 'Bal. Tax Group Code';
                        ToolTip = 'Specifies the Bal. Tax Group Code.';
                        ApplicationArea = All;
                }
                field(balUseTax; Rec."Bal. Use Tax")
                    {
                        Caption = 'Bal. Use Tax';
                        ToolTip = 'Specifies the Bal. Use Tax.';
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
                field(balVatBusPostingGroup; Rec."Bal. VAT Bus. Posting Group")
                    {
                        Caption = 'Bal. VAT Bus. Posting Group';
                        ToolTip = 'Specifies the Bal. VAT Bus. Posting Group.';
                        ApplicationArea = All;
                }
                field(balVatProdPostingGroup; Rec."Bal. VAT Prod. Posting Group")
                    {
                        Caption = 'Bal. VAT Prod. Posting Group';
                        ToolTip = 'Specifies the Bal. VAT Prod. Posting Group.';
                        ApplicationArea = All;
                }
                field(additionalCurrencyPosting; Rec."Additional-Currency Posting")
                    {
                        Caption = 'Additional-Currency Posting';
                        ToolTip = 'Specifies the Additional-Currency Posting.';
                        ApplicationArea = All;
                }
                field(faAddCurrencyFactor; Rec."FA Add.-Currency Factor")
                    {
                        Caption = 'FA Add.-Currency Factor';
                        ToolTip = 'Specifies the FA Add.-Currency Factor.';
                        ApplicationArea = All;
                }
                field(sourceCurrencyCode; Rec."Source Currency Code")
                    {
                        Caption = 'Source Currency Code';
                        ToolTip = 'Specifies the Source Currency Code.';
                        ApplicationArea = All;
                }
                field(sourceCurrencyAmount; Rec."Source Currency Amount")
                    {
                        Caption = 'Source Currency Amount';
                        ToolTip = 'Specifies the Source Currency Amount.';
                        ApplicationArea = All;
                }
                field(sourceCurrVatBaseAmount; Rec."Source Curr. VAT Base Amount")
                    {
                        Caption = 'Source Curr. VAT Base Amount';
                        ToolTip = 'Specifies the Source Curr. VAT Base Amount.';
                        ApplicationArea = All;
                }
                field(sourceCurrVatAmount; Rec."Source Curr. VAT Amount")
                    {
                        Caption = 'Source Curr. VAT Amount';
                        ToolTip = 'Specifies the Source Curr. VAT Amount.';
                        ApplicationArea = All;
                }
                field(vatBaseDiscountPct; Rec."VAT Base Discount %")
                    {
                        Caption = 'VAT Base Discount %';
                        ToolTip = 'Specifies the VAT Base Discount %.';
                        ApplicationArea = All;
                }
                field(vatAmountLcy; Rec."VAT Amount (LCY)")
                    {
                        Caption = 'VAT Amount (LCY)';
                        ToolTip = 'Specifies the VAT Amount (LCY).';
                        ApplicationArea = All;
                }
                field(vatBaseAmountLcy; Rec."VAT Base Amount (LCY)")
                    {
                        Caption = 'VAT Base Amount (LCY)';
                        ToolTip = 'Specifies the VAT Base Amount (LCY).';
                        ApplicationArea = All;
                }
                field(balVatAmountLcy; Rec."Bal. VAT Amount (LCY)")
                    {
                        Caption = 'Bal. VAT Amount (LCY)';
                        ToolTip = 'Specifies the Bal. VAT Amount (LCY).';
                        ApplicationArea = All;
                }
                field(balVatBaseAmountLcy; Rec."Bal. VAT Base Amount (LCY)")
                    {
                        Caption = 'Bal. VAT Base Amount (LCY)';
                        ToolTip = 'Specifies the Bal. VAT Base Amount (LCY).';
                        ApplicationArea = All;
                }
                field(reversingEntry; Rec."Reversing Entry")
                    {
                        Caption = 'Reversing Entry';
                        ToolTip = 'Specifies the Reversing Entry.';
                        ApplicationArea = All;
                }
                field(allowZeroAmountPosting; Rec."Allow Zero-Amount Posting")
                    {
                        Caption = 'Allow Zero-Amount Posting';
                        ToolTip = 'Specifies the Allow Zero-Amount Posting.';
                        ApplicationArea = All;
                }
                field(shipToOrderAddressCode; Rec."Ship-to/Order Address Code")
                    {
                        Caption = 'Ship-to/Order Address Code';
                        ToolTip = 'Specifies the Ship-to/Order Address Code.';
                        ApplicationArea = All;
                }
                field(vatDifference; Rec."VAT Difference")
                    {
                        Caption = 'VAT Difference';
                        ToolTip = 'Specifies the VAT Difference.';
                        ApplicationArea = All;
                }
                field(balVatDifference; Rec."Bal. VAT Difference")
                    {
                        Caption = 'Bal. VAT Difference';
                        ToolTip = 'Specifies the Bal. VAT Difference.';
                        ApplicationArea = All;
                }
                field(icPartnerCode; Rec."IC Partner Code")
                    {
                        Caption = 'IC Partner Code';
                        ToolTip = 'Specifies the IC Partner Code.';
                        ApplicationArea = All;
                }
                field(icDirection; Rec."IC Direction")
                    {
                        Caption = 'IC Direction';
                        ToolTip = 'Specifies the IC Direction.';
                        ApplicationArea = All;
                }
                field(icPartnerTransactionNo; Rec."IC Partner Transaction No.")
                    {
                        Caption = 'IC Partner Transaction No.';
                        ToolTip = 'Specifies the IC Partner Transaction No..';
                        ApplicationArea = All;
                }
                field(sellToBuyFromNo; Rec."Sell-to/Buy-from No.")
                    {
                        Caption = 'Sell-to/Buy-from No.';
                        ToolTip = 'Specifies the Sell-to/Buy-from No..';
                        ApplicationArea = All;
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                    {
                        Caption = 'VAT Registration No.';
                        ToolTip = 'Specifies the VAT Registration No..';
                        ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                    {
                        Caption = 'Country/Region Code';
                        ToolTip = 'Specifies the Country/Region Code.';
                        ApplicationArea = All;
                }
                field(prepayment; Rec.Prepayment)
                    {
                        Caption = 'Prepayment';
                        ToolTip = 'Specifies the Prepayment.';
                        ApplicationArea = All;
                }
                field(financialVoid; Rec."Financial Void")
                    {
                        Caption = 'Financial Void';
                        ToolTip = 'Specifies the Financial Void.';
                        ApplicationArea = All;
                }
                field(copyVatSetupToJnlLines; Rec."Copy VAT Setup to Jnl. Lines")
                    {
                        Caption = 'Copy VAT Setup to Jnl. Lines';
                        ToolTip = 'Specifies the Copy VAT Setup to Jnl. Lines.';
                        ApplicationArea = All;
                }
                field(vatBaseBeforePmtDisc; Rec."VAT Base Before Pmt. Disc.")
                    {
                        Caption = 'VAT Base Before Pmt. Disc.';
                        ToolTip = 'Specifies the VAT Base Before Pmt. Disc..';
                        ApplicationArea = All;
                }
                field(origPmtDiscPossible; Rec."Orig. Pmt. Disc. Possible")
                    {
                        Caption = 'Original Pmt. Disc. Possible';
                        ToolTip = 'Specifies the Orig. Pmt. Disc. Possible.';
                        ApplicationArea = All;
                }
                field(origPmtDiscPossibleLcy; Rec."Orig. Pmt. Disc. Possible(LCY)")
                    {
                        Caption = 'Orig. Pmt. Disc. Possible (LCY)';
                        ToolTip = 'Specifies the Orig. Pmt. Disc. Possible(LCY).';
                        ApplicationArea = All;
                }
                field(vatReportingDate; Rec."VAT Reporting Date")
                    {
                        Caption = 'VAT Date';
                        ToolTip = 'Specifies the VAT Reporting Date.';
                        ApplicationArea = All;
                }
                field(zeroSrcCurrAmount; Rec."Zero Src. Curr. Amount")
                    {
                        Caption = 'Zero Source Currency Amount';
                        ToolTip = 'Specifies the Zero Src. Curr. Amount.';
                        ApplicationArea = All;
                }
                field(icAccountType; Rec."IC Account Type")
                    {
                        Caption = 'IC Account Type';
                        ToolTip = 'Specifies the IC Account Type.';
                        ApplicationArea = All;
                }
                field(icAccountNo; Rec."IC Account No.")
                    {
                        Caption = 'IC Account No.';
                        ToolTip = 'Specifies the IC Account No..';
                        ApplicationArea = All;
                }
                field(jobQueueStatus; Rec."Job Queue Status")
                    {
                        Caption = 'Job Queue Status';
                        ToolTip = 'Specifies the Job Queue Status.';
                        ApplicationArea = All;
                }
                field(jobQueueEntryId; Rec."Job Queue Entry ID")
                    {
                        Caption = 'Job Queue Entry ID';
                        ToolTip = 'Specifies the Job Queue Entry ID.';
                        ApplicationArea = All;
                }
                field(incomingDocumentEntryNo; Rec."Incoming Document Entry No.")
                    {
                        Caption = 'Incoming Document Entry No.';
                        ToolTip = 'Specifies the Incoming Document Entry No..';
                        ApplicationArea = All;
                }
                field(creditorNo; Rec."Creditor No.")
                    {
                        Caption = 'Creditor No.';
                        ToolTip = 'Specifies the Creditor No..';
                        ApplicationArea = All;
                }
                field(paymentReference; Rec."Payment Reference")
                    {
                        Caption = 'Payment Reference';
                        ToolTip = 'Specifies the Payment Reference.';
                        ApplicationArea = All;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                    {
                        Caption = 'Payment Method Code';
                        ToolTip = 'Specifies the Payment Method Code.';
                        ApplicationArea = All;
                }
                field(appliesToExtDocNo; Rec."Applies-to Ext. Doc. No.")
                    {
                        Caption = 'Applies-to Ext. Doc. No.';
                        ToolTip = 'Specifies the Applies-to Ext. Doc. No..';
                        ApplicationArea = All;
                }
                field(invoiceReceivedDate; Rec."Invoice Received Date")
                    {
                        Caption = 'Invoice Received Date';
                        ToolTip = 'Specifies the Invoice Received Date.';
                        ApplicationArea = All;
                }
                field(keepDescription; Rec."Keep Description")
                    {
                        Caption = 'Keep Description';
                        ToolTip = 'Specifies the Keep Description.';
                        ApplicationArea = All;
                }
                field(recipientBankAccount; Rec."Recipient Bank Account")
                    {
                        Caption = 'Recipient Bank Account';
                        ToolTip = 'Specifies the Recipient Bank Account.';
                        ApplicationArea = All;
                }
                field(messageToRecipient; Rec."Message to Recipient")
                    {
                        Caption = 'Message to Recipient';
                        ToolTip = 'Specifies the Message to Recipient.';
                        ApplicationArea = All;
                }
                field(exportedToPaymentFile; Rec."Exported to Payment File")
                    {
                        Caption = 'Exported to Payment File';
                        ToolTip = 'Specifies the Exported to Payment File.';
                        ApplicationArea = All;
                }
                field(hasPaymentExportError; Rec."Has Payment Export Error")
                    {
                        Caption = 'Has Payment Export Error';
                        ToolTip = 'Specifies the Has Payment Export Error.';
                        ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                    {
                        Caption = 'Dimension Set ID';
                        ToolTip = 'Specifies the Dimension Set ID.';
                        ApplicationArea = All;
                }
                field(remitToCode; Rec."Remit-to Code")
                    {
                        Caption = 'Remit-to Code';
                        ToolTip = 'Specifies the Remit-to Code.';
                        ApplicationArea = All;
                }
                field(jobTaskNo; Rec."Job Task No.")
                    {
                        Caption = 'Project Task No.';
                        ToolTip = 'Specifies the Job Task No..';
                        ApplicationArea = All;
                }
                field(jobUnitPriceLcy; Rec."Job Unit Price (LCY)")
                    {
                        Caption = 'Project Unit Price (LCY)';
                        ToolTip = 'Specifies the Job Unit Price (LCY).';
                        ApplicationArea = All;
                }
                field(jobTotalPriceLcy; Rec."Job Total Price (LCY)")
                    {
                        Caption = 'Project Total Price (LCY)';
                        ToolTip = 'Specifies the Job Total Price (LCY).';
                        ApplicationArea = All;
                }
                field(jobQuantity; Rec."Job Quantity")
                    {
                        Caption = 'Project Quantity';
                        ToolTip = 'Specifies the Job Quantity.';
                        ApplicationArea = All;
                }
                field(jobUnitCostLcy; Rec."Job Unit Cost (LCY)")
                    {
                        Caption = 'Project Unit Cost (LCY)';
                        ToolTip = 'Specifies the Job Unit Cost (LCY).';
                        ApplicationArea = All;
                }
                field(jobLineDiscountPct; Rec."Job Line Discount %")
                    {
                        Caption = 'Project Line Discount %';
                        ToolTip = 'Specifies the Job Line Discount %.';
                        ApplicationArea = All;
                }
                field(jobLineDiscAmountLcy; Rec."Job Line Disc. Amount (LCY)")
                    {
                        Caption = 'Project Line Disc. Amount (LCY)';
                        ToolTip = 'Specifies the Job Line Disc. Amount (LCY).';
                        ApplicationArea = All;
                }
                field(jobUnitOfMeasureCode; Rec."Job Unit Of Measure Code")
                    {
                        Caption = 'Project Unit Of Measure Code';
                        ToolTip = 'Specifies the Job Unit Of Measure Code.';
                        ApplicationArea = All;
                }
                field(jobLineType; Rec."Job Line Type")
                    {
                        Caption = 'Project Line Type';
                        ToolTip = 'Specifies the Job Line Type.';
                        ApplicationArea = All;
                }
                field(jobUnitPrice; Rec."Job Unit Price")
                    {
                        Caption = 'Project Unit Price';
                        ToolTip = 'Specifies the Job Unit Price.';
                        ApplicationArea = All;
                }
                field(jobTotalPrice; Rec."Job Total Price")
                    {
                        Caption = 'Project Total Price';
                        ToolTip = 'Specifies the Job Total Price.';
                        ApplicationArea = All;
                }
                field(jobUnitCost; Rec."Job Unit Cost")
                    {
                        Caption = 'Project Unit Cost';
                        ToolTip = 'Specifies the Job Unit Cost.';
                        ApplicationArea = All;
                }
                field(jobTotalCost; Rec."Job Total Cost")
                    {
                        Caption = 'Project Total Cost';
                        ToolTip = 'Specifies the Job Total Cost.';
                        ApplicationArea = All;
                }
                field(jobLineDiscountAmount; Rec."Job Line Discount Amount")
                    {
                        Caption = 'Project Line Discount Amount';
                        ToolTip = 'Specifies the Job Line Discount Amount.';
                        ApplicationArea = All;
                }
                field(jobLineAmount; Rec."Job Line Amount")
                    {
                        Caption = 'Project Line Amount';
                        ToolTip = 'Specifies the Job Line Amount.';
                        ApplicationArea = All;
                }
                field(jobTotalCostLcy; Rec."Job Total Cost (LCY)")
                    {
                        Caption = 'Project Total Cost (LCY)';
                        ToolTip = 'Specifies the Job Total Cost (LCY).';
                        ApplicationArea = All;
                }
                field(jobLineAmountLcy; Rec."Job Line Amount (LCY)")
                    {
                        Caption = 'Project Line Amount (LCY)';
                        ToolTip = 'Specifies the Job Line Amount (LCY).';
                        ApplicationArea = All;
                }
                field(jobCurrencyFactor; Rec."Job Currency Factor")
                    {
                        Caption = 'Project Currency Factor';
                        ToolTip = 'Specifies the Job Currency Factor.';
                        ApplicationArea = All;
                }
                field(jobCurrencyCode; Rec."Job Currency Code")
                    {
                        Caption = 'Project Currency Code';
                        ToolTip = 'Specifies the Job Currency Code.';
                        ApplicationArea = All;
                }
                field(jobPlanningLineNo; Rec."Job Planning Line No.")
                    {
                        Caption = 'Project Planning Line No.';
                        ToolTip = 'Specifies the Job Planning Line No..';
                        ApplicationArea = All;
                }
                field(jobRemainingQty; Rec."Job Remaining Qty.")
                    {
                        Caption = 'Project Remaining Qty.';
                        ToolTip = 'Specifies the Job Remaining Qty..';
                        ApplicationArea = All;
                }
                field(directDebitMandateId; Rec."Direct Debit Mandate ID")
                    {
                        Caption = 'Direct Debit Mandate ID';
                        ToolTip = 'Specifies the Direct Debit Mandate ID.';
                        ApplicationArea = All;
                }
                field(dataExchEntryNo; Rec."Data Exch. Entry No.")
                    {
                        Caption = 'Data Exch. Entry No.';
                        ToolTip = 'Specifies the Data Exch. Entry No..';
                        ApplicationArea = All;
                }
                field(payerInformation; Rec."Payer Information")
                    {
                        Caption = 'Payer Information';
                        ToolTip = 'Specifies the Payer Information.';
                        ApplicationArea = All;
                }
                field(transactionInformation; Rec."Transaction Information")
                    {
                        Caption = 'Transaction Information';
                        ToolTip = 'Specifies the Transaction Information.';
                        ApplicationArea = All;
                }
                field(dataExchLineNo; Rec."Data Exch. Line No.")
                    {
                        Caption = 'Data Exch. Line No.';
                        ToolTip = 'Specifies the Data Exch. Line No..';
                        ApplicationArea = All;
                }
                field(appliedAutomatically; Rec."Applied Automatically")
                    {
                        Caption = 'Applied Automatically';
                        ToolTip = 'Specifies the Applied Automatically.';
                        ApplicationArea = All;
                }
                field(linkedTableId; Rec."Linked Table ID")
                    {
                        Caption = 'Linked Table ID';
                        ToolTip = 'Specifies the Linked Table ID.';
                        ApplicationArea = All;
                }
                field(linkedSystemId; Rec."Linked System ID")
                    {
                        Caption = 'Linked System ID';
                        ToolTip = 'Specifies the Linked System ID.';
                        ApplicationArea = All;
                }
                field(deferralCode; Rec."Deferral Code")
                    {
                        Caption = 'Deferral Code';
                        ToolTip = 'Specifies the Deferral Code.';
                        ApplicationArea = All;
                }
                field(deferralLineNo; Rec."Deferral Line No.")
                    {
                        Caption = 'Deferral Line No.';
                        ToolTip = 'Specifies the Deferral Line No..';
                        ApplicationArea = All;
                }
                field(selectedAllocAccountNo; Rec."Selected Alloc. Account No.")
                    {
                        Caption = 'Allocation Account No.';
                        ToolTip = 'Specifies the Selected Alloc. Account No..';
                        ApplicationArea = All;
                }
                field(allocAccModifiedByUser; Rec."Alloc. Acc. Modified by User")
                    {
                        Caption = 'Allocation Account Distributions Modified';
                        ToolTip = 'Specifies the Alloc. Acc. Modified by User.';
                        ApplicationArea = All;
                }
                field(allocationAccountNo; Rec."Allocation Account No.")
                    {
                        Caption = 'Posting Allocation Account No.';
                        ToolTip = 'Specifies the Allocation Account No..';
                        ApplicationArea = All;
                }
                field(allocJournalLineSystemid; Rec."Alloc. Journal Line SystemId")
                    {
                        Caption = 'Allocation Journal Line SystemId';
                        ToolTip = 'Specifies the Alloc. Journal Line SystemId.';
                        ApplicationArea = All;
                }
                field(campaignNo; Rec."Campaign No.")
                    {
                        Caption = 'Campaign No.';
                        ToolTip = 'Specifies the Campaign No..';
                        ApplicationArea = All;
                }
                field(prodOrderNo; Rec."Prod. Order No.")
                    {
                        Caption = 'Prod. Order No.';
                        ToolTip = 'Specifies the Prod. Order No..';
                        ApplicationArea = All;
                }
                field(faPostingDate; Rec."FA Posting Date")
                    {
                        Caption = 'FA Posting Date';
                        ToolTip = 'Specifies the FA Posting Date.';
                        ApplicationArea = All;
                }
                field(faPostingType; Rec."FA Posting Type")
                    {
                        Caption = 'FA Posting Type';
                        ToolTip = 'Specifies the FA Posting Type.';
                        ApplicationArea = All;
                }
                field(depreciationBookCode; Rec."Depreciation Book Code")
                    {
                        Caption = 'Depreciation Book Code';
                        ToolTip = 'Specifies the Depreciation Book Code.';
                        ApplicationArea = All;
                }
                field(salvageValue; Rec."Salvage Value")
                    {
                        Caption = 'Salvage Value';
                        ToolTip = 'Specifies the Salvage Value.';
                        ApplicationArea = All;
                }
                field(noOfDepreciationDays; Rec."No. of Depreciation Days")
                    {
                        Caption = 'No. of Depreciation Days';
                        ToolTip = 'Specifies the No. of Depreciation Days.';
                        ApplicationArea = All;
                }
                field(deprUntilFaPostingDate; Rec."Depr. until FA Posting Date")
                    {
                        Caption = 'Depr. until FA Posting Date';
                        ToolTip = 'Specifies the Depr. until FA Posting Date.';
                        ApplicationArea = All;
                }
                field(deprAcquisitionCost; Rec."Depr. Acquisition Cost")
                    {
                        Caption = 'Depr. Acquisition Cost';
                        ToolTip = 'Specifies the Depr. Acquisition Cost.';
                        ApplicationArea = All;
                }
                field(maintenanceCode; Rec."Maintenance Code")
                    {
                        Caption = 'Maintenance Code';
                        ToolTip = 'Specifies the Maintenance Code.';
                        ApplicationArea = All;
                }
                field(insuranceNo; Rec."Insurance No.")
                    {
                        Caption = 'Insurance No.';
                        ToolTip = 'Specifies the Insurance No..';
                        ApplicationArea = All;
                }
                field(budgetedFaNo; Rec."Budgeted FA No.")
                    {
                        Caption = 'Budgeted FA No.';
                        ToolTip = 'Specifies the Budgeted FA No..';
                        ApplicationArea = All;
                }
                field(duplicateInDepreciationBook; Rec."Duplicate in Depreciation Book")
                    {
                        Caption = 'Duplicate in Depreciation Book';
                        ToolTip = 'Specifies the Duplicate in Depreciation Book.';
                        ApplicationArea = All;
                }
                field(useDuplicationList; Rec."Use Duplication List")
                    {
                        Caption = 'Use Duplication List';
                        ToolTip = 'Specifies the Use Duplication List.';
                        ApplicationArea = All;
                }
                field(faReclassificationEntry; Rec."FA Reclassification Entry")
                    {
                        Caption = 'FA Reclassification Entry';
                        ToolTip = 'Specifies the FA Reclassification Entry.';
                        ApplicationArea = All;
                }
                field(faErrorEntryNo; Rec."FA Error Entry No.")
                    {
                        Caption = 'FA Error Entry No.';
                        ToolTip = 'Specifies the FA Error Entry No..';
                        ApplicationArea = All;
                }
                field(indexEntry; Rec."Index Entry")
                    {
                        Caption = 'Index Entry';
                        ToolTip = 'Specifies the Index Entry.';
                        ApplicationArea = All;
                }
                field(sourceLineNo; Rec."Source Line No.")
                    {
                        Caption = 'Source Line No.';
                        ToolTip = 'Specifies the Source Line No..';
                        ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                    {
                        Caption = 'Comment';
                        ToolTip = 'Specifies the Comment.';
                        ApplicationArea = All;
                }
                field(checkExported; Rec."Check Exported")
                    {
                        Caption = 'Check Exported';
                        ToolTip = 'Specifies the Check Exported.';
                        ApplicationArea = All;
                }
                field(checkTransmitted; Rec."Check Transmitted")
                    {
                        Caption = 'Check Transmitted';
                        ToolTip = 'Specifies the Check Transmitted.';
                        ApplicationArea = All;
                }
                field(reverseDateCalculation; Rec."Reverse Date Calculation")
                    {
                        Caption = 'Reverse Date Calculation';
                        ToolTip = 'Specifies the Reverse Date Calculation.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatPct; Rec."Non-Deductible VAT %")
                    {
                        Caption = 'Non-Deductible VAT %';
                        ToolTip = 'Specifies the Non-Deductible VAT %.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatBase; Rec."Non-Deductible VAT Base")
                    {
                        Caption = 'Non-Deductible VAT Base';
                        ToolTip = 'Specifies the Non-Deductible VAT Base.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatAmount; Rec."Non-Deductible VAT Amount")
                    {
                        Caption = 'Non-Deductible VAT Amount';
                        ToolTip = 'Specifies the Non-Deductible VAT Amount.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatBaseLcy; Rec."Non-Deductible VAT Base LCY")
                    {
                        Caption = 'Non-Deductible VAT Base LCY';
                        ToolTip = 'Specifies the Non-Deductible VAT Base LCY.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatAmountLcy; Rec."Non-Deductible VAT Amount LCY")
                    {
                        Caption = 'Non-Deductible VAT Amount LCY';
                        ToolTip = 'Specifies the Non-Deductible VAT Amount LCY.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatBaseAcy; Rec."Non-Deductible VAT Base ACY")
                    {
                        Caption = 'Non-Deductible VAT Base ACY';
                        ToolTip = 'Specifies the Non-Deductible VAT Base ACY.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatAmountAcy; Rec."Non-Deductible VAT Amount ACY")
                    {
                        Caption = 'Non-Deductible VAT Amount ACY';
                        ToolTip = 'Specifies the Non-Deductible VAT Amount ACY.';
                        ApplicationArea = All;
                }
                field(faGLAccountNo; Rec."FA G/L Account No.")
                    {
                        Caption = 'FA G/L Account No.';
                        ToolTip = 'Specifies the FA G/L Account No..';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatDiff; Rec."Non-Deductible VAT Diff.")
                    {
                        Caption = 'Non-Deductible VAT Difference';
                        ToolTip = 'Specifies the Non-Deductible VAT Diff..';
                        ApplicationArea = All;
                }
                field(balNonDedVatPct; Rec."Bal. Non-Ded. VAT %")
                    {
                        Caption = 'Bal. Non-Deductible VAT %';
                        ToolTip = 'Specifies the Bal. Non-Ded. VAT %.';
                        ApplicationArea = All;
                }
                field(balNonDedVatBase; Rec."Bal. Non-Ded. VAT Base")
                    {
                        Caption = 'Bal. Non-Deductible VAT Base';
                        ToolTip = 'Specifies the Bal. Non-Ded. VAT Base.';
                        ApplicationArea = All;
                }
                field(balNonDedVatAmount; Rec."Bal. Non-Ded. VAT Amount")
                    {
                        Caption = 'Bal. Non-Deductible VAT Amount';
                        ToolTip = 'Specifies the Bal. Non-Ded. VAT Amount.';
                        ApplicationArea = All;
                }
                field(balNonDedVatBaseLcy; Rec."Bal. Non-Ded. VAT Base LCY")
                    {
                        Caption = 'Bal. Non-Deductible VAT Base LCY';
                        ToolTip = 'Specifies the Bal. Non-Ded. VAT Base LCY.';
                        ApplicationArea = All;
                }
                field(balNonDedVatAmountLcy; Rec."Bal. Non-Ded. VAT Amount LCY")
                    {
                        Caption = 'Bal. Non-Deductible VAT Amount LCY';
                        ToolTip = 'Specifies the Bal. Non-Ded. VAT Amount LCY.';
                        ApplicationArea = All;
                }
                field(nonDedVatFaCost; Rec."Non-Ded. VAT FA Cost")
                    {
                        Caption = 'Non-Ded. VAT FA Cost';
                        ToolTip = 'Specifies the Non-Ded. VAT FA Cost.';
                        ApplicationArea = All;
                }
                field(accountId; Rec."Account Id")
                    {
                        Caption = 'Account Id';
                        ToolTip = 'Specifies the Account Id.';
                        ApplicationArea = All;
                }
                field(customerId; Rec."Customer Id")
                    {
                        Caption = 'Customer Id';
                        ToolTip = 'Specifies the Customer Id.';
                        ApplicationArea = All;
                }
                field(appliesToInvoiceId; Rec."Applies-to Invoice Id")
                    {
                        Caption = 'Applies-to Invoice Id';
                        ToolTip = 'Specifies the Applies-to Invoice Id.';
                        ApplicationArea = All;
                }
                field(contactGraphId; Rec."Contact Graph Id")
                    {
                        Caption = 'Contact Graph Id';
                        ToolTip = 'Specifies the Contact Graph Id.';
                        ApplicationArea = All;
                }
                field(lastModifiedDatetime; Rec."Last Modified DateTime")
                    {
                        Caption = 'Last Modified DateTime';
                        ToolTip = 'Specifies the Last Modified DateTime.';
                        ApplicationArea = All;
                }
                field(journalBatchId; Rec."Journal Batch Id")
                    {
                        Caption = 'Journal Batch Id';
                        ToolTip = 'Specifies the Journal Batch Id.';
                        ApplicationArea = All;
                }
                field(paymentMethodId; Rec."Payment Method Id")
                    {
                        Caption = 'Payment Method Id';
                        ToolTip = 'Specifies the Payment Method Id.';
                        ApplicationArea = All;
                }
                field(balanceAccountId; Rec."Balance Account Id")
                    {
                        Caption = 'Balance Account Id';
                        ToolTip = 'Specifies the Balance Account Id.';
                        ApplicationArea = All;
                }
                field(vendorId; Rec."Vendor Id")
                    {
                        Caption = 'Vendor Id';
                        ToolTip = 'Specifies the Vendor Id.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
