namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Document;

page 90985 "ocpfServiceHeaders"
{
    PageType = API;
    Caption = 'Service Documents — open service quotes, orders, invoices, and credit memos with customer, status, and response details.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceHeader';
    EntitySetName = 'ocpfServiceHeaders';
    SourceTable = "Service Header";
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
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies the type of the service document on the line.';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the number of the customer who owns the items in the service document.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
                    ApplicationArea = All;
                }
                field(billToName; Rec."Bill-to Name")
                {
                    Caption = 'Bill-to Name';
                    ToolTip = 'Specifies the name of the customer that you send or sent the invoice or credit memo to.';
                    ApplicationArea = All;
                }
                field(billToName2; Rec."Bill-to Name 2")
                {
                    Caption = 'Bill-to Name 2';
                    ToolTip = 'Specifies an additional part of the name of the customer that you send or sent the invoice or credit memo to.';
                    ApplicationArea = All;
                }
                field(billToAddress; Rec."Bill-to Address")
                {
                    Caption = 'Bill-to Address';
                    ToolTip = 'Specifies the address of the customer to whom you will send the invoice.';
                    ApplicationArea = All;
                }
                field(billToAddress2; Rec."Bill-to Address 2")
                {
                    Caption = 'Bill-to Address 2';
                    ToolTip = 'Specifies an additional line of the address.';
                    ApplicationArea = All;
                }
                field(billToCity; Rec."Bill-to City")
                {
                    Caption = 'Bill-to City';
                    ToolTip = 'Specifies the city of the address.';
                    ApplicationArea = All;
                }
                field(billToContact; Rec."Bill-to Contact")
                {
                    Caption = 'Bill-to Contact';
                    ToolTip = 'Specifies the name of the contact person at the customer''s billing address.';
                    ApplicationArea = All;
                }
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'Your Reference';
                    ToolTip = 'Specifies a customer reference, which will be used when printing service documents.';
                    ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    ApplicationArea = All;
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                    ToolTip = 'Specifies the name of the customer at the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToName2; Rec."Ship-to Name 2")
                {
                    Caption = 'Ship-to Name 2';
                    ToolTip = 'Specifies an additional part of thethe name of the customer at the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToAddress; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address';
                    ToolTip = 'Specifies the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToAddress2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address 2';
                    ToolTip = 'Specifies an additional part of the ship-to address, in case it is a long address.';
                    ApplicationArea = All;
                }
                field(shipToCity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';
                    ToolTip = 'Specifies the city of the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                    Caption = 'Ship-to Contact';
                    ToolTip = 'Specifies the name of the contact person at the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(orderDate; Rec."Order Date")
                {
                    Caption = 'Order Date';
                    ToolTip = 'Specifies the date when the order was created.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the date when the service document should be posted.';
                    ApplicationArea = All;
                }
                field(postingDescription; Rec."Posting Description")
                {
                    Caption = 'Posting Description';
                    ToolTip = 'Specifies the Posting Description.';
                    ApplicationArea = All;
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Specifies when the related invoice must be paid.';
                    ApplicationArea = All;
                }
                field(paymentDiscountPct; Rec."Payment Discount %")
                {
                    Caption = 'Payment Discount %';
                    ToolTip = 'Specifies the percentage of payment discount given, if the customer pays by the date entered in the Pmt. Discount Date field.';
                    ApplicationArea = All;
                }
                field(pmtDiscountDate; Rec."Pmt. Discount Date")
                {
                    Caption = 'Pmt. Discount Date';
                    ToolTip = 'Specifies the date on which the amount in the entry must be paid for a payment discount to be granted.';
                    ApplicationArea = All;
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                    ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the code of the location (for example, warehouse or distribution center) of the items specified on the service item lines.';
                    ApplicationArea = All;
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for various amounts on the service lines.';
                    ApplicationArea = All;
                }
                field(currencyFactor; Rec."Currency Factor")
                {
                    Caption = 'Currency Factor';
                    ToolTip = 'Specifies the Currency Factor.';
                    ApplicationArea = All;
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                    ToolTip = 'Specifies the Customer Price Group.';
                    ApplicationArea = All;
                }
                field(pricesIncludingVat; Rec."Prices Including VAT")
                {
                    Caption = 'Prices Including VAT';
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
                    ApplicationArea = All;
                }
                field(invoiceDiscCode; Rec."Invoice Disc. Code")
                {
                    Caption = 'Invoice Disc. Code';
                    ToolTip = 'Specifies the Invoice Disc. Code.';
                    ApplicationArea = All;
                }
                field(customerDiscGroup; Rec."Customer Disc. Group")
                {
                    Caption = 'Customer Disc. Group';
                    ToolTip = 'Specifies the Customer Disc. Group.';
                    ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                    ToolTip = 'Specifies the Language Code.';
                    ApplicationArea = All;
                }
                field(formatRegion; Rec."Format Region")
                {
                    Caption = 'Format Region';
                    ToolTip = 'Specifies the Format Region.';
                    ApplicationArea = All;
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                    ToolTip = 'Specifies the code of the salesperson assigned to this service document.';
                    ApplicationArea = All;
                }
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
                    ApplicationArea = All;
                }
                field(noPrinted; Rec."No. Printed")
                {
                    Caption = 'No. Printed';
                    ToolTip = 'Specifies the No. Printed.';
                    ApplicationArea = All;
                }
                field(appliesToDocType; Rec."Applies-to Doc. Type")
                {
                    Caption = 'Applies-to Doc. Type';
                    ToolTip = 'Specifies the type of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
                    ApplicationArea = All;
                }
                field(appliesToDocNo; Rec."Applies-to Doc. No.")
                {
                    Caption = 'Applies-to Doc. No.';
                    ToolTip = 'Specifies the number of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
                    ApplicationArea = All;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                    ToolTip = 'Specifies the Bal. Account No..';
                    ApplicationArea = All;
                }
                field(amount; Rec."Amount")
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the sum of amounts on all the lines in the document.';
                    ApplicationArea = All;
                }
                field(amountIncludingVat; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including VAT';
                    ToolTip = 'Specifies the sum of amounts, including VAT, on all the lines in the document.';
                    ApplicationArea = All;
                }
                field(shippingNo; Rec."Shipping No.")
                {
                    Caption = 'Shipping No.';
                    ToolTip = 'Specifies the Shipping No..';
                    ApplicationArea = All;
                }
                field(postingNo; Rec."Posting No.")
                {
                    Caption = 'Posting No.';
                    ToolTip = 'Specifies the Posting No..';
                    ApplicationArea = All;
                }
                field(lastShippingNo; Rec."Last Shipping No.")
                {
                    Caption = 'Last Shipping No.';
                    ToolTip = 'Specifies the Last Shipping No..';
                    ApplicationArea = All;
                }
                field(lastPostingNo; Rec."Last Posting No.")
                {
                    Caption = 'Last Posting No.';
                    ToolTip = 'Specifies the Last Posting No..';
                    ApplicationArea = All;
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                    ToolTip = 'Specifies the VAT Registration No..';
                    ApplicationArea = All;
                }
                field(combineShipments; Rec."Combine Shipments")
                {
                    Caption = 'Combine Shipments';
                    ToolTip = 'Specifies whether the order will be included when you use the Combine Shipments function.';
                    ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                    ToolTip = 'Specifies the Reason Code.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the Gen. Bus. Posting Group.';
                    ApplicationArea = All;
                }
                field(eu3PartyTrade; Rec."EU 3-Party Trade")
                {
                    Caption = 'EU 3-Party Trade';
                    ToolTip = 'Specifies if the transaction is related to trade with a third party within the EU.';
                    ApplicationArea = All;
                }
                field(transactionType; Rec."Transaction Type")
                {
                    Caption = 'Transaction Type';
                    ToolTip = 'Specifies the type of transaction that the document represents, for the purpose of reporting to INTRASTAT.';
                    ApplicationArea = All;
                }
                field(transportMethod; Rec."Transport Method")
                {
                    Caption = 'Transport Method';
                    ToolTip = 'Specifies the transport method, for the purpose of reporting to INTRASTAT.';
                    ApplicationArea = All;
                }
                field(vatCountryRegionCode; Rec."VAT Country/Region Code")
                {
                    Caption = 'VAT Country/Region Code';
                    ToolTip = 'Specifies the VAT Country/Region Code.';
                    ApplicationArea = All;
                }
                field(name; Rec."Name")
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name of the customer to whom the items on the document will be shipped.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies an additional part of the name of the customer to whom the items on the document will be shipped.';
                    ApplicationArea = All;
                }
                field(address; Rec."Address")
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the address of the customer to whom the service will be shipped.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies additional address information.';
                    ApplicationArea = All;
                }
                field(city; Rec."City")
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city of the address.';
                    ApplicationArea = All;
                }
                field(contactName; Rec."Contact Name")
                {
                    Caption = 'Contact Name';
                    ToolTip = 'Specifies the name of the contact who will receive the service.';
                    ApplicationArea = All;
                }
                field(billToPostCode; Rec."Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code';
                    ToolTip = 'Specifies the postal code of the customer''s billing address.';
                    ApplicationArea = All;
                }
                field(billToCounty; Rec."Bill-to County")
                {
                    Caption = 'Bill-to County';
                    ToolTip = 'Specifies the county in the customer''s address.';
                    ApplicationArea = All;
                }
                field(billToCountryRegionCode; Rec."Bill-to Country/Region Code")
                {
                    Caption = 'Bill-to Country/Region Code';
                    ToolTip = 'Specifies the country/region in the customer''s address.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the postal code.';
                    ApplicationArea = All;
                }
                field(county; Rec."County")
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the county in the customer''s address.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region of the address.';
                    ApplicationArea = All;
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                    ToolTip = 'Specifies the postal code of the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToCounty; Rec."Ship-to County")
                {
                    Caption = 'Ship-to County';
                    ToolTip = 'Specifies the county in the customer''s address.';
                    ApplicationArea = All;
                }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';
                    ToolTip = 'Specifies the country/region in the customer''s address.';
                    ApplicationArea = All;
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                    ToolTip = 'Specifies the Bal. Account Type.';
                    ApplicationArea = All;
                }
                field(exitPoint; Rec."Exit Point")
                {
                    Caption = 'Exit Point';
                    ToolTip = 'Specifies the point of exit through which you ship the items out of your country/region, for reporting to Intrastat.';
                    ApplicationArea = All;
                }
                field(correction; Rec."Correction")
                {
                    Caption = 'Correction';
                    ToolTip = 'Specifies the Correction.';
                    ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                    ToolTip = 'Specifies the date when the related document was created.';
                    ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                    ApplicationArea = All;
                }
                field("area"; Rec."Area")
                {
                    Caption = 'Area';
                    ToolTip = 'Specifies the area of the customer or vendor, for the purpose of reporting to INTRASTAT.';
                    ApplicationArea = All;
                }
                field(transactionSpecification; Rec."Transaction Specification")
                {
                    Caption = 'Transaction Specification';
                    ToolTip = 'Specifies a specification of the document''s transaction, for the purpose of reporting to INTRASTAT.';
                    ApplicationArea = All;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                    ApplicationArea = All;
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                    ToolTip = 'Specifies the code for the shipping agent who is transporting the items.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the No. Series.';
                    ApplicationArea = All;
                }
                field(postingNoSeries; Rec."Posting No. Series")
                {
                    Caption = 'Posting No. Series';
                    ToolTip = 'Specifies the Posting No. Series.';
                    ApplicationArea = All;
                }
                field(shippingNoSeries; Rec."Shipping No. Series")
                {
                    Caption = 'Shipping No. Series';
                    ToolTip = 'Specifies the Shipping No. Series.';
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
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                    ApplicationArea = All;
                }
                field(reserve; Rec."Reserve")
                {
                    Caption = 'Reserve';
                    ToolTip = 'Specifies the Reserve.';
                    ApplicationArea = All;
                }
                field(appliesToId; Rec."Applies-to ID")
                {
                    Caption = 'Applies-to ID';
                    ToolTip = 'Specifies the ID of entries that will be applied to when you choose the Apply Entries action.';
                    ApplicationArea = All;
                }
                field(vatBaseDiscountPct; Rec."VAT Base Discount %")
                {
                    Caption = 'VAT Base Discount %';
                    ToolTip = 'Specifies the VAT Base Discount %.';
                    ApplicationArea = All;
                }
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the service order status, which reflects the repair or maintenance status of all service items on the service order.';
                    ApplicationArea = All;
                }
                field(invoiceDiscountCalculation; Rec."Invoice Discount Calculation")
                {
                    Caption = 'Invoice Discount Calculation';
                    ToolTip = 'Specifies the Invoice Discount Calculation.';
                    ApplicationArea = All;
                }
                field(invoiceDiscountValue; Rec."Invoice Discount Value")
                {
                    Caption = 'Invoice Discount Value';
                    ToolTip = 'Specifies the Invoice Discount Value.';
                    ApplicationArea = All;
                }
                field(companyBankAccountCode; Rec."Company Bank Account Code")
                {
                    Caption = 'Bank Account Code';
                    ToolTip = 'Specifies the bank account to use for bank information when the document is printed.';
                    ApplicationArea = All;
                }
                field(releaseStatus; Rec."Release Status")
                {
                    Caption = 'Release Status';
                    ToolTip = 'Specifies if items in the Service Lines window are ready to be handled in warehouse activities.';
                    ApplicationArea = All;
                }
                field(vatReportingDate; Rec."VAT Reporting Date")
                {
                    Caption = 'VAT Date';
                    ToolTip = 'Specifies the date used to include entries on VAT reports in a VAT period. This is either the date that the document was created or posted, depending on your setting on the General Ledger Setup page.';
                    ApplicationArea = All;
                }
                field(incomingDocumentEntryNo; Rec."Incoming Document Entry No.")
                {
                    Caption = 'Incoming Document Entry No.';
                    ToolTip = 'Specifies the Incoming Document Entry No..';
                    ApplicationArea = All;
                }
                field(journalTemplName; Rec."Journal Templ. Name")
                {
                    Caption = 'Journal Template Name';
                    ToolTip = 'Specifies the Journal Template Name.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
                field(directDebitMandateId; Rec."Direct Debit Mandate ID")
                {
                    Caption = 'Direct Debit Mandate ID';
                    ToolTip = 'Specifies the direct-debit mandate that the customer has signed to allow direct debit collection of payments.';
                    ApplicationArea = All;
                }
                field(noOfArchivedVersions; Rec."No. of Archived Versions")
                {
                    Caption = 'No. of Archived Versions';
                    ToolTip = 'Specifies the number of archived versions for this document.';
                    ApplicationArea = All;
                }
                field(docNoOccurrence; Rec."Doc. No. Occurrence")
                {
                    Caption = 'Doc. No. Occurrence';
                    ToolTip = 'Specifies the Doc. No. Occurrence.';
                    ApplicationArea = All;
                }
                field(contactNo; Rec."Contact No.")
                {
                    Caption = 'Contact No.';
                    ToolTip = 'Specifies the number of the contact to whom you will deliver the service.';
                    ApplicationArea = All;
                }
                field(billToContactNo; Rec."Bill-to Contact No.")
                {
                    Caption = 'Bill-to Contact No.';
                    ToolTip = 'Specifies the number of the contact person at the customer''s billing address.';
                    ApplicationArea = All;
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                    ApplicationArea = All;
                }
                field(shippingAdvice; Rec."Shipping Advice")
                {
                    Caption = 'Shipping Advice';
                    ToolTip = 'Specifies information about whether the customer will accept a partial shipment of the order.';
                    ApplicationArea = All;
                }
                field(completelyShipped; Rec."Completely Shipped")
                {
                    Caption = 'Completely Shipped';
                    ToolTip = 'Specifies the Completely Shipped.';
                    ApplicationArea = All;
                }
                field(locationFilter; Rec."Location Filter")
                {
                    Caption = 'Location Filter';
                    ToolTip = 'Specifies the Location Filter.';
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
                    ToolTip = 'Specifies the code for the service, such as a one-day delivery, that is offered by the shipping agent.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the Date Filter.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a short description of the service document, such as Order 2001.';
                    ApplicationArea = All;
                }
                field(serviceOrderType; Rec."Service Order Type")
                {
                    Caption = 'Service Order Type';
                    ToolTip = 'Specifies the type of this service order.';
                    ApplicationArea = All;
                }
                field(linkServiceToServiceItem; Rec."Link Service to Service Item")
                {
                    Caption = 'Link Service to Service Item';
                    ToolTip = 'Specifies that service lines for items and resources must be linked to a service item line.';
                    ApplicationArea = All;
                }
                field(priority; Rec."Priority")
                {
                    Caption = 'Priority';
                    ToolTip = 'Specifies the priority of the service order.';
                    ApplicationArea = All;
                }
                field(allocatedHours; Rec."Allocated Hours")
                {
                    Caption = 'Allocated Hours';
                    ToolTip = 'Specifies the number of hours allocated to the items in this service order.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the phone number of the customer in this service order.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the email address of the customer in this service order.';
                    ApplicationArea = All;
                }
                field(phoneNo2; Rec."Phone No. 2")
                {
                    Caption = 'Phone No. 2';
                    ToolTip = 'Specifies your customer''s alternate phone number.';
                    ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the Fax No..';
                    ApplicationArea = All;
                }
                field(noOfUnallocatedItems; Rec."No. of Unallocated Items")
                {
                    Caption = 'No. of Unallocated Items';
                    ToolTip = 'Specifies the number of service items in this order that are not allocated to resources.';
                    ApplicationArea = All;
                }
                field(orderTime; Rec."Order Time")
                {
                    Caption = 'Order Time';
                    ToolTip = 'Specifies the time when the service order was created.';
                    ApplicationArea = All;
                }
                field(defaultResponseTimeHours; Rec."Default Response Time (Hours)")
                {
                    Caption = 'Default Response Time (Hours)';
                    ToolTip = 'Specifies the Default Response Time (Hours).';
                    ApplicationArea = All;
                }
                field(actualResponseTimeHours; Rec."Actual Response Time (Hours)")
                {
                    Caption = 'Actual Response Time (Hours)';
                    ToolTip = 'Specifies the number of hours from order creation, to when the service order status changes from Pending, to In Process.';
                    ApplicationArea = All;
                }
                field(serviceTimeHours; Rec."Service Time (Hours)")
                {
                    Caption = 'Service Time (Hours)';
                    ToolTip = 'Specifies the total time in hours that the service specified in the order has taken.';
                    ApplicationArea = All;
                }
                field(responseDate; Rec."Response Date")
                {
                    Caption = 'Response Date';
                    ToolTip = 'Specifies the estimated date when work on the order should start, that is, when the service order status changes from Pending, to In Process.';
                    ApplicationArea = All;
                }
                field(responseTime; Rec."Response Time")
                {
                    Caption = 'Response Time';
                    ToolTip = 'Specifies the estimated time when work on the order starts, that is, when the service order status changes from Pending, to In Process.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the starting date of the service, that is, the date when the order status changes from Pending, to In Process for the first time.';
                    ApplicationArea = All;
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                    ToolTip = 'Specifies the starting time of the service, that is, the time when the order status changes from Pending, to In Process for the first time.';
                    ApplicationArea = All;
                }
                field(finishingDate; Rec."Finishing Date")
                {
                    Caption = 'Finishing Date';
                    ToolTip = 'Specifies the finishing date of the service, that is, the date when the Status field changes to Finished.';
                    ApplicationArea = All;
                }
                field(finishingTime; Rec."Finishing Time")
                {
                    Caption = 'Finishing Time';
                    ToolTip = 'Specifies the finishing time of the service, that is, the time when the Status field changes to Finished.';
                    ApplicationArea = All;
                }
                field(contractServHoursExist; Rec."Contract Serv. Hours Exist")
                {
                    Caption = 'Contract Serv. Hours Exist';
                    ToolTip = 'Specifies the Contract Serv. Hours Exist.';
                    ApplicationArea = All;
                }
                field(reallocationNeeded; Rec."Reallocation Needed")
                {
                    Caption = 'Reallocation Needed';
                    ToolTip = 'Specifies that you must reallocate resources to at least one service item in this service order.';
                    ApplicationArea = All;
                }
                field(notifyCustomer; Rec."Notify Customer")
                {
                    Caption = 'Notify Customer';
                    ToolTip = 'Specifies how the customer wants to receive notifications about service completion.';
                    ApplicationArea = All;
                }
                field(maxLaborUnitPrice; Rec."Max. Labor Unit Price")
                {
                    Caption = 'Max. Labor Unit Price';
                    ToolTip = 'Specifies the maximum unit price that can be set for a resource (for example, a technician) on all service lines linked to this order.';
                    ApplicationArea = All;
                }
                field(warningStatus; Rec."Warning Status")
                {
                    Caption = 'Warning Status';
                    ToolTip = 'Specifies the response time warning status for the order.';
                    ApplicationArea = All;
                }
                field(noOfAllocations; Rec."No. of Allocations")
                {
                    Caption = 'No. of Allocations';
                    ToolTip = 'Specifies the number of resource allocations to service items in this order.';
                    ApplicationArea = All;
                }
                field(contractNo; Rec."Contract No.")
                {
                    Caption = 'Contract No.';
                    ToolTip = 'Specifies the number of the contract associated with the order.';
                    ApplicationArea = All;
                }
                field(typeFilter; Rec."Type Filter")
                {
                    Caption = 'Type Filter';
                    ToolTip = 'Specifies the Type Filter.';
                    ApplicationArea = All;
                }
                field(customerFilter; Rec."Customer Filter")
                {
                    Caption = 'Customer Filter';
                    ToolTip = 'Specifies the Customer Filter.';
                    ApplicationArea = All;
                }
                field(resourceFilter; Rec."Resource Filter")
                {
                    Caption = 'Resource Filter';
                    ToolTip = 'Specifies the Resource Filter.';
                    ApplicationArea = All;
                }
                field(contractFilter; Rec."Contract Filter")
                {
                    Caption = 'Contract Filter';
                    ToolTip = 'Specifies the Contract Filter.';
                    ApplicationArea = All;
                }
                field(shipToFaxNo; Rec."Ship-to Fax No.")
                {
                    Caption = 'Ship-to Fax No.';
                    ToolTip = 'Specifies the Ship-to Fax No..';
                    ApplicationArea = All;
                }
                field(shipToEMail; Rec."Ship-to E-Mail")
                {
                    Caption = 'Ship-to Email';
                    ToolTip = 'Specifies the email address at the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(resourceGroupFilter; Rec."Resource Group Filter")
                {
                    Caption = 'Resource Group Filter';
                    ToolTip = 'Specifies the Resource Group Filter.';
                    ApplicationArea = All;
                }
                field(shipToPhone; Rec."Ship-to Phone")
                {
                    Caption = 'Ship-to Phone';
                    ToolTip = 'Specifies the phone number of the address where the service items in the order are located.';
                    ApplicationArea = All;
                }
                field(shipToPhone2; Rec."Ship-to Phone 2")
                {
                    Caption = 'Ship-to Phone 2';
                    ToolTip = 'Specifies an additional phone number at address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(serviceZoneFilter; Rec."Service Zone Filter")
                {
                    Caption = 'Service Zone Filter';
                    ToolTip = 'Specifies the Service Zone Filter.';
                    ApplicationArea = All;
                }
                field(serviceZoneCode; Rec."Service Zone Code")
                {
                    Caption = 'Service Zone Code';
                    ToolTip = 'Specifies the service zone code of the customer''s ship-to address in the service order.';
                    ApplicationArea = All;
                }
                field(expectedFinishingDate; Rec."Expected Finishing Date")
                {
                    Caption = 'Expected Finishing Date';
                    ToolTip = 'Specifies the date when service on the order is expected to be finished.';
                    ApplicationArea = All;
                }
                field(priceCalculationMethod; Rec."Price Calculation Method")
                {
                    Caption = 'Price Calculation Method';
                    ToolTip = 'Specifies the Price Calculation Method.';
                    ApplicationArea = All;
                }
                field(allowLineDisc; Rec."Allow Line Disc.")
                {
                    Caption = 'Allow Line Disc.';
                    ToolTip = 'Specifies the Allow Line Disc..';
                    ApplicationArea = All;
                }
                field(assignedUserId; Rec."Assigned User ID")
                {
                    Caption = 'Assigned User ID';
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                    ApplicationArea = All;
                }
                field(quoteNo; Rec."Quote No.")
                {
                    Caption = 'Quote No.';
                    ToolTip = 'Specifies the number of the service quote that the service order was created from. You can track the number to service quote documents that you have printed, saved, or emailed.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
