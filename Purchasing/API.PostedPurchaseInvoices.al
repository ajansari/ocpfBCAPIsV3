namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Purchases.History;

page 90896 "ocpfPostedPurchaseInvoices"
{
    PageType = API;
    Caption = 'Posted (finalized) purchase invoices.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_purchasing';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfPostedPurchaseInvoice';
    EntitySetName = 'ocpfPostedPurchaseInvoices';
    SourceTable = "Purch. Inv. Header";
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
                field(buyFromVendorNo; Rec."Buy-from Vendor No.")
                    {
                        Caption = 'Buy-from Vendor No.';
                        ToolTip = 'Specifies the identifier of the vendor that you bought the items from.';
                        ApplicationArea = All;
                }
                field(no; Rec."No.")
                    {
                        Caption = 'No.';
                        ToolTip = 'Specifies the No..';
                        ApplicationArea = All;
                }
                field(payToVendorNo; Rec."Pay-to Vendor No.")
                    {
                        Caption = 'Pay-to Vendor No.';
                        ToolTip = 'Specifies the number of the vendor that you received the invoice from.';
                        ApplicationArea = All;
                }
                field(payToName; Rec."Pay-to Name")
                    {
                        Caption = 'Pay-to Name';
                        ToolTip = 'Specifies the Pay-to Name.';
                        ApplicationArea = All;
                }
                field(payToName2; Rec."Pay-to Name 2")
                    {
                        Caption = 'Pay-to Name 2';
                        ToolTip = 'Specifies an additional part of the name of the vendor who you receive the invoice from.';
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
                        ToolTip = 'Specifies the Pay-to Contact.';
                        ApplicationArea = All;
                }
                field(yourReference; Rec."Your Reference")
                    {
                        Caption = 'Your Reference';
                        ToolTip = 'Specifies the Your Reference.';
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
                        ToolTip = 'Specifies the Ship-to Name.';
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
                        ToolTip = 'Specifies the Ship-to Contact.';
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
                        ToolTip = 'Specifies the Shipment Method Code.';
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
                        ToolTip = 'Specifies the Shortcut Dimension 1 Code.';
                        ApplicationArea = All;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                    {
                        Caption = 'Shortcut Dimension 2 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 2 Code.';
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
                        ToolTip = 'Specifies the Currency Code.';
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
                        ToolTip = 'Specifies the Purchaser Code.';
                        ApplicationArea = All;
                }
                field(orderNo; Rec."Order No.")
                    {
                        Caption = 'Order No.';
                        ToolTip = 'Specifies the Order No..';
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
                field(amount; Rec.Amount)
                    {
                        Caption = 'Amount';
                        ToolTip = 'Specifies the Amount.';
                        ApplicationArea = All;
                }
                field(amountIncludingVat; Rec."Amount Including VAT")
                    {
                        Caption = 'Amount Including VAT';
                        ToolTip = 'Specifies the Amount Including VAT.';
                        ApplicationArea = All;
                }
                field(vendorOrderNo; Rec."Vendor Order No.")
                    {
                        Caption = 'Vendor Order No.';
                        ToolTip = 'Specifies the Vendor Order No..';
                        ApplicationArea = All;
                }
                field(vendorInvoiceNo; Rec."Vendor Invoice No.")
                    {
                        Caption = 'Vendor Invoice No.';
                        ToolTip = 'Specifies the Vendor Invoice No..';
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
                        ToolTip = 'Specifies the Buy-from Vendor Name.';
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
                        ToolTip = 'Specifies the Buy-from Contact.';
                        ApplicationArea = All;
                }
                field(payToPostCode; Rec."Pay-to Post Code")
                    {
                        Caption = 'Pay-to Post Code';
                        ToolTip = 'Specifies the Pay-to Post Code.';
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
                        ToolTip = 'Specifies the Pay-to Country/Region Code.';
                        ApplicationArea = All;
                }
                field(buyFromPostCode; Rec."Buy-from Post Code")
                    {
                        Caption = 'Buy-from Post Code';
                        ToolTip = 'Specifies the Buy-from Post Code.';
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
                        ToolTip = 'Specifies the Buy-from Country/Region Code.';
                        ApplicationArea = All;
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                    {
                        Caption = 'Ship-to Post Code';
                        ToolTip = 'Specifies the Ship-to Post Code.';
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
                        ToolTip = 'Specifies the Ship-to Country/Region Code.';
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
                        ToolTip = 'Specifies the Order Address Code.';
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
                        ToolTip = 'Specifies the Document Date.';
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
                field(preAssignedNoSeries; Rec."Pre-Assigned No. Series")
                    {
                        Caption = 'Pre-Assigned No. Series';
                        ToolTip = 'Specifies the Pre-Assigned No. Series.';
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
                field(preAssignedNo; Rec."Pre-Assigned No.")
                    {
                        Caption = 'Pre-Assigned No.';
                        ToolTip = 'Specifies the Pre-Assigned No..';
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
                field(prepaymentNoSeries; Rec."Prepayment No. Series")
                    {
                        Caption = 'Prepayment No. Series';
                        ToolTip = 'Specifies the Prepayment No. Series.';
                        ApplicationArea = All;
                }
                field(prepaymentInvoice; Rec."Prepayment Invoice")
                    {
                        Caption = 'Prepayment Invoice';
                        ToolTip = 'Specifies the Prepayment Invoice.';
                        ApplicationArea = All;
                }
                field(prepaymentOrderNo; Rec."Prepayment Order No.")
                    {
                        Caption = 'Prepayment Order No.';
                        ToolTip = 'Specifies the Prepayment Order No..';
                        ApplicationArea = All;
                }
                field(quoteNo; Rec."Quote No.")
                    {
                        Caption = 'Quote No.';
                        ToolTip = 'Specifies the Quote No..';
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
                field(closed; Rec.Closed)
                    {
                        Caption = 'Closed';
                        ToolTip = 'Specifies the Closed.';
                        ApplicationArea = All;
                }
                field(remainingAmount; Rec."Remaining Amount")
                    {
                        Caption = 'Remaining Amount';
                        ToolTip = 'Specifies the Remaining Amount.';
                        ApplicationArea = All;
                }
                field(vendorLedgerEntryNo; Rec."Vendor Ledger Entry No.")
                    {
                        Caption = 'Vendor Ledger Entry No.';
                        ToolTip = 'Specifies the Vendor Ledger Entry No..';
                        ApplicationArea = All;
                }
                field(invoiceDiscountAmount; Rec."Invoice Discount Amount")
                    {
                        Caption = 'Invoice Discount Amount';
                        ToolTip = 'Specifies the Invoice Discount Amount.';
                        ApplicationArea = All;
                }
                field(cancelled; Rec.Cancelled)
                    {
                        Caption = 'Cancelled';
                        ToolTip = 'Specifies the Cancelled.';
                        ApplicationArea = All;
                }
                field(corrective; Rec.Corrective)
                    {
                        Caption = 'Corrective';
                        ToolTip = 'Specifies the Corrective.';
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
                field(priceCalculationMethod; Rec."Price Calculation Method")
                    {
                        Caption = 'Price Calculation Method';
                        ToolTip = 'Specifies the Price Calculation Method.';
                        ApplicationArea = All;
                }
                field(draftInvoiceSystemid; Rec."Draft Invoice SystemId")
                    {
                        Caption = 'Draft Invoice SystemId';
                        ToolTip = 'Specifies the Draft Invoice SystemId.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
