namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.Document;

page 90877 "ocpfSalesCreditMemoLines"
{
    PageType = API;
    Caption = 'Lines of open sales credit memos.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_sales';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfSalesCreditMemoLine';
    EntitySetName = 'ocpfSalesCreditMemoLines';
    SourceTable = "Sales Line";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    SourceTableView = where("Document Type" = const("Credit Memo"));

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
                        ToolTip = 'Specifies the type of document that you are about to create.';
                        ApplicationArea = All;
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                    {
                        Caption = 'Sell-to Customer No.';
                        ToolTip = 'Specifies the number of the customer.';
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
                        ToolTip = 'Specifies the line number.';
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
                        ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
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
                        ToolTip = 'Specifies how many units on the order line have not yet been shipped.';
                        ApplicationArea = All;
                }
                field(qtyToInvoice; Rec."Qty. to Invoice")
                    {
                        Caption = 'Qty. to Invoice';
                        ToolTip = 'Specifies the Qty. to Invoice.';
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
                field(lineDiscountAmount; Rec."Line Discount Amount")
                    {
                        Caption = 'Line Discount Amount';
                        ToolTip = 'Specifies the Line Discount Amount.';
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
                field(customerPriceGroup; Rec."Customer Price Group")
                    {
                        Caption = 'Customer Price Group';
                        ToolTip = 'Specifies the Customer Price Group.';
                        ApplicationArea = All;
                }
                field(jobNo; Rec."Job No.")
                    {
                        Caption = 'Project No.';
                        ToolTip = 'Specifies the number of the related project. If you fill in this field and the Project Task No. field, then a project ledger entry will be posted together with the sales line.';
                        ApplicationArea = All;
                }
                field(workTypeCode; Rec."Work Type Code")
                    {
                        Caption = 'Work Type Code';
                        ToolTip = 'Specifies which work type the resource applies to when the sale is related to a project.';
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
                        ToolTip = 'Specifies the Quantity Shipped.';
                        ApplicationArea = All;
                }
                field(quantityInvoiced; Rec."Quantity Invoiced")
                    {
                        Caption = 'Quantity Invoiced';
                        ToolTip = 'Specifies the Quantity Invoiced.';
                        ApplicationArea = All;
                }
                field(shipmentNo; Rec."Shipment No.")
                    {
                        Caption = 'Shipment No.';
                        ToolTip = 'Specifies the Shipment No..';
                        ApplicationArea = All;
                }
                field(shipmentLineNo; Rec."Shipment Line No.")
                    {
                        Caption = 'Shipment Line No.';
                        ToolTip = 'Specifies the Shipment Line No..';
                        ApplicationArea = All;
                }
                field(profitPct; Rec."Profit %")
                    {
                        Caption = 'Profit %';
                        ToolTip = 'Specifies the Profit %.';
                        ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                    {
                        Caption = 'Bill-to Customer No.';
                        ToolTip = 'Specifies the Bill-to Customer No..';
                        ApplicationArea = All;
                }
                field(invDiscountAmount; Rec."Inv. Discount Amount")
                    {
                        Caption = 'Inv. Discount Amount';
                        ToolTip = 'Specifies the Inv. Discount Amount.';
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
                field(taxCategory; Rec."Tax Category")
                    {
                        Caption = 'Tax Category';
                        ToolTip = 'Specifies the Tax Category.';
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
                field(vatClauseCode; Rec."VAT Clause Code")
                    {
                        Caption = 'VAT Clause Code';
                        ToolTip = 'Specifies the VAT Clause Code.';
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
                        ToolTip = 'Specifies the Outstanding Amount (LCY).';
                        ApplicationArea = All;
                }
                field(shippedNotInvoicedLcy; Rec."Shipped Not Invoiced (LCY)")
                    {
                        Caption = 'Shipped Not Invoiced (LCY) Incl. VAT';
                        ToolTip = 'Specifies the Shipped Not Invoiced (LCY).';
                        ApplicationArea = All;
                }
                field(shippedNotInvLcyNoVat; Rec."Shipped Not Inv. (LCY) No VAT")
                    {
                        Caption = 'Shipped Not Invoiced (LCY)';
                        ToolTip = 'Specifies the Shipped Not Inv. (LCY) No VAT.';
                        ApplicationArea = All;
                }
                field(reservedQuantity; Rec."Reserved Quantity")
                    {
                        Caption = 'Reserved Quantity';
                        ToolTip = 'Specifies the Reserved Quantity.';
                        ApplicationArea = All;
                }
                field(reserve; Rec.Reserve)
                    {
                        Caption = 'Reserve';
                        ToolTip = 'Specifies whether a reservation can be made for items on this line.';
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
                field(lineDiscountCalculation; Rec."Line Discount Calculation")
                    {
                        Caption = 'Line Discount Calculation';
                        ToolTip = 'Specifies the Line Discount Calculation.';
                        ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                    {
                        Caption = 'Dimension Set ID';
                        ToolTip = 'Specifies the Dimension Set ID.';
                        ApplicationArea = All;
                }
                field(qtyToAssembleToOrder; Rec."Qty. to Assemble to Order")
                    {
                        Caption = 'Qty. to Assemble to Order';
                        ToolTip = 'Specifies the Qty. to Assemble to Order.';
                        ApplicationArea = All;
                }
                field(qtyToAsmToOrderBase; Rec."Qty. to Asm. to Order (Base)")
                    {
                        Caption = 'Qty. to Asm. to Order (Base)';
                        ToolTip = 'Specifies the Qty. to Asm. to Order (Base).';
                        ApplicationArea = All;
                }
                field(atoWhseOutstandingQty; Rec."ATO Whse. Outstanding Qty.")
                    {
                        Caption = 'ATO Whse. Outstanding Qty.';
                        ToolTip = 'Specifies the ATO Whse. Outstanding Qty..';
                        ApplicationArea = All;
                }
                field(atoWhseOutstdQtyBase; Rec."ATO Whse. Outstd. Qty. (Base)")
                    {
                        Caption = 'ATO Whse. Outstd. Qty. (Base)';
                        ToolTip = 'Specifies the ATO Whse. Outstd. Qty. (Base).';
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
                field(postingDate; Rec."Posting Date")
                    {
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the Posting Date.';
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
                field(allocSalesLineSystemid; Rec."Alloc. Sales Line SystemId")
                    {
                        Caption = 'Allocation Sales Line SystemId';
                        ToolTip = 'Specifies the Alloc. Sales Line SystemId.';
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
                field(planned; Rec.Planned)
                    {
                        Caption = 'Planned';
                        ToolTip = 'Specifies the Planned.';
                        ApplicationArea = All;
                }
                field(qtyRoundingPrecision; Rec."Qty. Rounding Precision")
                    {
                        Caption = 'Qty. Rounding Precision';
                        ToolTip = 'Specifies the Qty. Rounding Precision.';
                        ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                    {
                        Caption = 'Unit of Measure Code';
                        ToolTip = 'Specifies the Unit of Measure Code.';
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
                        ToolTip = 'Specifies the value in the Reserved Quantity field, expressed in the base unit of measure.';
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
                field(outOfStockSubstitution; Rec."Out-of-Stock Substitution")
                    {
                        Caption = 'Out-of-Stock Substitution';
                        ToolTip = 'Specifies the Out-of-Stock Substitution.';
                        ApplicationArea = All;
                }
                field(substitutionAvailable; Rec."Substitution Available")
                    {
                        Caption = 'Substitution Available';
                        ToolTip = 'Specifies the Substitution Available.';
                        ApplicationArea = All;
                }
                field(originallyOrderedNo; Rec."Originally Ordered No.")
                    {
                        Caption = 'Originally Ordered No.';
                        ToolTip = 'Specifies the Originally Ordered No..';
                        ApplicationArea = All;
                }
                field(originallyOrderedVarCode; Rec."Originally Ordered Var. Code")
                    {
                        Caption = 'Originally Ordered Var. Code';
                        ToolTip = 'Specifies the Originally Ordered Var. Code.';
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
                field(specialOrderPurchaseNo; Rec."Special Order Purchase No.")
                    {
                        Caption = 'Special Order Purchase No.';
                        ToolTip = 'Specifies the Special Order Purchase No..';
                        ApplicationArea = All;
                }
                field(specialOrderPurchLineNo; Rec."Special Order Purch. Line No.")
                    {
                        Caption = 'Special Order Purch. Line No.';
                        ToolTip = 'Specifies the Special Order Purch. Line No..';
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
                        Caption = 'Reference Unit of Measure';
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
                field(whseOutstandingQty; Rec."Whse. Outstanding Qty.")
                    {
                        Caption = 'Whse. Outstanding Qty.';
                        ToolTip = 'Specifies the Whse. Outstanding Qty..';
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
                field(returnQtyToReceive; Rec."Return Qty. to Receive")
                    {
                        Caption = 'Return Qty. to Receive';
                        ToolTip = 'Specifies the Return Qty. to Receive.';
                        ApplicationArea = All;
                }
                field(returnQtyToReceiveBase; Rec."Return Qty. to Receive (Base)")
                    {
                        Caption = 'Return Qty. to Receive (Base)';
                        ToolTip = 'Specifies the Return Qty. to Receive (Base).';
                        ApplicationArea = All;
                }
                field(returnQtyRcdNotInvd; Rec."Return Qty. Rcd. Not Invd.")
                    {
                        Caption = 'Return Qty. Rcd. Not Invd.';
                        ToolTip = 'Specifies the Return Qty. Rcd. Not Invd..';
                        ApplicationArea = All;
                }
                field(retQtyRcdNotInvdBase; Rec."Ret. Qty. Rcd. Not Invd.(Base)")
                    {
                        Caption = 'Ret. Qty. Rcd. Not Invd.(Base)';
                        ToolTip = 'Specifies the Ret. Qty. Rcd. Not Invd.(Base).';
                        ApplicationArea = All;
                }
                field(returnRcdNotInvd; Rec."Return Rcd. Not Invd.")
                    {
                        Caption = 'Return Rcd. Not Invd.';
                        ToolTip = 'Specifies the Return Rcd. Not Invd..';
                        ApplicationArea = All;
                }
                field(returnRcdNotInvdLcy; Rec."Return Rcd. Not Invd. (LCY)")
                    {
                        Caption = 'Return Rcd. Not Invd. (LCY)';
                        ToolTip = 'Specifies the Return Rcd. Not Invd. (LCY).';
                        ApplicationArea = All;
                }
                field(returnQtyReceived; Rec."Return Qty. Received")
                    {
                        Caption = 'Return Qty. Received';
                        ToolTip = 'Specifies the Return Qty. Received.';
                        ApplicationArea = All;
                }
                field(returnQtyReceivedBase; Rec."Return Qty. Received (Base)")
                    {
                        Caption = 'Return Qty. Received (Base)';
                        ToolTip = 'Specifies the Return Qty. Received (Base).';
                        ApplicationArea = All;
                }
                field(applFromItemEntry; Rec."Appl.-from Item Entry")
                    {
                        Caption = 'Appl.-from Item Entry';
                        ToolTip = 'Specifies the Appl.-from Item Entry.';
                        ApplicationArea = All;
                }
                field(itemChargeQtyToHandle; Rec."Item Charge Qty. to Handle")
                    {
                        Caption = 'Item Charge Qty. to Handle';
                        ToolTip = 'Specifies the Item Charge Qty. to Handle.';
                        ApplicationArea = All;
                }
                field(bomItemNo; Rec."BOM Item No.")
                    {
                        Caption = 'BOM Item No.';
                        ToolTip = 'Specifies the BOM Item No..';
                        ApplicationArea = All;
                }
                field(returnReceiptNo; Rec."Return Receipt No.")
                    {
                        Caption = 'Return Receipt No.';
                        ToolTip = 'Specifies the Return Receipt No..';
                        ApplicationArea = All;
                }
                field(returnReceiptLineNo; Rec."Return Receipt Line No.")
                    {
                        Caption = 'Return Receipt Line No.';
                        ToolTip = 'Specifies the Return Receipt Line No..';
                        ApplicationArea = All;
                }
                field(returnReasonCode; Rec."Return Reason Code")
                    {
                        Caption = 'Return Reason Code';
                        ToolTip = 'Specifies the Return Reason Code.';
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
                field(subtype; Rec.Subtype)
                    {
                        Caption = 'Subtype';
                        ToolTip = 'Specifies the Subtype.';
                        ApplicationArea = All;
                }
                field(priceDescription; Rec."Price description")
                    {
                        Caption = 'Price description';
                        ToolTip = 'Specifies the Price description.';
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
                field(sellToCustomerName; Rec."Sell-to Customer Name")
                    {
                        Caption = 'Sell-to Customer Name';
                        ToolTip = 'Specifies the Sell-to Customer Name.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
