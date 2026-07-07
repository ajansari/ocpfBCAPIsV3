namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Document;

page 90962 "ocpfProdOrderLines"
{
    PageType = API;
    Caption = 'Production Order Lines — the items being produced on a production order, with scheduled dates and quantities.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfProdOrderLine';
    EntitySetName = 'ocpfProdOrderLines';
    SourceTable = "Prod. Order Line";
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
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies a value that is copied from the corresponding field on the production order header.';
                    ApplicationArea = All;
                }
                field(prodOrderNo; Rec."Prod. Order No.")
                {
                    Caption = 'Prod. Order No.';
                    ToolTip = 'Specifies the number of the related production order.';
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the Line No..';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the number of the item that is to be produced.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant of the item on the line.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field on the item card. If you enter a variant code, the variant description is copied to this field instead.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies an additional description.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location code, if the produced items should be stored in a specific location.';
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
                field(binCode; Rec."Bin Code")
                {
                    Caption = 'Bin Code';
                    ToolTip = 'Specifies the bin that the produced item is posted to as output, and from where it can be taken to storage or cross-docked.';
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the quantity to be produced if you manually fill in this line.';
                    ApplicationArea = All;
                }
                field(finishedQuantity; Rec."Finished Quantity")
                {
                    Caption = 'Finished Quantity';
                    ToolTip = 'Specifies how much of the quantity on this line has been produced.';
                    ApplicationArea = All;
                }
                field(remainingQuantity; Rec."Remaining Quantity")
                {
                    Caption = 'Remaining Quantity';
                    ToolTip = 'Specifies the difference between the finished and planned quantities, or zero if the finished quantity is greater than the remaining quantity.';
                    ApplicationArea = All;
                }
                field(scrapPct; Rec."Scrap %")
                {
                    Caption = 'Scrap %';
                    ToolTip = 'Specifies the percentage of the item that you expect to be scrapped in the production process.';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Specifies the date when the produced item must be available. The date is copied from the header of the production order.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the entry''s starting date, which is retrieved from the production order routing.';
                    ApplicationArea = All;
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                    ToolTip = 'Specifies the entry''s starting time, which is retrieved from the production order routing.';
                    ApplicationArea = All;
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                    ToolTip = 'Specifies the entry''s ending date, which is retrieved from the production order routing.';
                    ApplicationArea = All;
                }
                field(endingTime; Rec."Ending Time")
                {
                    Caption = 'Ending Time';
                    ToolTip = 'Specifies the entry''s ending time, which is retrieved from the production order routing.';
                    ApplicationArea = All;
                }
                field(planningLevelCode; Rec."Planning Level Code")
                {
                    Caption = 'Planning Level Code';
                    ToolTip = 'Specifies the Planning Level Code.';
                    ApplicationArea = All;
                }
                field(priority; Rec."Priority")
                {
                    Caption = 'Priority';
                    ToolTip = 'Specifies the Priority.';
                    ApplicationArea = All;
                }
                field(productionBomNo; Rec."Production BOM No.")
                {
                    Caption = 'Production BOM No.';
                    ToolTip = 'Specifies the number of the production BOM that is the basis for creating the Prod. Order Component list for this line.';
                    ApplicationArea = All;
                }
                field(routingNo; Rec."Routing No.")
                {
                    Caption = 'Routing No.';
                    ToolTip = 'Specifies the number of the routing used as the basis for creating the production order routing for this line.';
                    ApplicationArea = All;
                }
                field(inventoryPostingGroup; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                    ToolTip = 'Specifies the Inventory Posting Group.';
                    ApplicationArea = All;
                }
                field(routingReferenceNo; Rec."Routing Reference No.")
                {
                    Caption = 'Routing Reference No.';
                    ToolTip = 'Specifies the Routing Reference No..';
                    ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                    ApplicationArea = All;
                }
                field(putAwayStatus; Rec."Put-away Status")
                {
                    Caption = 'Put-away Status';
                    ToolTip = 'Specifies the Put-away Status.';
                    ApplicationArea = All;
                }
                field(costAmount; Rec."Cost Amount")
                {
                    Caption = 'Cost Amount';
                    ToolTip = 'Specifies the total cost on the line by multiplying the unit cost by the quantity.';
                    ApplicationArea = All;
                }
                field(reservedQuantity; Rec."Reserved Quantity")
                {
                    Caption = 'Reserved Quantity';
                    ToolTip = 'Specifies how many units of this item have been reserved.';
                    ApplicationArea = All;
                }
                field(capacityTypeFilter; Rec."Capacity Type Filter")
                {
                    Caption = 'Capacity Type Filter';
                    ToolTip = 'Specifies the Capacity Type Filter.';
                    ApplicationArea = All;
                }
                field(capacityNoFilter; Rec."Capacity No. Filter")
                {
                    Caption = 'Capacity No. Filter';
                    ToolTip = 'Specifies the Capacity No. Filter.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the Date Filter.';
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
                field(manualScheduling; Rec."Manual Scheduling")
                {
                    Caption = 'Manual Scheduling';
                    ToolTip = 'Specifies that the End/Due Dates on the production have been scheduled manually.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item is measured, such as in pieces or tons. By default, the value in the Base Unit of Measure field on the item card is inserted. It will be changed if you switch Product BOM or Production BOM Version.';
                    ApplicationArea = All;
                }
                field(quantityBase; Rec."Quantity (Base)")
                {
                    Caption = 'Quantity (Base)';
                    ToolTip = 'Specifies the quantity for this entry, in base units of measure.';
                    ApplicationArea = All;
                }
                field(finishedQtyBase; Rec."Finished Qty. (Base)")
                {
                    Caption = 'Finished Qty. (Base)';
                    ToolTip = 'Specifies the Finished Qty. (Base).';
                    ApplicationArea = All;
                }
                field(remainingQtyBase; Rec."Remaining Qty. (Base)")
                {
                    Caption = 'Remaining Qty. (Base)';
                    ToolTip = 'Specifies the Remaining Qty. (Base).';
                    ApplicationArea = All;
                }
                field(reservedQtyBase; Rec."Reserved Qty. (Base)")
                {
                    Caption = 'Reserved Qty. (Base)';
                    ToolTip = 'Specifies the reserved quantity of the item, in base units of measure.';
                    ApplicationArea = All;
                }
                field(expectedOperationCostAmt; Rec."Expected Operation Cost Amt.")
                {
                    Caption = 'Expected Operation Cost Amt.';
                    ToolTip = 'Specifies the Expected Operation Cost Amt..';
                    ApplicationArea = All;
                }
                field(totalExpOperOutputQty; Rec."Total Exp. Oper. Output (Qty.)")
                {
                    Caption = 'Total Exp. Oper. Output (Qty.)';
                    ToolTip = 'Specifies the Total Exp. Oper. Output (Qty.).';
                    ApplicationArea = All;
                }
                field(expectedComponentCostAmt; Rec."Expected Component Cost Amt.")
                {
                    Caption = 'Expected Component Cost Amt.';
                    ToolTip = 'Specifies the Expected Component Cost Amt..';
                    ApplicationArea = All;
                }
                field(startingDateTime; Rec."Starting Date-Time")
                {
                    Caption = 'Starting Date-Time';
                    ToolTip = 'Specifies the starting date and the starting time, which are combined in a format called "starting date-time".';
                    ApplicationArea = All;
                }
                field(endingDateTime; Rec."Ending Date-Time")
                {
                    Caption = 'Ending Date-Time';
                    ToolTip = 'Specifies the ending date and the ending time, which are combined in a format called "ending date-time".';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
                field(costAmountAcy; Rec."Cost Amount (ACY)")
                {
                    Caption = 'Cost Amount (ACY)';
                    ToolTip = 'Specifies the Cost Amount (ACY).';
                    ApplicationArea = All;
                }
                field(unitCostAcy; Rec."Unit Cost (ACY)")
                {
                    Caption = 'Unit Cost (ACY)';
                    ToolTip = 'Specifies the Unit Cost (ACY).';
                    ApplicationArea = All;
                }
                field(qtyPutAway; Rec."Qty. Put Away")
                {
                    Caption = 'Qty. Put Away';
                    ToolTip = 'Specifies the quantity that is put away.';
                    ApplicationArea = All;
                }
                field(qtyPutAwayBase; Rec."Qty. Put Away (Base)")
                {
                    Caption = 'Qty. Put Away (Base)';
                    ToolTip = 'Specifies the Qty. Put Away (Base).';
                    ApplicationArea = All;
                }
                field(putAwayQty; Rec."Put-away Qty.")
                {
                    Caption = 'Put-away Qty.';
                    ToolTip = 'Specifies the Put-away Qty..';
                    ApplicationArea = All;
                }
                field(putAwayQtyBase; Rec."Put-away Qty. (Base)")
                {
                    Caption = 'Put-away Qty. (Base)';
                    ToolTip = 'Specifies the Put-away Qty. (Base).';
                    ApplicationArea = All;
                }
                field(lotNoFilter; Rec."Lot No. Filter")
                {
                    Caption = 'Lot No. Filter';
                    ToolTip = 'Specifies the Lot No. Filter.';
                    ApplicationArea = All;
                }
                field(serialNoFilter; Rec."Serial No. Filter")
                {
                    Caption = 'Serial No. Filter';
                    ToolTip = 'Specifies the Serial No. Filter.';
                    ApplicationArea = All;
                }
                field(packageNoFilter; Rec."Package No. Filter")
                {
                    Caption = 'Package No. Filter';
                    ToolTip = 'Specifies the Package No. Filter.';
                    ApplicationArea = All;
                }
                field(productionBomVersionCode; Rec."Production BOM Version Code")
                {
                    Caption = 'Production BOM Version Code';
                    ToolTip = 'Specifies the version code of the production BOM.';
                    ApplicationArea = All;
                }
                field(routingVersionCode; Rec."Routing Version Code")
                {
                    Caption = 'Routing Version Code';
                    ToolTip = 'Specifies the version number of the routing.';
                    ApplicationArea = All;
                }
                field(routingType; Rec."Routing Type")
                {
                    Caption = 'Routing Type';
                    ToolTip = 'Specifies the Routing Type.';
                    ApplicationArea = All;
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    ToolTip = 'Specifies the Qty. per Unit of Measure.';
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
                    ToolTip = 'Specifies whether the supply represented by this line is considered by the planning system when calculating action messages.';
                    ApplicationArea = All;
                }
                field(indirectCostPct; Rec."Indirect Cost %")
                {
                    Caption = 'Indirect Cost %';
                    ToolTip = 'Specifies the Indirect Cost %.';
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
