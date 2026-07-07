namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.History;

page 90994 "ocpfServiceShipmentHeaders"
{
    PageType = API;
    Caption = 'Posted Service Shipments — headers of posted service shipments. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceShipmentHeader';
    EntitySetName = 'ocpfServiceShipmentHeaders';
    SourceTable = "Service Shipment Header";
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
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the number of the customer who owns the items on the service order.';
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
                    ToolTip = 'Specifies the address of the customer to whom you sent the invoice.';
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
                    ToolTip = 'Specifies a reference to the customer.';
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
                    ToolTip = 'Specifies the date when the related order was created.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the date when the shipment was posted.';
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
                    ToolTip = 'Specifies the Payment Terms Code.';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Specifies the Due Date.';
                    ApplicationArea = All;
                }
                field(paymentDiscountPct; Rec."Payment Discount %")
                {
                    Caption = 'Payment Discount %';
                    ToolTip = 'Specifies the Payment Discount %.';
                    ApplicationArea = All;
                }
                field(pmtDiscountDate; Rec."Pmt. Discount Date")
                {
                    Caption = 'Pmt. Discount Date';
                    ToolTip = 'Specifies the Pmt. Discount Date.';
                    ApplicationArea = All;
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                    ToolTip = 'Specifies the code for the shipment method that is associated with the posted service shipment.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location, such as warehouse or distribution center, from where the items on the order were shipped.';
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
                    ToolTip = 'Specifies the Customer Posting Group.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for various amounts on the shipment.';
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
                    ToolTip = 'Specifies the Prices Including VAT.';
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
                    ToolTip = 'Specifies the code of the salesperson assigned to the service order.';
                    ApplicationArea = All;
                }
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    ToolTip = 'Specifies the number of the service order from which the shipment was created.';
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
                    ToolTip = 'Specifies how many times the document has been printed.';
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
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                    ToolTip = 'Specifies the Bal. Account No..';
                    ApplicationArea = All;
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                    ToolTip = 'Specifies the VAT Registration No..';
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
                    ToolTip = 'Specifies the Transaction Type.';
                    ApplicationArea = All;
                }
                field(transportMethod; Rec."Transport Method")
                {
                    Caption = 'Transport Method';
                    ToolTip = 'Specifies the Transport Method.';
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
                    ToolTip = 'Specifies the name of the customer.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies an additional part of the name of the customer on the posted service shipment.';
                    ApplicationArea = All;
                }
                field(address; Rec."Address")
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the address of the customer of the posted service shipment.';
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
                    ToolTip = 'Specifies the name of the contact person at the customer company.';
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
                    ToolTip = 'Specifies the state, province or county for the customer that the invoice is sent to.';
                    ApplicationArea = All;
                }
                field(billToCountryRegionCode; Rec."Bill-to Country/Region Code")
                {
                    Caption = 'Bill-to Country/Region Code';
                    ToolTip = 'Specifies the country/region code of the customer''s billing address.';
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
                    ToolTip = 'Specifies the state, province or county related to the posted service shipment.';
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
                    ToolTip = 'Specifies the Ship-to County.';
                    ApplicationArea = All;
                }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';
                    ToolTip = 'Specifies the country/region code of the address that the items are shipped to.';
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
                    ToolTip = 'Specifies the Exit Point.';
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
                    ToolTip = 'Specifies the external document number that is entered on the service header that this line was posted from.';
                    ApplicationArea = All;
                }
                field("area"; Rec."Area")
                {
                    Caption = 'Area';
                    ToolTip = 'Specifies the Area.';
                    ApplicationArea = All;
                }
                field(transactionSpecification; Rec."Transaction Specification")
                {
                    Caption = 'Transaction Specification';
                    ToolTip = 'Specifies the Transaction Specification.';
                    ApplicationArea = All;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    ToolTip = 'Specifies the Payment Method Code.';
                    ApplicationArea = All;
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                    ToolTip = 'Specifies which shipping agent is used to transport the items on the service document to the customer.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the No. Series.';
                    ApplicationArea = All;
                }
                field(orderNoSeries; Rec."Order No. Series")
                {
                    Caption = 'Order No. Series';
                    ToolTip = 'Specifies the Order No. Series.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the User ID.';
                    ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the Source Code.';
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
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ToolTip = 'Specifies the VAT Bus. Posting Group.';
                    ApplicationArea = All;
                }
                field(vatBaseDiscountPct; Rec."VAT Base Discount %")
                {
                    Caption = 'VAT Base Discount %';
                    ToolTip = 'Specifies the VAT Base Discount %.';
                    ApplicationArea = All;
                }
                field(companyBankAccountCode; Rec."Company Bank Account Code")
                {
                    Caption = 'Company Bank Account Code';
                    ToolTip = 'Specifies the Company Bank Account Code.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
                field(contactNo; Rec."Contact No.")
                {
                    Caption = 'Contact No.';
                    ToolTip = 'Specifies the number of the contact person at the customer''s site.';
                    ApplicationArea = All;
                }
                field(billToContactNo; Rec."Bill-to Contact No.")
                {
                    Caption = 'Bill-to Contact No.';
                    ToolTip = 'Specifies the Bill-to Contact No..';
                    ApplicationArea = All;
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                    ApplicationArea = All;
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                    ToolTip = 'Specifies which shipping agent service is used to transport the items on the service document to the customer.';
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
                    ToolTip = 'Specifies a description of the order from which the shipment was posted.';
                    ApplicationArea = All;
                }
                field(serviceOrderType; Rec."Service Order Type")
                {
                    Caption = 'Service Order Type';
                    ToolTip = 'Specifies the type of the service order from which the shipment was created.';
                    ApplicationArea = All;
                }
                field(linkServiceToServiceItem; Rec."Link Service to Service Item")
                {
                    Caption = 'Link Service to Service Item';
                    ToolTip = 'Specifies the value in this field from the Link Service to Service Item field on the service header.';
                    ApplicationArea = All;
                }
                field(priority; Rec."Priority")
                {
                    Caption = 'Priority';
                    ToolTip = 'Specifies the priority of the posted service order.';
                    ApplicationArea = All;
                }
                field(allocatedHours; Rec."Allocated Hours")
                {
                    Caption = 'Allocated Hours';
                    ToolTip = 'Specifies the number of hours allocated to the items within the posted service order.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the customer phone number.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the email address of the customer.';
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
                    ToolTip = 'Specifies the No. of Unallocated Items.';
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
                    ToolTip = 'Specifies the hours since the creation of the service order, to the time when the order status was changed from Pending to In Process.';
                    ApplicationArea = All;
                }
                field(serviceTimeHours; Rec."Service Time (Hours)")
                {
                    Caption = 'Service Time (Hours)';
                    ToolTip = 'Specifies the total time in hours that the service on the service order has taken.';
                    ApplicationArea = All;
                }
                field(responseDate; Rec."Response Date")
                {
                    Caption = 'Response Date';
                    ToolTip = 'Specifies the approximate date when work on the service order started.';
                    ApplicationArea = All;
                }
                field(responseTime; Rec."Response Time")
                {
                    Caption = 'Response Time';
                    ToolTip = 'Specifies the approximate time when work on the service order started.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the starting date of the service on the shipment.';
                    ApplicationArea = All;
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                    ToolTip = 'Specifies the starting time of the service on the shipment.';
                    ApplicationArea = All;
                }
                field(finishingDate; Rec."Finishing Date")
                {
                    Caption = 'Finishing Date';
                    ToolTip = 'Specifies the date when the service is finished.';
                    ApplicationArea = All;
                }
                field(finishingTime; Rec."Finishing Time")
                {
                    Caption = 'Finishing Time';
                    ToolTip = 'Specifies the time when the service is finished.';
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
                    ToolTip = 'Specifies the Reallocation Needed.';
                    ApplicationArea = All;
                }
                field(notifyCustomer; Rec."Notify Customer")
                {
                    Caption = 'Notify Customer';
                    ToolTip = 'Specifies in what way the customer wants to receive notifications about the service completed.';
                    ApplicationArea = All;
                }
                field(maxLaborUnitPrice; Rec."Max. Labor Unit Price")
                {
                    Caption = 'Max. Labor Unit Price';
                    ToolTip = 'Specifies the Max. Labor Unit Price.';
                    ApplicationArea = All;
                }
                field(warningStatus; Rec."Warning Status")
                {
                    Caption = 'Warning Status';
                    ToolTip = 'Specifies the warning status for the response time on the original service order.';
                    ApplicationArea = All;
                }
                field(noOfAllocations; Rec."No. of Allocations")
                {
                    Caption = 'No. of Allocations';
                    ToolTip = 'Specifies the No. of Allocations.';
                    ApplicationArea = All;
                }
                field(contractNo; Rec."Contract No.")
                {
                    Caption = 'Contract No.';
                    ToolTip = 'Specifies the number of the contract associated with the service order.';
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
                    ToolTip = 'Specifies the customer phone number.';
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
                    ToolTip = 'Specifies the service zone code assigned to the customer.';
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
                field(quoteNo; Rec."Quote No.")
                {
                    Caption = 'Quote No.';
                    ToolTip = 'Specifies the number of the service quote document if a quote was used to start the service process.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
