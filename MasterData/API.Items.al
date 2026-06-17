namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Item;

page 90846 "ocpfItems"
{
    PageType = API;
    Caption = 'Items — master records for all inventory items, non-inventory items, and services bought or sold by the company.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfItem';
    EntitySetName = 'ocpfItems';
    SourceTable = Item;
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
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the no. for this item record.';
                    ApplicationArea = All;
                }
                field(no2; Rec."No. 2")
                {
                    Caption = 'No. 2';
                    ToolTip = 'Specifies the no. 2 for this item record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this item record.';
                    ApplicationArea = All;
                }
                field(searchDescription; Rec."Search Description")
                {
                    Caption = 'Search Description';
                    ToolTip = 'Specifies the search description for this item record.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies the description 2 for this item record.';
                    ApplicationArea = All;
                }
                field(assemblyBom; Rec."Assembly BOM")
                {
                    Caption = 'Assembly BOM';
                    ToolTip = 'Specifies the assembly bom for this item record.';
                    ApplicationArea = All;
                }
                field(baseUnitOfMeasure; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                    ToolTip = 'Specifies the base unit of measure for this item record.';
                    ApplicationArea = All;
                }
                field(priceUnitConversion; Rec."Price Unit Conversion")
                {
                    Caption = 'Price Unit Conversion';
                    ToolTip = 'Specifies the price unit conversion for this item record.';
                    ApplicationArea = All;
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type for this item record.';
                    ApplicationArea = All;
                }
                field(inventoryPostingGroup; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                    ToolTip = 'Specifies the inventory posting group for this item record.';
                    ApplicationArea = All;
                }
                field(shelfNo; Rec."Shelf No.")
                {
                    Caption = 'Shelf No.';
                    ToolTip = 'Specifies the shelf no. for this item record.';
                    ApplicationArea = All;
                }
                field(itemDiscGroup; Rec."Item Disc. Group")
                {
                    Caption = 'Item Disc. Group';
                    ToolTip = 'Specifies the item disc. group for this item record.';
                    ApplicationArea = All;
                }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
                {
                    Caption = 'Allow Invoice Disc.';
                    ToolTip = 'Specifies the allow invoice disc. for this item record.';
                    ApplicationArea = All;
                }
                field(statisticsGroup; Rec."Statistics Group")
                {
                    Caption = 'Statistics Group';
                    ToolTip = 'Specifies the statistics group.';
                    ApplicationArea = All;
                }
                field(commissionGroup; Rec."Commission Group")
                {
                    Caption = 'Commission Group';
                    ToolTip = 'Specifies the commission group for this item record.';
                    ApplicationArea = All;
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ToolTip = 'Specifies the unit price for this item record.';
                    ApplicationArea = All;
                }
                field(priceProfitCalculation; Rec."Price/Profit Calculation")
                {
                    Caption = 'Price/Profit Calculation';
                    ToolTip = 'Specifies the price/profit calculation for this item record.';
                    ApplicationArea = All;
                }
                field(profit; Rec."Profit %")
                {
                    Caption = 'Profit %';
                    ToolTip = 'Specifies the profit % for this item record.';
                    ApplicationArea = All;
                }
                field(costingMethod; Rec."Costing Method")
                {
                    Caption = 'Costing Method';
                    ToolTip = 'Specifies the costing method for this item record.';
                    ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the unit cost for this item record.';
                    ApplicationArea = All;
                }
                field(standardCost; Rec."Standard Cost")
                {
                    Caption = 'Standard Cost';
                    ToolTip = 'Specifies the standard cost for this item record.';
                    ApplicationArea = All;
                }
                field(lastDirectCost; Rec."Last Direct Cost")
                {
                    Caption = 'Last Direct Cost';
                    ToolTip = 'Specifies the last direct cost for this item record.';
                    ApplicationArea = All;
                }
                field(indirectCost; Rec."Indirect Cost %")
                {
                    Caption = 'Indirect Cost %';
                    ToolTip = 'Specifies the indirect cost % for this item record.';
                    ApplicationArea = All;
                }
                field(costIsAdjusted; Rec."Cost is Adjusted")
                {
                    Caption = 'Cost is Adjusted';
                    ToolTip = 'Specifies the cost is adjusted for this item record.';
                    ApplicationArea = All;
                }
                field(allowOnlineAdjustment; Rec."Allow Online Adjustment")
                {
                    Caption = 'Allow Online Adjustment';
                    ToolTip = 'Specifies the allow online adjustment for this item record.';
                    ApplicationArea = All;
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the vendor no. for this item record.';
                    ApplicationArea = All;
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    ToolTip = 'Specifies the vendor item no. for this item record.';
                    ApplicationArea = All;
                }
                field(leadTimeCalculation; Rec."Lead Time Calculation")
                {
                    Caption = 'Lead Time Calculation';
                    ToolTip = 'Specifies the lead time calculation for this item record.';
                    ApplicationArea = All;
                }
                field(reorderPoint; Rec."Reorder Point")
                {
                    Caption = 'Reorder Point';
                    ToolTip = 'Specifies the reorder point for this item record.';
                    ApplicationArea = All;
                }
                field(maximumInventory; Rec."Maximum Inventory")
                {
                    Caption = 'Maximum Inventory';
                    ToolTip = 'Specifies the maximum inventory for this item record.';
                    ApplicationArea = All;
                }
                field(reorderQuantity; Rec."Reorder Quantity")
                {
                    Caption = 'Reorder Quantity';
                    ToolTip = 'Specifies the reorder quantity for this item record.';
                    ApplicationArea = All;
                }
                field(alternativeItemNo; Rec."Alternative Item No.")
                {
                    Caption = 'Alternative Item No.';
                    ToolTip = 'Specifies the alternative item no. for this item record.';
                    ApplicationArea = All;
                }
                field(unitListPrice; Rec."Unit List Price")
                {
                    Caption = 'Unit List Price';
                    ToolTip = 'Specifies the unit list price for this item record.';
                    ApplicationArea = All;
                }
                field(dutyDue; Rec."Duty Due %")
                {
                    Caption = 'Duty Due %';
                    ToolTip = 'Specifies the duty due % for this item record.';
                    ApplicationArea = All;
                }
                field(dutyCode; Rec."Duty Code")
                {
                    Caption = 'Duty Code';
                    ToolTip = 'Specifies the duty code for this item record.';
                    ApplicationArea = All;
                }
                field(grossWeight; Rec."Gross Weight")
                {
                    Caption = 'Gross Weight';
                    ToolTip = 'Specifies the gross weight for this item record.';
                    ApplicationArea = All;
                }
                field(netWeight; Rec."Net Weight")
                {
                    Caption = 'Net Weight';
                    ToolTip = 'Specifies the net weight for this item record.';
                    ApplicationArea = All;
                }
                field(unitsPerParcel; Rec."Units per Parcel")
                {
                    Caption = 'Units per Parcel';
                    ToolTip = 'Specifies the units per parcel for this item record.';
                    ApplicationArea = All;
                }
                field(unitVolume; Rec."Unit Volume")
                {
                    Caption = 'Unit Volume';
                    ToolTip = 'Specifies the unit volume for this item record.';
                    ApplicationArea = All;
                }
                field(durability; Rec.Durability)
                {
                    Caption = 'Durability';
                    ToolTip = 'Specifies the durability for this item record.';
                    ApplicationArea = All;
                }
                field(freightType; Rec."Freight Type")
                {
                    Caption = 'Freight Type';
                    ToolTip = 'Specifies the freight type for this item record.';
                    ApplicationArea = All;
                }
                field(tariffNo; Rec."Tariff No.")
                {
                    Caption = 'Tariff No.';
                    ToolTip = 'Specifies the tariff no. for this item record.';
                    ApplicationArea = All;
                }
                field(dutyUnitConversion; Rec."Duty Unit Conversion")
                {
                    Caption = 'Duty Unit Conversion';
                    ToolTip = 'Specifies the duty unit conversion for this item record.';
                    ApplicationArea = All;
                }
                field(countryRegionPurchasedCode; Rec."Country/Region Purchased Code")
                {
                    Caption = 'Country/Region Purchased Code';
                    ToolTip = 'Specifies the country/region purchased code for this item record.';
                    ApplicationArea = All;
                }
                field(budgetQuantity; Rec."Budget Quantity")
                {
                    Caption = 'Budget Quantity';
                    ToolTip = 'Specifies the budget quantity for this item record.';
                    ApplicationArea = All;
                }
                field(budgetedAmount; Rec."Budgeted Amount")
                {
                    Caption = 'Budgeted Amount';
                    ToolTip = 'Specifies the budgeted amount for this item record.';
                    ApplicationArea = All;
                }
                field(budgetProfit; Rec."Budget Profit")
                {
                    Caption = 'Budget Profit';
                    ToolTip = 'Specifies the budget profit for this item record.';
                    ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the comment for this item record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the blocked for this item record.';
                    ApplicationArea = All;
                }
                field(costIsPostedToGL; Rec."Cost is Posted to G/L")
                {
                    Caption = 'Cost is Posted to G/L';
                    ToolTip = 'Specifies the cost is posted to g/l for this item record.';
                    ApplicationArea = All;
                }
                field(blockReason; Rec."Block Reason")
                {
                    Caption = 'Block Reason';
                    ToolTip = 'Specifies the block reason for this item record.';
                    ApplicationArea = All;
                }
                field(lastDatetimeModified; Rec."Last DateTime Modified")
                {
                    Caption = 'Last DateTime Modified';
                    ToolTip = 'Specifies the last datetime modified for this item record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date modified for this item record.';
                    ApplicationArea = All;
                }
                field(lastTimeModified; Rec."Last Time Modified")
                {
                    Caption = 'Last Time Modified';
                    ToolTip = 'Specifies the last time modified for this item record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this item record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Filter; Rec."Global Dimension 1 Filter")
                {
                    Caption = 'Global Dimension 1 Filter';
                    ToolTip = 'Specifies the global dimension 1 filter for this item record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Filter; Rec."Global Dimension 2 Filter")
                {
                    Caption = 'Global Dimension 2 Filter';
                    ToolTip = 'Specifies the global dimension 2 filter for this item record.';
                    ApplicationArea = All;
                }
                field(locationFilter; Rec."Location Filter")
                {
                    Caption = 'Location Filter';
                    ToolTip = 'Specifies the location filter for this item record.';
                    ApplicationArea = All;
                }
                field(inventory; Rec.Inventory)
                {
                    Caption = 'Inventory';
                    ToolTip = 'Specifies the inventory for this item record.';
                    ApplicationArea = All;
                }
                field(netInvoicedQty; Rec."Net Invoiced Qty.")
                {
                    Caption = 'Net Invoiced Qty.';
                    ToolTip = 'Specifies the net invoiced qty. for this item record.';
                    ApplicationArea = All;
                }
                field(netChange; Rec."Net Change")
                {
                    Caption = 'Net Change';
                    ToolTip = 'Specifies the net change for this item record.';
                    ApplicationArea = All;
                }
                field(qtyOnPurchOrder; Rec."Qty. on Purch. Order")
                {
                    Caption = 'Qty. on Purch. Order';
                    ToolTip = 'Specifies the qty. on purch. order for this item record.';
                    ApplicationArea = All;
                }
                field(qtyOnSalesOrder; Rec."Qty. on Sales Order")
                {
                    Caption = 'Qty. on Sales Order';
                    ToolTip = 'Specifies the qty. on sales order for this item record.';
                    ApplicationArea = All;
                }
                field(priceIncludesVat; Rec."Price Includes VAT")
                {
                    Caption = 'Price Includes VAT';
                    ToolTip = 'Specifies the price includes vat for this item record.';
                    ApplicationArea = All;
                }
                field(dropShipmentFilter; Rec."Drop Shipment Filter")
                {
                    Caption = 'Drop Shipment Filter';
                    ToolTip = 'Specifies the drop shipment filter for this item record.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the gen. prod. posting group for this item record.';
                    ApplicationArea = All;
                }
                field(picture; Rec.Picture)
                {
                    Caption = 'Picture';
                    ToolTip = 'Specifies the picture for this item record.';
                    ApplicationArea = All;
                }
                field(countryRegionOfOriginCode; Rec."Country/Region of Origin Code")
                {
                    Caption = 'Country/Region of Origin Code';
                    ToolTip = 'Specifies the country/region of origin code for this item record.';
                    ApplicationArea = All;
                }
                field(automaticExtTexts; Rec."Automatic Ext. Texts")
                {
                    Caption = 'Automatic Ext. Texts';
                    ToolTip = 'Specifies the automatic ext. texts for this item record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this item record.';
                    ApplicationArea = All;
                }
                field(taxGroupCode; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';
                    ToolTip = 'Specifies the tax group code for this item record.';
                    ApplicationArea = All;
                }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                    ToolTip = 'Specifies the vat prod. posting group for this item record.';
                    ApplicationArea = All;
                }
                field(reserve; Rec.Reserve)
                {
                    Caption = 'Reserve';
                    ToolTip = 'Specifies the reserve for this item record.';
                    ApplicationArea = All;
                }
                field(reservedQtyOnInventory; Rec."Reserved Qty. on Inventory")
                {
                    Caption = 'Reserved Qty. on Inventory';
                    ToolTip = 'Specifies the reserved qty. on inventory for this item record.';
                    ApplicationArea = All;
                }
                field(reservedQtyOnPurchOrders; Rec."Reserved Qty. on Purch. Orders")
                {
                    Caption = 'Reserved Qty. on Purch. Orders';
                    ToolTip = 'Specifies the reserved qty. on purch. orders for this item record.';
                    ApplicationArea = All;
                }
                field(reservedQtyOnSalesOrders; Rec."Reserved Qty. on Sales Orders")
                {
                    Caption = 'Reserved Qty. on Sales Orders';
                    ToolTip = 'Specifies the reserved qty. on sales orders for this item record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this item record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this item record.';
                    ApplicationArea = All;
                }
                field(resQtyOnOutboundTransfer; Rec."Res. Qty. on Outbound Transfer")
                {
                    Caption = 'Res. Qty. on Outbound Transfer';
                    ToolTip = 'Specifies the res. qty. on outbound transfer for this item record.';
                    ApplicationArea = All;
                }
                field(resQtyOnInboundTransfer; Rec."Res. Qty. on Inbound Transfer")
                {
                    Caption = 'Res. Qty. on Inbound Transfer';
                    ToolTip = 'Specifies the res. qty. on inbound transfer for this item record.';
                    ApplicationArea = All;
                }
                field(resQtyOnSalesReturns; Rec."Res. Qty. on Sales Returns")
                {
                    Caption = 'Res. Qty. on Sales Returns';
                    ToolTip = 'Specifies the res. qty. on sales returns for this item record.';
                    ApplicationArea = All;
                }
                field(resQtyOnPurchReturns; Rec."Res. Qty. on Purch. Returns")
                {
                    Caption = 'Res. Qty. on Purch. Returns';
                    ToolTip = 'Specifies the res. qty. on purch. returns for this item record.';
                    ApplicationArea = All;
                }
                field(stockoutWarning; Rec."Stockout Warning")
                {
                    Caption = 'Stockout Warning';
                    ToolTip = 'Specifies the stockout warning for this item record.';
                    ApplicationArea = All;
                }
                field(preventNegativeInventory; Rec."Prevent Negative Inventory")
                {
                    Caption = 'Prevent Negative Inventory';
                    ToolTip = 'Specifies the prevent negative inventory for this item record.';
                    ApplicationArea = All;
                }
                field(variantMandatoryIfExists; Rec."Variant Mandatory if Exists")
                {
                    Caption = 'Variant Mandatory if Exists';
                    ToolTip = 'Specifies the variant mandatory if exists for this item record.';
                    ApplicationArea = All;
                }
                field(applicationWkshUserId; Rec."Application Wksh. User ID")
                {
                    Caption = 'Application Wksh. User ID';
                    ToolTip = 'Specifies the application wksh. user id for this item record.';
                    ApplicationArea = All;
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dynamics 365 Sales';
                    ToolTip = 'Specifies the coupled to dataverse for this item record.';
                    ApplicationArea = All;
                }
                field(assemblyPolicy; Rec."Assembly Policy")
                {
                    Caption = 'Assembly Policy';
                    ToolTip = 'Specifies the assembly policy for this item record.';
                    ApplicationArea = All;
                }
                field(qtyOnJobOrder; Rec."Qty. on Job Order")
                {
                    Caption = 'Qty. on Project Order';
                    ToolTip = 'Specifies the qty. on job order for this item record.';
                    ApplicationArea = All;
                }
                field(resQtyOnJobOrder; Rec."Res. Qty. on Job Order")
                {
                    Caption = 'Res. Qty. on Project Order';
                    ToolTip = 'Specifies the res. qty. on job order for this item record.';
                    ApplicationArea = All;
                }
                field(gTIN; Rec.GTIN)
                {
                    Caption = 'GTIN';
                    ToolTip = 'Specifies the gtin for this item record.';
                    ApplicationArea = All;
                }
                field(defaultDeferralTemplateCode; Rec."Default Deferral Template Code")
                {
                    Caption = 'Default Deferral Template Code';
                    ToolTip = 'Specifies the default deferral template code for this item record.';
                    ApplicationArea = All;
                }
                field(lowLevelCode; Rec."Low-Level Code")
                {
                    Caption = 'Low-Level Code';
                    ToolTip = 'Specifies the low-level code for this item record.';
                    ApplicationArea = All;
                }
                field(lotSize; Rec."Lot Size")
                {
                    Caption = 'Lot Size';
                    ToolTip = 'Specifies the lot size for this item record.';
                    ApplicationArea = All;
                }
                field(serialNos; Rec."Serial Nos.")
                {
                    Caption = 'Serial Nos.';
                    ToolTip = 'Specifies the serial nos. for this item record.';
                    ApplicationArea = All;
                }
                field(lastUnitCostCalcDate; Rec."Last Unit Cost Calc. Date")
                {
                    Caption = 'Last Unit Cost Calc. Date';
                    ToolTip = 'Specifies the last unit cost calc. date for this item record.';
                    ApplicationArea = All;
                }
                field(rolledUpMaterialCost; Rec."Rolled-up Material Cost")
                {
                    Caption = 'Rolled-up Material Cost';
                    ToolTip = 'Specifies the rolled-up material cost for this item record.';
                    ApplicationArea = All;
                }
                field(rolledUpCapacityCost; Rec."Rolled-up Capacity Cost")
                {
                    Caption = 'Rolled-up Capacity Cost';
                    ToolTip = 'Specifies the rolled-up capacity cost for this item record.';
                    ApplicationArea = All;
                }
                field(scrap; Rec."Scrap %")
                {
                    Caption = 'Scrap %';
                    ToolTip = 'Specifies the scrap % for this item record.';
                    ApplicationArea = All;
                }
                field(rolledUpMatNonInvtCost; Rec."Rolled-up Mat. Non-Invt. Cost")
                {
                    Caption = 'Rolled-up Material Non-Inventory Cost';
                    ToolTip = 'Specifies the Non-inventory material cost of all items at all levels of the parent item';
                    ApplicationArea = All;
                }
                field(inventoryValueZero; Rec."Inventory Value Zero")
                {
                    Caption = 'Inventory Value Zero';
                    ToolTip = 'Specifies the inventory value zero for this item record.';
                    ApplicationArea = All;
                }
                field(discreteOrderQuantity; Rec."Discrete Order Quantity")
                {
                    Caption = 'Discrete Order Quantity';
                    ToolTip = 'Specifies the discrete order quantity for this item record.';
                    ApplicationArea = All;
                }
                field(minimumOrderQuantity; Rec."Minimum Order Quantity")
                {
                    Caption = 'Minimum Order Quantity';
                    ToolTip = 'Specifies the minimum order quantity for this item record.';
                    ApplicationArea = All;
                }
                field(maximumOrderQuantity; Rec."Maximum Order Quantity")
                {
                    Caption = 'Maximum Order Quantity';
                    ToolTip = 'Specifies the maximum order quantity for this item record.';
                    ApplicationArea = All;
                }
                field(safetyStockQuantity; Rec."Safety Stock Quantity")
                {
                    Caption = 'Safety Stock Quantity';
                    ToolTip = 'Specifies the safety stock quantity for this item record.';
                    ApplicationArea = All;
                }
                field(orderMultiple; Rec."Order Multiple")
                {
                    Caption = 'Order Multiple';
                    ToolTip = 'Specifies the order multiple for this item record.';
                    ApplicationArea = All;
                }
                field(safetyLeadTime; Rec."Safety Lead Time")
                {
                    Caption = 'Safety Lead Time';
                    ToolTip = 'Specifies the safety lead time for this item record.';
                    ApplicationArea = All;
                }
                field(flushingMethod; Rec."Flushing Method")
                {
                    Caption = 'Flushing Method';
                    ToolTip = 'Specifies the flushing method for this item record.';
                    ApplicationArea = All;
                }
                field(replenishmentSystem; Rec."Replenishment System")
                {
                    Caption = 'Replenishment System';
                    ToolTip = 'Specifies the replenishment system for this item record.';
                    ApplicationArea = All;
                }
                field(roundingPrecision; Rec."Rounding Precision")
                {
                    Caption = 'Rounding Precision';
                    ToolTip = 'Specifies the rounding precision for this item record.';
                    ApplicationArea = All;
                }
                field(binFilter; Rec."Bin Filter")
                {
                    Caption = 'Bin Filter';
                    ToolTip = 'Specifies the bin filter for this item record.';
                    ApplicationArea = All;
                }
                field(variantFilter; Rec."Variant Filter")
                {
                    Caption = 'Variant Filter';
                    ToolTip = 'Specifies the variant filter for this item record.';
                    ApplicationArea = All;
                }
                field(salesUnitOfMeasure; Rec."Sales Unit of Measure")
                {
                    Caption = 'Sales Unit of Measure';
                    ToolTip = 'Specifies the sales unit of measure for this item record.';
                    ApplicationArea = All;
                }
                field(purchUnitOfMeasure; Rec."Purch. Unit of Measure")
                {
                    Caption = 'Purch. Unit of Measure';
                    ToolTip = 'Specifies the purch. unit of measure for this item record.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureFilter; Rec."Unit of Measure Filter")
                {
                    Caption = 'Unit of Measure Filter';
                    ToolTip = 'Specifies the unit of measure filter for this item record.';
                    ApplicationArea = All;
                }
                field(timeBucket; Rec."Time Bucket")
                {
                    Caption = 'Time Bucket';
                    ToolTip = 'Specifies the time bucket for this item record.';
                    ApplicationArea = All;
                }
                field(resQtyOnReqLine; Rec."Res. Qty. on Req. Line")
                {
                    Caption = 'Res. Qty. on Req. Line';
                    ToolTip = 'Specifies the res. qty. on req. line for this item record.';
                    ApplicationArea = All;
                }
                field(reorderingPolicy; Rec."Reordering Policy")
                {
                    Caption = 'Reordering Policy';
                    ToolTip = 'Specifies the reordering policy for this item record.';
                    ApplicationArea = All;
                }
                field(includeInventory; Rec."Include Inventory")
                {
                    Caption = 'Include Inventory';
                    ToolTip = 'Specifies the include inventory for this item record.';
                    ApplicationArea = All;
                }
                field(manufacturingPolicy; Rec."Manufacturing Policy")
                {
                    Caption = 'Manufacturing Policy';
                    ToolTip = 'Specifies the manufacturing policy for this item record.';
                    ApplicationArea = All;
                }
                field(reschedulingPeriod; Rec."Rescheduling Period")
                {
                    Caption = 'Rescheduling Period';
                    ToolTip = 'Specifies the rescheduling period for this item record.';
                    ApplicationArea = All;
                }
                field(lotAccumulationPeriod; Rec."Lot Accumulation Period")
                {
                    Caption = 'Lot Accumulation Period';
                    ToolTip = 'Specifies the lot accumulation period for this item record.';
                    ApplicationArea = All;
                }
                field(dampenerPeriod; Rec."Dampener Period")
                {
                    Caption = 'Dampener Period';
                    ToolTip = 'Specifies the dampener period for this item record.';
                    ApplicationArea = All;
                }
                field(dampenerQuantity; Rec."Dampener Quantity")
                {
                    Caption = 'Dampener Quantity';
                    ToolTip = 'Specifies the dampener quantity for this item record.';
                    ApplicationArea = All;
                }
                field(overflowLevel; Rec."Overflow Level")
                {
                    Caption = 'Overflow Level';
                    ToolTip = 'Specifies the overflow level for this item record.';
                    ApplicationArea = All;
                }
                field(stockkeepingUnitExists; Rec."Stockkeeping Unit Exists")
                {
                    Caption = 'Stockkeeping Unit Exists';
                    ToolTip = 'Specifies the stockkeeping unit exists for this item record.';
                    ApplicationArea = All;
                }
                field(manufacturerCode; Rec."Manufacturer Code")
                {
                    Caption = 'Manufacturer Code';
                    ToolTip = 'Specifies the manufacturer code for this item record.';
                    ApplicationArea = All;
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                    ToolTip = 'Specifies the item category code for this item record.';
                    ApplicationArea = All;
                }
                field(createdFromNonstockItem; Rec."Created From Nonstock Item")
                {
                    Caption = 'Created From Catalog Item';
                    ToolTip = 'Specifies the created from nonstock item for this item record.';
                    ApplicationArea = All;
                }
                field(substitutesExist; Rec."Substitutes Exist")
                {
                    Caption = 'Substitutes Exist';
                    ToolTip = 'Specifies the substitutes exist for this item record.';
                    ApplicationArea = All;
                }
                field(qtyInTransit; Rec."Qty. in Transit")
                {
                    Caption = 'Qty. in Transit';
                    ToolTip = 'Specifies the qty. in transit for this item record.';
                    ApplicationArea = All;
                }
                field(purchasingCode; Rec."Purchasing Code")
                {
                    Caption = 'Purchasing Code';
                    ToolTip = 'Specifies the purchasing code for this item record.';
                    ApplicationArea = All;
                }
                field(qtyAssignedToShip; Rec."Qty. Assigned to ship")
                {
                    Caption = 'Qty. Assigned to ship';
                    ToolTip = 'Specifies the qty. assigned to ship for this item record.';
                    ApplicationArea = All;
                }
                field(qtyPicked; Rec."Qty. Picked")
                {
                    Caption = 'Qty. Picked';
                    ToolTip = 'Specifies the qty. picked for this item record.';
                    ApplicationArea = All;
                }
                field(excludedFromCostAdjustment; Rec."Excluded from Cost Adjustment")
                {
                    Caption = 'Excluded from Cost Adjustment';
                    ToolTip = 'Specifies the excluded from cost adjustment for this item record.';
                    ApplicationArea = All;
                }
                field(itemTrackingCode; Rec."Item Tracking Code")
                {
                    Caption = 'Item Tracking Code';
                    ToolTip = 'Specifies the item tracking code for this item record.';
                    ApplicationArea = All;
                }
                field(lotNos; Rec."Lot Nos.")
                {
                    Caption = 'Lot Nos.';
                    ToolTip = 'Specifies the lot nos. for this item record.';
                    ApplicationArea = All;
                }
                field(expirationCalculation; Rec."Expiration Calculation")
                {
                    Caption = 'Expiration Calculation';
                    ToolTip = 'Specifies the expiration calculation for this item record.';
                    ApplicationArea = All;
                }
                field(lotNoFilter; Rec."Lot No. Filter")
                {
                    Caption = 'Lot No. Filter';
                    ToolTip = 'Specifies the lot no. filter for this item record.';
                    ApplicationArea = All;
                }
                field(serialNoFilter; Rec."Serial No. Filter")
                {
                    Caption = 'Serial No. Filter';
                    ToolTip = 'Specifies the serial no. filter for this item record.';
                    ApplicationArea = All;
                }
                field(packageNoFilter; Rec."Package No. Filter")
                {
                    Caption = 'Package No. Filter';
                    ToolTip = 'Specifies the package no. filter for this item record.';
                    ApplicationArea = All;
                }
                field(qtyOnPurchReturn; Rec."Qty. on Purch. Return")
                {
                    Caption = 'Qty. on Purch. Return';
                    ToolTip = 'Specifies the qty. on purch. return for this item record.';
                    ApplicationArea = All;
                }
                field(qtyOnSalesReturn; Rec."Qty. on Sales Return")
                {
                    Caption = 'Qty. on Sales Return';
                    ToolTip = 'Specifies the qty. on sales return for this item record.';
                    ApplicationArea = All;
                }
                field(noOfSubstitutes; Rec."No. of Substitutes")
                {
                    Caption = 'No. of Substitutes';
                    ToolTip = 'Specifies the no. of substitutes for this item record.';
                    ApplicationArea = All;
                }
                field(warehouseClassCode; Rec."Warehouse Class Code")
                {
                    Caption = 'Warehouse Class Code';
                    ToolTip = 'Specifies the warehouse class code for this item record.';
                    ApplicationArea = All;
                }
                field(specialEquipmentCode; Rec."Special Equipment Code")
                {
                    Caption = 'Special Equipment Code';
                    ToolTip = 'Specifies the special equipment code for this item record.';
                    ApplicationArea = All;
                }
                field(putAwayTemplateCode; Rec."Put-away Template Code")
                {
                    Caption = 'Put-away Template Code';
                    ToolTip = 'Specifies the put-away template code for this item record.';
                    ApplicationArea = All;
                }
                field(putAwayUnitOfMeasureCode; Rec."Put-away Unit of Measure Code")
                {
                    Caption = 'Put-away Unit of Measure Code';
                    ToolTip = 'Specifies the put-away unit of measure code for this item record.';
                    ApplicationArea = All;
                }
                field(physInvtCountingPeriodCode; Rec."Phys Invt Counting Period Code")
                {
                    Caption = 'Phys Invt Counting Period Code';
                    ToolTip = 'Specifies the phys invt counting period code for this item record.';
                    ApplicationArea = All;
                }
                field(lastCountingPeriodUpdate; Rec."Last Counting Period Update")
                {
                    Caption = 'Last Counting Period Update';
                    ToolTip = 'Specifies the last counting period update for this item record.';
                    ApplicationArea = All;
                }
                field(lastPhysInvtDate; Rec."Last Phys. Invt. Date")
                {
                    Caption = 'Last Phys. Invt. Date';
                    ToolTip = 'Specifies the last phys. invt. date for this item record.';
                    ApplicationArea = All;
                }
                field(useCrossDocking; Rec."Use Cross-Docking")
                {
                    Caption = 'Use Cross-Docking';
                    ToolTip = 'Specifies the use cross-docking for this item record.';
                    ApplicationArea = All;
                }
                field(nextCountingStartDate; Rec."Next Counting Start Date")
                {
                    Caption = 'Next Counting Start Date';
                    ToolTip = 'Specifies the next counting start date for this item record.';
                    ApplicationArea = All;
                }
                field(nextCountingEndDate; Rec."Next Counting End Date")
                {
                    Caption = 'Next Counting End Date';
                    ToolTip = 'Specifies the next counting end date for this item record.';
                    ApplicationArea = All;
                }
                field(unitGroupExists; Rec."Unit Group Exists")
                {
                    Caption = 'Unit Group Exists';
                    ToolTip = 'Specifies the unit group exists for this item record.';
                    ApplicationArea = All;
                }
                field(identifierCode; Rec."Identifier Code")
                {
                    Caption = 'Identifier Code';
                    ToolTip = 'Specifies the identifier code for this item record.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureId; Rec."Unit of Measure Id")
                {
                    Caption = 'Unit of Measure Id';
                    ToolTip = 'Specifies the unit of measure id for this item record.';
                    ApplicationArea = All;
                }
                field(taxGroupId; Rec."Tax Group Id")
                {
                    Caption = 'Tax Group Id';
                    ToolTip = 'Specifies the tax group id for this item record.';
                    ApplicationArea = All;
                }
                field(salesBlocked; Rec."Sales Blocked")
                {
                    Caption = 'Sales Blocked';
                    ToolTip = 'Specifies the sales blocked for this item record.';
                    ApplicationArea = All;
                }
                field(purchasingBlocked; Rec."Purchasing Blocked")
                {
                    Caption = 'Purchasing Blocked';
                    ToolTip = 'Specifies the purchasing blocked for this item record.';
                    ApplicationArea = All;
                }
                field(itemCategoryId; Rec."Item Category Id")
                {
                    Caption = 'Item Category Id';
                    ToolTip = 'Specifies the item category id for this item record.';
                    ApplicationArea = All;
                }
                field(inventoryPostingGroupId; Rec."Inventory Posting Group Id")
                {
                    Caption = 'Inventory Posting Group Id';
                    ToolTip = 'Specifies the inventory posting group id for this item record.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroupId; Rec."Gen. Prod. Posting Group Id")
                {
                    Caption = 'Gen. Prod. Posting Group Id';
                    ToolTip = 'Specifies the gen. prod. posting group id for this item record.';
                    ApplicationArea = All;
                }
                field(serviceBlocked; Rec."Service Blocked")
                {
                    Caption = 'Service Blocked';
                    ToolTip = 'Specifies the service blocked for this item record.';
                    ApplicationArea = All;
                }
                field(overReceiptCode; Rec."Over-Receipt Code")
                {
                    Caption = 'Over-Receipt Code';
                    ToolTip = 'Specifies the over-receipt code for this item record.';
                    ApplicationArea = All;
                }
                field(singleLevelMaterialCost; Rec."Single-Level Material Cost")
                {
                    Caption = 'Single-Level Material Cost';
                    ToolTip = 'Specifies the single-level material cost for this item record.';
                    ApplicationArea = All;
                }
                field(singleLevelCapacityCost; Rec."Single-Level Capacity Cost")
                {
                    Caption = 'Single-Level Capacity Cost';
                    ToolTip = 'Specifies the single-level capacity cost for this item record.';
                    ApplicationArea = All;
                }
                field(singleLevelSubcontrdCost; Rec."Single-Level Subcontrd. Cost")
                {
                    Caption = 'Single-Level Subcontrd. Cost';
                    ToolTip = 'Specifies the single-level subcontrd. cost for this item record.';
                    ApplicationArea = All;
                }
                field(singleLevelCapOvhdCost; Rec."Single-Level Cap. Ovhd Cost")
                {
                    Caption = 'Single-Level Cap. Ovhd Cost';
                    ToolTip = 'Specifies the single-level cap. ovhd cost for this item record.';
                    ApplicationArea = All;
                }
                field(singleLevelMfgOvhdCost; Rec."Single-Level Mfg. Ovhd Cost")
                {
                    Caption = 'Single-Level Mfg. Ovhd Cost';
                    ToolTip = 'Specifies the single-level mfg. ovhd cost for this item record.';
                    ApplicationArea = All;
                }
                field(overheadRate; Rec."Overhead Rate")
                {
                    Caption = 'Overhead Rate';
                    ToolTip = 'Specifies the overhead rate for this item record.';
                    ApplicationArea = All;
                }
                field(rolledUpSubcontractedCost; Rec."Rolled-up Subcontracted Cost")
                {
                    Caption = 'Rolled-up Subcontracted Cost';
                    ToolTip = 'Specifies the rolled-up subcontracted cost for this item record.';
                    ApplicationArea = All;
                }
                field(rolledUpMfgOvhdCost; Rec."Rolled-up Mfg. Ovhd Cost")
                {
                    Caption = 'Rolled-up Mfg. Ovhd Cost';
                    ToolTip = 'Specifies the rolled-up mfg. ovhd cost for this item record.';
                    ApplicationArea = All;
                }
                field(rolledUpCapOverheadCost; Rec."Rolled-up Cap. Overhead Cost")
                {
                    Caption = 'Rolled-up Cap. Overhead Cost';
                    ToolTip = 'Specifies the rolled-up cap. overhead cost for this item record.';
                    ApplicationArea = All;
                }
                field(orderTrackingPolicy; Rec."Order Tracking Policy")
                {
                    Caption = 'Order Tracking Policy';
                    ToolTip = 'Specifies the order tracking policy for this item record.';
                    ApplicationArea = All;
                }
                field(productionForecastName; Rec."Production Forecast Name")
                {
                    Caption = 'Production Forecast Name';
                    ToolTip = 'Specifies the production forecast name for this item record.';
                    ApplicationArea = All;
                }
                field(componentForecast; Rec."Component Forecast")
                {
                    Caption = 'Component Forecast';
                    ToolTip = 'Specifies the component forecast for this item record.';
                    ApplicationArea = All;
                }
                field(critical; Rec.Critical)
                {
                    Caption = 'Critical';
                    ToolTip = 'Specifies the critical for this item record.';
                    ApplicationArea = All;
                }
                field(singleLvlMatNonInvtCost; Rec."Single-Lvl Mat. Non-Invt. Cost")
                {
                    Caption = 'Single-Level Material Non-Inventory Cost';
                    ToolTip = 'Specifies the total Non-inventory material cost of all components on the parent item';
                    ApplicationArea = All;
                }
                field(allowWhseOverpick; Rec."Allow Whse. Overpick")
                {
                    Caption = 'Allow Whse. Overpick';
                    ToolTip = 'Specifies that the record is allowed to be created in the Warehouse Pick list against the Released Production Order more than the quantity defined in the component Line. For example, system will allow';
                    ApplicationArea = All;
                }
                field(commonItemNo; Rec."Common Item No.")
                {
                    Caption = 'Common Item No.';
                    ToolTip = 'Specifies the common item no. for this item record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified DateTime';
                    ToolTip = 'Specifies the Last Modified DateTime.';
                    ApplicationArea = All;
                }
            }
        }
    }
}