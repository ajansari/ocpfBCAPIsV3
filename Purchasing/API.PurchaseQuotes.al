namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Purchases.Document;

page 90904 "ocpfPurchaseQuotes"
{
    PageType = API;
    Caption = 'Purchase quotes — requests for pricing from vendors before ordering.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_purchasing';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfPurchaseQuote';
    EntitySetName = 'ocpfPurchaseQuotes';
    SourceTable = "Purchase Header";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTableView = where("Document Type" = const(Quote));

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
            field(buyFromVendorNo; Rec."Buy-from Vendor No.")
            {
                Caption = 'Buy-from Vendor No.';
                ToolTip = 'Specifies the Buy-from Vendor No..';
                ApplicationArea = All;
            }
            field(no; Rec."No.")
            {
                Caption = 'No.';
                ToolTip = 'Specifies a unique number that identifies the purchase order. The number can be generated automatically from a number series, or you can number each of them manually.';
                ApplicationArea = All;
            }
            field(payToVendorNo; Rec."Pay-to Vendor No.")
            {
                Caption = 'Pay-to Vendor No.';
                ToolTip = 'Specifies the Pay-to Vendor No..';
                ApplicationArea = All;
            }
            field(payToName; Rec."Pay-to Name")
            {
                Caption = 'Pay-to Name';
                ToolTip = 'Specifies the name of the vendor who you received the invoice from.';
                ApplicationArea = All;
            }
            field(payToName2; Rec."Pay-to Name 2")
            {
                Caption = 'Pay-to Name 2';
                ToolTip = 'Specifies an additional part of the name of the vendor who you receive the invoice or credit memo from.';
                ApplicationArea = All;
            }
            field(payToAddress; Rec."Pay-to Address")
            {
                Caption = 'Pay-to Address';
                ToolTip = 'Specifies the Pay-to Address.';
                ApplicationArea = All;
            }
            field(payToAddress2; Rec."Pay-to Address 2")
            {
                Caption = 'Pay-to Address 2';
                ToolTip = 'Specifies the Pay-to Address 2.';
                ApplicationArea = All;
            }
            field(payToCity; Rec."Pay-to City")
            {
                Caption = 'Pay-to City';
                ToolTip = 'Specifies the Pay-to City.';
                ApplicationArea = All;
            }
            field(payToContact; Rec."Pay-to Contact")
            {
                Caption = 'Pay-to Contact';
                ToolTip = 'Specifies the name of the person to contact about an invoice from this vendor.';
                ApplicationArea = All;
            }
            field(yourReference; Rec."Your Reference")
            {
                Caption = 'Your Reference';
                ToolTip = 'Specifies the vendor';
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
                ToolTip = 'Specifies the Posting Date.';
                ApplicationArea = All;
            }
            field(expectedReceiptDate; Rec."Expected Receipt Date")
            {
                Caption = 'Expected Receipt Date';
                ToolTip = 'Specifies the Expected Receipt Date.';
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
                ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                ApplicationArea = All;
            }
            field(dueDate; Rec."Due Date")
            {
                Caption = 'Due Date';
                ToolTip = 'Specifies when the purchase invoice is due for payment.';
                ApplicationArea = All;
            }
            field(paymentDiscountPct; Rec."Payment Discount %")
            {
                Caption = 'Payment Discount %';
                ToolTip = 'Specifies the payment discount percent granted if payment is made on or before the date in the Pmt. Discount Date field.';
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
                ToolTip = 'Specifies the Location Code.';
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
            field(vendorPostingGroup; Rec."Vendor Posting Group")
            {
                Caption = 'Vendor Posting Group';
                ToolTip = 'Specifies the Vendor Posting Group.';
                ApplicationArea = All;
            }
            field(currencyCode; Rec."Currency Code")
            {
                Caption = 'Currency Code';
                ToolTip = 'Specifies the code of the currency of the amounts on the purchase lines.';
                ApplicationArea = All;
            }
            field(currencyFactor; Rec."Currency Factor")
            {
                Caption = 'Currency Factor';
                ToolTip = 'Specifies the Currency Factor.';
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
            field(purchaserCode; Rec."Purchaser Code")
            {
                Caption = 'Purchaser Code';
                ToolTip = 'Specifies which purchaser is assigned to the vendor.';
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
            field(receive; Rec.Receive)
            {
                Caption = 'Receive';
                ToolTip = 'Specifies the Receive.';
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
            field(receivingNo; Rec."Receiving No.")
            {
                Caption = 'Receiving No.';
                ToolTip = 'Specifies the Receiving No..';
                ApplicationArea = All;
            }
            field(postingNo; Rec."Posting No.")
            {
                Caption = 'Posting No.';
                ToolTip = 'Specifies the Posting No..';
                ApplicationArea = All;
            }
            field(lastReceivingNo; Rec."Last Receiving No.")
            {
                Caption = 'Last Receiving No.';
                ToolTip = 'Specifies the Last Receiving No..';
                ApplicationArea = All;
            }
            field(lastPostingNo; Rec."Last Posting No.")
            {
                Caption = 'Last Posting No.';
                ToolTip = 'Specifies the Last Posting No..';
                ApplicationArea = All;
            }
            field(vendorOrderNo; Rec."Vendor Order No.")
            {
                Caption = 'Vendor Order No.';
                ToolTip = 'Specifies the vendor';
                ApplicationArea = All;
            }
            field(vendorShipmentNo; Rec."Vendor Shipment No.")
            {
                Caption = 'Vendor Shipment No.';
                ToolTip = 'Specifies the Vendor Shipment No..';
                ApplicationArea = All;
            }
            field(vendorInvoiceNo; Rec."Vendor Invoice No.")
            {
                Caption = 'Vendor Invoice No.';
                ToolTip = 'Specifies the Vendor Invoice No..';
                ApplicationArea = All;
            }
            field(vendorCrMemoNo; Rec."Vendor Cr. Memo No.")
            {
                Caption = 'Vendor Cr. Memo No.';
                ToolTip = 'Specifies the Vendor Cr. Memo No..';
                ApplicationArea = All;
            }
            field(vatRegistrationNo; Rec."VAT Registration No.")
            {
                Caption = 'VAT Registration No.';
                ToolTip = 'Specifies the VAT Registration No..';
                ApplicationArea = All;
            }
            field(sellToCustomerNo; Rec."Sell-to Customer No.")
            {
                Caption = 'Sell-to Customer No.';
                ToolTip = 'Specifies the Sell-to Customer No..';
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
            field(buyFromVendorName; Rec."Buy-from Vendor Name")
            {
                Caption = 'Buy-from Vendor Name';
                ToolTip = 'Specifies the name of the vendor that you’re buying from. By default, the same vendor is suggested as the pay-to vendor. If needed, you can specify a different pay-to vendor on the document.';
                ApplicationArea = All;
            }
            field(buyFromVendorName2; Rec."Buy-from Vendor Name 2")
            {
                Caption = 'Buy-from Vendor Name 2';
                ToolTip = 'Specifies an additional part of the name of the vendor that you’re buying from.';
                ApplicationArea = All;
            }
            field(buyFromAddress; Rec."Buy-from Address")
            {
                Caption = 'Buy-from Address';
                ToolTip = 'Specifies the Buy-from Address.';
                ApplicationArea = All;
            }
            field(buyFromAddress2; Rec."Buy-from Address 2")
            {
                Caption = 'Buy-from Address 2';
                ToolTip = 'Specifies the Buy-from Address 2.';
                ApplicationArea = All;
            }
            field(buyFromCity; Rec."Buy-from City")
            {
                Caption = 'Buy-from City';
                ToolTip = 'Specifies the Buy-from City.';
                ApplicationArea = All;
            }
            field(buyFromContact; Rec."Buy-from Contact")
            {
                Caption = 'Buy-from Contact';
                ToolTip = 'Specifies the name of the contact person at the vendor who delivered the items.';
                ApplicationArea = All;
            }
            field(payToPostCode; Rec."Pay-to Post Code")
            {
                Caption = 'Pay-to Post Code';
                ToolTip = 'Specifies the post code of the vendor that you received the invoice from.';
                ApplicationArea = All;
            }
            field(payToCounty; Rec."Pay-to County")
            {
                Caption = 'Pay-to County';
                ToolTip = 'Specifies the Pay-to County.';
                ApplicationArea = All;
            }
            field(payToCountryRegionCode; Rec."Pay-to Country/Region Code")
            {
                Caption = 'Pay-to Country/Region Code';
                ToolTip = 'Specifies the country/region code of the address.';
                ApplicationArea = All;
            }
            field(buyFromPostCode; Rec."Buy-from Post Code")
            {
                Caption = 'Buy-from Post Code';
                ToolTip = 'Specifies the post code of the vendor who delivered the items.';
                ApplicationArea = All;
            }
            field(buyFromCounty; Rec."Buy-from County")
            {
                Caption = 'Buy-from County';
                ToolTip = 'Specifies the Buy-from County.';
                ApplicationArea = All;
            }
            field(buyFromCountryRegionCode; Rec."Buy-from Country/Region Code")
            {
                Caption = 'Buy-from Country/Region Code';
                ToolTip = 'Specifies the city of the vendor who delivered the items.';
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
            field(orderAddressCode; Rec."Order Address Code")
            {
                Caption = 'Order Address Code';
                ToolTip = 'Specifies the order address of the related vendor.';
                ApplicationArea = All;
            }
            field(entryPoint; Rec."Entry Point")
            {
                Caption = 'Entry Point';
                ToolTip = 'Specifies the Entry Point.';
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
                ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
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
            field(receivingNoSeries; Rec."Receiving No. Series")
            {
                Caption = 'Receiving No. Series';
                ToolTip = 'Specifies the Receiving No. Series.';
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
                ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
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
            field(buyFromIcPartnerCode; Rec."Buy-from IC Partner Code")
            {
                Caption = 'Buy-from IC Partner Code';
                ToolTip = 'Specifies the Buy-from IC Partner Code.';
                ApplicationArea = All;
            }
            field(payToIcPartnerCode; Rec."Pay-to IC Partner Code")
            {
                Caption = 'Pay-to IC Partner Code';
                ToolTip = 'Specifies the Pay-to IC Partner Code.';
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
                ToolTip = 'Specifies the Quote No..';
                ApplicationArea = All;
            }
            field(jobQueueStatus; Rec."Job Queue Status")
            {
                Caption = 'Job Queue Status';
                ToolTip = 'Specifies the status of a job queue entry that handles the posting of purchase orders.';
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
            field(invoiceReceivedDate; Rec."Invoice Received Date")
            {
                Caption = 'Invoice Received Date';
                ToolTip = 'Specifies the Invoice Received Date.';
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
            field(shipToPhoneNo; Rec."Ship-to Phone No.")
            {
                Caption = 'Ship-to Phone No.';
                ToolTip = 'Specifies the Ship-to Phone No..';
                ApplicationArea = All;
            }
            field(aRcdNotInvExVatLcy; Rec."A. Rcd. Not Inv. Ex. VAT (LCY)")
            {
                Caption = 'Amount Received Not Invoiced (LCY)';
                ToolTip = 'Specifies the amount excluding VAT for the items on the order that have been received but are not yet invoiced.';
                ApplicationArea = All;
            }
            field(amtRcdNotInvoicedLcy; Rec."Amt. Rcd. Not Invoiced (LCY)")
            {
                Caption = 'Amount Received Not Invoiced (LCY) Incl. VAT';
                ToolTip = 'Specifies the sum, in LCY, for items that have been received but have not yet been invoiced. The value in the Amt. Rcd. Not Invoiced (LCY) field is used for entries in the Purchase Line table of document type Order to calculate and update the content';
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
                ToolTip = 'Specifies the Campaign No..';
                ApplicationArea = All;
            }
            field(buyFromContactNo; Rec."Buy-from Contact No.")
            {
                Caption = 'Buy-from Contact No.';
                ToolTip = 'Specifies the Buy-from Contact No..';
                ApplicationArea = All;
            }
            field(payToContactNo; Rec."Pay-to Contact No.")
            {
                Caption = 'Pay-to Contact No.';
                ToolTip = 'Specifies the Pay-to Contact No..';
                ApplicationArea = All;
            }
            field(responsibilityCenter; Rec."Responsibility Center")
            {
                Caption = 'Responsibility Center';
                ToolTip = 'Specifies the Responsibility Center.';
                ApplicationArea = All;
            }
            field(partiallyInvoiced; Rec."Partially Invoiced")
            {
                Caption = 'Partially Invoiced';
                ToolTip = 'Specifies the Partially Invoiced.';
                ApplicationArea = All;
            }
            field(completelyReceived; Rec."Completely Received")
            {
                Caption = 'Completely Received';
                ToolTip = 'Specifies the Completely Received.';
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
            field(receivedNotInvoiced; Rec."Received Not Invoiced")
            {
                Caption = 'Received Not Invoiced';
                ToolTip = 'Specifies the Received Not Invoiced.';
                ApplicationArea = All;
            }
            field(requestedReceiptDate; Rec."Requested Receipt Date")
            {
                Caption = 'Requested Receipt Date';
                ToolTip = 'Specifies the date that you want the vendor to deliver to the ship-to address. The value in the field is used to calculate the latest date you can order the items to have them delivered on the requested receipt date. If you do not need delivery on a ';
                ApplicationArea = All;
            }
            field(promisedReceiptDate; Rec."Promised Receipt Date")
            {
                Caption = 'Promised Receipt Date';
                ToolTip = 'Specifies the Promised Receipt Date.';
                ApplicationArea = All;
            }
            field(leadTimeCalculation; Rec."Lead Time Calculation")
            {
                Caption = 'Lead Time Calculation';
                ToolTip = 'Specifies the Lead Time Calculation.';
                ApplicationArea = All;
            }
            field(inboundWhseHandlingTime; Rec."Inbound Whse. Handling Time")
            {
                Caption = 'Inbound Whse. Handling Time';
                ToolTip = 'Specifies the Inbound Whse. Handling Time.';
                ApplicationArea = All;
            }
            field(dateFilter; Rec."Date Filter")
            {
                Caption = 'Date Filter';
                ToolTip = 'Specifies the Date Filter.';
                ApplicationArea = All;
            }
            field(vendorAuthorizationNo; Rec."Vendor Authorization No.")
            {
                Caption = 'Vendor Authorization No.';
                ToolTip = 'Specifies the compensation agreement identification number, sometimes referred to as the RMA No. (Returns Materials Authorization).';
                ApplicationArea = All;
            }
            field(returnShipmentNo; Rec."Return Shipment No.")
            {
                Caption = 'Return Shipment No.';
                ToolTip = 'Specifies the Return Shipment No..';
                ApplicationArea = All;
            }
            field(returnShipmentNoSeries; Rec."Return Shipment No. Series")
            {
                Caption = 'Return Shipment No. Series';
                ToolTip = 'Specifies the Return Shipment No. Series.';
                ApplicationArea = All;
            }
            field(ship; Rec.Ship)
            {
                Caption = 'Ship';
                ToolTip = 'Specifies the Ship.';
                ApplicationArea = All;
            }
            field(lastReturnShipmentNo; Rec."Last Return Shipment No.")
            {
                Caption = 'Last Return Shipment No.';
                ToolTip = 'Specifies the Last Return Shipment No..';
                ApplicationArea = All;
            }
            field(priceCalculationMethod; Rec."Price Calculation Method")
            {
                Caption = 'Price Calculation Method';
                ToolTip = 'Specifies the Price Calculation Method.';
                ApplicationArea = All;
            }
            field(assignedUserId; Rec."Assigned User ID")
            {
                Caption = 'Assigned User ID';
                ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                ApplicationArea = All;
            }
            field(pendingApprovals; Rec."Pending Approvals")
            {
                Caption = 'Pending Approvals';
                ToolTip = 'Specifies the Pending Approvals.';
                ApplicationArea = All;
            }
            }
        }
    }
}
