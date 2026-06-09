namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.History;

page 90883 "ocpfPostedSalesShipmentLines"
{
    PageType = API;
    Caption = 'Lines of posted sales shipments.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_sales';
    APIVersion = 'v3.0';
    EntityName = 'ocpfPostedSalesShipmentLine';
    EntitySetName = 'ocpfPostedSalesShipmentLines';
    SourceTable = "Sales Shipment Line";
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
                        ToolTip = 'Specifies the Sell-to Customer No..';
                        ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                    {
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the Document No..';
                        ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                    {
                        Caption = 'Line No.';
                        ToolTip = 'Specifies the Line No..';
                        ApplicationArea = All;
                }
                field(type; Rec.Type)
                    {
                        Caption = 'Type';
                        ToolTip = 'Specifies the Type.';
                        ApplicationArea = All;
                }
                field(no; Rec."No.")
                    {
                        Caption = 'No.';
                        ToolTip = 'Specifies the No..';
                        ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                    {
                        Caption = 'Location Code';
                        ToolTip = 'Specifies the Location Code.';
                        ApplicationArea = All;
                }
                field(postingGroup; Rec."Posting Group")
                    {
                        Caption = 'Posting Group';
                        ToolTip = 'Specifies the Posting Group.';
                        ApplicationArea = All;
                }
                field(shipmentDate; Rec."Shipment Date")
                    {
                        Caption = 'Shipment Date';
                        ToolTip = 'Specifies the Shipment Date.';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                    {
                        Caption = 'Description 2';
                        ToolTip = 'Specifies the Description 2.';
                        ApplicationArea = All;
                }
                field(unitOfMeasure; Rec."Unit of Measure")
                    {
                        Caption = 'Unit of Measure';
                        ToolTip = 'Specifies the Unit of Measure.';
                        ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                    {
                        Caption = 'Quantity';
                        ToolTip = 'Specifies the Quantity.';
                        ApplicationArea = All;
                }
                field(unitPrice; Rec."Unit Price")
                    {
                        Caption = 'Unit Price';
                        ToolTip = 'Specifies the Unit Price.';
                        ApplicationArea = All;
                }
                field(unitCostLcy; Rec."Unit Cost (LCY)")
                    {
                        Caption = 'Unit Cost (LCY)';
                        ToolTip = 'Specifies the Unit Cost (LCY).';
                        ApplicationArea = All;
                }
                field(vatPct; Rec."VAT %")
                    {
                        Caption = 'VAT %';
                        ToolTip = 'Specifies the VAT %.';
                        ApplicationArea = All;
                }
                field(lineDiscountPct; Rec."Line Discount %")
                    {
                        Caption = 'Line Discount %';
                        ToolTip = 'Specifies the Line Discount %.';
                        ApplicationArea = All;
                }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
                    {
                        Caption = 'Allow Invoice Disc.';
                        ToolTip = 'Specifies the Allow Invoice Disc..';
                        ApplicationArea = All;
                }
                field(grossWeight; Rec."Gross Weight")
                    {
                        Caption = 'Gross Weight';
                        ToolTip = 'Specifies the Gross Weight.';
                        ApplicationArea = All;
                }
                field(netWeight; Rec."Net Weight")
                    {
                        Caption = 'Net Weight';
                        ToolTip = 'Specifies the Net Weight.';
                        ApplicationArea = All;
                }
                field(unitsPerParcel; Rec."Units per Parcel")
                    {
                        Caption = 'Units per Parcel';
                        ToolTip = 'Specifies the Units per Parcel.';
                        ApplicationArea = All;
                }
                field(unitVolume; Rec."Unit Volume")
                    {
                        Caption = 'Unit Volume';
                        ToolTip = 'Specifies the Unit Volume.';
                        ApplicationArea = All;
                }
                field(applToItemEntry; Rec."Appl.-to Item Entry")
                    {
                        Caption = 'Appl.-to Item Entry';
                        ToolTip = 'Specifies the Appl.-to Item Entry.';
                        ApplicationArea = All;
                }
                field(itemShptEntryNo; Rec."Item Shpt. Entry No.")
                    {
                        Caption = 'Item Shpt. Entry No.';
                        ToolTip = 'Specifies the Item Shpt. Entry No..';
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
                field(customerPriceGroup; Rec."Customer Price Group")
                    {
                        Caption = 'Customer Price Group';
                        ToolTip = 'Specifies the Customer Price Group.';
                        ApplicationArea = All;
                }
                field(jobNo; Rec."Job No.")
                    {
                        Caption = 'Project No.';
                        ToolTip = 'Specifies the Job No..';
                        ApplicationArea = All;
                }
                field(workTypeCode; Rec."Work Type Code")
                    {
                        Caption = 'Work Type Code';
                        ToolTip = 'Specifies the Work Type Code.';
                        ApplicationArea = All;
                }
                field(qtyShippedNotInvoiced; Rec."Qty. Shipped Not Invoiced")
                    {
                        Caption = 'Qty. Shipped Not Invoiced';
                        ToolTip = 'Specifies the Qty. Shipped Not Invoiced.';
                        ApplicationArea = All;
                }
                field(quantityInvoiced; Rec."Quantity Invoiced")
                    {
                        Caption = 'Quantity Invoiced';
                        ToolTip = 'Specifies the Quantity Invoiced.';
                        ApplicationArea = All;
                }
                field(orderNo; Rec."Order No.")
                    {
                        Caption = 'Order No.';
                        ToolTip = 'Specifies the Order No..';
                        ApplicationArea = All;
                }
                field(orderLineNo; Rec."Order Line No.")
                    {
                        Caption = 'Order Line No.';
                        ToolTip = 'Specifies the Order Line No..';
                        ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                    {
                        Caption = 'Bill-to Customer No.';
                        ToolTip = 'Specifies the Bill-to Customer No..';
                        ApplicationArea = All;
                }
                field(purchaseOrderNo; Rec."Purchase Order No.")
                    {
                        Caption = 'Purchase Order No.';
                        ToolTip = 'Specifies the Purchase Order No..';
                        ApplicationArea = All;
                }
                field(purchOrderLineNo; Rec."Purch. Order Line No.")
                    {
                        Caption = 'Purch. Order Line No.';
                        ToolTip = 'Specifies the Purch. Order Line No..';
                        ApplicationArea = All;
                }
                field(dropShipment; Rec."Drop Shipment")
                    {
                        Caption = 'Drop Shipment';
                        ToolTip = 'Specifies the Drop Shipment.';
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
                field(attachedToLineNo; Rec."Attached to Line No.")
                    {
                        Caption = 'Attached to Line No.';
                        ToolTip = 'Specifies the Attached to Line No..';
                        ApplicationArea = All;
                }
                field(exitPoint; Rec."Exit Point")
                    {
                        Caption = 'Exit Point';
                        ToolTip = 'Specifies the Exit Point.';
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
                field(currencyCode; Rec."Currency Code")
                    {
                        Caption = 'Currency Code';
                        ToolTip = 'Specifies the Currency Code.';
                        ApplicationArea = All;
                }
                field(blanketOrderNo; Rec."Blanket Order No.")
                    {
                        Caption = 'Blanket Order No.';
                        ToolTip = 'Specifies the Blanket Order No..';
                        ApplicationArea = All;
                }
                field(blanketOrderLineNo; Rec."Blanket Order Line No.")
                    {
                        Caption = 'Blanket Order Line No.';
                        ToolTip = 'Specifies the Blanket Order Line No..';
                        ApplicationArea = All;
                }
                field(vatBaseAmount; Rec."VAT Base Amount")
                    {
                        Caption = 'VAT Base Amount';
                        ToolTip = 'Specifies the VAT Base Amount.';
                        ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                    {
                        Caption = 'Unit Cost';
                        ToolTip = 'Specifies the Unit Cost.';
                        ApplicationArea = All;
                }
                field(icPartnerRefType; Rec."IC Partner Ref. Type")
                    {
                        Caption = 'IC Partner Ref. Type';
                        ToolTip = 'Specifies the IC Partner Ref. Type.';
                        ApplicationArea = All;
                }
                field(icPartnerReference; Rec."IC Partner Reference")
                    {
                        Caption = 'IC Partner Reference';
                        ToolTip = 'Specifies the IC Partner Reference.';
                        ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                    {
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the Posting Date.';
                        ApplicationArea = All;
                }
                field(icItemReferenceNo; Rec."IC Item Reference No.")
                    {
                        Caption = 'IC Item Reference No.';
                        ToolTip = 'Specifies the IC Item Reference No..';
                        ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                    {
                        Caption = 'Dimension Set ID';
                        ToolTip = 'Specifies the Dimension Set ID.';
                        ApplicationArea = All;
                }
                field(authorizedForCreditCard; Rec."Authorized for Credit Card")
                    {
                        Caption = 'Authorized for Credit Card';
                        ToolTip = 'Specifies the Authorized for Credit Card.';
                        ApplicationArea = All;
                }
                field(jobTaskNo; Rec."Job Task No.")
                    {
                        Caption = 'Project Task No.';
                        ToolTip = 'Specifies the Job Task No..';
                        ApplicationArea = All;
                }
                field(jobContractEntryNo; Rec."Job Contract Entry No.")
                    {
                        Caption = 'Project Contract Entry No.';
                        ToolTip = 'Specifies the Job Contract Entry No..';
                        ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                    {
                        Caption = 'Variant Code';
                        ToolTip = 'Specifies the Variant Code.';
                        ApplicationArea = All;
                }
                field(binCode; Rec."Bin Code")
                    {
                        Caption = 'Bin Code';
                        ToolTip = 'Specifies the Bin Code.';
                        ApplicationArea = All;
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                    {
                        Caption = 'Qty. per Unit of Measure';
                        ToolTip = 'Specifies the Qty. per Unit of Measure.';
                        ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                    {
                        Caption = 'Unit of Measure Code';
                        ToolTip = 'Specifies the Unit of Measure Code.';
                        ApplicationArea = All;
                }
                field(quantityBase; Rec."Quantity (Base)")
                    {
                        Caption = 'Quantity (Base)';
                        ToolTip = 'Specifies the Quantity (Base).';
                        ApplicationArea = All;
                }
                field(qtyInvoicedBase; Rec."Qty. Invoiced (Base)")
                    {
                        Caption = 'Qty. Invoiced (Base)';
                        ToolTip = 'Specifies the Qty. Invoiced (Base).';
                        ApplicationArea = All;
                }
                field(faPostingDate; Rec."FA Posting Date")
                    {
                        Caption = 'FA Posting Date';
                        ToolTip = 'Specifies the FA Posting Date.';
                        ApplicationArea = All;
                }
                field(depreciationBookCode; Rec."Depreciation Book Code")
                    {
                        Caption = 'Depreciation Book Code';
                        ToolTip = 'Specifies the Depreciation Book Code.';
                        ApplicationArea = All;
                }
                field(deprUntilFaPostingDate; Rec."Depr. until FA Posting Date")
                    {
                        Caption = 'Depr. until FA Posting Date';
                        ToolTip = 'Specifies the Depr. until FA Posting Date.';
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
                field(responsibilityCenter; Rec."Responsibility Center")
                    {
                        Caption = 'Responsibility Center';
                        ToolTip = 'Specifies the Responsibility Center.';
                        ApplicationArea = All;
                }
                field(itemCategoryCode; Rec."Item Category Code")
                    {
                        Caption = 'Item Category Code';
                        ToolTip = 'Specifies the Item Category Code.';
                        ApplicationArea = All;
                }
                field(nonstock; Rec.Nonstock)
                    {
                        Caption = 'Catalog';
                        ToolTip = 'Specifies the Nonstock.';
                        ApplicationArea = All;
                }
                field(purchasingCode; Rec."Purchasing Code")
                    {
                        Caption = 'Purchasing Code';
                        ToolTip = 'Specifies the Purchasing Code.';
                        ApplicationArea = All;
                }
                field(itemReferenceNo; Rec."Item Reference No.")
                    {
                        Caption = 'Item Reference No.';
                        ToolTip = 'Specifies the Item Reference No..';
                        ApplicationArea = All;
                }
                field(itemReferenceUnitOfMeasure; Rec."Item Reference Unit of Measure")
                    {
                        Caption = 'Unit of Measure (Item Ref.)';
                        ToolTip = 'Specifies the Item Reference Unit of Measure.';
                        ApplicationArea = All;
                }
                field(itemReferenceType; Rec."Item Reference Type")
                    {
                        Caption = 'Item Reference Type';
                        ToolTip = 'Specifies the Item Reference Type.';
                        ApplicationArea = All;
                }
                field(itemReferenceTypeNo; Rec."Item Reference Type No.")
                    {
                        Caption = 'Item Reference Type No.';
                        ToolTip = 'Specifies the Item Reference Type No..';
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
                field(outboundWhseHandlingTime; Rec."Outbound Whse. Handling Time")
                    {
                        Caption = 'Outbound Whse. Handling Time';
                        ToolTip = 'Specifies the Outbound Whse. Handling Time.';
                        ApplicationArea = All;
                }
                field(plannedDeliveryDate; Rec."Planned Delivery Date")
                    {
                        Caption = 'Planned Delivery Date';
                        ToolTip = 'Specifies the Planned Delivery Date.';
                        ApplicationArea = All;
                }
                field(plannedShipmentDate; Rec."Planned Shipment Date")
                    {
                        Caption = 'Planned Shipment Date';
                        ToolTip = 'Specifies the Planned Shipment Date.';
                        ApplicationArea = All;
                }
                field(applFromItemEntry; Rec."Appl.-from Item Entry")
                    {
                        Caption = 'Appl.-from Item Entry';
                        ToolTip = 'Specifies the Appl.-from Item Entry.';
                        ApplicationArea = All;
                }
                field(itemChargeBaseAmount; Rec."Item Charge Base Amount")
                    {
                        Caption = 'Item Charge Base Amount';
                        ToolTip = 'Specifies the Item Charge Base Amount.';
                        ApplicationArea = All;
                }
                field(correction; Rec.Correction)
                    {
                        Caption = 'Correction';
                        ToolTip = 'Specifies the Correction.';
                        ApplicationArea = All;
                }
                field(returnReasonCode; Rec."Return Reason Code")
                    {
                        Caption = 'Return Reason Code';
                        ToolTip = 'Specifies the Return Reason Code.';
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
                field(customerDiscGroup; Rec."Customer Disc. Group")
                    {
                        Caption = 'Customer Disc. Group';
                        ToolTip = 'Specifies the Customer Disc. Group.';
                        ApplicationArea = All;
                }
                field(documentId; Rec."Document Id")
                    {
                        Caption = 'Document Id';
                        ToolTip = 'Specifies the Document Id.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
