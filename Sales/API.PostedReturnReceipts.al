namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.History;

page 90884 "ocpfPostedReturnReceipts"
{
    PageType = API;
    Caption = 'Posted return receipts (items received back from customers).';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_sales';
    APIVersion = 'v3.0';
    EntityName = 'ocpfPostedReturnReceipt';
    EntitySetName = 'ocpfPostedReturnReceipts';
    SourceTable = "Return Receipt Header";
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
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                    {
                        Caption = 'Sell-to Customer No.';
                        ToolTip = 'Specifies the number of the customer who returned the products.';
                        ApplicationArea = All;
                }
                field(no; Rec."No.")
                    {
                        Caption = 'No.';
                        ToolTip = 'Specifies the No..';
                        ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                    {
                        Caption = 'Bill-to Customer No.';
                        ToolTip = 'Specifies the number of the customer that you send or sent the credit memo to.';
                        ApplicationArea = All;
                }
                field(billToName; Rec."Bill-to Name")
                    {
                        Caption = 'Bill-to Name';
                        ToolTip = 'Specifies the Bill-to Name.';
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
                        ToolTip = 'Specifies the Bill-to Contact.';
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
                field(shipmentDate; Rec."Shipment Date")
                    {
                        Caption = 'Shipment Date';
                        ToolTip = 'Specifies the Shipment Date.';
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
                field(customerPostingGroup; Rec."Customer Posting Group")
                    {
                        Caption = 'Customer Posting Group';
                        ToolTip = 'Specifies the Customer Posting Group.';
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
                        ToolTip = 'Specifies the Salesperson Code.';
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
                        ToolTip = 'Specifies the Sell-to Customer Name.';
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
                        ToolTip = 'Specifies the Sell-to Contact.';
                        ApplicationArea = All;
                }
                field(billToPostCode; Rec."Bill-to Post Code")
                    {
                        Caption = 'Bill-to Post Code';
                        ToolTip = 'Specifies the Bill-to Post Code.';
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
                        ToolTip = 'Specifies the Bill-to Country/Region Code.';
                        ApplicationArea = All;
                }
                field(sellToPostCode; Rec."Sell-to Post Code")
                    {
                        Caption = 'Sell-to Post Code';
                        ToolTip = 'Specifies the Sell-to Post Code.';
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
                        ToolTip = 'Specifies the Sell-to Country/Region Code.';
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
                        ToolTip = 'Specifies the Document Date.';
                        ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                    {
                        Caption = 'External Document No.';
                        ToolTip = 'Specifies the External Document No..';
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
                        ToolTip = 'Specifies the Shipping Agent Code.';
                        ApplicationArea = All;
                }
                field(packageTrackingNo; Rec."Package Tracking No.")
                    {
                        Caption = 'Package Tracking No.';
                        ToolTip = 'Specifies the Package Tracking No..';
                        ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                    {
                        Caption = 'No. Series';
                        ToolTip = 'Specifies the No. Series.';
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
                field(rcvdFromCountRegionCode; Rec."Rcvd.-from Count./Region Code")
                    {
                        Caption = 'Received-from Country/Region Code';
                        ToolTip = 'Specifies the Rcvd.-from Count./Region Code.';
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
                field(campaignNo; Rec."Campaign No.")
                    {
                        Caption = 'Campaign No.';
                        ToolTip = 'Specifies the Campaign No..';
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
                field(responsibilityCenter; Rec."Responsibility Center")
                    {
                        Caption = 'Responsibility Center';
                        ToolTip = 'Specifies the Responsibility Center.';
                        ApplicationArea = All;
                }
                field(requestedDeliveryDate; Rec."Requested Delivery Date")
                    {
                        Caption = 'Requested Delivery Date';
                        ToolTip = 'Specifies the Requested Delivery Date.';
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
                field(warehouseHandlingTime; Rec."Warehouse Handling Time")
                    {
                        Caption = 'Warehouse Handling Time';
                        ToolTip = 'Specifies the Warehouse Handling Time.';
                        ApplicationArea = All;
                }
                field(lateOrderShipping; Rec."Late Order Shipping")
                    {
                        Caption = 'Late Order Shipping';
                        ToolTip = 'Specifies the Late Order Shipping.';
                        ApplicationArea = All;
                }
                field(returnOrderNo; Rec."Return Order No.")
                    {
                        Caption = 'Return Order No.';
                        ToolTip = 'Specifies the Return Order No..';
                        ApplicationArea = All;
                }
                field(returnOrderNoSeries; Rec."Return Order No. Series")
                    {
                        Caption = 'Return Order No. Series';
                        ToolTip = 'Specifies the Return Order No. Series.';
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
            }
        }
    }
}
