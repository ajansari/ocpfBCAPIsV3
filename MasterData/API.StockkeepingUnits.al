namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Location;

page 90851 "ocpfStockkeepingUnits"
{
    PageType = API;
    Caption = 'Stockkeeping Units — location-specific item settings that override the item card defaults for replenishment, costing, and ordering at a given location.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfStockkeepingUnit';
    EntitySetName = 'ocpfStockkeepingUnits';
    SourceTable = "Stockkeeping Unit";
    ODataKeyFields = SystemId;
    DelayedInsert = true;

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
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the item no. for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant code for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location code for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies the description 2 for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(assemblyBom; Rec."Assembly BOM")
                {
                    Caption = 'Assembly BOM';
                    ToolTip = 'Specifies the assembly bom for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(shelfNo; Rec."Shelf No.")
                {
                    Caption = 'Shelf No.';
                    ToolTip = 'Specifies the shelf no. for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the unit cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(standardCost; Rec."Standard Cost")
                {
                    Caption = 'Standard Cost';
                    ToolTip = 'Specifies the standard cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(lastDirectCost; Rec."Last Direct Cost")
                {
                    Caption = 'Last Direct Cost';
                    ToolTip = 'Specifies the last direct cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the vendor no. for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    ToolTip = 'Specifies the vendor item no. for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(leadTimeCalculation; Rec."Lead Time Calculation")
                {
                    Caption = 'Lead Time Calculation';
                    ToolTip = 'Specifies the lead time calculation for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(reorderPoint; Rec."Reorder Point")
                {
                    Caption = 'Reorder Point';
                    ToolTip = 'Specifies the reorder point for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(maximumInventory; Rec."Maximum Inventory")
                {
                    Caption = 'Maximum Inventory';
                    ToolTip = 'Specifies the maximum inventory for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(reorderQuantity; Rec."Reorder Quantity")
                {
                    Caption = 'Reorder Quantity';
                    ToolTip = 'Specifies the reorder quantity for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the comment for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date modified for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Filter; Rec."Global Dimension 1 Filter")
                {
                    Caption = 'Global Dimension 1 Filter';
                    ToolTip = 'Specifies the global dimension 1 filter for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Filter; Rec."Global Dimension 2 Filter")
                {
                    Caption = 'Global Dimension 2 Filter';
                    ToolTip = 'Specifies the global dimension 2 filter for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(inventory; Rec.Inventory)
                {
                    Caption = 'Inventory';
                    ToolTip = 'Specifies the inventory for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(qtyOnPurchOrder; Rec."Qty. on Purch. Order")
                {
                    Caption = 'Qty. on Purch. Order';
                    ToolTip = 'Specifies the qty. on purch. order for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(qtyOnSalesOrder; Rec."Qty. on Sales Order")
                {
                    Caption = 'Qty. on Sales Order';
                    ToolTip = 'Specifies the qty. on sales order for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(dropShipmentFilter; Rec."Drop Shipment Filter")
                {
                    Caption = 'Drop Shipment Filter';
                    ToolTip = 'Specifies the drop shipment filter for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(assemblyPolicy; Rec."Assembly Policy")
                {
                    Caption = 'Assembly Policy';
                    ToolTip = 'Specifies the assembly policy for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(qtyOnAssemblyOrder; Rec."Qty. on Assembly Order")
                {
                    Caption = 'Qty. on Assembly Order';
                    ToolTip = 'Specifies the qty. on assembly order for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(qtyOnAsmComponent; Rec."Qty. on Asm. Component")
                {
                    Caption = 'Qty. on Asm. Component';
                    ToolTip = 'Specifies the qty. on asm. component for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(qtyOnJobOrder; Rec."Qty. on Job Order")
                {
                    Caption = 'Qty. on Project Order';
                    ToolTip = 'Specifies the qty. on job order for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(transferLevelCode; Rec."Transfer-Level Code")
                {
                    Caption = 'Transfer-Level Code';
                    ToolTip = 'Specifies the transfer-level code for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(lotSize; Rec."Lot Size")
                {
                    Caption = 'Lot Size';
                    ToolTip = 'Specifies the lot size for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(discreteOrderQuantity; Rec."Discrete Order Quantity")
                {
                    Caption = 'Discrete Order Quantity';
                    ToolTip = 'Specifies the discrete order quantity for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(minimumOrderQuantity; Rec."Minimum Order Quantity")
                {
                    Caption = 'Minimum Order Quantity';
                    ToolTip = 'Specifies the minimum order quantity for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(maximumOrderQuantity; Rec."Maximum Order Quantity")
                {
                    Caption = 'Maximum Order Quantity';
                    ToolTip = 'Specifies the maximum order quantity for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(safetyStockQuantity; Rec."Safety Stock Quantity")
                {
                    Caption = 'Safety Stock Quantity';
                    ToolTip = 'Specifies the safety stock quantity for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(orderMultiple; Rec."Order Multiple")
                {
                    Caption = 'Order Multiple';
                    ToolTip = 'Specifies the order multiple for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(safetyLeadTime; Rec."Safety Lead Time")
                {
                    Caption = 'Safety Lead Time';
                    ToolTip = 'Specifies the safety lead time for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(componentsAtLocation; Rec."Components at Location")
                {
                    Caption = 'Components at Location';
                    ToolTip = 'Specifies the components at location for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(flushingMethod; Rec."Flushing Method")
                {
                    Caption = 'Flushing Method';
                    ToolTip = 'Specifies the flushing method for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(replenishmentSystem; Rec."Replenishment System")
                {
                    Caption = 'Replenishment System';
                    ToolTip = 'Specifies the replenishment system for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(binFilter; Rec."Bin Filter")
                {
                    Caption = 'Bin Filter';
                    ToolTip = 'Specifies the bin filter for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(timeBucket; Rec."Time Bucket")
                {
                    Caption = 'Time Bucket';
                    ToolTip = 'Specifies the time bucket for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(reorderingPolicy; Rec."Reordering Policy")
                {
                    Caption = 'Reordering Policy';
                    ToolTip = 'Specifies the reordering policy for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(includeInventory; Rec."Include Inventory")
                {
                    Caption = 'Include Inventory';
                    ToolTip = 'Specifies the include inventory for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(manufacturingPolicy; Rec."Manufacturing Policy")
                {
                    Caption = 'Manufacturing Policy';
                    ToolTip = 'Specifies the manufacturing policy for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(reschedulingPeriod; Rec."Rescheduling Period")
                {
                    Caption = 'Rescheduling Period';
                    ToolTip = 'Specifies the rescheduling period for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(lotAccumulationPeriod; Rec."Lot Accumulation Period")
                {
                    Caption = 'Lot Accumulation Period';
                    ToolTip = 'Specifies the lot accumulation period for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(dampenerPeriod; Rec."Dampener Period")
                {
                    Caption = 'Dampener Period';
                    ToolTip = 'Specifies the dampener period for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(dampenerQuantity; Rec."Dampener Quantity")
                {
                    Caption = 'Dampener Quantity';
                    ToolTip = 'Specifies the dampener quantity for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(overflowLevel; Rec."Overflow Level")
                {
                    Caption = 'Overflow Level';
                    ToolTip = 'Specifies the overflow level for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(planMinimalSupply; Rec."Plan Minimal Supply")
                {
                    Caption = 'Plan Minimal Supply';
                    ToolTip = 'Specifies the plan minimal supply for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(transferFromCode; Rec."Transfer-from Code")
                {
                    Caption = 'Transfer-from Code';
                    ToolTip = 'Specifies the transfer-from code for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(qtyInTransit; Rec."Qty. in Transit")
                {
                    Caption = 'Qty. in Transit';
                    ToolTip = 'Specifies the qty. in transit for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(specialEquipmentCode; Rec."Special Equipment Code")
                {
                    Caption = 'Special Equipment Code';
                    ToolTip = 'Specifies the special equipment code for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(putAwayTemplateCode; Rec."Put-away Template Code")
                {
                    Caption = 'Put-away Template Code';
                    ToolTip = 'Specifies the put-away template code for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(putAwayUnitOfMeasureCode; Rec."Put-away Unit of Measure Code")
                {
                    Caption = 'Put-away Unit of Measure Code';
                    ToolTip = 'Specifies the put-away unit of measure code for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(physInvtCountingPeriodCode; Rec."Phys Invt Counting Period Code")
                {
                    Caption = 'Phys Invt Counting Period Code';
                    ToolTip = 'Specifies the phys invt counting period code for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(lastCountingPeriodUpdate; Rec."Last Counting Period Update")
                {
                    Caption = 'Last Counting Period Update';
                    ToolTip = 'Specifies the last counting period update for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(lastPhysInvtDate; Rec."Last Phys. Invt. Date")
                {
                    Caption = 'Last Phys. Invt. Date';
                    ToolTip = 'Specifies the last phys. invt. date for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(useCrossDocking; Rec."Use Cross-Docking")
                {
                    Caption = 'Use Cross-Docking';
                    ToolTip = 'Specifies the use cross-docking for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(nextCountingStartDate; Rec."Next Counting Start Date")
                {
                    Caption = 'Next Counting Start Date';
                    ToolTip = 'Specifies the next counting start date for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(nextCountingEndDate; Rec."Next Counting End Date")
                {
                    Caption = 'Next Counting End Date';
                    ToolTip = 'Specifies the next counting end date for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(rolledUpMaterialCost; Rec."Rolled-up Material Cost")
                {
                    Caption = 'Rolled-up Material Cost';
                    ToolTip = 'Specifies the rolled-up material cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(rolledUpCapacityCost; Rec."Rolled-up Capacity Cost")
                {
                    Caption = 'Rolled-up Capacity Cost';
                    ToolTip = 'Specifies the rolled-up capacity cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(scrap; Rec."Scrap %")
                {
                    Caption = 'Scrap %';
                    ToolTip = 'Specifies the scrap % for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(rolledUpMatNonInvtCost; Rec."Rolled-up Mat. Non-Invt. Cost")
                {
                    Caption = 'Rolled-up Material Non-Inventory Cost';
                    ToolTip = 'Specifies the rolled-up mat. non-invt. cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(singleLevelMaterialCost; Rec."Single-Level Material Cost")
                {
                    Caption = 'Single-Level Material Cost';
                    ToolTip = 'Specifies the single-level material cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(singleLevelCapacityCost; Rec."Single-Level Capacity Cost")
                {
                    Caption = 'Single-Level Capacity Cost';
                    ToolTip = 'Specifies the single-level capacity cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(singleLevelSubcontrdCost; Rec."Single-Level Subcontrd. Cost")
                {
                    Caption = 'Single-Level Subcontrd. Cost';
                    ToolTip = 'Specifies the single-level subcontrd. cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(singleLevelCapOvhdCost; Rec."Single-Level Cap. Ovhd Cost")
                {
                    Caption = 'Single-Level Cap. Ovhd Cost';
                    ToolTip = 'Specifies the single-level cap. ovhd cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(singleLevelMfgOvhdCost; Rec."Single-Level Mfg. Ovhd Cost")
                {
                    Caption = 'Single-Level Mfg. Ovhd Cost';
                    ToolTip = 'Specifies the single-level mfg. ovhd cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(rolledUpSubcontractedCost; Rec."Rolled-up Subcontracted Cost")
                {
                    Caption = 'Rolled-up Subcontracted Cost';
                    ToolTip = 'Specifies the rolled-up subcontracted cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(rolledUpMfgOvhdCost; Rec."Rolled-up Mfg. Ovhd Cost")
                {
                    Caption = 'Rolled-up Mfg. Ovhd Cost';
                    ToolTip = 'Specifies the rolled-up mfg. ovhd cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(rolledUpCapOverheadCost; Rec."Rolled-up Cap. Overhead Cost")
                {
                    Caption = 'Rolled-up Cap. Overhead Cost';
                    ToolTip = 'Specifies the rolled-up cap. overhead cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(singleLvlMatNonInvtCost; Rec."Single-Lvl Mat. Non-Invt. Cost")
                {
                    Caption = 'Single-Level Material Non-Inventory Cost';
                    ToolTip = 'Specifies the single-lvl mat. non-invt. cost for this stockkeeping unit record.';
                    ApplicationArea = All;
                }
                field(transOrdReceiptQty; Rec."Trans. Ord. Receipt (Qty.)")
                {
                    Caption = 'Trans. Ord. Receipt (Qty.)';
                    ToolTip = 'Specifies the quantity of the item units that remains to be received but are not yet shipped as the difference between the Quantity and the Quantity Shipped fields.';
                    ApplicationArea = All;
                }
                field(transOrdShipmentQty; Rec."Trans. Ord. Shipment (Qty.)")
                {
                    Caption = 'Trans. Ord. Shipment (Qty.)';
                    ToolTip = 'Specifies the quantity of the item units that remains to be shipped as the difference between the Quantity and the Quantity Shipped fields.';
                    ApplicationArea = All;
                }
                field(purchReqReceiptQty; Rec."Purch. Req. Receipt (Qty.)")
                {
                    Caption = 'Purch. Req. Receipt (Qty.)';
                    ToolTip = 'Specifies the Purch. Req. Receipt (Qty.).';
                    ApplicationArea = All;
                }
                field(purchReqReleaseQty; Rec."Purch. Req. Release (Qty.)")
                {
                    Caption = 'Purch. Req. Release (Qty.)';
                    ToolTip = 'Specifies the Purch. Req. Release (Qty.).';
                    ApplicationArea = All;
                }
            }
        }
    }
}