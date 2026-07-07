namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.History;

page 90995 "ocpfServiceShipmentLines"
{
    PageType = API;
    Caption = 'Posted Service Shipment Lines — lines of posted service shipments. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceShipmentLine';
    EntitySetName = 'ocpfServiceShipmentLines';
    SourceTable = "Service Shipment Line";
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
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the number of this shipment.';
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the number of the shipment line.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type of this shipment line.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location, such as warehouse or distribution center, from which the items should be taken and where they should be registered.';
                    ApplicationArea = All;
                }
                field(postingGroup; Rec."Posting Group")
                {
                    Caption = 'Posting Group';
                    ToolTip = 'Specifies the code for the posting group used when the service line was posted.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description of an item, resource, cost, or a standard text on the service line.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies information in addition to the description.';
                    ApplicationArea = All;
                }
                field(unitOfMeasure; Rec."Unit of Measure")
                {
                    Caption = 'Unit of Measure';
                    ToolTip = 'Specifies the name of the item or resource''s unit of measure, such as piece or hour.';
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the number of item units, resource hours, general ledger account payments, or cost that have been shipped to the customer.';
                    ApplicationArea = All;
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                    ApplicationArea = All;
                }
                field(unitCostLcy; Rec."Unit Cost (LCY)")
                {
                    Caption = 'Unit Cost (LCY)';
                    ToolTip = 'Specifies the cost, in LCY, of one unit of the item or resource on the line.';
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
                    ToolTip = 'Specifies the discount percentage that is granted for the item on the line.';
                    ApplicationArea = All;
                }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
                {
                    Caption = 'Allow Invoice Disc.';
                    ToolTip = 'Specifies if the invoice line is included when the invoice discount is calculated.';
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
                    ToolTip = 'Specifies the number of the item ledger entry that the document or journal line is applied to.';
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
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
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
                    ToolTip = 'Specifies the Project No..';
                    ApplicationArea = All;
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Project Task No.';
                    ToolTip = 'Specifies the Project Task No..';
                    ApplicationArea = All;
                }
                field(workTypeCode; Rec."Work Type Code")
                {
                    Caption = 'Work Type Code';
                    ToolTip = 'Specifies a code for the type of work performed under the posted service order.';
                    ApplicationArea = All;
                }
                field(qtyShippedNotInvoiced; Rec."Qty. Shipped Not Invoiced")
                {
                    Caption = 'Qty. Shipped Not Invoiced';
                    ToolTip = 'Specifies the quantity of the shipped item that has been posted as shipped but that has not yet been posted as invoiced.';
                    ApplicationArea = All;
                }
                field(quantityInvoiced; Rec."Quantity Invoiced")
                {
                    Caption = 'Quantity Invoiced';
                    ToolTip = 'Specifies how many units of the item on the line have been posted as invoiced.';
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
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
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
                    ToolTip = 'Specifies the currency code for various amounts on the shipment.';
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
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
                field(timeSheetNo; Rec."Time Sheet No.")
                {
                    Caption = 'Time Sheet No.';
                    ToolTip = 'Specifies the Time Sheet No..';
                    ApplicationArea = All;
                }
                field(timeSheetLineNo; Rec."Time Sheet Line No.")
                {
                    Caption = 'Time Sheet Line No.';
                    ToolTip = 'Specifies the Time Sheet Line No..';
                    ApplicationArea = All;
                }
                field(timeSheetDate; Rec."Time Sheet Date")
                {
                    Caption = 'Time Sheet Date';
                    ToolTip = 'Specifies the Time Sheet Date.';
                    ApplicationArea = All;
                }
                field(jobPlanningLineNo; Rec."Job Planning Line No.")
                {
                    Caption = 'Project Planning Line No.';
                    ToolTip = 'Specifies the Project Planning Line No..';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant of the item on the line.';
                    ApplicationArea = All;
                }
                field(binCode; Rec."Bin Code")
                {
                    Caption = 'Bin Code';
                    ToolTip = 'Specifies the bin where the items are picked or put away.';
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
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    ApplicationArea = All;
                }
                field(quantityBase; Rec."Quantity (Base)")
                {
                    Caption = 'Quantity (Base)';
                    ToolTip = 'Specifies the Quantity (Base).';
                    ApplicationArea = All;
                }
                field(qtyShippedNotInvdBase; Rec."Qty. Shipped Not Invd. (Base)")
                {
                    Caption = 'Qty. Shipped Not Invd. (Base)';
                    ToolTip = 'Specifies the Qty. Shipped Not Invd. (Base).';
                    ApplicationArea = All;
                }
                field(qtyInvoicedBase; Rec."Qty. Invoiced (Base)")
                {
                    Caption = 'Qty. Invoiced (Base)';
                    ToolTip = 'Specifies the Qty. Invoiced (Base).';
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
                field(nonstock; Rec."Nonstock")
                {
                    Caption = 'Catalog';
                    ToolTip = 'Specifies that the item on the shipment line is a catalog item.';
                    ApplicationArea = All;
                }
                field(correction; Rec."Correction")
                {
                    Caption = 'Correction';
                    ToolTip = 'Specifies the Correction.';
                    ApplicationArea = All;
                }
                field(applToWarrantyEntry; Rec."Appl.-to Warranty Entry")
                {
                    Caption = 'Appl.-to Warranty Entry';
                    ToolTip = 'Specifies the Appl.-to Warranty Entry.';
                    ApplicationArea = All;
                }
                field(serviceItemNo; Rec."Service Item No.")
                {
                    Caption = 'Service Item No.';
                    ToolTip = 'Specifies the number of the service item to which this service line is linked.';
                    ApplicationArea = All;
                }
                field(applToServiceEntry; Rec."Appl.-to Service Entry")
                {
                    Caption = 'Appl.-to Service Entry';
                    ToolTip = 'Specifies the Appl.-to Service Entry.';
                    ApplicationArea = All;
                }
                field(serviceItemLineNo; Rec."Service Item Line No.")
                {
                    Caption = 'Service Item Line No.';
                    ToolTip = 'Specifies the number of the service item line to which this service line is linked.';
                    ApplicationArea = All;
                }
                field(serviceItemSerialNo; Rec."Service Item Serial No.")
                {
                    Caption = 'Service Item Serial No.';
                    ToolTip = 'Specifies the serial number of the service item to which this shipment line is linked.';
                    ApplicationArea = All;
                }
                field(serviceItemLineDescription; Rec."Service Item Line Description")
                {
                    Caption = 'Service Item Line Description';
                    ToolTip = 'Specifies the Service Item Line Description.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the date when the service line was posted.';
                    ApplicationArea = All;
                }
                field(orderDate; Rec."Order Date")
                {
                    Caption = 'Order Date';
                    ToolTip = 'Specifies the date when the related order was created.';
                    ApplicationArea = All;
                }
                field(neededByDate; Rec."Needed by Date")
                {
                    Caption = 'Needed by Date';
                    ToolTip = 'Specifies the Needed by Date.';
                    ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    ApplicationArea = All;
                }
                field(quantityConsumed; Rec."Quantity Consumed")
                {
                    Caption = 'Quantity Consumed';
                    ToolTip = 'Specifies the number of units of items, resource hours, general ledger account payments, or costs that have been posted as consumed.';
                    ApplicationArea = All;
                }
                field(qtyConsumedBase; Rec."Qty. Consumed (Base)")
                {
                    Caption = 'Qty. Consumed (Base)';
                    ToolTip = 'Specifies the Qty. Consumed (Base).';
                    ApplicationArea = All;
                }
                field(servicePriceGroupCode; Rec."Service Price Group Code")
                {
                    Caption = 'Service Price Group Code';
                    ToolTip = 'Specifies the Service Price Group Code.';
                    ApplicationArea = All;
                }
                field(faultAreaCode; Rec."Fault Area Code")
                {
                    Caption = 'Fault Area Code';
                    ToolTip = 'Specifies the code of the fault area associated with this service line.';
                    ApplicationArea = All;
                }
                field(symptomCode; Rec."Symptom Code")
                {
                    Caption = 'Symptom Code';
                    ToolTip = 'Specifies the code of the symptom associated with this service shipment line.';
                    ApplicationArea = All;
                }
                field(faultCode; Rec."Fault Code")
                {
                    Caption = 'Fault Code';
                    ToolTip = 'Specifies the fault code associated with this service shipment line.';
                    ApplicationArea = All;
                }
                field(resolutionCode; Rec."Resolution Code")
                {
                    Caption = 'Resolution Code';
                    ToolTip = 'Specifies the code of the resolution associated with this service shipment line.';
                    ApplicationArea = All;
                }
                field(excludeWarranty; Rec."Exclude Warranty")
                {
                    Caption = 'Exclude Warranty';
                    ToolTip = 'Specifies that the warranty discount is excluded on this service shipment line.';
                    ApplicationArea = All;
                }
                field(warranty; Rec."Warranty")
                {
                    Caption = 'Warranty';
                    ToolTip = 'Specifies that a warranty discount is available on this service shipment line of type Item or Resource.';
                    ApplicationArea = All;
                }
                field(contractNo; Rec."Contract No.")
                {
                    Caption = 'Contract No.';
                    ToolTip = 'Specifies the number of the contract associated with the posted service order.';
                    ApplicationArea = All;
                }
                field(contractDiscPct; Rec."Contract Disc. %")
                {
                    Caption = 'Contract Disc. %';
                    ToolTip = 'Specifies the contract discount percentage valid for the items, resources, and costs on the service shipment line.';
                    ApplicationArea = All;
                }
                field(warrantyDiscPct; Rec."Warranty Disc. %")
                {
                    Caption = 'Warranty Disc. %';
                    ToolTip = 'Specifies the percentage of the warranty discount valid for the items or resources on the service shipment line.';
                    ApplicationArea = All;
                }
                field(componentLineNo; Rec."Component Line No.")
                {
                    Caption = 'Component Line No.';
                    ToolTip = 'Specifies the number of the line in the Service Item Component List window.';
                    ApplicationArea = All;
                }
                field(sparePartAction; Rec."Spare Part Action")
                {
                    Caption = 'Spare Part Action';
                    ToolTip = 'Specifies whether the item has been used to replace the whole service item, one of the service item components, installed as a new component, or as a supplementary tool in the service process.';
                    ApplicationArea = All;
                }
                field(faultReasonCode; Rec."Fault Reason Code")
                {
                    Caption = 'Fault Reason Code';
                    ToolTip = 'Specifies the code of the fault reason for the service shipment line.';
                    ApplicationArea = All;
                }
                field(replacedItemNo; Rec."Replaced Item No.")
                {
                    Caption = 'Replaced Item No.';
                    ToolTip = 'Specifies the number of the service item component replaced by the item on the service line.';
                    ApplicationArea = All;
                }
                field(excludeContractDiscount; Rec."Exclude Contract Discount")
                {
                    Caption = 'Exclude Contract Discount';
                    ToolTip = 'Specifies the Exclude Contract Discount.';
                    ApplicationArea = All;
                }
                field(replacedItemType; Rec."Replaced Item Type")
                {
                    Caption = 'Replaced Item Type';
                    ToolTip = 'Specifies the type of the service item component replaced by the item on the service line.';
                    ApplicationArea = All;
                }
                field(priceAdjmtStatus; Rec."Price Adjmt. Status")
                {
                    Caption = 'Price Adjmt. Status';
                    ToolTip = 'Specifies the Price Adjmt. Status.';
                    ApplicationArea = All;
                }
                field(lineDiscountType; Rec."Line Discount Type")
                {
                    Caption = 'Line Discount Type';
                    ToolTip = 'Specifies the Line Discount Type.';
                    ApplicationArea = All;
                }
                field(copyComponentsFrom; Rec."Copy Components From")
                {
                    Caption = 'Copy Components From';
                    ToolTip = 'Specifies the Copy Components From.';
                    ApplicationArea = All;
                }
                field(returnReasonCode; Rec."Return Reason Code")
                {
                    Caption = 'Return Reason Code';
                    ToolTip = 'Specifies the code explaining why the item was returned.';
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
            }
        }
    }
}
