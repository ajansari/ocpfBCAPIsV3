namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.Customer;

page 90842 "ocpfCustomers"
{
    PageType = API;
    Caption = 'Customers — master records for all entities to whom the company sells goods or services, including credit, payment, and posting settings.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfCustomer';
    EntitySetName = 'ocpfCustomers';
    SourceTable = Customer;
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
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies an alternate name that you can use to search for a customer.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies an additional part of the name.';
                    ApplicationArea = All;
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies additional address information.';
                    ApplicationArea = All;
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(contact; Rec.Contact)
                {
                    Caption = 'Contact';
                    ToolTip = 'Specifies the name of the person you regularly contact when you do business with this customer.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(telexNo; Rec."Telex No.")
                {
                    Caption = 'Telex No.';
                    ToolTip = 'Specifies the telex no. for this customer record.';
                    ApplicationArea = All;
                }
                field(documentSendingProfile; Rec."Document Sending Profile")
                {
                    Caption = 'Document Sending Profile';
                    ToolTip = 'Specifies the preferred method of sending documents to this customer, so that you do not have to select a sending option every time that you post and send a document to the customer. Sales documents t';
                    ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies the code for another shipment address than the customer';
                    ApplicationArea = All;
                }
                field(ourAccountNo; Rec."Our Account No.")
                {
                    Caption = 'Our Account No.';
                    ToolTip = 'Specifies the our account no. for this customer record.';
                    ApplicationArea = All;
                }
                field(territoryCode; Rec."Territory Code")
                {
                    Caption = 'Territory Code';
                    ToolTip = 'Specifies the territory code for this customer record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this customer record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this customer record.';
                    ApplicationArea = All;
                }
                field(chainName; Rec."Chain Name")
                {
                    Caption = 'Chain Name';
                    ToolTip = 'Specifies the chain name for this customer record.';
                    ApplicationArea = All;
                }
                field(budgetedAmount; Rec."Budgeted Amount")
                {
                    Caption = 'Budgeted Amount';
                    ToolTip = 'Specifies the Budgeted Amount.';
                    ApplicationArea = All;
                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the default currency for the customer.';
                    ApplicationArea = All;
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                    ToolTip = 'Specifies the customer price group code, which you can use to set up special sales prices in the Sales Prices window.';
                    ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                    ToolTip = 'Specifies the language that is used when translating specified text on documents to foreign business partner, such as an item description on an order confirmation.';
                    ApplicationArea = All;
                }
                field(registrationNumber; Rec."Registration Number")
                {
                    Caption = 'Registration No.';
                    ToolTip = 'Specifies the registration number of the customer. You can enter a maximum of 20 characters, both numbers and letters.';
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
                    ToolTip = 'Specifies a code that indicates the payment terms that you require of the customer.';
                    ApplicationArea = All;
                }
                field(finChargeTermsCode; Rec."Fin. Charge Terms Code")
                {
                    Caption = 'Fin. Charge Terms Code';
                    ToolTip = 'Specifies the code for the involved finance charges in case of late payment.';
                    ApplicationArea = All;
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                    ToolTip = 'Specifies a code for the salesperson who normally handles this customer';
                    ApplicationArea = All;
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                    ToolTip = 'Specifies which shipment method to use when you ship items to the customer.';
                    ApplicationArea = All;
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                    ToolTip = 'Specifies which shipping company is used when you ship items to the customer.';
                    ApplicationArea = All;
                }
                field(placeOfExport; Rec."Place of Export")
                {
                    Caption = 'Place of Export';
                    ToolTip = 'Specifies the place of export for this customer record.';
                    ApplicationArea = All;
                }
                field(invoiceDiscCode; Rec."Invoice Disc. Code")
                {
                    Caption = 'Invoice Disc. Code';
                    ToolTip = 'Specifies a code for the invoice discount terms that you have defined for the customer.';
                    ApplicationArea = All;
                }
                field(customerDiscGroup; Rec."Customer Disc. Group")
                {
                    Caption = 'Customer Disc. Group';
                    ToolTip = 'Specifies the customer discount group code, which you can use as a criterion to set up special discounts in the Sales Line Discounts window.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region of the address.';
                    ApplicationArea = All;
                }
                field(collectionMethod; Rec."Collection Method")
                {
                    Caption = 'Collection Method';
                    ToolTip = 'Specifies the collection method for this customer record.';
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the amount for this customer record.';
                    ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the comment for this customer record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies which transactions with the customer that cannot be processed, for example, because the customer is insolvent.';
                    ApplicationArea = All;
                }
                field(lastStatementNo; Rec."Last Statement No.")
                {
                    Caption = 'Last Statement No.';
                    ToolTip = 'Specifies the number of the last statement that was printed for this customer.';
                    ApplicationArea = All;
                }
                field(printStatements; Rec."Print Statements")
                {
                    Caption = 'Print Statements';
                    ToolTip = 'Specifies whether to include this customer when you print the Statement report.';
                    ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Specifies a different customer who will be invoiced for products that you sell to the customer in the Name field on the customer card.';
                    ApplicationArea = All;
                }
                field(priority; Rec.Priority)
                {
                    Caption = 'Priority';
                    ToolTip = 'Specifies a number that corresponds to the priority you give the customer. The higher the number, the higher the priority.';
                    ApplicationArea = All;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    ToolTip = 'Specifies how the customer usually submits payment, such as bank transfer or check.';
                    ApplicationArea = All;
                }
                field(formatRegion; Rec."Format Region")
                {
                    Caption = 'Format Region';
                    ToolTip = 'Specifies the Format Region to be used on printouts for this customer.';
                    ApplicationArea = All;
                }
                field(firstTransactionDate; Rec."First Transaction Date")
                {
                    Caption = 'Customer Since';
                    ToolTip = 'Specifies the date of the first transaction with the customer.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this customer record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies when the customer card was last modified.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this customer record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Filter; Rec."Global Dimension 1 Filter")
                {
                    Caption = 'Global Dimension 1 Filter';
                    ToolTip = 'Specifies the global dimension 1 filter for this customer record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Filter; Rec."Global Dimension 2 Filter")
                {
                    Caption = 'Global Dimension 2 Filter';
                    ToolTip = 'Specifies the global dimension 2 filter for this customer record.';
                    ApplicationArea = All;
                }
                field(balance; Rec.Balance)
                {
                    Caption = 'Balance';
                    ToolTip = 'Specifies the Balance.';
                    ApplicationArea = All;
                }
                field(netChange; Rec."Net Change")
                {
                    Caption = 'Net Change';
                    ToolTip = 'Specifies the Net Change.';
                    ApplicationArea = All;
                }
                field(balanceDue; Rec."Balance Due")
                {
                    Caption = 'Balance Due';
                    ToolTip = 'Specifies the sum of outstanding payments from the customer.';
                    ApplicationArea = All;
                }
                field(payments; Rec.Payments)
                {
                    Caption = 'Payments';
                    ToolTip = 'Specifies the payments for this customer record.';
                    ApplicationArea = All;
                }
                field(invoiceAmounts; Rec."Invoice Amounts")
                {
                    Caption = 'Invoice Amounts';
                    ToolTip = 'Specifies the invoice amounts for this customer record.';
                    ApplicationArea = All;
                }
                field(crMemoAmounts; Rec."Cr. Memo Amounts")
                {
                    Caption = 'Cr. Memo Amounts';
                    ToolTip = 'Specifies the cr. memo amounts for this customer record.';
                    ApplicationArea = All;
                }
                field(financeChargeMemoAmounts; Rec."Finance Charge Memo Amounts")
                {
                    Caption = 'Finance Charge Memo Amounts';
                    ToolTip = 'Specifies the Finance Charge Memo Amounts.';
                    ApplicationArea = All;
                }
                field(outstandingOrders; Rec."Outstanding Orders")
                {
                    Caption = 'Outstanding Orders';
                    ToolTip = 'Specifies the outstanding orders for this customer record.';
                    ApplicationArea = All;
                }
                field(shippedNotInvoiced; Rec."Shipped Not Invoiced")
                {
                    Caption = 'Shipped Not Invoiced';
                    ToolTip = 'Specifies the shipped not invoiced for this customer record.';
                    ApplicationArea = All;
                }
                field(applicationMethod; Rec."Application Method")
                {
                    Caption = 'Application Method';
                    ToolTip = 'Specifies how to apply payments to entries for this customer.';
                    ApplicationArea = All;
                }
                field(pricesIncludingVat; Rec."Prices Including VAT")
                {
                    Caption = 'Prices Including VAT';
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies from which location sales to this customer will be processed by default.';
                    ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(telexAnswerBack; Rec."Telex Answer Back")
                {
                    Caption = 'Telex Answer Back';
                    ToolTip = 'Specifies the telex answer back for this customer record.';
                    ApplicationArea = All;
                }
                field(vATRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(combineShipments; Rec."Combine Shipments")
                {
                    Caption = 'Combine Sales Shipments';
                    ToolTip = 'Specifies if several orders delivered to the customer can appear on the same sales invoice.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(gLN; Rec.GLN)
                {
                    Caption = 'GLN';
                    ToolTip = 'Specifies the customer in connection with electronic document sending.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the post code.';
                    ApplicationArea = All;
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the state, province or county as a part of the address.';
                    ApplicationArea = All;
                }
                field(eORINumber; Rec."EORI Number")
                {
                    Caption = 'EORI Number';
                    ToolTip = 'Specifies the Economic Operators Registration and Identification number that is used when you exchange information with the customs authorities due to trade into or out of the European Union.';
                    ApplicationArea = All;
                }
                field(useGlnInElectronicDocument; Rec."Use GLN in Electronic Document")
                {
                    Caption = 'Use GLN in Electronic Documents';
                    ToolTip = 'Specifies whether the GLN is used in electronic documents as a party identification number.';
                    ApplicationArea = All;
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    Caption = 'Debit Amount';
                    ToolTip = 'Specifies the debit amount for this customer record.';
                    ApplicationArea = All;
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    Caption = 'Credit Amount';
                    ToolTip = 'Specifies the credit amount for this customer record.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Home Page';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(reminderTermsCode; Rec."Reminder Terms Code")
                {
                    Caption = 'Reminder Terms Code';
                    ToolTip = 'Specifies how reminders about late payments are handled for this customer.';
                    ApplicationArea = All;
                }
                field(reminderAmounts; Rec."Reminder Amounts")
                {
                    Caption = 'Reminder Amounts';
                    ToolTip = 'Specifies the reminder amounts for this customer record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this customer record.';
                    ApplicationArea = All;
                }
                field(taxAreaCode; Rec."Tax Area Code")
                {
                    Caption = 'Tax Area Code';
                    ToolTip = 'Specifies the tax area that is used to calculate and post sales tax.';
                    ApplicationArea = All;
                }
                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';
                    ToolTip = 'Specifies if the customer or vendor is liable for sales tax.';
                    ApplicationArea = All;
                }
                field(vATBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(currencyFilter; Rec."Currency Filter")
                {
                    Caption = 'Currency Filter';
                    ToolTip = 'Specifies the Currency Filter.';
                    ApplicationArea = All;
                }
                field(reserve; Rec.Reserve)
                {
                    Caption = 'Reserve';
                    ToolTip = 'Specifies whether items will never, automatically (Always), or optionally be reserved for this customer. Optional means that you must manually reserve items for this customer.';
                    ApplicationArea = All;
                }
                field(blockPaymentTolerance; Rec."Block Payment Tolerance")
                {
                    Caption = 'Block Payment Tolerance';
                    ToolTip = 'Specifies that the customer is not allowed a payment tolerance.';
                    ApplicationArea = All;
                }
                field(iCPartnerCode; Rec."IC Partner Code")
                {
                    Caption = 'IC Partner Code';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(refunds; Rec.Refunds)
                {
                    Caption = 'Refunds';
                    ToolTip = 'Specifies the Refunds.';
                    ApplicationArea = All;
                }
                field(otherAmounts; Rec."Other Amounts")
                {
                    Caption = 'Other Amounts';
                    ToolTip = 'Specifies the other amounts for this customer record.';
                    ApplicationArea = All;
                }
                field(prepayment; Rec."Prepayment %")
                {
                    Caption = 'Prepayment %';
                    ToolTip = 'Specifies a prepayment percentage that applies to all orders for this customer, regardless of the items or services on the order lines.';
                    ApplicationArea = All;
                }
                field(outstandingInvoices; Rec."Outstanding Invoices")
                {
                    Caption = 'Outstanding Invoices';
                    ToolTip = 'Specifies the outstanding invoices for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfArchivedDoc; Rec."Bill-to No. Of Archived Doc.")
                {
                    Caption = 'Bill-to No. Of Sales Archived Doc.';
                    ToolTip = 'Specifies the bill-to no. of archived doc. for this customer record.';
                    ApplicationArea = All;
                }
                field(sellToNoOfArchivedDoc; Rec."Sell-to No. Of Archived Doc.")
                {
                    Caption = 'Sell-to No. Of Sales Archived Doc.';
                    ToolTip = 'Specifies the sell-to no. of archived doc. for this customer record.';
                    ApplicationArea = All;
                }
                field(partnerType; Rec."Partner Type")
                {
                    Caption = 'Partner Type';
                    ToolTip = 'Specifies for direct debit collections if the customer that the payment is collected from is a person or a company.';
                    ApplicationArea = All;
                }
                field(intrastatPartnerType; Rec."Intrastat Partner Type")
                {
                    Caption = 'Intrastat Partner Type';
                    ToolTip = 'Specifies for Intrastat reporting if the customer is a person or a company.';
                    ApplicationArea = All;
                }
                field(excludeFromPmtPractices; Rec."Exclude from Pmt. Practices")
                {
                    Caption = 'Exclude from Payment Practices';
                    ToolTip = 'Specifies that the customer must be excluded from Payment Practices calculations.';
                    ApplicationArea = All;
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                    ToolTip = 'Specifies the picture of the customer, for example, a logo.';
                    ApplicationArea = All;
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                    ApplicationArea = All;
                }
                field(disableSearchByName; Rec."Disable Search by Name")
                {
                    Caption = 'Disable Search by Name';
                    ToolTip = 'Specifies that you can change the customer name on open sales documents. The change applies only to the documents.';
                    ApplicationArea = All;
                }
                field(allowMultiplePostingGroups; Rec."Allow Multiple Posting Groups")
                {
                    Caption = 'Allow Multiple Posting Groups';
                    ToolTip = 'Specifies if multiple posting groups can be used for posting business transactions for this customer.';
                    ApplicationArea = All;
                }
                field(preferredBankAccountCode; Rec."Preferred Bank Account Code")
                {
                    Caption = 'Preferred Bank Account Code';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dataverse';
                    ToolTip = 'Specifies that the customer is coupled to an account in Dataverse.';
                    ApplicationArea = All;
                }
                field(cashFlowPaymentTermsCode; Rec."Cash Flow Payment Terms Code")
                {
                    Caption = 'Cash Flow Payment Terms Code';
                    ToolTip = 'Specifies a payment term that will be used to calculate cash flow for the customer.';
                    ApplicationArea = All;
                }
                field(primaryContactNo; Rec."Primary Contact No.")
                {
                    Caption = 'Primary Contact No.';
                    ToolTip = 'Specifies the contact number for the customer.';
                    ApplicationArea = All;
                }
                field(contactType; Rec."Contact Type")
                {
                    Caption = 'Contact Type';
                    ToolTip = 'Specifies the contact type for this customer record.';
                    ApplicationArea = All;
                }
                field(mobilePhoneNo; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No.';
                    ToolTip = 'Specifies the customer';
                    ApplicationArea = All;
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ToolTip = 'Specifies the code for the responsibility center that will administer this customer by default.';
                    ApplicationArea = All;
                }
                field(shippingAdvice; Rec."Shipping Advice")
                {
                    Caption = 'Shipping Advice';
                    ToolTip = 'Specifies if the customer accepts partial shipment of orders.';
                    ApplicationArea = All;
                }
                field(shippingTime; Rec."Shipping Time")
                {
                    Caption = 'Shipping Time';
                    ToolTip = 'Specifies how long it takes from when the items are shipped from the warehouse to when they are delivered.';
                    ApplicationArea = All;
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                    ToolTip = 'Specifies the code for the shipping agent service to use for this customer.';
                    ApplicationArea = All;
                }
                field(priceCalculationMethod; Rec."Price Calculation Method")
                {
                    Caption = 'Price Calculation Method';
                    ToolTip = 'Specifies the default price calculation method.';
                    ApplicationArea = All;
                }
                field(allowLineDisc; Rec."Allow Line Disc.")
                {
                    Caption = 'Allow Line Disc.';
                    ToolTip = 'Specifies if a sales line discount is calculated when a special sales price is offered according to setup in the Sales Prices window.';
                    ApplicationArea = All;
                }
                field(noOfQuotes; Rec."No. of Quotes")
                {
                    Caption = 'No. of Quotes';
                    ToolTip = 'Specifies the no. of quotes for this customer record.';
                    ApplicationArea = All;
                }
                field(noOfBlanketOrders; Rec."No. of Blanket Orders")
                {
                    Caption = 'No. of Blanket Orders';
                    ToolTip = 'Specifies the no. of blanket orders for this customer record.';
                    ApplicationArea = All;
                }
                field(noOfOrders; Rec."No. of Orders")
                {
                    Caption = 'No. of Orders';
                    ToolTip = 'Specifies the no. of orders for this customer record.';
                    ApplicationArea = All;
                }
                field(noOfInvoices; Rec."No. of Invoices")
                {
                    Caption = 'No. of Invoices';
                    ToolTip = 'Specifies the no. of invoices for this customer record.';
                    ApplicationArea = All;
                }
                field(noOfReturnOrders; Rec."No. of Return Orders")
                {
                    Caption = 'No. of Return Orders';
                    ToolTip = 'Specifies the no. of return orders for this customer record.';
                    ApplicationArea = All;
                }
                field(noOfCreditMemos; Rec."No. of Credit Memos")
                {
                    Caption = 'No. of Credit Memos';
                    ToolTip = 'Specifies the no. of credit memos for this customer record.';
                    ApplicationArea = All;
                }
                field(noOfPstdShipments; Rec."No. of Pstd. Shipments")
                {
                    Caption = 'No. of Pstd. Shipments';
                    ToolTip = 'Specifies the no. of pstd. shipments for this customer record.';
                    ApplicationArea = All;
                }
                field(noOfPstdInvoices; Rec."No. of Pstd. Invoices")
                {
                    Caption = 'No. of Pstd. Invoices';
                    ToolTip = 'Specifies the no. of pstd. invoices for this customer record.';
                    ApplicationArea = All;
                }
                field(noOfPstdReturnReceipts; Rec."No. of Pstd. Return Receipts")
                {
                    Caption = 'No. of Pstd. Return Receipts';
                    ToolTip = 'Specifies the no. of pstd. return receipts for this customer record.';
                    ApplicationArea = All;
                }
                field(noOfPstdCreditMemos; Rec."No. of Pstd. Credit Memos")
                {
                    Caption = 'No. of Pstd. Credit Memos';
                    ToolTip = 'Specifies the no. of pstd. credit memos for this customer record.';
                    ApplicationArea = All;
                }
                field(noOfShipToAddresses; Rec."No. of Ship-to Addresses")
                {
                    Caption = 'No. of Ship-to Addresses';
                    ToolTip = 'Specifies the no. of ship-to addresses for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfQuotes; Rec."Bill-To No. of Quotes")
                {
                    Caption = 'Bill-To No. of Quotes';
                    ToolTip = 'Specifies the bill-to no. of quotes for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfBlanketOrders; Rec."Bill-To No. of Blanket Orders")
                {
                    Caption = 'Bill-To No. of Blanket Orders';
                    ToolTip = 'Specifies the bill-to no. of blanket orders for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfOrders; Rec."Bill-To No. of Orders")
                {
                    Caption = 'Bill-To No. of Orders';
                    ToolTip = 'Specifies the bill-to no. of orders for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfInvoices; Rec."Bill-To No. of Invoices")
                {
                    Caption = 'Bill-To No. of Invoices';
                    ToolTip = 'Specifies the bill-to no. of invoices for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfReturnOrders; Rec."Bill-To No. of Return Orders")
                {
                    Caption = 'Bill-To No. of Return Orders';
                    ToolTip = 'Specifies the bill-to no. of return orders for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfCreditMemos; Rec."Bill-To No. of Credit Memos")
                {
                    Caption = 'Bill-To No. of Credit Memos';
                    ToolTip = 'Specifies the bill-to no. of credit memos for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfPstdShipments; Rec."Bill-To No. of Pstd. Shipments")
                {
                    Caption = 'Bill-To No. of Pstd. Shipments';
                    ToolTip = 'Specifies the bill-to no. of pstd. shipments for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfPstdInvoices; Rec."Bill-To No. of Pstd. Invoices")
                {
                    Caption = 'Bill-To No. of Pstd. Invoices';
                    ToolTip = 'Specifies the bill-to no. of pstd. invoices for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfPstdReturnR; Rec."Bill-To No. of Pstd. Return R.")
                {
                    Caption = 'Bill-To No. of Pstd. Return R.';
                    ToolTip = 'Specifies the bill-to no. of pstd. return r. for this customer record.';
                    ApplicationArea = All;
                }
                field(billToNoOfPstdCrMemos; Rec."Bill-To No. of Pstd. Cr. Memos")
                {
                    Caption = 'Bill-To No. of Pstd. Cr. Memos';
                    ToolTip = 'Specifies the bill-to no. of pstd. cr. memos for this customer record.';
                    ApplicationArea = All;
                }
                field(baseCalendarCode; Rec."Base Calendar Code")
                {
                    Caption = 'Base Calendar Code';
                    ToolTip = 'Specifies a customizable calendar for shipment planning that holds the customer';
                    ApplicationArea = All;
                }
                field(copySellToAddrToQteFrom; Rec."Copy Sell-to Addr. to Qte From")
                {
                    Caption = 'Copy Sell-to Addr. to Qte From';
                    ToolTip = 'Specifies which customer address is inserted on sales quotes that you create for the customer.';
                    ApplicationArea = All;
                }
                field(validateEuVatRegNo; Rec."Validate EU Vat Reg. No.")
                {
                    Caption = 'Validate EU VAT Reg. No.';
                    ToolTip = 'Specifies the validate eu vat reg. no. for this customer record.';
                    ApplicationArea = All;
                }
                field(currencyId; Rec."Currency Id")
                {
                    Caption = 'Currency Id';
                    ToolTip = 'Specifies the currency id for this customer record.';
                    ApplicationArea = All;
                }
                field(paymentTermsId; Rec."Payment Terms Id")
                {
                    Caption = 'Payment Terms Id';
                    ToolTip = 'Specifies the payment terms id for this customer record.';
                    ApplicationArea = All;
                }
                field(shipmentMethodId; Rec."Shipment Method Id")
                {
                    Caption = 'Shipment Method Id';
                    ToolTip = 'Specifies the shipment method id for this customer record.';
                    ApplicationArea = All;
                }
                field(paymentMethodId; Rec."Payment Method Id")
                {
                    Caption = 'Payment Method Id';
                    ToolTip = 'Specifies the payment method id for this customer record.';
                    ApplicationArea = All;
                }
                field(taxAreaId; Rec."Tax Area ID")
                {
                    Caption = 'Tax Area ID';
                    ToolTip = 'Specifies the tax area id for this customer record.';
                    ApplicationArea = All;
                }
                field(contactId; Rec."Contact ID")
                {
                    Caption = 'Contact ID';
                    ToolTip = 'Specifies the contact id for this customer record.';
                    ApplicationArea = All;
                }
                field(contactGraphId; Rec."Contact Graph Id")
                {
                    Caption = 'Contact Graph Id';
                    ToolTip = 'Specifies the contact graph id for this customer record.';
                    ApplicationArea = All;
                }
                field(creditLimitLcy; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit (LCY)';
                    ToolTip = 'Specifies the maximum amount of credit that you extend to the customer for their purchases before you issue warnings. The value 0 represents unlimited credit.';
                    ApplicationArea = All;
                }
                field(balanceLcy; Rec."Balance (LCY)")
                {
                    Caption = 'Balance (LCY)';
                    ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';
                    ApplicationArea = All;
                }
                field(netChangeLcy; Rec."Net Change (LCY)")
                {
                    Caption = 'Net Change (LCY)';
                    ToolTip = 'Specifies the Net Change (LCY).';
                    ApplicationArea = All;
                }
                field(salesLcy; Rec."Sales (LCY)")
                {
                    Caption = 'Sales (LCY)';
                    ToolTip = 'Specifies the sales, in local currency.';
                    ApplicationArea = All;
                }
                field(profitLcy; Rec."Profit (LCY)")
                {
                    Caption = 'Profit (LCY)';
                    ToolTip = 'Specifies the profit, in local currency.';
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
                    Caption = 'Overdue Balance (LCY)';
                    ToolTip = 'Specifies payments from the customer that are overdue per today''s date.';
                    ApplicationArea = All;
                }
                field(paymentsLcy; Rec."Payments (LCY)")
                {
                    Caption = 'Payments (LCY)';
                    ToolTip = 'Specifies the sum of payments received from the customer in the current fiscal year. Current fiscal year is determined by the system date. The value shown here is calculated asynchronously so there might be a delay in updating this field.';
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
                    ToolTip = 'Specifies your expected sales income from the customer in LCY based on ongoing sales orders.';
                    ApplicationArea = All;
                }
                field(shippedNotInvoicedLcy; Rec."Shipped Not Invoiced (LCY)")
                {
                    Caption = 'Shipped Not Invoiced (LCY)';
                    ToolTip = 'Specifies your expected sales income from the customer in LCY based on ongoing sales orders where items have been shipped.';
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
                    ToolTip = 'Specifies the sum of refunds received from the customer.';
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
                    ToolTip = 'Specifies your expected sales income from the customer in LCY based on unpaid sales invoices.';
                    ApplicationArea = All;
                }
            }
        }
    }
}