namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Document;

page 90963 "ocpfProdOrderComponents"
{
    PageType = API;
    Caption = 'Production Order Components — the material requirements of each production order line.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfProdOrderComponent';
    EntitySetName = 'ocpfProdOrderComponents';
    SourceTable = "Prod. Order Component";
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
                    ToolTip = 'Specifies the status of the production order to which the component list belongs.';
                    ApplicationArea = All;
                }
                field(prodOrderNo; Rec."Prod. Order No.")
                {
                    Caption = 'Prod. Order No.';
                    ToolTip = 'Specifies the number of the related production order.';
                    ApplicationArea = All;
                }
                field(prodOrderLineNo; Rec."Prod. Order Line No.")
                {
                    Caption = 'Prod. Order Line No.';
                    ToolTip = 'Specifies the number of the production order line to which the component list belongs.';
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
                    ToolTip = 'Specifies the number of the item that is a component in the production order component list.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the item on the line.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the Quantity.';
                    ApplicationArea = All;
                }
                field(position; Rec."Position")
                {
                    Caption = 'Position';
                    ToolTip = 'Specifies the position of the component on the bill of material.';
                    ApplicationArea = All;
                }
                field(position2; Rec."Position 2")
                {
                    Caption = 'Position 2';
                    ToolTip = 'Specifies the components position in the BOM. It is copied from the production BOM when you calculate the production order.';
                    ApplicationArea = All;
                }
                field(position3; Rec."Position 3")
                {
                    Caption = 'Position 3';
                    ToolTip = 'Specifies the third reference number for the component position on a bill of material, such as the alternate position number of a component on a print card.';
                    ApplicationArea = All;
                }
                field(leadTimeOffset; Rec."Lead-Time Offset")
                {
                    Caption = 'Lead-Time Offset';
                    ToolTip = 'Specifies the lead-time offset for the component line. It is copied from the corresponding field in the production BOM when you calculate the production order.';
                    ApplicationArea = All;
                }
                field(routingLinkCode; Rec."Routing Link Code")
                {
                    Caption = 'Routing Link Code';
                    ToolTip = 'Specifies the routing link code when you calculate the production order.';
                    ApplicationArea = All;
                }
                field(scrapPct; Rec."Scrap %")
                {
                    Caption = 'Scrap %';
                    ToolTip = 'Specifies the percentage of the item that you expect to be scrapped in the production process.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant of the item on the line.';
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
                field(expectedQuantity; Rec."Expected Quantity")
                {
                    Caption = 'Expected Quantity';
                    ToolTip = 'Specifies the quantity of the component expected to be consumed during the production of the quantity on this line.';
                    ApplicationArea = All;
                }
                field(remainingQuantity; Rec."Remaining Quantity")
                {
                    Caption = 'Remaining Quantity';
                    ToolTip = 'Specifies the difference between the finished and planned quantities, or zero if the finished quantity is greater than the remaining quantity.';
                    ApplicationArea = All;
                }
                field(actConsumptionQty; Rec."Act. Consumption (Qty)")
                {
                    Caption = 'Act. Consumption (Qty)';
                    ToolTip = 'Specifies the Act. Consumption (Qty).';
                    ApplicationArea = All;
                }
                field(flushingMethod; Rec."Flushing Method")
                {
                    Caption = 'Flushing Method';
                    ToolTip = 'Specifies how consumption of the item (component) is calculated and handled in production processes. Manual: Enter and post consumption in the consumption journal manually. Forward: Automatically posts consumption according to the production order component lines when the first operation starts. Backward: Automatically calculates and posts consumption according to the production order component lines when the production order is finished. Pick + Forward / Pick + Backward: Variations with warehousing.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location where the component is stored. Copies the location code from the corresponding field on the production order line.';
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
                    ToolTip = 'Specifies the bin in which the component is to be placed before it is consumed.';
                    ApplicationArea = All;
                }
                field(suppliedByLineNo; Rec."Supplied-by Line No.")
                {
                    Caption = 'Supplied-by Line No.';
                    ToolTip = 'Specifies the Supplied-by Line No..';
                    ApplicationArea = All;
                }
                field(planningLevelCode; Rec."Planning Level Code")
                {
                    Caption = 'Planning Level Code';
                    ToolTip = 'Specifies the Planning Level Code.';
                    ApplicationArea = All;
                }
                field(itemLowLevelCode; Rec."Item Low-Level Code")
                {
                    Caption = 'Item Low-Level Code';
                    ToolTip = 'Specifies the Item Low-Level Code.';
                    ApplicationArea = All;
                }
                field(length; Rec."Length")
                {
                    Caption = 'Length';
                    ToolTip = 'Specifies the length of one item unit when measured in the specified unit of measure.';
                    ApplicationArea = All;
                }
                field(width; Rec."Width")
                {
                    Caption = 'Width';
                    ToolTip = 'Specifies the width of one item unit when measured in the specified unit of measure.';
                    ApplicationArea = All;
                }
                field(weight; Rec."Weight")
                {
                    Caption = 'Weight';
                    ToolTip = 'Specifies the weight of one item unit when measured in the specified unit of measure.';
                    ApplicationArea = All;
                }
                field(depth; Rec."Depth")
                {
                    Caption = 'Depth';
                    ToolTip = 'Specifies the depth of one item unit when measured in the specified unit of measure.';
                    ApplicationArea = All;
                }
                field(calculationFormula; Rec."Calculation Formula")
                {
                    Caption = 'Calculation Formula';
                    ToolTip = 'Specifies how to calculate the Quantity field.';
                    ApplicationArea = All;
                }
                field(quantityPer; Rec."Quantity per")
                {
                    Caption = 'Quantity per';
                    ToolTip = 'Specifies how many units of the component are required to produce the parent item.';
                    ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                    ApplicationArea = All;
                }
                field(costAmount; Rec."Cost Amount")
                {
                    Caption = 'Cost Amount';
                    ToolTip = 'Specifies the total cost on the line by multiplying the unit cost by the quantity.';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Specifies the date when the produced item must be available. The date is copied from the header of the production order.';
                    ApplicationArea = All;
                }
                field(dueTime; Rec."Due Time")
                {
                    Caption = 'Due Time';
                    ToolTip = 'Specifies the Due Time.';
                    ApplicationArea = All;
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    ToolTip = 'Specifies the quantity per unit of measure of the component item.';
                    ApplicationArea = All;
                }
                field(remainingQtyBase; Rec."Remaining Qty. (Base)")
                {
                    Caption = 'Remaining Qty. (Base)';
                    ToolTip = 'Specifies the Remaining Qty. (Base).';
                    ApplicationArea = All;
                }
                field(quantityBase; Rec."Quantity (Base)")
                {
                    Caption = 'Quantity (Base)';
                    ToolTip = 'Specifies the Quantity (Base).';
                    ApplicationArea = All;
                }
                field(reservedQtyBase; Rec."Reserved Qty. (Base)")
                {
                    Caption = 'Reserved Qty. (Base)';
                    ToolTip = 'Specifies the reserved quantity of the item in base units of measure.';
                    ApplicationArea = All;
                }
                field(reservedQuantity; Rec."Reserved Quantity")
                {
                    Caption = 'Reserved Quantity';
                    ToolTip = 'Specifies how many units of this item have been reserved.';
                    ApplicationArea = All;
                }
                field(expectedQtyBase; Rec."Expected Qty. (Base)")
                {
                    Caption = 'Expected Qty. (Base)';
                    ToolTip = 'Specifies the Expected Qty. (Base).';
                    ApplicationArea = All;
                }
                field(dueDateTime; Rec."Due Date-Time")
                {
                    Caption = 'Due Date-Time';
                    ToolTip = 'Specifies the due date and the due time, which are combined in a format called "due date-time".';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
                field(substitutionAvailable; Rec."Substitution Available")
                {
                    Caption = 'Substitution Available';
                    ToolTip = 'Specifies if an item substitute is available for the production order component.';
                    ApplicationArea = All;
                }
                field(originalItemNo; Rec."Original Item No.")
                {
                    Caption = 'Original Item No.';
                    ToolTip = 'Specifies the Original Item No..';
                    ApplicationArea = All;
                }
                field(originalVariantCode; Rec."Original Variant Code")
                {
                    Caption = 'Original Variant Code';
                    ToolTip = 'Specifies the Original Variant Code.';
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
                    ToolTip = 'Specifies the quantity of the item you have picked for the component line.';
                    ApplicationArea = All;
                }
                field(qtyPickedBase; Rec."Qty. Picked (Base)")
                {
                    Caption = 'Qty. Picked (Base)';
                    ToolTip = 'Specifies the quantity of the item you have picked for the component line.';
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
                field(directUnitCost; Rec."Direct Unit Cost")
                {
                    Caption = 'Direct Unit Cost';
                    ToolTip = 'Specifies the Direct Unit Cost.';
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
                field(directCostAmount; Rec."Direct Cost Amount")
                {
                    Caption = 'Direct Cost Amount';
                    ToolTip = 'Specifies the Direct Cost Amount.';
                    ApplicationArea = All;
                }
                field(overheadAmount; Rec."Overhead Amount")
                {
                    Caption = 'Overhead Amount';
                    ToolTip = 'Specifies the Overhead Amount.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
