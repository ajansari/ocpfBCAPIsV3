namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Purchases.Document;

page 90893 "ocpfPurchaseInvoiceLines"
{
    PageType = API;
    Caption = 'Lines of open purchase invoices.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_purchasing';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfPurchaseInvoiceLine';
    EntitySetName = 'ocpfPurchaseInvoiceLines';
    SourceTable = "Purchase Line";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTableView = where("Document Type" = const(Invoice));

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
                field(documentType; Rec."Document Type")
                    {
                        Caption = 'Document Type';
                        ToolTip = 'Specifies the type of document that you are about to create.';
                        ApplicationArea = All;
                }
                field(buyFromVendorNo; Rec."Buy-from Vendor No.")
                    {
                        Caption = 'Buy-from Vendor No.';
                        ToolTip = 'Specifies the name of the vendor who delivered the items.';
                        ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                    {
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the document number.';
                        ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                    {
                        Caption = 'Line No.';
                        ToolTip = 'Specifies the line';
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
                field(expectedReceiptDate; Rec."Expected Receipt Date")
                    {
                        Caption = 'Expected Receipt Date';
                        ToolTip = 'Specifies the date that you expect the items to be available in your warehouse.';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies a description of the entry of the product to be purchased. To add a non-transactional text line, fill in the Description field only.';
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
                        ToolTip = 'Specifies the Unit of Measure.';
                        ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                    {
                        Caption = 'Quantity';
                        ToolTip = 'Specifies the Quantity.';
                        ApplicationArea = All;
                }
                field(outstandingQuantity; Rec."Outstanding Quantity")
                    {
                        Caption = 'Outstanding Quantity';
                        ToolTip = 'Specifies how many units on the order line have not yet been received.';
                        ApplicationArea = All;
                }
                field(qtyToInvoice; Rec."Qty. to Invoice")
                    {
                        Caption = 'Qty. to Invoice';
                        ToolTip = 'Specifies the quantity that remains to be invoiced. It is calculated as Quantity - Qty. Invoiced.';
                        ApplicationArea = All;
                }
                field(qtyToReceive; Rec."Qty. to Receive")
                    {
                        Caption = 'Qty. to Receive';
                        ToolTip = 'Specifies the Qty. to Receive.';
                        ApplicationArea = All;
                }
                field(directUnitCost; Rec."Direct Unit Cost")
                    {
                        Caption = 'Direct Unit Cost';
                        ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
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
                        ToolTip = 'Specifies the Line Discount %.';
                        ApplicationArea = All;
                }
                field(lineDiscountAmount; Rec."Line Discount Amount")
                    {
                        Caption = 'Line Discount Amount';
                        ToolTip = 'Specifies the discount amount that is granted for the item on the line.';
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
                field(unitPriceLcy; Rec."Unit Price (LCY)")
                    {
                        Caption = 'Unit Price (LCY)';
                        ToolTip = 'Specifies the price, in LCY, of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
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
                field(jobNo; Rec."Job No.")
                    {
                        Caption = 'Project No.';
                        ToolTip = 'Specifies the number of the related project. If you fill in this field and the Project Task No. field, then a project ledger entry will be posted together with the purchase line.';
                        ApplicationArea = All;
                }
                field(indirectCostPct; Rec."Indirect Cost %")
                    {
                        Caption = 'Indirect Cost %';
                        ToolTip = 'Specifies the percentage of the item';
                        ApplicationArea = All;
                }
                field(recalculateInvoiceDisc; Rec."Recalculate Invoice Disc.")
                    {
                        Caption = 'Recalculate Invoice Disc.';
                        ToolTip = 'Specifies the Recalculate Invoice Disc..';
                        ApplicationArea = All;
                }
                field(outstandingAmount; Rec."Outstanding Amount")
                    {
                        Caption = 'Outstanding Amount';
                        ToolTip = 'Specifies the Outstanding Amount.';
                        ApplicationArea = All;
                }
                field(qtyRcdNotInvoiced; Rec."Qty. Rcd. Not Invoiced")
                    {
                        Caption = 'Qty. Rcd. Not Invoiced';
                        ToolTip = 'Specifies the Qty. Rcd. Not Invoiced.';
                        ApplicationArea = All;
                }
                field(amtRcdNotInvoiced; Rec."Amt. Rcd. Not Invoiced")
                    {
                        Caption = 'Amt. Rcd. Not Invoiced';
                        ToolTip = 'Specifies the Amt. Rcd. Not Invoiced.';
                        ApplicationArea = All;
                }
                field(quantityReceived; Rec."Quantity Received")
                    {
                        Caption = 'Quantity Received';
                        ToolTip = 'Specifies how many units of the item on the line have been posted as received.';
                        ApplicationArea = All;
                }
                field(quantityInvoiced; Rec."Quantity Invoiced")
                    {
                        Caption = 'Quantity Invoiced';
                        ToolTip = 'Specifies the Quantity Invoiced.';
                        ApplicationArea = All;
                }
                field(receiptNo; Rec."Receipt No.")
                    {
                        Caption = 'Receipt No.';
                        ToolTip = 'Specifies the Receipt No..';
                        ApplicationArea = All;
                }
                field(receiptLineNo; Rec."Receipt Line No.")
                    {
                        Caption = 'Receipt Line No.';
                        ToolTip = 'Specifies the Receipt Line No..';
                        ApplicationArea = All;
                }
                field(orderNo; Rec."Order No.")
                    {
                        Caption = 'Order No.';
                        ToolTip = 'Specifies the order number this line is associated with.';
                        ApplicationArea = All;
                }
                field(orderLineNo; Rec."Order Line No.")
                    {
                        Caption = 'Order Line No.';
                        ToolTip = 'Specifies the Order Line No..';
                        ApplicationArea = All;
                }
                field(profitPct; Rec."Profit %")
                    {
                        Caption = 'Profit %';
                        ToolTip = 'Specifies the Profit %.';
                        ApplicationArea = All;
                }
                field(payToVendorNo; Rec."Pay-to Vendor No.")
                    {
                        Caption = 'Pay-to Vendor No.';
                        ToolTip = 'Specifies the Pay-to Vendor No..';
                        ApplicationArea = All;
                }
                field(invDiscountAmount; Rec."Inv. Discount Amount")
                    {
                        Caption = 'Inv. Discount Amount';
                        ToolTip = 'Specifies the total calculated invoice discount amount for the line.';
                        ApplicationArea = All;
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                    {
                        Caption = 'Vendor Item No.';
                        ToolTip = 'Specifies the Vendor Item No..';
                        ApplicationArea = All;
                }
                field(salesOrderNo; Rec."Sales Order No.")
                    {
                        Caption = 'Sales Order No.';
                        ToolTip = 'Specifies the Sales Order No..';
                        ApplicationArea = All;
                }
                field(salesOrderLineNo; Rec."Sales Order Line No.")
                    {
                        Caption = 'Sales Order Line No.';
                        ToolTip = 'Specifies the Sales Order Line No..';
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
                field(entryPoint; Rec."Entry Point")
                    {
                        Caption = 'Entry Point';
                        ToolTip = 'Specifies the Entry Point.';
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
                field(useTax; Rec."Use Tax")
                    {
                        Caption = 'Use Tax';
                        ToolTip = 'Specifies the Use Tax.';
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
                field(outstandingAmountLcy; Rec."Outstanding Amount (LCY)")
                    {
                        Caption = 'Outstanding Amount (LCY)';
                        ToolTip = 'Specifies the amount for the items on the order that have not yet been received in LCY.';
                        ApplicationArea = All;
                }
                field(amtRcdNotInvoicedLcy; Rec."Amt. Rcd. Not Invoiced (LCY)")
                    {
                        Caption = 'Amt. Rcd. Not Invoiced (LCY)';
                        ToolTip = 'Specifies the sum, in LCY, for items that have been received but have not yet been invoiced. The value in the Amt. Rcd. Not Invoiced (LCY) field is used for entries in the Purchase Line table of document type Order to calculate and update the content';
                        ApplicationArea = All;
                }
                field(reservedQuantity; Rec."Reserved Quantity")
                    {
                        Caption = 'Reserved Quantity';
                        ToolTip = 'Specifies the Reserved Quantity.';
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
                field(prepaymentPct; Rec."Prepayment %")
                    {
                        Caption = 'Prepayment %';
                        ToolTip = 'Specifies the Prepayment %.';
                        ApplicationArea = All;
                }
                field(prepmtLineAmount; Rec."Prepmt. Line Amount")
                    {
                        Caption = 'Prepmt. Line Amount';
                        ToolTip = 'Specifies the Prepmt. Line Amount.';
                        ApplicationArea = All;
                }
                field(prepmtAmtInv; Rec."Prepmt. Amt. Inv.")
                    {
                        Caption = 'Prepmt. Amt. Inv.';
                        ToolTip = 'Specifies the Prepmt. Amt. Inv..';
                        ApplicationArea = All;
                }
                field(prepmtAmtInclVat; Rec."Prepmt. Amt. Incl. VAT")
                    {
                        Caption = 'Prepmt. Amt. Incl. VAT';
                        ToolTip = 'Specifies the Prepmt. Amt. Incl. VAT.';
                        ApplicationArea = All;
                }
                field(prepaymentAmount; Rec."Prepayment Amount")
                    {
                        Caption = 'Prepayment Amount';
                        ToolTip = 'Specifies the Prepayment Amount.';
                        ApplicationArea = All;
                }
                field(prepmtVatBaseAmt; Rec."Prepmt. VAT Base Amt.")
                    {
                        Caption = 'Prepmt. VAT Base Amt.';
                        ToolTip = 'Specifies the Prepmt. VAT Base Amt..';
                        ApplicationArea = All;
                }
                field(prepaymentVatPct; Rec."Prepayment VAT %")
                    {
                        Caption = 'Prepayment VAT %';
                        ToolTip = 'Specifies the Prepayment VAT %.';
                        ApplicationArea = All;
                }
                field(prepmtVatCalcType; Rec."Prepmt. VAT Calc. Type")
                    {
                        Caption = 'Prepmt. VAT Calc. Type';
                        ToolTip = 'Specifies the Prepmt. VAT Calc. Type.';
                        ApplicationArea = All;
                }
                field(prepaymentVatIdentifier; Rec."Prepayment VAT Identifier")
                    {
                        Caption = 'Prepayment VAT Identifier';
                        ToolTip = 'Specifies the Prepayment VAT Identifier.';
                        ApplicationArea = All;
                }
                field(prepaymentTaxAreaCode; Rec."Prepayment Tax Area Code")
                    {
                        Caption = 'Prepayment Tax Area Code';
                        ToolTip = 'Specifies the Prepayment Tax Area Code.';
                        ApplicationArea = All;
                }
                field(prepaymentTaxLiable; Rec."Prepayment Tax Liable")
                    {
                        Caption = 'Prepayment Tax Liable';
                        ToolTip = 'Specifies the Prepayment Tax Liable.';
                        ApplicationArea = All;
                }
                field(prepaymentTaxGroupCode; Rec."Prepayment Tax Group Code")
                    {
                        Caption = 'Prepayment Tax Group Code';
                        ToolTip = 'Specifies the Prepayment Tax Group Code.';
                        ApplicationArea = All;
                }
                field(prepmtAmtToDeduct; Rec."Prepmt Amt to Deduct")
                    {
                        Caption = 'Prepmt Amt to Deduct';
                        ToolTip = 'Specifies the Prepmt Amt to Deduct.';
                        ApplicationArea = All;
                }
                field(prepmtAmtDeducted; Rec."Prepmt Amt Deducted")
                    {
                        Caption = 'Prepmt Amt Deducted';
                        ToolTip = 'Specifies the Prepmt Amt Deducted.';
                        ApplicationArea = All;
                }
                field(prepaymentLine; Rec."Prepayment Line")
                    {
                        Caption = 'Prepayment Line';
                        ToolTip = 'Specifies the Prepayment Line.';
                        ApplicationArea = All;
                }
                field(prepmtAmountInvInclVat; Rec."Prepmt. Amount Inv. Incl. VAT")
                    {
                        Caption = 'Prepmt. Amount Inv. Incl. VAT';
                        ToolTip = 'Specifies the Prepmt. Amount Inv. Incl. VAT.';
                        ApplicationArea = All;
                }
                field(prepmtAmountInvLcy; Rec."Prepmt. Amount Inv. (LCY)")
                    {
                        Caption = 'Prepmt. Amount Inv. (LCY)';
                        ToolTip = 'Specifies the Prepmt. Amount Inv. (LCY).';
                        ApplicationArea = All;
                }
                field(icPartnerCode; Rec."IC Partner Code")
                    {
                        Caption = 'IC Partner Code';
                        ToolTip = 'Specifies the IC Partner Code.';
                        ApplicationArea = All;
                }
                field(prepmtVatAmountInvLcy; Rec."Prepmt. VAT Amount Inv. (LCY)")
                    {
                        Caption = 'Prepmt. VAT Amount Inv. (LCY)';
                        ToolTip = 'Specifies the Prepmt. VAT Amount Inv. (LCY).';
                        ApplicationArea = All;
                }
                field(prepaymentVatDifference; Rec."Prepayment VAT Difference")
                    {
                        Caption = 'Prepayment VAT Difference';
                        ToolTip = 'Specifies the Prepayment VAT Difference.';
                        ApplicationArea = All;
                }
                field(prepmtVatDiffToDeduct; Rec."Prepmt VAT Diff. to Deduct")
                    {
                        Caption = 'Prepmt VAT Diff. to Deduct';
                        ToolTip = 'Specifies the Prepmt VAT Diff. to Deduct.';
                        ApplicationArea = All;
                }
                field(prepmtVatDiffDeducted; Rec."Prepmt VAT Diff. Deducted")
                    {
                        Caption = 'Prepmt VAT Diff. Deducted';
                        ToolTip = 'Specifies the Prepmt VAT Diff. Deducted.';
                        ApplicationArea = All;
                }
                field(icItemReferenceNo; Rec."IC Item Reference No.")
                    {
                        Caption = 'IC Item Reference No.';
                        ToolTip = 'Specifies the IC Item Reference No..';
                        ApplicationArea = All;
                }
                field(outstandingAmtExVatLcy; Rec."Outstanding Amt. Ex. VAT (LCY)")
                    {
                        Caption = 'Outstanding Amt. Ex. VAT (LCY)';
                        ToolTip = 'Specifies the Outstanding Amt. Ex. VAT (LCY).';
                        ApplicationArea = All;
                }
                field(aRcdNotInvExVatLcy; Rec."A. Rcd. Not Inv. Ex. VAT (LCY)")
                    {
                        Caption = 'A. Rcd. Not Inv. Ex. VAT (LCY)';
                        ToolTip = 'Specifies the A. Rcd. Not Inv. Ex. VAT (LCY).';
                        ApplicationArea = All;
                }
                field(pmtDiscountAmount; Rec."Pmt. Discount Amount")
                    {
                        Caption = 'Pmt. Discount Amount';
                        ToolTip = 'Specifies the Pmt. Discount Amount.';
                        ApplicationArea = All;
                }
                field(prepmtPmtDiscountAmount; Rec."Prepmt. Pmt. Discount Amount")
                    {
                        Caption = 'Prepmt. Pmt. Discount Amount';
                        ToolTip = 'Specifies the Prepmt. Pmt. Discount Amount.';
                        ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                    {
                        Caption = 'Dimension Set ID';
                        ToolTip = 'Specifies the Dimension Set ID.';
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
                        ToolTip = 'Specifies a Project Planning Line together with the posting of a project ledger entry.';
                        ApplicationArea = All;
                }
                field(jobUnitPrice; Rec."Job Unit Price")
                    {
                        Caption = 'Project Unit Price';
                        ToolTip = 'Specifies the Job Unit Price.';
                        ApplicationArea = All;
                }
                field(jobTotalPrice; Rec."Job Total Price")
                    {
                        Caption = 'Project Total Price';
                        ToolTip = 'Specifies the Job Total Price.';
                        ApplicationArea = All;
                }
                field(jobLineAmount; Rec."Job Line Amount")
                    {
                        Caption = 'Project Line Amount';
                        ToolTip = 'Specifies the Job Line Amount.';
                        ApplicationArea = All;
                }
                field(jobLineDiscountAmount; Rec."Job Line Discount Amount")
                    {
                        Caption = 'Project Line Discount Amount';
                        ToolTip = 'Specifies the Job Line Discount Amount.';
                        ApplicationArea = All;
                }
                field(jobLineDiscountPct; Rec."Job Line Discount %")
                    {
                        Caption = 'Project Line Discount %';
                        ToolTip = 'Specifies the Job Line Discount %.';
                        ApplicationArea = All;
                }
                field(jobUnitPriceLcy; Rec."Job Unit Price (LCY)")
                    {
                        Caption = 'Project Unit Price (LCY)';
                        ToolTip = 'Specifies the Job Unit Price (LCY).';
                        ApplicationArea = All;
                }
                field(jobTotalPriceLcy; Rec."Job Total Price (LCY)")
                    {
                        Caption = 'Project Total Price (LCY)';
                        ToolTip = 'Specifies the Job Total Price (LCY).';
                        ApplicationArea = All;
                }
                field(jobLineAmountLcy; Rec."Job Line Amount (LCY)")
                    {
                        Caption = 'Project Line Amount (LCY)';
                        ToolTip = 'Specifies the Job Line Amount (LCY).';
                        ApplicationArea = All;
                }
                field(jobLineDiscAmountLcy; Rec."Job Line Disc. Amount (LCY)")
                    {
                        Caption = 'Project Line Disc. Amount (LCY)';
                        ToolTip = 'Specifies the Job Line Disc. Amount (LCY).';
                        ApplicationArea = All;
                }
                field(jobCurrencyFactor; Rec."Job Currency Factor")
                    {
                        Caption = 'Project Currency Factor';
                        ToolTip = 'Specifies the Job Currency Factor.';
                        ApplicationArea = All;
                }
                field(jobCurrencyCode; Rec."Job Currency Code")
                    {
                        Caption = 'Project Currency Code';
                        ToolTip = 'Specifies the Job Currency Code.';
                        ApplicationArea = All;
                }
                field(jobPlanningLineNo; Rec."Job Planning Line No.")
                    {
                        Caption = 'Job Planning Line No.';
                        ToolTip = 'Specifies the Job Planning Line No..';
                        ApplicationArea = All;
                }
                field(jobRemainingQty; Rec."Job Remaining Qty.")
                    {
                        Caption = 'Project Remaining Qty.';
                        ToolTip = 'Specifies the Job Remaining Qty..';
                        ApplicationArea = All;
                }
                field(jobRemainingQtyBase; Rec."Job Remaining Qty. (Base)")
                    {
                        Caption = 'Project Remaining Qty. (Base)';
                        ToolTip = 'Specifies the Job Remaining Qty. (Base).';
                        ApplicationArea = All;
                }
                field(deferralCode; Rec."Deferral Code")
                    {
                        Caption = 'Deferral Code';
                        ToolTip = 'Specifies the Deferral Code.';
                        ApplicationArea = All;
                }
                field(returnsDeferralStartDate; Rec."Returns Deferral Start Date")
                    {
                        Caption = 'Returns Deferral Start Date';
                        ToolTip = 'Specifies the Returns Deferral Start Date.';
                        ApplicationArea = All;
                }
                field(selectedAllocAccountNo; Rec."Selected Alloc. Account No.")
                    {
                        Caption = 'Allocation Account No.';
                        ToolTip = 'Specifies the allocation account number that will be used to distribute the amounts during the posting process.';
                        ApplicationArea = All;
                }
                field(allocAccModifiedByUser; Rec."Alloc. Acc. Modified by User")
                    {
                        Caption = 'Allocation Account Distributions Modified';
                        ToolTip = 'Specifies the Alloc. Acc. Modified by User.';
                        ApplicationArea = All;
                }
                field(allocationAccountNo; Rec."Allocation Account No.")
                    {
                        Caption = 'Posting Allocation Account No.';
                        ToolTip = 'Specifies the Allocation Account No..';
                        ApplicationArea = All;
                }
                field(allocPurchLineSystemid; Rec."Alloc. Purch. Line SystemId")
                    {
                        Caption = 'Allocation Purchase Line SystemId';
                        ToolTip = 'Specifies the Alloc. Purch. Line SystemId.';
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
                field(outstandingQtyBase; Rec."Outstanding Qty. (Base)")
                    {
                        Caption = 'Outstanding Qty. (Base)';
                        ToolTip = 'Specifies the Outstanding Qty. (Base).';
                        ApplicationArea = All;
                }
                field(qtyToInvoiceBase; Rec."Qty. to Invoice (Base)")
                    {
                        Caption = 'Qty. to Invoice (Base)';
                        ToolTip = 'Specifies the Qty. to Invoice (Base).';
                        ApplicationArea = All;
                }
                field(qtyToReceiveBase; Rec."Qty. to Receive (Base)")
                    {
                        Caption = 'Qty. to Receive (Base)';
                        ToolTip = 'Specifies the Qty. to Receive (Base).';
                        ApplicationArea = All;
                }
                field(qtyRcdNotInvoicedBase; Rec."Qty. Rcd. Not Invoiced (Base)")
                    {
                        Caption = 'Qty. Rcd. Not Invoiced (Base)';
                        ToolTip = 'Specifies the Qty. Rcd. Not Invoiced (Base).';
                        ApplicationArea = All;
                }
                field(qtyReceivedBase; Rec."Qty. Received (Base)")
                    {
                        Caption = 'Qty. Received (Base)';
                        ToolTip = 'Specifies the Qty. Received (Base).';
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
                        ToolTip = 'Specifies the value in the Reserved Quantity field, expressed in the base unit of measure.';
                        ApplicationArea = All;
                }
                field(faPostingDate; Rec."FA Posting Date")
                    {
                        Caption = 'FA Posting Date';
                        ToolTip = 'Specifies the FA Posting Date.';
                        ApplicationArea = All;
                }
                field(faPostingType; Rec."FA Posting Type")
                    {
                        Caption = 'FA Posting Type';
                        ToolTip = 'Specifies the FA Posting Type.';
                        ApplicationArea = All;
                }
                field(depreciationBookCode; Rec."Depreciation Book Code")
                    {
                        Caption = 'Depreciation Book Code';
                        ToolTip = 'Specifies the Depreciation Book Code.';
                        ApplicationArea = All;
                }
                field(salvageValue; Rec."Salvage Value")
                    {
                        Caption = 'Salvage Value';
                        ToolTip = 'Specifies the Salvage Value.';
                        ApplicationArea = All;
                }
                field(deprUntilFaPostingDate; Rec."Depr. until FA Posting Date")
                    {
                        Caption = 'Depr. until FA Posting Date';
                        ToolTip = 'Specifies the Depr. until FA Posting Date.';
                        ApplicationArea = All;
                }
                field(deprAcquisitionCost; Rec."Depr. Acquisition Cost")
                    {
                        Caption = 'Depr. Acquisition Cost';
                        ToolTip = 'Specifies the Depr. Acquisition Cost.';
                        ApplicationArea = All;
                }
                field(maintenanceCode; Rec."Maintenance Code")
                    {
                        Caption = 'Maintenance Code';
                        ToolTip = 'Specifies the Maintenance Code.';
                        ApplicationArea = All;
                }
                field(insuranceNo; Rec."Insurance No.")
                    {
                        Caption = 'Insurance No.';
                        ToolTip = 'Specifies the Insurance No..';
                        ApplicationArea = All;
                }
                field(budgetedFaNo; Rec."Budgeted FA No.")
                    {
                        Caption = 'Budgeted FA No.';
                        ToolTip = 'Specifies the Budgeted FA No..';
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
                field(specialOrder; Rec."Special Order")
                    {
                        Caption = 'Special Order';
                        ToolTip = 'Specifies the Special Order.';
                        ApplicationArea = All;
                }
                field(specialOrderSalesNo; Rec."Special Order Sales No.")
                    {
                        Caption = 'Special Order Sales No.';
                        ToolTip = 'Specifies the Special Order Sales No..';
                        ApplicationArea = All;
                }
                field(specialOrderSalesLineNo; Rec."Special Order Sales Line No.")
                    {
                        Caption = 'Special Order Sales Line No.';
                        ToolTip = 'Specifies the Special Order Sales Line No..';
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
                        Caption = 'Item Reference Unit of Measure';
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
                field(whseOutstandingQtyBase; Rec."Whse. Outstanding Qty. (Base)")
                    {
                        Caption = 'Whse. Outstanding Qty. (Base)';
                        ToolTip = 'Specifies the Whse. Outstanding Qty. (Base).';
                        ApplicationArea = All;
                }
                field(completelyReceived; Rec."Completely Received")
                    {
                        Caption = 'Completely Received';
                        ToolTip = 'Specifies the Completely Received.';
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
                        ToolTip = 'Specifies the date that the vendor has promised to deliver the order.';
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
                field(plannedReceiptDate; Rec."Planned Receipt Date")
                    {
                        Caption = 'Planned Receipt Date';
                        ToolTip = 'Specifies the Planned Receipt Date.';
                        ApplicationArea = All;
                }
                field(orderDate; Rec."Order Date")
                    {
                        Caption = 'Order Date';
                        ToolTip = 'Specifies the Order Date.';
                        ApplicationArea = All;
                }
                field(allowItemChargeAssignment; Rec."Allow Item Charge Assignment")
                    {
                        Caption = 'Allow Item Charge Assignment';
                        ToolTip = 'Specifies the Allow Item Charge Assignment.';
                        ApplicationArea = All;
                }
                field(qtyToAssign; Rec."Qty. to Assign")
                    {
                        Caption = 'Qty. to Assign';
                        ToolTip = 'Specifies the Qty. to Assign.';
                        ApplicationArea = All;
                }
                field(qtyAssigned; Rec."Qty. Assigned")
                    {
                        Caption = 'Qty. Assigned';
                        ToolTip = 'Specifies the Qty. Assigned.';
                        ApplicationArea = All;
                }
                field(returnQtyToShip; Rec."Return Qty. to Ship")
                    {
                        Caption = 'Return Qty. to Ship';
                        ToolTip = 'Specifies the Return Qty. to Ship.';
                        ApplicationArea = All;
                }
                field(returnQtyToShipBase; Rec."Return Qty. to Ship (Base)")
                    {
                        Caption = 'Return Qty. to Ship (Base)';
                        ToolTip = 'Specifies the Return Qty. to Ship (Base).';
                        ApplicationArea = All;
                }
                field(returnQtyShippedNotInvd; Rec."Return Qty. Shipped Not Invd.")
                    {
                        Caption = 'Return Qty. Shipped Not Invd.';
                        ToolTip = 'Specifies the Return Qty. Shipped Not Invd..';
                        ApplicationArea = All;
                }
                field(retQtyShpdNotInvdBase; Rec."Ret. Qty. Shpd Not Invd.(Base)")
                    {
                        Caption = 'Ret. Qty. Shpd Not Invd.(Base)';
                        ToolTip = 'Specifies the Ret. Qty. Shpd Not Invd.(Base).';
                        ApplicationArea = All;
                }
                field(returnShpdNotInvd; Rec."Return Shpd. Not Invd.")
                    {
                        Caption = 'Return Shpd. Not Invd.';
                        ToolTip = 'Specifies the Return Shpd. Not Invd..';
                        ApplicationArea = All;
                }
                field(returnShpdNotInvdLcy; Rec."Return Shpd. Not Invd. (LCY)")
                    {
                        Caption = 'Return Shpd. Not Invd. (LCY)';
                        ToolTip = 'Specifies the Return Shpd. Not Invd. (LCY).';
                        ApplicationArea = All;
                }
                field(returnQtyShipped; Rec."Return Qty. Shipped")
                    {
                        Caption = 'Return Qty. Shipped';
                        ToolTip = 'Specifies the Return Qty. Shipped.';
                        ApplicationArea = All;
                }
                field(returnQtyShippedBase; Rec."Return Qty. Shipped (Base)")
                    {
                        Caption = 'Return Qty. Shipped (Base)';
                        ToolTip = 'Specifies the Return Qty. Shipped (Base).';
                        ApplicationArea = All;
                }
                field(itemChargeQtyToHandle; Rec."Item Charge Qty. to Handle")
                    {
                        Caption = 'Item Charge Qty. to Handle';
                        ToolTip = 'Specifies the Item Charge Qty. to Handle.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatPct; Rec."Non-Deductible VAT %")
                    {
                        Caption = 'Non-Deductible VAT %';
                        ToolTip = 'Specifies the Non-Deductible VAT %.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatBase; Rec."Non-Deductible VAT Base")
                    {
                        Caption = 'Non-Deductible VAT Base';
                        ToolTip = 'Specifies the Non-Deductible VAT Base.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatAmount; Rec."Non-Deductible VAT Amount")
                    {
                        Caption = 'Non-Deductible VAT Amount';
                        ToolTip = 'Specifies the Non-Deductible VAT Amount.';
                        ApplicationArea = All;
                }
                field(nonDeductibleVatDiff; Rec."Non-Deductible VAT Diff.")
                    {
                        Caption = 'Non-Deductible VAT Difference';
                        ToolTip = 'Specifies the Non-Deductible VAT Diff..';
                        ApplicationArea = All;
                }
                field(prepmtNonDeductVatBase; Rec."Prepmt. Non-Deduct. VAT Base")
                    {
                        Caption = 'Prepmt.  Non-Deductible VAT Base';
                        ToolTip = 'Specifies the Prepmt. Non-Deduct. VAT Base.';
                        ApplicationArea = All;
                }
                field(prepmtNonDeductVatAmount; Rec."Prepmt. Non-Deduct. VAT Amount")
                    {
                        Caption = 'Prepmt. on-Deductible VAT Amount';
                        ToolTip = 'Specifies the Prepmt. Non-Deduct. VAT Amount.';
                        ApplicationArea = All;
                }
                field(itemChargeHasNonDedVat; Rec."Item Charge Has Non.Ded. VAT")
                    {
                        Caption = 'Item Charge Has Non-Deductible VAT';
                        ToolTip = 'Specifies the Item Charge Has Non.Ded. VAT.';
                        ApplicationArea = All;
                }
                field(returnShipmentNo; Rec."Return Shipment No.")
                    {
                        Caption = 'Return Shipment No.';
                        ToolTip = 'Specifies the Return Shipment No..';
                        ApplicationArea = All;
                }
                field(returnShipmentLineNo; Rec."Return Shipment Line No.")
                    {
                        Caption = 'Return Shipment Line No.';
                        ToolTip = 'Specifies the Return Shipment Line No..';
                        ApplicationArea = All;
                }
                field(returnReasonCode; Rec."Return Reason Code")
                    {
                        Caption = 'Return Reason Code';
                        ToolTip = 'Specifies the Return Reason Code.';
                        ApplicationArea = All;
                }
                field(subtype; Rec.Subtype)
                    {
                        Caption = 'Subtype';
                        ToolTip = 'Specifies the Subtype.';
                        ApplicationArea = All;
                }
                field(copiedFromPostedDoc; Rec."Copied From Posted Doc.")
                    {
                        Caption = 'Copied From Posted Doc.';
                        ToolTip = 'Specifies the Copied From Posted Doc..';
                        ApplicationArea = All;
                }
                field(priceCalculationMethod; Rec."Price Calculation Method")
                    {
                        Caption = 'Price Calculation Method';
                        ToolTip = 'Specifies the Price Calculation Method.';
                        ApplicationArea = All;
                }
                field(attachedDocCount; Rec."Attached Doc Count")
                    {
                        Caption = 'Attached Doc Count';
                        ToolTip = 'Specifies the Attached Doc Count.';
                        ApplicationArea = All;
                }
                field(attachedLinesCount; Rec."Attached Lines Count")
                    {
                        Caption = 'Attached Lines Count';
                        ToolTip = 'Specifies the Attached Lines Count.';
                        ApplicationArea = All;
                }
                field(overReceiptQuantity; Rec."Over-Receipt Quantity")
                    {
                        Caption = 'Over-Receipt Quantity';
                        ToolTip = 'Specifies the Over-Receipt Quantity.';
                        ApplicationArea = All;
                }
                field(overReceiptCode; Rec."Over-Receipt Code")
                    {
                        Caption = 'Over-Receipt Code';
                        ToolTip = 'Specifies the Over-Receipt Code.';
                        ApplicationArea = All;
                }
                field(overReceiptApprovalStatus; Rec."Over-Receipt Approval Status")
                    {
                        Caption = 'Over-Receipt Approval Status';
                        ToolTip = 'Specifies the Over-Receipt Approval Status.';
                        ApplicationArea = All;
                }
                field(buyFromVendorName; Rec."Buy-from Vendor Name")
                    {
                        Caption = 'Buy-from Vendor Name';
                        ToolTip = 'Specifies the Buy-from Vendor Name.';
                        ApplicationArea = All;
                }
                field(overheadRate; Rec."Overhead Rate")
                    {
                        Caption = 'Overhead Rate';
                        ToolTip = 'Specifies the Overhead Rate.';
                        ApplicationArea = All;
                }
                field(mpsOrder; Rec."MPS Order")
                    {
                        Caption = 'MPS Order';
                        ToolTip = 'Specifies the MPS Order.';
                        ApplicationArea = All;
                }
                field(planningFlexibility; Rec."Planning Flexibility")
                    {
                        Caption = 'Planning Flexibility';
                        ToolTip = 'Specifies the Planning Flexibility.';
                        ApplicationArea = All;
                }
                field(safetyLeadTime; Rec."Safety Lead Time")
                    {
                        Caption = 'Safety Lead Time';
                        ToolTip = 'Specifies the Safety Lead Time.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
