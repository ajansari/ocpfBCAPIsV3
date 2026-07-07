namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Document;

page 90987 "ocpfServiceLines"
{
    PageType = API;
    Caption = 'Service Lines — the items, resources, and costs consumed or invoiced on service documents.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceLine';
    EntitySetName = 'ocpfServiceLines';
    SourceTable = "Service Line";
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
                    ToolTip = 'Specifies the type of the service document associated with this line.';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the number of the customer who owns the items to be serviced under the service order.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the service order number associated with this line.';
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the number of the line.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type of the service line.';
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
                    ToolTip = 'Specifies the inventory location from where the items on the line should be taken and where they should be registered.';
                    ApplicationArea = All;
                }
                field(postingGroup; Rec."Posting Group")
                {
                    Caption = 'Posting Group';
                    ToolTip = 'Specifies the inventory posting group assigned to the item.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description of an item, resource, cost, or a standard text on the line.';
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
                    ToolTip = 'Specifies the number of item units, resource hours, cost on the service line.';
                    ApplicationArea = All;
                }
                field(outstandingQuantity; Rec."Outstanding Quantity")
                {
                    Caption = 'Outstanding Quantity';
                    ToolTip = 'Specifies the Outstanding Quantity.';
                    ApplicationArea = All;
                }
                field(qtyToInvoice; Rec."Qty. to Invoice")
                {
                    Caption = 'Qty. to Invoice';
                    ToolTip = 'Specifies the quantity of the items, resources, costs, or general ledger account payments, which should be invoiced.';
                    ApplicationArea = All;
                }
                field(qtyToShip; Rec."Qty. to Ship")
                {
                    Caption = 'Qty. to Ship';
                    ToolTip = 'Specifies the quantity of items that remain to be shipped.';
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
                    ToolTip = 'Specifies the VAT percentage used to calculate Amount Including VAT on this line.';
                    ApplicationArea = All;
                }
                field(lineDiscountPct; Rec."Line Discount %")
                {
                    Caption = 'Line Discount %';
                    ToolTip = 'Specifies the discount percentage that is granted for the item on the line.';
                    ApplicationArea = All;
                }
                field(lineDiscountAmount; Rec."Line Discount Amount")
                {
                    Caption = 'Line Discount Amount';
                    ToolTip = 'Specifies the discount amount that is granted for the item on the line.';
                    ApplicationArea = All;
                }
                field(amount; Rec."Amount")
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the Amount.';
                    ApplicationArea = All;
                }
                field(amountIncludingVat; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including VAT';
                    ToolTip = 'Specifies the net amount, including VAT, for this line.';
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
                    ToolTip = 'Specifies the number of the related project.';
                    ApplicationArea = All;
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Project Task No.';
                    ToolTip = 'Specifies the number of the related project task.';
                    ApplicationArea = All;
                }
                field(jobLineType; Rec."Job Line Type")
                {
                    Caption = 'Project Line Type';
                    ToolTip = 'Specifies the type of journal line that is created in the Project Planning Line table from this line.';
                    ApplicationArea = All;
                }
                field(workTypeCode; Rec."Work Type Code")
                {
                    Caption = 'Work Type Code';
                    ToolTip = 'Specifies a code for the type of work performed by the resource registered on this line.';
                    ApplicationArea = All;
                }
                field(outstandingAmount; Rec."Outstanding Amount")
                {
                    Caption = 'Outstanding Amount';
                    ToolTip = 'Specifies the Outstanding Amount.';
                    ApplicationArea = All;
                }
                field(qtyShippedNotInvoiced; Rec."Qty. Shipped Not Invoiced")
                {
                    Caption = 'Qty. Shipped Not Invoiced';
                    ToolTip = 'Specifies the Qty. Shipped Not Invoiced.';
                    ApplicationArea = All;
                }
                field(shippedNotInvoiced; Rec."Shipped Not Invoiced")
                {
                    Caption = 'Shipped Not Invoiced';
                    ToolTip = 'Specifies the Shipped Not Invoiced.';
                    ApplicationArea = All;
                }
                field(quantityShipped; Rec."Quantity Shipped")
                {
                    Caption = 'Quantity Shipped';
                    ToolTip = 'Specifies how many units of the item on the line have been posted as shipped.';
                    ApplicationArea = All;
                }
                field(quantityInvoiced; Rec."Quantity Invoiced")
                {
                    Caption = 'Quantity Invoiced';
                    ToolTip = 'Specifies how many units of the item on the line have been posted as invoiced.';
                    ApplicationArea = All;
                }
                field(shipmentNo; Rec."Shipment No.")
                {
                    Caption = 'Shipment No.';
                    ToolTip = 'Specifies the number of the correspondent shipment in the posted shipment list.';
                    ApplicationArea = All;
                }
                field(shipmentLineNo; Rec."Shipment Line No.")
                {
                    Caption = 'Shipment Line No.';
                    ToolTip = 'Specifies the Shipment Line No..';
                    ApplicationArea = All;
                }
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    ToolTip = 'Specifies the Order No..';
                    ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
                    ApplicationArea = All;
                }
                field(invDiscountAmount; Rec."Inv. Discount Amount")
                {
                    Caption = 'Inv. Discount Amount';
                    ToolTip = 'Specifies the total calculated invoice discount amount for the line.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
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
                    ToolTip = 'Specifies the tax area that is used to calculate and post sales tax.';
                    ApplicationArea = All;
                }
                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';
                    ToolTip = 'Specifies if the customer or vendor is liable for sales tax.';
                    ApplicationArea = All;
                }
                field(taxGroupCode; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';
                    ToolTip = 'Specifies the tax group that is used to calculate and post sales tax.';
                    ApplicationArea = All;
                }
                field(vatClauseCode; Rec."VAT Clause Code")
                {
                    Caption = 'VAT Clause Code';
                    ToolTip = 'Specifies the VAT Clause Code.';
                    ApplicationArea = All;
                }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                    ApplicationArea = All;
                }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for the amounts on this line.';
                    ApplicationArea = All;
                }
                field(outstandingAmountLcy; Rec."Outstanding Amount (LCY)")
                {
                    Caption = 'Outstanding Amount (LCY)';
                    ToolTip = 'Specifies the Outstanding Amount (LCY).';
                    ApplicationArea = All;
                }
                field(shippedNotInvoicedLcy; Rec."Shipped Not Invoiced (LCY)")
                {
                    Caption = 'Shipped Not Invoiced (LCY)';
                    ToolTip = 'Specifies the Shipped Not Invoiced (LCY).';
                    ApplicationArea = All;
                }
                field(reservedQuantity; Rec."Reserved Quantity")
                {
                    Caption = 'Reserved Quantity';
                    ToolTip = 'Specifies how many item units on this line have been reserved.';
                    ApplicationArea = All;
                }
                field(reserve; Rec."Reserve")
                {
                    Caption = 'Reserve';
                    ToolTip = 'Specifies whether a reservation can be made for items on this line.';
                    ApplicationArea = All;
                }
                field(vatBaseAmount; Rec."VAT Base Amount")
                {
                    Caption = 'VAT Base Amount';
                    ToolTip = 'Specifies the amount that serves as a base for calculating the Amount Including VAT field.';
                    ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the Unit Cost.';
                    ApplicationArea = All;
                }
                field(systemCreatedEntry; Rec."System-Created Entry")
                {
                    Caption = 'System-Created Entry';
                    ToolTip = 'Specifies the System-Created Entry.';
                    ApplicationArea = All;
                }
                field(lineAmount; Rec."Line Amount")
                {
                    Caption = 'Line Amount';
                    ToolTip = 'Specifies the net amount, excluding any invoice discount amount, that must be paid for products on the line.';
                    ApplicationArea = All;
                }
                field(vatDifference; Rec."VAT Difference")
                {
                    Caption = 'VAT Difference';
                    ToolTip = 'Specifies the VAT Difference.';
                    ApplicationArea = All;
                }
                field(invDiscAmountToInvoice; Rec."Inv. Disc. Amount to Invoice")
                {
                    Caption = 'Inv. Disc. Amount to Invoice';
                    ToolTip = 'Specifies the Inv. Disc. Amount to Invoice.';
                    ApplicationArea = All;
                }
                field(vatIdentifier; Rec."VAT Identifier")
                {
                    Caption = 'VAT Identifier';
                    ToolTip = 'Specifies the VAT Identifier.';
                    ApplicationArea = All;
                }
                field(pmtDiscountAmount; Rec."Pmt. Discount Amount")
                {
                    Caption = 'Pmt. Discount Amount';
                    ToolTip = 'Specifies the Pmt. Discount Amount.';
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
                    ToolTip = 'Specifies the project planning line number associated with this line. This establishes a link that can be used to calculate actual usage.';
                    ApplicationArea = All;
                }
                field(jobRemainingQty; Rec."Job Remaining Qty.")
                {
                    Caption = 'Project Remaining Qty.';
                    ToolTip = 'Specifies the quantity that remains to complete a project.';
                    ApplicationArea = All;
                }
                field(jobRemainingQtyBase; Rec."Job Remaining Qty. (Base)")
                {
                    Caption = 'Project Remaining Qty. (Base)';
                    ToolTip = 'Specifies the Project Remaining Qty. (Base).';
                    ApplicationArea = All;
                }
                field(jobRemainingTotalCost; Rec."Job Remaining Total Cost")
                {
                    Caption = 'Project Remaining Total Cost';
                    ToolTip = 'Specifies the remaining total cost, as the sum of costs from project planning lines associated with the order.';
                    ApplicationArea = All;
                }
                field(jobRemainingTotalCostLcy; Rec."Job Remaining Total Cost (LCY)")
                {
                    Caption = 'Project Remaining Total Cost (LCY)';
                    ToolTip = 'Specifies the remaining total cost for the project planning line associated with the service order.';
                    ApplicationArea = All;
                }
                field(jobRemainingLineAmount; Rec."Job Remaining Line Amount")
                {
                    Caption = 'Project Remaining Line Amount';
                    ToolTip = 'Specifies the net amount of the project planning line.';
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
                field(planned; Rec."Planned")
                {
                    Caption = 'Planned';
                    ToolTip = 'Specifies the Planned.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    ApplicationArea = All;
                }
                field(qtyRoundingPrecision; Rec."Qty. Rounding Precision")
                {
                    Caption = 'Qty. Rounding Precision';
                    ToolTip = 'Specifies the Qty. Rounding Precision.';
                    ApplicationArea = All;
                }
                field(qtyRoundingPrecisionBase; Rec."Qty. Rounding Precision (Base)")
                {
                    Caption = 'Qty. Rounding Precision (Base)';
                    ToolTip = 'Specifies the Qty. Rounding Precision (Base).';
                    ApplicationArea = All;
                }
                field(quantityBase; Rec."Quantity (Base)")
                {
                    Caption = 'Quantity (Base)';
                    ToolTip = 'Specifies the quantity of items, resource time, costs, or general ledger account payments, expressed in base units of measure.';
                    ApplicationArea = All;
                }
                field(outstandingQtyBase; Rec."Outstanding Qty. (Base)")
                {
                    Caption = 'Outstanding Qty. (Base)';
                    ToolTip = 'Specifies the quantity of registered items, resource time, costs, or payments to the general ledger account that have not been shipped.';
                    ApplicationArea = All;
                }
                field(qtyToInvoiceBase; Rec."Qty. to Invoice (Base)")
                {
                    Caption = 'Qty. to Invoice (Base)';
                    ToolTip = 'Specifies the Qty. to Invoice (Base).';
                    ApplicationArea = All;
                }
                field(qtyToShipBase; Rec."Qty. to Ship (Base)")
                {
                    Caption = 'Qty. to Ship (Base)';
                    ToolTip = 'Specifies the Qty. to Ship (Base).';
                    ApplicationArea = All;
                }
                field(qtyShippedNotInvdBase; Rec."Qty. Shipped Not Invd. (Base)")
                {
                    Caption = 'Qty. Shipped Not Invd. (Base)';
                    ToolTip = 'Specifies the Qty. Shipped Not Invd. (Base).';
                    ApplicationArea = All;
                }
                field(qtyShippedBase; Rec."Qty. Shipped (Base)")
                {
                    Caption = 'Qty. Shipped (Base)';
                    ToolTip = 'Specifies the Qty. Shipped (Base).';
                    ApplicationArea = All;
                }
                field(qtyInvoicedBase; Rec."Qty. Invoiced (Base)")
                {
                    Caption = 'Qty. Invoiced (Base)';
                    ToolTip = 'Specifies the Qty. Invoiced (Base).';
                    ApplicationArea = All;
                }
                field(reservedQtyBase; Rec."Reserved Qty. (Base)")
                {
                    Caption = 'Reserved Qty. (Base)';
                    ToolTip = 'Specifies the quantity of registered items that have been reserved.';
                    ApplicationArea = All;
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ToolTip = 'Specifies the Responsibility Center.';
                    ApplicationArea = All;
                }
                field(substitutionAvailable; Rec."Substitution Available")
                {
                    Caption = 'Substitution Available';
                    ToolTip = 'Specifies whether a substitute is available for the item.';
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
                    ToolTip = 'Specifies that the item is a catalog item.';
                    ApplicationArea = All;
                }
                field(itemReferenceNo; Rec."Item Reference No.")
                {
                    Caption = 'Item Reference No.';
                    ToolTip = 'Specifies the referenced item number. If you enter a cross reference between yours and your vendor''s or customer''s item number, then this number will override the standard item number when you enter the reference number on a service document.';
                    ApplicationArea = All;
                }
                field(itemReferenceUnitOfMeasure; Rec."Item Reference Unit of Measure")
                {
                    Caption = 'Reference Unit of Measure';
                    ToolTip = 'Specifies the Reference Unit of Measure.';
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
                field(whseOutstandingQtyBase; Rec."Whse. Outstanding Qty. (Base)")
                {
                    Caption = 'Whse. Outstanding Qty. (Base)';
                    ToolTip = 'Specifies the Whse. Outstanding Qty. (Base).';
                    ApplicationArea = All;
                }
                field(completelyShipped; Rec."Completely Shipped")
                {
                    Caption = 'Completely Shipped';
                    ToolTip = 'Specifies the Completely Shipped.';
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
                field(plannedDeliveryDate; Rec."Planned Delivery Date")
                {
                    Caption = 'Planned Delivery Date';
                    ToolTip = 'Specifies the planned date that the shipment will be delivered at the customer''s address. If the customer requests a delivery date, the program calculates whether the items will be available for delivery on this date. If the items are available, the planned delivery date will be the same as the requested delivery date. If not, the program calculates the date that the items are available for delivery and enters this date in the Planned Delivery Date field.';
                    ApplicationArea = All;
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                    ToolTip = 'Specifies the Shipping Agent Code.';
                    ApplicationArea = All;
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                    ToolTip = 'Specifies the Shipping Agent Service Code.';
                    ApplicationArea = All;
                }
                field(applFromItemEntry; Rec."Appl.-from Item Entry")
                {
                    Caption = 'Appl.-from Item Entry';
                    ToolTip = 'Specifies the number of the item ledger entry that the document or journal line is applied from.';
                    ApplicationArea = All;
                }
                field(serviceItemNo; Rec."Service Item No.")
                {
                    Caption = 'Service Item No.';
                    ToolTip = 'Specifies the service item number linked to this service line.';
                    ApplicationArea = All;
                }
                field(applToServiceEntry; Rec."Appl.-to Service Entry")
                {
                    Caption = 'Appl.-to Service Entry';
                    ToolTip = 'Specifies the service ledger entry number this line is applied to.';
                    ApplicationArea = All;
                }
                field(serviceItemLineNo; Rec."Service Item Line No.")
                {
                    Caption = 'Service Item Line No.';
                    ToolTip = 'Specifies the service item line number linked to this service line.';
                    ApplicationArea = All;
                }
                field(serviceItemSerialNo; Rec."Service Item Serial No.")
                {
                    Caption = 'Service Item Serial No.';
                    ToolTip = 'Specifies the service item serial number linked to this line.';
                    ApplicationArea = All;
                }
                field(serviceItemLineDescription; Rec."Service Item Line Description")
                {
                    Caption = 'Service Item Line Description';
                    ToolTip = 'Specifies the description of the service item line in the service order.';
                    ApplicationArea = All;
                }
                field(servPriceAdjmtGrCode; Rec."Serv. Price Adjmt. Gr. Code")
                {
                    Caption = 'Serv. Price Adjmt. Gr. Code';
                    ToolTip = 'Specifies the service price adjustment group code that applies to this line.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the date when the service line should be posted.';
                    ApplicationArea = All;
                }
                field(orderDate; Rec."Order Date")
                {
                    Caption = 'Order Date';
                    ToolTip = 'Specifies the Order Date.';
                    ApplicationArea = All;
                }
                field(neededByDate; Rec."Needed by Date")
                {
                    Caption = 'Needed by Date';
                    ToolTip = 'Specifies the date when you require the item to be available for a service order.';
                    ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    ApplicationArea = All;
                }
                field(qtyToConsume; Rec."Qty. to Consume")
                {
                    Caption = 'Qty. to Consume';
                    ToolTip = 'Specifies the quantity of items, resource hours, costs, or G/L account payments that should be consumed.';
                    ApplicationArea = All;
                }
                field(quantityConsumed; Rec."Quantity Consumed")
                {
                    Caption = 'Quantity Consumed';
                    ToolTip = 'Specifies the quantity of items, resource hours, costs, or general ledger account payments on this line, which have been posted as consumed.';
                    ApplicationArea = All;
                }
                field(qtyToConsumeBase; Rec."Qty. to Consume (Base)")
                {
                    Caption = 'Qty. to Consume (Base)';
                    ToolTip = 'Specifies the Qty. to Consume (Base).';
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
                    ToolTip = 'Specifies the code of the fault area associated with this line.';
                    ApplicationArea = All;
                }
                field(symptomCode; Rec."Symptom Code")
                {
                    Caption = 'Symptom Code';
                    ToolTip = 'Specifies the code of the symptom associated with this line.';
                    ApplicationArea = All;
                }
                field(faultCode; Rec."Fault Code")
                {
                    Caption = 'Fault Code';
                    ToolTip = 'Specifies the code of the fault associated with this line.';
                    ApplicationArea = All;
                }
                field(resolutionCode; Rec."Resolution Code")
                {
                    Caption = 'Resolution Code';
                    ToolTip = 'Specifies the code of the resolution associated with this line.';
                    ApplicationArea = All;
                }
                field(excludeWarranty; Rec."Exclude Warranty")
                {
                    Caption = 'Exclude Warranty';
                    ToolTip = 'Specifies that the warranty discount is excluded on this line.';
                    ApplicationArea = All;
                }
                field(warranty; Rec."Warranty")
                {
                    Caption = 'Warranty';
                    ToolTip = 'Specifies that a warranty discount is available on this line of type Item or Resource.';
                    ApplicationArea = All;
                }
                field(contractNo; Rec."Contract No.")
                {
                    Caption = 'Contract No.';
                    ToolTip = 'Specifies the number of the contract, if the service order originated from a service contract.';
                    ApplicationArea = All;
                }
                field(contractDiscPct; Rec."Contract Disc. %")
                {
                    Caption = 'Contract Disc. %';
                    ToolTip = 'Specifies the contract discount percentage that is valid for the items, resources, and costs on this line.';
                    ApplicationArea = All;
                }
                field(warrantyDiscPct; Rec."Warranty Disc. %")
                {
                    Caption = 'Warranty Disc. %';
                    ToolTip = 'Specifies the percentage of the warranty discount that is valid for the items or resources on this line.';
                    ApplicationArea = All;
                }
                field(componentLineNo; Rec."Component Line No.")
                {
                    Caption = 'Component Line No.';
                    ToolTip = 'Specifies the Component Line No..';
                    ApplicationArea = All;
                }
                field(sparePartAction; Rec."Spare Part Action")
                {
                    Caption = 'Spare Part Action';
                    ToolTip = 'Specifies whether the item was used to replace the whole service item, one of the service item components, installed as a new component, or used as a supplementary tool.';
                    ApplicationArea = All;
                }
                field(faultReasonCode; Rec."Fault Reason Code")
                {
                    Caption = 'Fault Reason Code';
                    ToolTip = 'Specifies the code of the fault reason for this service line.';
                    ApplicationArea = All;
                }
                field(replacedItemNo; Rec."Replaced Item No.")
                {
                    Caption = 'Replaced Item No.';
                    ToolTip = 'Specifies the Replaced Item No..';
                    ApplicationArea = All;
                }
                field(excludeContractDiscount; Rec."Exclude Contract Discount")
                {
                    Caption = 'Exclude Contract Discount';
                    ToolTip = 'Specifies that the contract discount is excluded for the item, resource, or cost on this line.';
                    ApplicationArea = All;
                }
                field(replacedItemType; Rec."Replaced Item Type")
                {
                    Caption = 'Replaced Item Type';
                    ToolTip = 'Specifies the Replaced Item Type.';
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
                    ToolTip = 'Specifies the type of the line discount assigned to this line.';
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
                field(qtyPicked; Rec."Qty. Picked")
                {
                    Caption = 'Qty. Picked';
                    ToolTip = 'Specifies the Qty. Picked.';
                    ApplicationArea = All;
                }
                field(qtyPickedBase; Rec."Qty. Picked (Base)")
                {
                    Caption = 'Qty. Picked (Base)';
                    ToolTip = 'Specifies the Qty. Picked (Base).';
                    ApplicationArea = All;
                }
                field(completelyPicked; Rec."Completely Picked")
                {
                    Caption = 'Completely Picked';
                    ToolTip = 'Specifies the Completely Picked.';
                    ApplicationArea = All;
                }
                field(pickQtyBase; Rec."Pick Qty. (Base)")
                {
                    Caption = 'Pick Qty. (Base)';
                    ToolTip = 'Specifies the Pick Qty. (Base).';
                    ApplicationArea = All;
                }
            }
        }
    }
}
