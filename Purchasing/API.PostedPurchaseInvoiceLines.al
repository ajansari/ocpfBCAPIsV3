namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Purchases.History;

page 90897 "ocpfPostedPurchaseInvoiceLines"
{
    PageType = API;
    Caption = 'Lines of posted purchase invoices.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_purchasing';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfPostedPurchaseInvoiceLine';
    EntitySetName = 'ocpfPostedPurchaseInvoiceLines';
    SourceTable = "Purch. Inv. Line";
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
                        ToolTip = 'Specifies the Buy-from Vendor No..';
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
                field(expectedReceiptDate; Rec."Expected Receipt Date")
                    {
                        Caption = 'Expected Receipt Date';
                        ToolTip = 'Specifies the Expected Receipt Date.';
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
                field(directUnitCost; Rec."Direct Unit Cost")
                    {
                        Caption = 'Direct Unit Cost';
                        ToolTip = 'Specifies the Direct Unit Cost.';
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
                field(unitPriceLcy; Rec."Unit Price (LCY)")
                    {
                        Caption = 'Unit Price (LCY)';
                        ToolTip = 'Specifies the Unit Price (LCY).';
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
                        ToolTip = 'Specifies the Shortcut Dimension 1 Code.';
                        ApplicationArea = All;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                    {
                        Caption = 'Shortcut Dimension 2 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 2 Code.';
                        ApplicationArea = All;
                }
                field(jobNo; Rec."Job No.")
                    {
                        Caption = 'Project No.';
                        ToolTip = 'Specifies the Job No..';
                        ApplicationArea = All;
                }
                field(indirectCostPct; Rec."Indirect Cost %")
                    {
                        Caption = 'Indirect Cost %';
                        ToolTip = 'Specifies the Indirect Cost %.';
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
                        ToolTip = 'Specifies the Order No..';
                        ApplicationArea = All;
                }
                field(orderLineNo; Rec."Order Line No.")
                    {
                        Caption = 'Order Line No.';
                        ToolTip = 'Specifies the Order Line No..';
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
                        ToolTip = 'Specifies the Inv. Discount Amount.';
                        ApplicationArea = All;
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                    {
                        Caption = 'Vendor Item No.';
                        ToolTip = 'Specifies the Vendor Item No..';
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
                        ToolTip = 'Specifies the Line Amount.';
                        ApplicationArea = All;
                }
                field(vatDifference; Rec."VAT Difference")
                    {
                        Caption = 'VAT Difference';
                        ToolTip = 'Specifies the VAT Difference.';
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
                field(prepaymentLine; Rec."Prepayment Line")
                    {
                        Caption = 'Prepayment Line';
                        ToolTip = 'Specifies the Prepayment Line.';
                        ApplicationArea = All;
                }
                field(icPartnerCode; Rec."IC Partner Code")
                    {
                        Caption = 'IC Partner Code';
                        ToolTip = 'Specifies the IC Partner Code.';
                        ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                    {
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the Posting Date.';
                        ApplicationArea = All;
                }
                field(icCrossReferenceNo; Rec."IC Cross-Reference No.")
                    {
                        Caption = 'IC Item Reference No.';
                        ToolTip = 'Specifies the IC Cross-Reference No..';
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
                field(jobTaskNo; Rec."Job Task No.")
                    {
                        Caption = 'Project Task No.';
                        ToolTip = 'Specifies the Job Task No..';
                        ApplicationArea = All;
                }
                field(jobLineType; Rec."Job Line Type")
                    {
                        Caption = 'Project Line Type';
                        ToolTip = 'Specifies the Job Line Type.';
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
                        Caption = 'Project Planning Line No.';
                        ToolTip = 'Specifies the Job Planning Line No..';
                        ApplicationArea = All;
                }
                field(deferralCode; Rec."Deferral Code")
                    {
                        Caption = 'Deferral Code';
                        ToolTip = 'Specifies the Deferral Code.';
                        ApplicationArea = All;
                }
                field(allocationAccountNo; Rec."Allocation Account No.")
                    {
                        Caption = 'Allocation Account No.';
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
            }
        }
    }
}
