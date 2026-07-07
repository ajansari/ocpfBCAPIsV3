namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Purchases.Vendor;

page 90843 "ocpfVendors"
{
    PageType = API;
    Caption = 'Vendors — master records for all entities from whom the company purchases goods or services, including payment and posting settings.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfVendor';
    EntitySetName = 'ocpfVendors';
    SourceTable = Vendor;
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
                    ToolTip = 'Specifies the no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this vendor record.';
                    ApplicationArea = All;
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies the search name for this vendor record.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies the name 2 for this vendor record.';
                    ApplicationArea = All;
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the address for this vendor record.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies the address 2 for this vendor record.';
                    ApplicationArea = All;
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city for this vendor record.';
                    ApplicationArea = All;
                }
                field(contact; Rec.Contact)
                {
                    Caption = 'Contact';
                    ToolTip = 'Specifies the contact for this vendor record.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the phone no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(telexNo; Rec."Telex No.")
                {
                    Caption = 'Telex No.';
                    ToolTip = 'Specifies the telex no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(ourAccountNo; Rec."Our Account No.")
                {
                    Caption = 'Our Account No.';
                    ToolTip = 'Specifies the our account no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(territoryCode; Rec."Territory Code")
                {
                    Caption = 'Territory Code';
                    ToolTip = 'Specifies the territory code for this vendor record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this vendor record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this vendor record.';
                    ApplicationArea = All;
                }
                field(budgetedAmount; Rec."Budgeted Amount")
                {
                    Caption = 'Budgeted Amount';
                    ToolTip = 'Specifies the budgeted amount for this vendor record.';
                    ApplicationArea = All;
                }
                field(vendorPostingGroup; Rec."Vendor Posting Group")
                {
                    Caption = 'Vendor Posting Group';
                    ToolTip = 'Specifies the vendor posting group for this vendor record.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this vendor record.';
                    ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                    ToolTip = 'Specifies the language code for this vendor record.';
                    ApplicationArea = All;
                }
                field(registrationNumber; Rec."Registration Number")
                {
                    Caption = 'Registration No.';
                    ToolTip = 'Specifies the registration number for this vendor record.';
                    ApplicationArea = All;
                }
                field(statisticsGroup; Rec."Statistics Group")
                {
                    Caption = 'Statistics Group';
                    ToolTip = 'Specifies the statistics group.';
                    ApplicationArea = All;
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                    ToolTip = 'Specifies the payment terms code for this vendor record.';
                    ApplicationArea = All;
                }
                field(finChargeTermsCode; Rec."Fin. Charge Terms Code")
                {
                    Caption = 'Fin. Charge Terms Code';
                    ToolTip = 'Specifies the fin. charge terms code for this vendor record.';
                    ApplicationArea = All;
                }
                field(purchaserCode; Rec."Purchaser Code")
                {
                    Caption = 'Purchaser Code';
                    ToolTip = 'Specifies the purchaser code for this vendor record.';
                    ApplicationArea = All;
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                    ToolTip = 'Specifies the shipment method code for this vendor record.';
                    ApplicationArea = All;
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                    ToolTip = 'Specifies the shipping agent code for this vendor record.';
                    ApplicationArea = All;
                }
                field(invoiceDiscCode; Rec."Invoice Disc. Code")
                {
                    Caption = 'Invoice Disc. Code';
                    ToolTip = 'Specifies the invoice disc. code for this vendor record.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region code for this vendor record.';
                    ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the comment for this vendor record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the blocked for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToVendorNo; Rec."Pay-to Vendor No.")
                {
                    Caption = 'Pay-to Vendor No.';
                    ToolTip = 'Specifies the pay-to vendor no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(priority; Rec.Priority)
                {
                    Caption = 'Priority';
                    ToolTip = 'Specifies the priority for this vendor record.';
                    ApplicationArea = All;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    ToolTip = 'Specifies the payment method code for this vendor record.';
                    ApplicationArea = All;
                }
                field(formatRegion; Rec."Format Region")
                {
                    Caption = 'Format Region';
                    ToolTip = 'Specifies the format region for this vendor record.';
                    ApplicationArea = All;
                }
                field(firstTransactionDate; Rec."First Transaction Date")
                {
                    Caption = 'Vendor Since';
                    ToolTip = 'Specifies the date of the first transaction with the vendor.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this vendor record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date modified for this vendor record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this vendor record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Filter; Rec."Global Dimension 1 Filter")
                {
                    Caption = 'Global Dimension 1 Filter';
                    ToolTip = 'Specifies the global dimension 1 filter for this vendor record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Filter; Rec."Global Dimension 2 Filter")
                {
                    Caption = 'Global Dimension 2 Filter';
                    ToolTip = 'Specifies the global dimension 2 filter for this vendor record.';
                    ApplicationArea = All;
                }
                field(balance; Rec.Balance)
                {
                    Caption = 'Balance';
                    ToolTip = 'Specifies the balance for this vendor record.';
                    ApplicationArea = All;
                }
                field(netChange; Rec."Net Change")
                {
                    Caption = 'Net Change';
                    ToolTip = 'Specifies the net change for this vendor record.';
                    ApplicationArea = All;
                }
                field(balanceDue; Rec."Balance Due")
                {
                    Caption = 'Balance Due';
                    ToolTip = 'Specifies the balance due for this vendor record.';
                    ApplicationArea = All;
                }
                field(payments; Rec.Payments)
                {
                    Caption = 'Payments';
                    ToolTip = 'Specifies the payments for this vendor record.';
                    ApplicationArea = All;
                }
                field(invoiceAmounts; Rec."Invoice Amounts")
                {
                    Caption = 'Invoice Amounts';
                    ToolTip = 'Specifies the invoice amounts for this vendor record.';
                    ApplicationArea = All;
                }
                field(crMemoAmounts; Rec."Cr. Memo Amounts")
                {
                    Caption = 'Cr. Memo Amounts';
                    ToolTip = 'Specifies the cr. memo amounts for this vendor record.';
                    ApplicationArea = All;
                }
                field(financeChargeMemoAmounts; Rec."Finance Charge Memo Amounts")
                {
                    Caption = 'Finance Charge Memo Amounts';
                    ToolTip = 'Specifies the finance charge memo amounts for this vendor record.';
                    ApplicationArea = All;
                }
                field(outstandingOrders; Rec."Outstanding Orders")
                {
                    Caption = 'Outstanding Orders';
                    ToolTip = 'Specifies the outstanding orders for this vendor record.';
                    ApplicationArea = All;
                }
                field(amtRcdNotInvoiced; Rec."Amt. Rcd. Not Invoiced")
                {
                    Caption = 'Amt. Rcd. Not Invoiced';
                    ToolTip = 'Specifies the amt. rcd. not invoiced for this vendor record.';
                    ApplicationArea = All;
                }
                field(applicationMethod; Rec."Application Method")
                {
                    Caption = 'Application Method';
                    ToolTip = 'Specifies the application method for this vendor record.';
                    ApplicationArea = All;
                }
                field(pricesIncludingVat; Rec."Prices Including VAT")
                {
                    Caption = 'Prices Including VAT';
                    ToolTip = 'Specifies the prices including vat for this vendor record.';
                    ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the fax no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(telexAnswerBack; Rec."Telex Answer Back")
                {
                    Caption = 'Telex Answer Back';
                    ToolTip = 'Specifies the telex answer back for this vendor record.';
                    ApplicationArea = All;
                }
                field(vATRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                    ToolTip = 'Specifies the vat registration no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the gen. bus. posting group for this vendor record.';
                    ApplicationArea = All;
                }
                field(gLN; Rec.GLN)
                {
                    Caption = 'GLN';
                    ToolTip = 'Specifies the gln for this vendor record.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the post code for this vendor record.';
                    ApplicationArea = All;
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the county for this vendor record.';
                    ApplicationArea = All;
                }
                field(eORINumber; Rec."EORI Number")
                {
                    Caption = 'EORI Number';
                    ToolTip = 'Specifies the eori number for this vendor record.';
                    ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    Caption = 'Debit Amount';
                    ToolTip = 'Specifies the debit amount for this vendor record.';
                    ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    Caption = 'Credit Amount';
                    ToolTip = 'Specifies the credit amount for this vendor record.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the e-mail for this vendor record.';
                    ApplicationArea = All;
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Home Page';
                    ToolTip = 'Specifies the home page for this vendor record.';
                    ApplicationArea = All;
                }
                field(reminderAmounts; Rec."Reminder Amounts")
                {
                    Caption = 'Reminder Amounts';
                    ToolTip = 'Specifies the reminder amounts for this vendor record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this vendor record.';
                    ApplicationArea = All;
                }
                field(taxAreaCode; Rec."Tax Area Code")
                {
                    Caption = 'Tax Area Code';
                    ToolTip = 'Specifies the tax area code for this vendor record.';
                    ApplicationArea = All;
                }
                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';
                    ToolTip = 'Specifies the tax liable for this vendor record.';
                    ApplicationArea = All;
                }
                field(vATBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ToolTip = 'Specifies the vat bus. posting group for this vendor record.';
                    ApplicationArea = All;
                }
                field(currencyFilter; Rec."Currency Filter")
                {
                    Caption = 'Currency Filter';
                    ToolTip = 'Specifies the currency filter for this vendor record.';
                    ApplicationArea = All;
                }
                field(blockPaymentTolerance; Rec."Block Payment Tolerance")
                {
                    Caption = 'Block Payment Tolerance';
                    ToolTip = 'Specifies the block payment tolerance for this vendor record.';
                    ApplicationArea = All;
                }
                field(iCPartnerCode; Rec."IC Partner Code")
                {
                    Caption = 'IC Partner Code';
                    ToolTip = 'Specifies the ic partner code for this vendor record.';
                    ApplicationArea = All;
                }
                field(refunds; Rec.Refunds)
                {
                    Caption = 'Refunds';
                    ToolTip = 'Specifies the refunds for this vendor record.';
                    ApplicationArea = All;
                }
                field(otherAmounts; Rec."Other Amounts")
                {
                    Caption = 'Other Amounts';
                    ToolTip = 'Specifies the other amounts for this vendor record.';
                    ApplicationArea = All;
                }
                field(prepayment; Rec."Prepayment %")
                {
                    Caption = 'Prepayment %';
                    ToolTip = 'Specifies the prepayment % for this vendor record.';
                    ApplicationArea = All;
                }
                field(outstandingInvoices; Rec."Outstanding Invoices")
                {
                    Caption = 'Outstanding Invoices';
                    ToolTip = 'Specifies the outstanding invoices for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfArchivedDoc; Rec."Pay-to No. Of Archived Doc.")
                {
                    Caption = 'Pay-to No. Of Archived Doc.';
                    ToolTip = 'Specifies the pay-to no. of archived doc. for this vendor record.';
                    ApplicationArea = All;
                }
                field(buyFromNoOfArchivedDoc; Rec."Buy-from No. Of Archived Doc.")
                {
                    Caption = 'Buy-from No. Of Archived Doc.';
                    ToolTip = 'Specifies the buy-from no. of archived doc. for this vendor record.';
                    ApplicationArea = All;
                }
                field(partnerType; Rec."Partner Type")
                {
                    Caption = 'Partner Type';
                    ToolTip = 'Specifies the partner type for this vendor record.';
                    ApplicationArea = All;
                }
                field(intrastatPartnerType; Rec."Intrastat Partner Type")
                {
                    Caption = 'Intrastat Partner Type';
                    ToolTip = 'Specifies the intrastat partner type for this vendor record.';
                    ApplicationArea = All;
                }
                field(excludeFromPmtPractices; Rec."Exclude from Pmt. Practices")
                {
                    Caption = 'Exclude from Payment Practices';
                    ToolTip = 'Specifies the exclude from pmt. practices for this vendor record.';
                    ApplicationArea = All;
                }
                field(companySizeCode; Rec."Company Size Code")
                {
                    Caption = 'Company Size Code';
                    ToolTip = 'Specifies the company size code for this vendor record.';
                    ApplicationArea = All;
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                    ToolTip = 'Specifies the image for this vendor record.';
                    ApplicationArea = All;
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                    ToolTip = 'Specifies the privacy blocked for this vendor record.';
                    ApplicationArea = All;
                }
                field(disableSearchByName; Rec."Disable Search by Name")
                {
                    Caption = 'Disable Search by Name';
                    ToolTip = 'Specifies the disable search by name for this vendor record.';
                    ApplicationArea = All;
                }
                field(creditorNo; Rec."Creditor No.")
                {
                    Caption = 'Creditor No.';
                    ToolTip = 'Specifies the creditor no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(allowMultiplePostingGroups; Rec."Allow Multiple Posting Groups")
                {
                    Caption = 'Allow Multiple Posting Groups';
                    ToolTip = 'Specifies the allow multiple posting groups for this vendor record.';
                    ApplicationArea = All;
                }
                field(preferredBankAccountCode; Rec."Preferred Bank Account Code")
                {
                    Caption = 'Preferred Bank Account Code';
                    ToolTip = 'Specifies the preferred bank account code for this vendor record.';
                    ApplicationArea = All;
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dataverse';
                    ToolTip = 'Specifies the coupled to dataverse for this vendor record.';
                    ApplicationArea = All;
                }
                field(cashFlowPaymentTermsCode; Rec."Cash Flow Payment Terms Code")
                {
                    Caption = 'Cash Flow Payment Terms Code';
                    ToolTip = 'Specifies the cash flow payment terms code for this vendor record.';
                    ApplicationArea = All;
                }
                field(primaryContactNo; Rec."Primary Contact No.")
                {
                    Caption = 'Primary Contact No.';
                    ToolTip = 'Specifies the primary contact no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(mobilePhoneNo; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No.';
                    ToolTip = 'Specifies the mobile phone no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ToolTip = 'Specifies the responsibility center for this vendor record.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location code for this vendor record.';
                    ApplicationArea = All;
                }
                field(leadTimeCalculation; Rec."Lead Time Calculation")
                {
                    Caption = 'Lead Time Calculation';
                    ToolTip = 'Specifies the lead time calculation for this vendor record.';
                    ApplicationArea = All;
                }
                field(priceCalculationMethod; Rec."Price Calculation Method")
                {
                    Caption = 'Price Calculation Method';
                    ToolTip = 'Specifies the price calculation method for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfPstdReceipts; Rec."No. of Pstd. Receipts")
                {
                    Caption = 'No. of Pstd. Receipts';
                    ToolTip = 'Specifies the no. of pstd. receipts for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfPstdInvoices; Rec."No. of Pstd. Invoices")
                {
                    Caption = 'No. of Pstd. Invoices';
                    ToolTip = 'Specifies the no. of pstd. invoices for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfPstdReturnShipments; Rec."No. of Pstd. Return Shipments")
                {
                    Caption = 'No. of Pstd. Return Shipments';
                    ToolTip = 'Specifies the no. of pstd. return shipments for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfPstdCreditMemos; Rec."No. of Pstd. Credit Memos")
                {
                    Caption = 'No. of Pstd. Credit Memos';
                    ToolTip = 'Specifies the no. of pstd. credit memos for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfOrders; Rec."Pay-to No. of Orders")
                {
                    Caption = 'Pay-to No. of Orders';
                    ToolTip = 'Specifies the pay-to no. of orders for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfInvoices; Rec."Pay-to No. of Invoices")
                {
                    Caption = 'Pay-to No. of Invoices';
                    ToolTip = 'Specifies the pay-to no. of invoices for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfReturnOrders; Rec."Pay-to No. of Return Orders")
                {
                    Caption = 'Pay-to No. of Return Orders';
                    ToolTip = 'Specifies the pay-to no. of return orders for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfCreditMemos; Rec."Pay-to No. of Credit Memos")
                {
                    Caption = 'Pay-to No. of Credit Memos';
                    ToolTip = 'Specifies the pay-to no. of credit memos for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfPstdReceipts; Rec."Pay-to No. of Pstd. Receipts")
                {
                    Caption = 'Pay-to No. of Pstd. Receipts';
                    ToolTip = 'Specifies the pay-to no. of pstd. receipts for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfPstdInvoices; Rec."Pay-to No. of Pstd. Invoices")
                {
                    Caption = 'Pay-to No. of Pstd. Invoices';
                    ToolTip = 'Specifies the pay-to no. of pstd. invoices for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfPstdReturnS; Rec."Pay-to No. of Pstd. Return S.")
                {
                    Caption = 'Pay-to No. of Pstd. Return S.';
                    ToolTip = 'Specifies the pay-to no. of pstd. return s. for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfPstdCrMemos; Rec."Pay-to No. of Pstd. Cr. Memos")
                {
                    Caption = 'Pay-to No. of Pstd. Cr. Memos';
                    ToolTip = 'Specifies the pay-to no. of pstd. cr. memos for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfQuotes; Rec."No. of Quotes")
                {
                    Caption = 'No. of Quotes';
                    ToolTip = 'Specifies the no. of quotes for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfBlanketOrders; Rec."No. of Blanket Orders")
                {
                    Caption = 'No. of Blanket Orders';
                    ToolTip = 'Specifies the no. of blanket orders for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfOrders; Rec."No. of Orders")
                {
                    Caption = 'No. of Orders';
                    ToolTip = 'Specifies the no. of orders for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfInvoices; Rec."No. of Invoices")
                {
                    Caption = 'No. of Invoices';
                    ToolTip = 'Specifies the no. of invoices for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfReturnOrders; Rec."No. of Return Orders")
                {
                    Caption = 'No. of Return Orders';
                    ToolTip = 'Specifies the no. of return orders for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfCreditMemos; Rec."No. of Credit Memos")
                {
                    Caption = 'No. of Credit Memos';
                    ToolTip = 'Specifies the no. of credit memos for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfOrderAddresses; Rec."No. of Order Addresses")
                {
                    Caption = 'No. of Order Addresses';
                    ToolTip = 'Specifies the no. of order addresses for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfQuotes; Rec."Pay-to No. of Quotes")
                {
                    Caption = 'Pay-to No. of Quotes';
                    ToolTip = 'Specifies the pay-to no. of quotes for this vendor record.';
                    ApplicationArea = All;
                }
                field(payToNoOfBlanketOrders; Rec."Pay-to No. of Blanket Orders")
                {
                    Caption = 'Pay-to No. of Blanket Orders';
                    ToolTip = 'Specifies the pay-to no. of blanket orders for this vendor record.';
                    ApplicationArea = All;
                }
                field(noOfIncomingDocuments; Rec."No. of Incoming Documents")
                {
                    Caption = 'No. of Incoming Documents';
                    ToolTip = 'Specifies the no. of incoming documents for this vendor record.';
                    ApplicationArea = All;
                }
                field(baseCalendarCode; Rec."Base Calendar Code")
                {
                    Caption = 'Base Calendar Code';
                    ToolTip = 'Specifies the base calendar code for this vendor record.';
                    ApplicationArea = All;
                }
                field(documentSendingProfile; Rec."Document Sending Profile")
                {
                    Caption = 'Document Sending Profile';
                    ToolTip = 'Specifies the document sending profile for this vendor record.';
                    ApplicationArea = All;
                }
                field(validateEuVatRegNo; Rec."Validate EU Vat Reg. No.")
                {
                    Caption = 'Validate EU VAT Reg. No.';
                    ToolTip = 'Specifies the validate eu vat reg. no. for this vendor record.';
                    ApplicationArea = All;
                }
                field(currencyId; Rec."Currency Id")
                {
                    Caption = 'Currency Id';
                    ToolTip = 'Specifies the currency id for this vendor record.';
                    ApplicationArea = All;
                }
                field(paymentTermsId; Rec."Payment Terms Id")
                {
                    Caption = 'Payment Terms Id';
                    ToolTip = 'Specifies the payment terms id for this vendor record.';
                    ApplicationArea = All;
                }
                field(paymentMethodId; Rec."Payment Method Id")
                {
                    Caption = 'Payment Method Id';
                    ToolTip = 'Specifies the payment method id for this vendor record.';
                    ApplicationArea = All;
                }
                field(overReceiptCode; Rec."Over-Receipt Code")
                {
                    Caption = 'Over-Receipt Code';
                    ToolTip = 'Specifies the over-receipt code for this vendor record.';
                    ApplicationArea = All;
                }
                field(balanceLcy; Rec."Balance (LCY)")
                {
                    Caption = 'Balance (LCY)';
                    ToolTip = 'Specifies the total value of your completed purchases from the vendor in the current fiscal year. It is calculated from amounts including VAT on all completed purchase invoices and credit memos.';
                    ApplicationArea = All;
                }
                field(netChangeLcy; Rec."Net Change (LCY)")
                {
                    Caption = 'Net Change (LCY)';
                    ToolTip = 'Specifies the Net Change (LCY).';
                    ApplicationArea = All;
                }
                field(purchasesLcy; Rec."Purchases (LCY)")
                {
                    Caption = 'Purchases (LCY)';
                    ToolTip = 'Specifies the Purchases (LCY).';
                    ApplicationArea = All;
                }
                field(invDiscountsLcy; Rec."Inv. Discounts (LCY)")
                {
                    Caption = 'Inv. Discounts (LCY)';
                    ToolTip = 'Specifies the Inv. Discounts (LCY).';
                    ApplicationArea = All;
                }
                field(pmtDiscountsLcy; Rec."Pmt. Discounts (LCY)")
                {
                    Caption = 'Pmt. Discounts (LCY)';
                    ToolTip = 'Specifies the Pmt. Discounts (LCY).';
                    ApplicationArea = All;
                }
                field(balanceDueLcy; Rec."Balance Due (LCY)")
                {
                    Caption = 'Balance Due (LCY)';
                    ToolTip = 'Specifies the total value of your unpaid purchases from the vendor in the current fiscal year. It is calculated from amounts including VAT on all open purchase invoices and credit memos.';
                    ApplicationArea = All;
                }
                field(paymentsLcy; Rec."Payments (LCY)")
                {
                    Caption = 'Payments (LCY)';
                    ToolTip = 'Specifies the sum of payments paid to the vendor.';
                    ApplicationArea = All;
                }
                field(invAmountsLcy; Rec."Inv. Amounts (LCY)")
                {
                    Caption = 'Inv. Amounts (LCY)';
                    ToolTip = 'Specifies the Inv. Amounts (LCY).';
                    ApplicationArea = All;
                }
                field(crMemoAmountsLcy; Rec."Cr. Memo Amounts (LCY)")
                {
                    Caption = 'Cr. Memo Amounts (LCY)';
                    ToolTip = 'Specifies the Cr. Memo Amounts (LCY).';
                    ApplicationArea = All;
                }
                field(finChargeMemoAmountsLcy; Rec."Fin. Charge Memo Amounts (LCY)")
                {
                    Caption = 'Fin. Charge Memo Amounts (LCY)';
                    ToolTip = 'Specifies the Fin. Charge Memo Amounts (LCY).';
                    ApplicationArea = All;
                }
                field(debitAmountLcy; Rec."Debit Amount (LCY)")
                {
                    Caption = 'Debit Amount (LCY)';
                    ToolTip = 'Specifies the Debit Amount (LCY).';
                    ApplicationArea = All;
                }
                field(creditAmountLcy; Rec."Credit Amount (LCY)")
                {
                    Caption = 'Credit Amount (LCY)';
                    ToolTip = 'Specifies the Credit Amount (LCY).';
                    ApplicationArea = All;
                }
                field(reminderAmountsLcy; Rec."Reminder Amounts (LCY)")
                {
                    Caption = 'Reminder Amounts (LCY)';
                    ToolTip = 'Specifies the Reminder Amounts (LCY).';
                    ApplicationArea = All;
                }
                field(outstandingOrdersLcy; Rec."Outstanding Orders (LCY)")
                {
                    Caption = 'Outstanding Orders (LCY)';
                    ToolTip = 'Specifies the sum of outstanding orders (in LCY) to this vendor.';
                    ApplicationArea = All;
                }
                field(amtRcdNotInvoicedLcy; Rec."Amt. Rcd. Not Invoiced (LCY)")
                {
                    Caption = 'Amt. Rcd. Not Invoiced (LCY)';
                    ToolTip = 'Specifies the total invoice amount (in LCY) for the items you have received but not yet been invoiced for.';
                    ApplicationArea = All;
                }
                field(pmtDiscToleranceLcy; Rec."Pmt. Disc. Tolerance (LCY)")
                {
                    Caption = 'Pmt. Disc. Tolerance (LCY)';
                    ToolTip = 'Specifies the Pmt. Disc. Tolerance (LCY).';
                    ApplicationArea = All;
                }
                field(pmtToleranceLcy; Rec."Pmt. Tolerance (LCY)")
                {
                    Caption = 'Pmt. Tolerance (LCY)';
                    ToolTip = 'Specifies the Pmt. Tolerance (LCY).';
                    ApplicationArea = All;
                }
                field(refundsLcy; Rec."Refunds (LCY)")
                {
                    Caption = 'Refunds (LCY)';
                    ToolTip = 'Specifies the sum of refunds paid to the vendor.';
                    ApplicationArea = All;
                }
                field(otherAmountsLcy; Rec."Other Amounts (LCY)")
                {
                    Caption = 'Other Amounts (LCY)';
                    ToolTip = 'Specifies the Other Amounts (LCY).';
                    ApplicationArea = All;
                }
                field(outstandingInvoicesLcy; Rec."Outstanding Invoices (LCY)")
                {
                    Caption = 'Outstanding Invoices (LCY)';
                    ToolTip = 'Specifies the sum of the vendor''s outstanding purchase invoices in LCY.';
                    ApplicationArea = All;
                }
            }
        }
    }
}