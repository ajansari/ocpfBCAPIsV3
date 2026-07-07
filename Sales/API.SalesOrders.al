namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.Document;

page 90872 "ocpfSalesOrders"
{
    PageType = API;
    Caption = 'Sales orders (confirmed customer orders in progress).';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_sales';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfSalesOrder';
    EntitySetName = 'ocpfSalesOrders';
    SourceTable = "Sales Header";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTableView = where("Document Type" = const(Order));

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
                        ToolTip = 'Specifies the Document Type.';
                        ApplicationArea = All;
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                    {
                        Caption = 'Sell-to Customer No.';
                        ToolTip = 'Specifies the Sell-to Customer No..';
                        ApplicationArea = All;
                }
                field(no; Rec."No.")
                    {
                        Caption = 'No.';
                        ToolTip = 'Specifies a unique number that identifies the sales document. The number can be generated automatically from a number series, or you can number each of them manually.';
                        ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                    {
                        Caption = 'Bill-to Customer No.';
                        ToolTip = 'Specifies the Bill-to Customer No..';
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
                        ToolTip = 'Specifies the Bill-to Address.';
                        ApplicationArea = All;
                }
                field(billToAddress2; Rec."Bill-to Address 2")
                    {
                        Caption = 'Bill-to Address 2';
                        ToolTip = 'Specifies the Bill-to Address 2.';
                        ApplicationArea = All;
                }
                field(billToCity; Rec."Bill-to City")
                    {
                        Caption = 'Bill-to City';
                        ToolTip = 'Specifies the Bill-to City.';
                        ApplicationArea = All;
                }
                field(billToContact; Rec."Bill-to Contact")
                    {
                        Caption = 'Bill-to Contact';
                        ToolTip = 'Specifies the name of the contact person at the customer';
                        ApplicationArea = All;
                }
                field(yourReference; Rec."Your Reference")
                    {
                        Caption = 'Your Reference';
                        ToolTip = 'Specifies the customer';
                        ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                    {
                        Caption = 'Ship-to Code';
                        ToolTip = 'Specifies the Ship-to Code.';
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
                        ToolTip = 'Specifies the Ship-to Name 2.';
                        ApplicationArea = All;
                }
                field(shipToAddress; Rec."Ship-to Address")
                    {
                        Caption = 'Ship-to Address';
                        ToolTip = 'Specifies the Ship-to Address.';
                        ApplicationArea = All;
                }
                field(shipToAddress2; Rec."Ship-to Address 2")
                    {
                        Caption = 'Ship-to Address 2';
                        ToolTip = 'Specifies the Ship-to Address 2.';
                        ApplicationArea = All;
                }
                field(shipToCity; Rec."Ship-to City")
                    {
                        Caption = 'Ship-to City';
                        ToolTip = 'Specifies the Ship-to City.';
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
                        ToolTip = 'Specifies the Order Date.';
                        ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                    {
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
                        ApplicationArea = All;
                }
                field(shipmentDate; Rec."Shipment Date")
                    {
                        Caption = 'Shipment Date';
                        ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                        ApplicationArea = All;
                }
                field(postingDescription; Rec."Posting Description")
                    {
                        Caption = 'Posting Description';
                        ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
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
                        ToolTip = 'Specifies when the sales invoice must be paid.';
                        ApplicationArea = All;
                }
                field(paymentDiscountPct; Rec."Payment Discount %")
                    {
                        Caption = 'Payment Discount %';
                        ToolTip = 'Specifies the payment discount percentage that is granted if the customer pays on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
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
                        ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                        ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                    {
                        Caption = 'Location Code';
                        ToolTip = 'Specifies the location from where items are to be shipped. This field acts as the default location for new lines. You can update the location code for individual lines as needed.';
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
                        ToolTip = 'Specifies the currency of amounts on the sales document.';
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
                        ToolTip = 'Specifies the name of the salesperson who is assigned to the customer.';
                        ApplicationArea = All;
                }
                field(orderClass; Rec."Order Class")
                    {
                        Caption = 'Order Class';
                        ToolTip = 'Specifies the Order Class.';
                        ApplicationArea = All;
                }
                field(comment; Rec.Comment)
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
                field(balAccountNo; Rec."Bal. Account No.")
                    {
                        Caption = 'Bal. Account No.';
                        ToolTip = 'Specifies the Bal. Account No..';
                        ApplicationArea = All;
                }
                field(recalculateInvoiceDisc; Rec."Recalculate Invoice Disc.")
                    {
                        Caption = 'Recalculate Invoice Disc.';
                        ToolTip = 'Specifies the Recalculate Invoice Disc..';
                        ApplicationArea = All;
                }
                field(ship; Rec.Ship)
                    {
                        Caption = 'Ship';
                        ToolTip = 'Specifies the Ship.';
                        ApplicationArea = All;
                }
                field(invoice; Rec.Invoice)
                    {
                        Caption = 'Invoice';
                        ToolTip = 'Specifies the Invoice.';
                        ApplicationArea = All;
                }
                field(printPostedDocuments; Rec."Print Posted Documents")
                    {
                        Caption = 'Print Posted Documents';
                        ToolTip = 'Specifies the Print Posted Documents.';
                        ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                    {
                        Caption = 'Amount';
                        ToolTip = 'Specifies the sum of amounts on all the lines in the document. This will include invoice discounts.';
                        ApplicationArea = All;
                }
                field(amountIncludingVat; Rec."Amount Including VAT")
                    {
                        Caption = 'Amount Including VAT';
                        ToolTip = 'Specifies the sum of amounts, including VAT, on all the lines in the document. This will include invoice discounts.';
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
                field(prepaymentNo; Rec."Prepayment No.")
                    {
                        Caption = 'Prepayment No.';
                        ToolTip = 'Specifies the Prepayment No..';
                        ApplicationArea = All;
                }
                field(lastPrepaymentNo; Rec."Last Prepayment No.")
                    {
                        Caption = 'Last Prepayment No.';
                        ToolTip = 'Specifies the Last Prepayment No..';
                        ApplicationArea = All;
                }
                field(prepmtCrMemoNo; Rec."Prepmt. Cr. Memo No.")
                    {
                        Caption = 'Prepmt. Cr. Memo No.';
                        ToolTip = 'Specifies the Prepmt. Cr. Memo No..';
                        ApplicationArea = All;
                }
                field(lastPrepmtCrMemoNo; Rec."Last Prepmt. Cr. Memo No.")
                    {
                        Caption = 'Last Prepmt. Cr. Memo No.';
                        ToolTip = 'Specifies the Last Prepmt. Cr. Memo No..';
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
                        ToolTip = 'Specifies the Combine Shipments.';
                        ApplicationArea = All;
                }
                field(registrationNumber; Rec."Registration Number")
                    {
                        Caption = 'Registration No.';
                        ToolTip = 'Specifies the Registration Number.';
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
                        ToolTip = 'Specifies the EU 3-Party Trade.';
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
                field(sellToCustomerName; Rec."Sell-to Customer Name")
                    {
                        Caption = 'Sell-to Customer Name';
                        ToolTip = 'Specifies the name of the customer that you';
                        ApplicationArea = All;
                }
                field(sellToCustomerName2; Rec."Sell-to Customer Name 2")
                    {
                        Caption = 'Sell-to Customer Name 2';
                        ToolTip = 'Specifies an additional part of the name of the customer who will receive the products and be billed by default.';
                        ApplicationArea = All;
                }
                field(sellToAddress; Rec."Sell-to Address")
                    {
                        Caption = 'Sell-to Address';
                        ToolTip = 'Specifies the Sell-to Address.';
                        ApplicationArea = All;
                }
                field(sellToAddress2; Rec."Sell-to Address 2")
                    {
                        Caption = 'Sell-to Address 2';
                        ToolTip = 'Specifies the Sell-to Address 2.';
                        ApplicationArea = All;
                }
                field(sellToCity; Rec."Sell-to City")
                    {
                        Caption = 'Sell-to City';
                        ToolTip = 'Specifies the Sell-to City.';
                        ApplicationArea = All;
                }
                field(sellToContact; Rec."Sell-to Contact")
                    {
                        Caption = 'Sell-to Contact';
                        ToolTip = 'Specifies the name of the contact person at the customer';
                        ApplicationArea = All;
                }
                field(billToPostCode; Rec."Bill-to Post Code")
                    {
                        Caption = 'Bill-to Post Code';
                        ToolTip = 'Specifies the postal code of the customer';
                        ApplicationArea = All;
                }
                field(billToCounty; Rec."Bill-to County")
                    {
                        Caption = 'Bill-to County';
                        ToolTip = 'Specifies the Bill-to County.';
                        ApplicationArea = All;
                }
                field(billToCountryRegionCode; Rec."Bill-to Country/Region Code")
                    {
                        Caption = 'Bill-to Country/Region Code';
                        ToolTip = 'Specifies the country/region code of the customer';
                        ApplicationArea = All;
                }
                field(sellToPostCode; Rec."Sell-to Post Code")
                    {
                        Caption = 'Sell-to Post Code';
                        ToolTip = 'Specifies the postal code of the customer';
                        ApplicationArea = All;
                }
                field(sellToCounty; Rec."Sell-to County")
                    {
                        Caption = 'Sell-to County';
                        ToolTip = 'Specifies the Sell-to County.';
                        ApplicationArea = All;
                }
                field(sellToCountryRegionCode; Rec."Sell-to Country/Region Code")
                    {
                        Caption = 'Sell-to Country/Region Code';
                        ToolTip = 'Specifies the country/region code of the customer';
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
                field(correction; Rec.Correction)
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
                        ToolTip = 'Specifies a document number that refers to the customer';
                        ApplicationArea = All;
                }
                field(areaCode; Rec.Area)
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
                        ToolTip = 'Specifies the code for the shipping agent who is transporting the items.';
                        ApplicationArea = All;
                }
                field(packageTrackingNo; Rec."Package Tracking No.")
                    {
                        Caption = 'Package Tracking No.';
                        ToolTip = 'Specifies the shipping agent';
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
                field(reserve; Rec.Reserve)
                    {
                        Caption = 'Reserve';
                        ToolTip = 'Specifies the Reserve.';
                        ApplicationArea = All;
                }
                field(appliesToId; Rec."Applies-to ID")
                    {
                        Caption = 'Applies-to ID';
                        ToolTip = 'Specifies the Applies-to ID.';
                        ApplicationArea = All;
                }
                field(vatBaseDiscountPct; Rec."VAT Base Discount %")
                    {
                        Caption = 'VAT Base Discount %';
                        ToolTip = 'Specifies the VAT Base Discount %.';
                        ApplicationArea = All;
                }
                field(status; Rec.Status)
                    {
                        Caption = 'Status';
                        ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
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
                field(sendIcDocument; Rec."Send IC Document")
                    {
                        Caption = 'Send IC Document';
                        ToolTip = 'Specifies the Send IC Document.';
                        ApplicationArea = All;
                }
                field(icStatus; Rec."IC Status")
                    {
                        Caption = 'IC Status';
                        ToolTip = 'Specifies the IC Status.';
                        ApplicationArea = All;
                }
                field(sellToIcPartnerCode; Rec."Sell-to IC Partner Code")
                    {
                        Caption = 'Sell-to IC Partner Code';
                        ToolTip = 'Specifies the Sell-to IC Partner Code.';
                        ApplicationArea = All;
                }
                field(billToIcPartnerCode; Rec."Bill-to IC Partner Code")
                    {
                        Caption = 'Bill-to IC Partner Code';
                        ToolTip = 'Specifies the Bill-to IC Partner Code.';
                        ApplicationArea = All;
                }
                field(icReferenceDocumentNo; Rec."IC Reference Document No.")
                    {
                        Caption = 'IC Reference Document No.';
                        ToolTip = 'Specifies the IC Reference Document No..';
                        ApplicationArea = All;
                }
                field(icDirection; Rec."IC Direction")
                    {
                        Caption = 'IC Direction';
                        ToolTip = 'Specifies the IC Direction.';
                        ApplicationArea = All;
                }
                field(prepaymentPct; Rec."Prepayment %")
                    {
                        Caption = 'Prepayment %';
                        ToolTip = 'Specifies the Prepayment %.';
                        ApplicationArea = All;
                }
                field(prepaymentNoSeries; Rec."Prepayment No. Series")
                    {
                        Caption = 'Prepayment No. Series';
                        ToolTip = 'Specifies the Prepayment No. Series.';
                        ApplicationArea = All;
                }
                field(compressPrepayment; Rec."Compress Prepayment")
                    {
                        Caption = 'Compress Prepayment';
                        ToolTip = 'Specifies the Compress Prepayment.';
                        ApplicationArea = All;
                }
                field(prepaymentDueDate; Rec."Prepayment Due Date")
                    {
                        Caption = 'Prepayment Due Date';
                        ToolTip = 'Specifies the Prepayment Due Date.';
                        ApplicationArea = All;
                }
                field(prepmtCrMemoNoSeries; Rec."Prepmt. Cr. Memo No. Series")
                    {
                        Caption = 'Prepmt. Cr. Memo No. Series';
                        ToolTip = 'Specifies the Prepmt. Cr. Memo No. Series.';
                        ApplicationArea = All;
                }
                field(prepmtPostingDescription; Rec."Prepmt. Posting Description")
                    {
                        Caption = 'Prepmt. Posting Description';
                        ToolTip = 'Specifies the Prepmt. Posting Description.';
                        ApplicationArea = All;
                }
                field(prepmtPmtDiscountDate; Rec."Prepmt. Pmt. Discount Date")
                    {
                        Caption = 'Prepmt. Pmt. Discount Date';
                        ToolTip = 'Specifies the Prepmt. Pmt. Discount Date.';
                        ApplicationArea = All;
                }
                field(prepmtPaymentTermsCode; Rec."Prepmt. Payment Terms Code")
                    {
                        Caption = 'Prepmt. Payment Terms Code';
                        ToolTip = 'Specifies the Prepmt. Payment Terms Code.';
                        ApplicationArea = All;
                }
                field(prepmtPaymentDiscountPct; Rec."Prepmt. Payment Discount %")
                    {
                        Caption = 'Prepmt. Payment Discount %';
                        ToolTip = 'Specifies the Prepmt. Payment Discount %.';
                        ApplicationArea = All;
                }
                field(quoteNo; Rec."Quote No.")
                    {
                        Caption = 'Quote No.';
                        ToolTip = 'Specifies the number of the sales quote that the sales order was created from. You can track the number to sales quote documents that you have printed, saved, or emailed.';
                        ApplicationArea = All;
                }
                field(quoteValidUntilDate; Rec."Quote Valid Until Date")
                    {
                        Caption = 'Quote Valid To Date';
                        ToolTip = 'Specifies the Quote Valid Until Date.';
                        ApplicationArea = All;
                }
                field(quoteSentToCustomer; Rec."Quote Sent to Customer")
                    {
                        Caption = 'Quote Sent to Customer';
                        ToolTip = 'Specifies the Quote Sent to Customer.';
                        ApplicationArea = All;
                }
                field(quoteAccepted; Rec."Quote Accepted")
                    {
                        Caption = 'Quote Accepted';
                        ToolTip = 'Specifies the Quote Accepted.';
                        ApplicationArea = All;
                }
                field(quoteAcceptedDate; Rec."Quote Accepted Date")
                    {
                        Caption = 'Quote Accepted Date';
                        ToolTip = 'Specifies the Quote Accepted Date.';
                        ApplicationArea = All;
                }
                field(jobQueueStatus; Rec."Job Queue Status")
                    {
                        Caption = 'Job Queue Status';
                        ToolTip = 'Specifies the status of a job queue entry or task that handles the posting of sales orders.';
                        ApplicationArea = All;
                }
                field(jobQueueEntryId; Rec."Job Queue Entry ID")
                    {
                        Caption = 'Job Queue Entry ID';
                        ToolTip = 'Specifies the Job Queue Entry ID.';
                        ApplicationArea = All;
                }
                field(companyBankAccountCode; Rec."Company Bank Account Code")
                    {
                        Caption = 'Company Bank Account Code';
                        ToolTip = 'Specifies the Company Bank Account Code.';
                        ApplicationArea = All;
                }
                field(incomingDocumentEntryNo; Rec."Incoming Document Entry No.")
                    {
                        Caption = 'Incoming Document Entry No.';
                        ToolTip = 'Specifies the Incoming Document Entry No..';
                        ApplicationArea = All;
                }
                field(altVatRegistrationNo; Rec."Alt. VAT Registration No.")
                    {
                        Caption = 'Alternative VAT Registration No.';
                        ToolTip = 'Specifies the Alt. VAT Registration No..';
                        ApplicationArea = All;
                }
                field(altGenBusPostingGroup; Rec."Alt. Gen. Bus Posting Group")
                    {
                        Caption = 'Alternative Gen. Bus. Posting Group';
                        ToolTip = 'Specifies the Alt. Gen. Bus Posting Group.';
                        ApplicationArea = All;
                }
                field(altVatBusPostingGroup; Rec."Alt. VAT Bus Posting Group")
                    {
                        Caption = 'Alternative VAT Bus. Posting Group';
                        ToolTip = 'Specifies the Alt. VAT Bus Posting Group.';
                        ApplicationArea = All;
                }
                field(istest; Rec.IsTest)
                    {
                        Caption = 'IsTest';
                        ToolTip = 'Specifies the IsTest.';
                        ApplicationArea = All;
                }
                field(sellToPhoneNo; Rec."Sell-to Phone No.")
                    {
                        Caption = 'Sell-to Phone No.';
                        ToolTip = 'Specifies the Sell-to Phone No..';
                        ApplicationArea = All;
                }
                field(sellToEMail; Rec."Sell-to E-Mail")
                    {
                        Caption = 'Email';
                        ToolTip = 'Specifies the Sell-to E-Mail.';
                        ApplicationArea = All;
                }
                field(journalTemplName; Rec."Journal Templ. Name")
                    {
                        Caption = 'Journal Template Name';
                        ToolTip = 'Specifies the Journal Templ. Name.';
                        ApplicationArea = All;
                }
                field(vatReportingDate; Rec."VAT Reporting Date")
                    {
                        Caption = 'VAT Date';
                        ToolTip = 'Specifies the VAT Reporting Date.';
                        ApplicationArea = All;
                }
                field(rcvdFromCountRegionCode; Rec."Rcvd.-from Count./Region Code")
                    {
                        Caption = 'Received-from Country/Region Code';
                        ToolTip = 'Specifies the Rcvd.-from Count./Region Code.';
                        ApplicationArea = All;
                }
                field(lastEmailSentTime; Rec."Last Email Sent Time")
                    {
                        Caption = 'Last Email Sent Time';
                        ToolTip = 'Specifies the Last Email Sent Time.';
                        ApplicationArea = All;
                }
                field(lastEmailSentMessageId; Rec."Last Email Sent Message Id")
                    {
                        Caption = 'Last Email Sent Message Id';
                        ToolTip = 'Specifies the Last Email Sent Message Id.';
                        ApplicationArea = All;
                }
                field(shipToPhoneNo; Rec."Ship-to Phone No.")
                    {
                        Caption = 'Ship-to Phone No.';
                        ToolTip = 'Specifies the Ship-to Phone No..';
                        ApplicationArea = All;
                }
                field(amtShipNotInvLcy; Rec."Amt. Ship. Not Inv. (LCY)")
                    {
                        Caption = 'Amount Shipped Not Invoiced (LCY) Incl. VAT';
                        ToolTip = 'Specifies the sum, in LCY, for items that have been shipped but not yet been invoiced. The amount is calculated as Amount Including VAT x Qty. Shipped Not Invoiced / Quantity.';
                        ApplicationArea = All;
                }
                field(amtShipNotInvLcyBase; Rec."Amt. Ship. Not Inv. (LCY) Base")
                    {
                        Caption = 'Amount Shipped Not Invoiced (LCY)';
                        ToolTip = 'Specifies the sum, in LCY, for items that have been shipped but not yet been invoiced. The amount is calculated as Amount Including VAT x Qty. Shipped Not Invoiced / Quantity.';
                        ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                    {
                        Caption = 'Dimension Set ID';
                        ToolTip = 'Specifies the Dimension Set ID.';
                        ApplicationArea = All;
                }
                field(paymentServiceSetId; Rec."Payment Service Set ID")
                    {
                        Caption = 'Payment Service Set ID';
                        ToolTip = 'Specifies the Payment Service Set ID.';
                        ApplicationArea = All;
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                    {
                        Caption = 'Coupled to Dynamics 365 Sales';
                        ToolTip = 'Specifies that the sales order is coupled to an order in Dynamics 365 Sales.';
                        ApplicationArea = All;
                }
                field(directDebitMandateId; Rec."Direct Debit Mandate ID")
                    {
                        Caption = 'Direct Debit Mandate ID';
                        ToolTip = 'Specifies the Direct Debit Mandate ID.';
                        ApplicationArea = All;
                }
                field(invoiceDiscountAmount; Rec."Invoice Discount Amount")
                    {
                        Caption = 'Invoice Discount Amount';
                        ToolTip = 'Specifies the Invoice Discount Amount.';
                        ApplicationArea = All;
                }
                field(noOfArchivedVersions; Rec."No. of Archived Versions")
                    {
                        Caption = 'No. of Archived Versions';
                        ToolTip = 'Specifies the No. of Archived Versions.';
                        ApplicationArea = All;
                }
                field(docNoOccurrence; Rec."Doc. No. Occurrence")
                    {
                        Caption = 'Doc. No. Occurrence';
                        ToolTip = 'Specifies the Doc. No. Occurrence.';
                        ApplicationArea = All;
                }
                field(campaignNo; Rec."Campaign No.")
                    {
                        Caption = 'Campaign No.';
                        ToolTip = 'Specifies the campaign number the document is linked to.';
                        ApplicationArea = All;
                }
                field(sellToContactNo; Rec."Sell-to Contact No.")
                    {
                        Caption = 'Sell-to Contact No.';
                        ToolTip = 'Specifies the Sell-to Contact No..';
                        ApplicationArea = All;
                }
                field(billToContactNo; Rec."Bill-to Contact No.")
                    {
                        Caption = 'Bill-to Contact No.';
                        ToolTip = 'Specifies the Bill-to Contact No..';
                        ApplicationArea = All;
                }
                field(opportunityNo; Rec."Opportunity No.")
                    {
                        Caption = 'Opportunity No.';
                        ToolTip = 'Specifies the Opportunity No..';
                        ApplicationArea = All;
                }
                field(sellToCustomerTemplCode; Rec."Sell-to Customer Templ. Code")
                    {
                        Caption = 'Sell-to Customer Template Code';
                        ToolTip = 'Specifies the Sell-to Customer Templ. Code.';
                        ApplicationArea = All;
                }
                field(billToCustomerTemplCode; Rec."Bill-to Customer Templ. Code")
                    {
                        Caption = 'Bill-to Customer Template Code';
                        ToolTip = 'Specifies the Bill-to Customer Templ. Code.';
                        ApplicationArea = All;
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                    {
                        Caption = 'Responsibility Center';
                        ToolTip = 'Specifies the Responsibility Center.';
                        ApplicationArea = All;
                }
                field(shippingAdvice; Rec."Shipping Advice")
                    {
                        Caption = 'Shipping Advice';
                        ToolTip = 'Specifies if the customer accepts partial shipment of orders.';
                        ApplicationArea = All;
                }
                field(shippedNotInvoiced; Rec."Shipped Not Invoiced")
                    {
                        Caption = 'Shipped Not Invoiced';
                        ToolTip = 'Specifies the Shipped Not Invoiced.';
                        ApplicationArea = All;
                }
                field(completelyShipped; Rec."Completely Shipped")
                    {
                        Caption = 'Completely Shipped';
                        ToolTip = 'Specifies whether all the items on the order have been shipped or, in the case of inbound items, completely received.';
                        ApplicationArea = All;
                }
                field(postingFromWhseRef; Rec."Posting from Whse. Ref.")
                    {
                        Caption = 'Posting from Whse. Ref.';
                        ToolTip = 'Specifies the Posting from Whse. Ref..';
                        ApplicationArea = All;
                }
                field(locationFilter; Rec."Location Filter")
                    {
                        Caption = 'Location Filter';
                        ToolTip = 'Specifies the Location Filter.';
                        ApplicationArea = All;
                }
                field(shipped; Rec.Shipped)
                    {
                        Caption = 'Shipped';
                        ToolTip = 'Specifies the Shipped.';
                        ApplicationArea = All;
                }
                field(lastShipmentDate; Rec."Last Shipment Date")
                    {
                        Caption = 'Last Shipment Date';
                        ToolTip = 'Specifies the Last Shipment Date.';
                        ApplicationArea = All;
                }
                field(requestedDeliveryDate; Rec."Requested Delivery Date")
                    {
                        Caption = 'Requested Delivery Date';
                        ToolTip = 'Specifies the date that the customer has asked for the order to be delivered.';
                        ApplicationArea = All;
                }
                field(promisedDeliveryDate; Rec."Promised Delivery Date")
                    {
                        Caption = 'Promised Delivery Date';
                        ToolTip = 'Specifies the Promised Delivery Date.';
                        ApplicationArea = All;
                }
                field(shippingTime; Rec."Shipping Time")
                    {
                        Caption = 'Shipping Time';
                        ToolTip = 'Specifies the Shipping Time.';
                        ApplicationArea = All;
                }
                field(outboundWhseHandlingTime; Rec."Outbound Whse. Handling Time")
                    {
                        Caption = 'Outbound Whse. Handling Time';
                        ToolTip = 'Specifies the Outbound Whse. Handling Time.';
                        ApplicationArea = All;
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                    {
                        Caption = 'Shipping Agent Service Code';
                        ToolTip = 'Specifies the code for the service, such as a one-day delivery, that is offered by the shipping agent.';
                        ApplicationArea = All;
                }
                field(lateOrderShipping; Rec."Late Order Shipping")
                    {
                        Caption = 'Late Order Shipping';
                        ToolTip = 'Specifies the Late Order Shipping.';
                        ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                    {
                        Caption = 'Date Filter';
                        ToolTip = 'Specifies the Date Filter.';
                        ApplicationArea = All;
                }
                field(receive; Rec.Receive)
                    {
                        Caption = 'Receive';
                        ToolTip = 'Specifies the Receive.';
                        ApplicationArea = All;
                }
                field(returnReceiptNo; Rec."Return Receipt No.")
                    {
                        Caption = 'Return Receipt No.';
                        ToolTip = 'Specifies the Return Receipt No..';
                        ApplicationArea = All;
                }
                field(returnReceiptNoSeries; Rec."Return Receipt No. Series")
                    {
                        Caption = 'Return Receipt No. Series';
                        ToolTip = 'Specifies the Return Receipt No. Series.';
                        ApplicationArea = All;
                }
                field(lastReturnReceiptNo; Rec."Last Return Receipt No.")
                    {
                        Caption = 'Last Return Receipt No.';
                        ToolTip = 'Specifies the Last Return Receipt No..';
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
                field(getShipmentUsed; Rec."Get Shipment Used")
                    {
                        Caption = 'Get Shipment Used';
                        ToolTip = 'Specifies the Get Shipment Used.';
                        ApplicationArea = All;
                }
                field(assignedUserId; Rec."Assigned User ID")
                    {
                        Caption = 'Assigned User ID';
                        ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
