namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Projects.Project.Planning;

page 90913 "ocpfProjectPlanningLines"
{
    PageType = API;
    Caption = 'Project planning lines — budget and schedule lines for a project task.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfProjectPlanningLine';
    EntitySetName = 'ocpfProjectPlanningLines';
    SourceTable = "Job Planning Line";
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
                field(lineNo; Rec."Line No.")
                    {
                        Caption = 'Line No.';
                        ToolTip = 'Specifies the Line No..';
                        ApplicationArea = All;
                }
                field(jobNo; Rec."Job No.")
                    {
                        Caption = 'Project No.';
                        ToolTip = 'Specifies the Job No..';
                        ApplicationArea = All;
                }
                field(planningDate; Rec."Planning Date")
                    {
                        Caption = 'Planning Date';
                        ToolTip = 'Specifies the Planning Date.';
                        ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                    {
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the Document No..';
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
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                    {
                        Caption = 'Quantity';
                        ToolTip = 'Specifies the Quantity.';
                        ApplicationArea = All;
                }
                field(directUnitCostLcy; Rec."Direct Unit Cost (LCY)")
                    {
                        Caption = 'Direct Unit Cost (LCY)';
                        ToolTip = 'Specifies the Direct Unit Cost (LCY).';
                        ApplicationArea = All;
                }
                field(unitCostLcy; Rec."Unit Cost (LCY)")
                    {
                        Caption = 'Unit Cost (LCY)';
                        ToolTip = 'Specifies the Unit Cost (LCY).';
                        ApplicationArea = All;
                }
                field(totalCostLcy; Rec."Total Cost (LCY)")
                    {
                        Caption = 'Total Cost (LCY)';
                        ToolTip = 'Specifies the Total Cost (LCY).';
                        ApplicationArea = All;
                }
                field(unitPriceLcy; Rec."Unit Price (LCY)")
                    {
                        Caption = 'Unit Price (LCY)';
                        ToolTip = 'Specifies the Unit Price (LCY).';
                        ApplicationArea = All;
                }
                field(totalPriceLcy; Rec."Total Price (LCY)")
                    {
                        Caption = 'Total Price (LCY)';
                        ToolTip = 'Specifies the Total Price (LCY).';
                        ApplicationArea = All;
                }
                field(resourceGroupNo; Rec."Resource Group No.")
                    {
                        Caption = 'Resource Group No.';
                        ToolTip = 'Specifies the Resource Group No..';
                        ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                    {
                        Caption = 'Unit of Measure Code';
                        ToolTip = 'Specifies the Unit of Measure Code.';
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
                field(locationCode; Rec."Location Code")
                    {
                        Caption = 'Location Code';
                        ToolTip = 'Specifies the Location Code.';
                        ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                    {
                        Caption = 'Last Date Modified';
                        ToolTip = 'Specifies the Last Date Modified.';
                        ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                    {
                        Caption = 'User ID';
                        ToolTip = 'Specifies the User ID.';
                        ApplicationArea = All;
                }
                field(workTypeCode; Rec."Work Type Code")
                    {
                        Caption = 'Work Type Code';
                        ToolTip = 'Specifies the Work Type Code.';
                        ApplicationArea = All;
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                    {
                        Caption = 'Customer Price Group';
                        ToolTip = 'Specifies the Customer Price Group.';
                        ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                    {
                        Caption = 'Country/Region Code';
                        ToolTip = 'Specifies the Country/Region Code.';
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
                field(documentDate; Rec."Document Date")
                    {
                        Caption = 'Document Date';
                        ToolTip = 'Specifies the Document Date.';
                        ApplicationArea = All;
                }
                field(planningDueDate; Rec."Planning Due Date")
                    {
                        Caption = 'Planning Due Date';
                        ToolTip = 'Specifies the Planning Due Date.';
                        ApplicationArea = All;
                }
                field(qtyToAssemble; Rec."Qty. to Assemble")
                    {
                        Caption = 'Qty. to Assemble';
                        ToolTip = 'Specifies the Qty. to Assemble.';
                        ApplicationArea = All;
                }
                field(qtyToAssembleBase; Rec."Qty. to Assemble (Base)")
                    {
                        Caption = 'Qty. to Assemble (Base)';
                        ToolTip = 'Specifies the Qty. to Assemble (Base).';
                        ApplicationArea = All;
                }
                field(assembleToOrder; Rec."Assemble to Order")
                    {
                        Caption = 'Assemble to Order';
                        ToolTip = 'Specifies the Assemble to Order.';
                        ApplicationArea = All;
                }
                field(bomItemNo; Rec."BOM Item No.")
                    {
                        Caption = 'BOM Item No.';
                        ToolTip = 'Specifies the BOM Item No..';
                        ApplicationArea = All;
                }
                field(attachedToLineNo; Rec."Attached to Line No.")
                    {
                        Caption = 'Attached to Line No.';
                        ToolTip = 'Specifies the Attached to Line No..';
                        ApplicationArea = All;
                }
                field(jobTaskNo; Rec."Job Task No.")
                    {
                        Caption = 'Project Task No.';
                        ToolTip = 'Specifies the Job Task No..';
                        ApplicationArea = All;
                }
                field(lineAmountLcy; Rec."Line Amount (LCY)")
                    {
                        Caption = 'Line Amount (LCY)';
                        ToolTip = 'Specifies the Line Amount (LCY).';
                        ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                    {
                        Caption = 'Unit Cost';
                        ToolTip = 'Specifies the Unit Cost.';
                        ApplicationArea = All;
                }
                field(totalCost; Rec."Total Cost")
                    {
                        Caption = 'Total Cost';
                        ToolTip = 'Specifies the Total Cost.';
                        ApplicationArea = All;
                }
                field(unitPrice; Rec."Unit Price")
                    {
                        Caption = 'Unit Price';
                        ToolTip = 'Specifies the Unit Price.';
                        ApplicationArea = All;
                }
                field(totalPrice; Rec."Total Price")
                    {
                        Caption = 'Total Price';
                        ToolTip = 'Specifies the Total Price.';
                        ApplicationArea = All;
                }
                field(lineAmount; Rec."Line Amount")
                    {
                        Caption = 'Line Amount';
                        ToolTip = 'Specifies the Line Amount.';
                        ApplicationArea = All;
                }
                field(lineDiscountAmount; Rec."Line Discount Amount")
                    {
                        Caption = 'Line Discount Amount';
                        ToolTip = 'Specifies the Line Discount Amount.';
                        ApplicationArea = All;
                }
                field(lineDiscountAmountLcy; Rec."Line Discount Amount (LCY)")
                    {
                        Caption = 'Line Discount Amount (LCY)';
                        ToolTip = 'Specifies the Line Discount Amount (LCY).';
                        ApplicationArea = All;
                }
                field(costFactor; Rec."Cost Factor")
                    {
                        Caption = 'Cost Factor';
                        ToolTip = 'Specifies the Cost Factor.';
                        ApplicationArea = All;
                }
                field(serialNo; Rec."Serial No.")
                    {
                        Caption = 'Serial No.';
                        ToolTip = 'Specifies the Serial No..';
                        ApplicationArea = All;
                }
                field(lotNo; Rec."Lot No.")
                    {
                        Caption = 'Lot No.';
                        ToolTip = 'Specifies the Lot No..';
                        ApplicationArea = All;
                }
                field(lineDiscountPct; Rec."Line Discount %")
                    {
                        Caption = 'Line Discount %';
                        ToolTip = 'Specifies the Line Discount %.';
                        ApplicationArea = All;
                }
                field(lineType; Rec."Line Type")
                    {
                        Caption = 'Line Type';
                        ToolTip = 'Specifies the Line Type.';
                        ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                    {
                        Caption = 'Currency Code';
                        ToolTip = 'Specifies the Currency Code.';
                        ApplicationArea = All;
                }
                field(currencyDate; Rec."Currency Date")
                    {
                        Caption = 'Currency Date';
                        ToolTip = 'Specifies the Currency Date.';
                        ApplicationArea = All;
                }
                field(currencyFactor; Rec."Currency Factor")
                    {
                        Caption = 'Currency Factor';
                        ToolTip = 'Specifies the Currency Factor.';
                        ApplicationArea = All;
                }
                field(scheduleLine; Rec."Schedule Line")
                    {
                        Caption = 'Budget Line';
                        ToolTip = 'Specifies the Schedule Line.';
                        ApplicationArea = All;
                }
                field(contractLine; Rec."Contract Line")
                    {
                        Caption = 'Billable Line';
                        ToolTip = 'Specifies the Contract Line.';
                        ApplicationArea = All;
                }
                field(jobContractEntryNo; Rec."Job Contract Entry No.")
                    {
                        Caption = 'Project Contract Entry No.';
                        ToolTip = 'Specifies the Job Contract Entry No..';
                        ApplicationArea = All;
                }
                field(invoicedAmountLcy; Rec."Invoiced Amount (LCY)")
                    {
                        Caption = 'Invoiced Amount (LCY)';
                        ToolTip = 'Specifies the Invoiced Amount (LCY).';
                        ApplicationArea = All;
                }
                field(invoicedCostAmountLcy; Rec."Invoiced Cost Amount (LCY)")
                    {
                        Caption = 'Invoiced Cost Amount (LCY)';
                        ToolTip = 'Specifies the Invoiced Cost Amount (LCY).';
                        ApplicationArea = All;
                }
                field(vatUnitPrice; Rec."VAT Unit Price")
                    {
                        Caption = 'VAT Unit Price';
                        ToolTip = 'Specifies the VAT Unit Price.';
                        ApplicationArea = All;
                }
                field(vatLineDiscountAmount; Rec."VAT Line Discount Amount")
                    {
                        Caption = 'VAT Line Discount Amount';
                        ToolTip = 'Specifies the VAT Line Discount Amount.';
                        ApplicationArea = All;
                }
                field(vatLineAmount; Rec."VAT Line Amount")
                    {
                        Caption = 'VAT Line Amount';
                        ToolTip = 'Specifies the VAT Line Amount.';
                        ApplicationArea = All;
                }
                field(vatPct; Rec."VAT %")
                    {
                        Caption = 'VAT %';
                        ToolTip = 'Specifies the VAT %.';
                        ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                    {
                        Caption = 'Description 2';
                        ToolTip = 'Specifies the Description 2.';
                        ApplicationArea = All;
                }
                field(jobLedgerEntryNo; Rec."Job Ledger Entry No.")
                    {
                        Caption = 'Project Ledger Entry No.';
                        ToolTip = 'Specifies the Job Ledger Entry No..';
                        ApplicationArea = All;
                }
                field(status; Rec.Status)
                    {
                        Caption = 'Status';
                        ToolTip = 'Specifies the Status.';
                        ApplicationArea = All;
                }
                field(ledgerEntryType; Rec."Ledger Entry Type")
                    {
                        Caption = 'Ledger Entry Type';
                        ToolTip = 'Specifies the Ledger Entry Type.';
                        ApplicationArea = All;
                }
                field(ledgerEntryNo; Rec."Ledger Entry No.")
                    {
                        Caption = 'Ledger Entry No.';
                        ToolTip = 'Specifies the Ledger Entry No..';
                        ApplicationArea = All;
                }
                field(systemCreatedEntry; Rec."System-Created Entry")
                    {
                        Caption = 'System-Created Entry';
                        ToolTip = 'Specifies the System-Created Entry.';
                        ApplicationArea = All;
                }
                field(usageLink; Rec."Usage Link")
                    {
                        Caption = 'Usage Link';
                        ToolTip = 'Specifies the Usage Link.';
                        ApplicationArea = All;
                }
                field(remainingQty; Rec."Remaining Qty.")
                    {
                        Caption = 'Remaining Qty.';
                        ToolTip = 'Specifies the Remaining Qty..';
                        ApplicationArea = All;
                }
                field(remainingQtyBase; Rec."Remaining Qty. (Base)")
                    {
                        Caption = 'Remaining Qty. (Base)';
                        ToolTip = 'Specifies the Remaining Qty. (Base).';
                        ApplicationArea = All;
                }
                field(remainingTotalCost; Rec."Remaining Total Cost")
                    {
                        Caption = 'Remaining Total Cost';
                        ToolTip = 'Specifies the Remaining Total Cost.';
                        ApplicationArea = All;
                }
                field(remainingTotalCostLcy; Rec."Remaining Total Cost (LCY)")
                    {
                        Caption = 'Remaining Total Cost (LCY)';
                        ToolTip = 'Specifies the Remaining Total Cost (LCY).';
                        ApplicationArea = All;
                }
                field(remainingLineAmount; Rec."Remaining Line Amount")
                    {
                        Caption = 'Remaining Line Amount';
                        ToolTip = 'Specifies the Remaining Line Amount.';
                        ApplicationArea = All;
                }
                field(remainingLineAmountLcy; Rec."Remaining Line Amount (LCY)")
                    {
                        Caption = 'Remaining Line Amount (LCY)';
                        ToolTip = 'Specifies the Remaining Line Amount (LCY).';
                        ApplicationArea = All;
                }
                field(qtyPosted; Rec."Qty. Posted")
                    {
                        Caption = 'Qty. Posted';
                        ToolTip = 'Specifies the Qty. Posted.';
                        ApplicationArea = All;
                }
                field(qtyToTransferToJournal; Rec."Qty. to Transfer to Journal")
                    {
                        Caption = 'Qty. to Transfer to Journal';
                        ToolTip = 'Specifies the Qty. to Transfer to Journal.';
                        ApplicationArea = All;
                }
                field(postedTotalCost; Rec."Posted Total Cost")
                    {
                        Caption = 'Posted Total Cost';
                        ToolTip = 'Specifies the Posted Total Cost.';
                        ApplicationArea = All;
                }
                field(postedTotalCostLcy; Rec."Posted Total Cost (LCY)")
                    {
                        Caption = 'Posted Total Cost (LCY)';
                        ToolTip = 'Specifies the Posted Total Cost (LCY).';
                        ApplicationArea = All;
                }
                field(postedLineAmount; Rec."Posted Line Amount")
                    {
                        Caption = 'Posted Line Amount';
                        ToolTip = 'Specifies the Posted Line Amount.';
                        ApplicationArea = All;
                }
                field(postedLineAmountLcy; Rec."Posted Line Amount (LCY)")
                    {
                        Caption = 'Posted Line Amount (LCY)';
                        ToolTip = 'Specifies the Posted Line Amount (LCY).';
                        ApplicationArea = All;
                }
                field(qtyTransferredToInvoice; Rec."Qty. Transferred to Invoice")
                    {
                        Caption = 'Qty. Transferred to Invoice';
                        ToolTip = 'Specifies the Qty. Transferred to Invoice.';
                        ApplicationArea = All;
                }
                field(qtyToTransferToInvoice; Rec."Qty. to Transfer to Invoice")
                    {
                        Caption = 'Qty. to Transfer to Invoice';
                        ToolTip = 'Specifies the Qty. to Transfer to Invoice.';
                        ApplicationArea = All;
                }
                field(qtyInvoiced; Rec."Qty. Invoiced")
                    {
                        Caption = 'Qty. Invoiced';
                        ToolTip = 'Specifies the Qty. Invoiced.';
                        ApplicationArea = All;
                }
                field(qtyToInvoice; Rec."Qty. to Invoice")
                    {
                        Caption = 'Qty. to Invoice';
                        ToolTip = 'Specifies the Qty. to Invoice.';
                        ApplicationArea = All;
                }
                field(reservedQuantity; Rec."Reserved Quantity")
                    {
                        Caption = 'Reserved Quantity';
                        ToolTip = 'Specifies the Reserved Quantity.';
                        ApplicationArea = All;
                }
                field(reservedQtyBase; Rec."Reserved Qty. (Base)")
                    {
                        Caption = 'Reserved Qty. (Base)';
                        ToolTip = 'Specifies the Reserved Qty. (Base).';
                        ApplicationArea = All;
                }
                field(reserve; Rec.Reserve)
                    {
                        Caption = 'Reserve';
                        ToolTip = 'Specifies the Reserve.';
                        ApplicationArea = All;
                }
                field(planned; Rec.Planned)
                    {
                        Caption = 'Planned';
                        ToolTip = 'Specifies the Planned.';
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
                field(quantityBase; Rec."Quantity (Base)")
                    {
                        Caption = 'Quantity (Base)';
                        ToolTip = 'Specifies the Quantity (Base).';
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
                field(plannedDeliveryDate; Rec."Planned Delivery Date")
                    {
                        Caption = 'Planned Delivery Date';
                        ToolTip = 'Specifies the Planned Delivery Date.';
                        ApplicationArea = All;
                }
                field(packageNo; Rec."Package No.")
                    {
                        Caption = 'Package No.';
                        ToolTip = 'Specifies the Package No..';
                        ApplicationArea = All;
                }
                field(priceCalculationMethod; Rec."Price Calculation Method")
                    {
                        Caption = 'Price Calculation Method';
                        ToolTip = 'Specifies the Price Calculation Method.';
                        ApplicationArea = All;
                }
                field(costCalculationMethod; Rec."Cost Calculation Method")
                    {
                        Caption = 'Cost Calculation Method';
                        ToolTip = 'Specifies the Cost Calculation Method.';
                        ApplicationArea = All;
                }
                field(pickQty; Rec."Pick Qty.")
                    {
                        Caption = 'Pick Qty.';
                        ToolTip = 'Specifies the Pick Qty..';
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
                field(qtyOnJournal; Rec."Qty. on Journal")
                    {
                        Caption = 'Qty. on Journal';
                        ToolTip = 'Specifies the Qty. on Journal.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
