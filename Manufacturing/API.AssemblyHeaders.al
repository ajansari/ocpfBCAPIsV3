namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Assembly.Document;

page 90969 "ocpfAssemblyHeaders"
{
    PageType = API;
    Caption = 'Assembly Orders — open assembly order and quote headers for assemble-to-stock and assemble-to-order flows.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfAssemblyHeader';
    EntitySetName = 'ocpfAssemblyHeaders';
    SourceTable = "Assembly Header";
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
                    ToolTip = 'Specifies the type of assembly document the record represents in assemble-to-order scenarios.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description of the assembly item.';
                    ApplicationArea = All;
                }
                field(searchDescription; Rec."Search Description")
                {
                    Caption = 'Search Description';
                    ToolTip = 'Specifies the Search Description.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies information in addition to the description.';
                    ApplicationArea = All;
                }
                field(creationDate; Rec."Creation Date")
                {
                    Caption = 'Creation Date';
                    ToolTip = 'Specifies the Creation Date.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the Last Date Modified.';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the number of the item that is being assembled with the assembly order.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant of the item on the line.';
                    ApplicationArea = All;
                }
                field(inventoryPostingGroup; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                    ToolTip = 'Specifies the Inventory Posting Group.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the Gen. Prod. Posting Group.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the code for the General Business Posting Group that applies to the entry.';
                    ApplicationArea = All;
                }
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location to which you want to post output of the assembly item.';
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
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the date on which the assembly order is posted.';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Specifies the date when the assembled item is due to be available for use.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the date when the assembly order is expected to start.';
                    ApplicationArea = All;
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                    ToolTip = 'Specifies the date when the assembly order is expected to finish.';
                    ApplicationArea = All;
                }
                field(binCode; Rec."Bin Code")
                {
                    Caption = 'Bin Code';
                    ToolTip = 'Specifies the bin the assembly item is posted to as output and from where it is taken to storage or shipped if it is assembled to a sales order.';
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies how many units of the assembly item that you expect to assemble with the assembly order.';
                    ApplicationArea = All;
                }
                field(quantityBase; Rec."Quantity (Base)")
                {
                    Caption = 'Quantity (Base)';
                    ToolTip = 'Specifies the Quantity (Base).';
                    ApplicationArea = All;
                }
                field(remainingQuantity; Rec."Remaining Quantity")
                {
                    Caption = 'Remaining Quantity';
                    ToolTip = 'Specifies how many units of the assembly item remain to be posted as assembled output.';
                    ApplicationArea = All;
                }
                field(remainingQuantityBase; Rec."Remaining Quantity (Base)")
                {
                    Caption = 'Remaining Quantity (Base)';
                    ToolTip = 'Specifies the Remaining Quantity (Base).';
                    ApplicationArea = All;
                }
                field(assembledQuantity; Rec."Assembled Quantity")
                {
                    Caption = 'Assembled Quantity';
                    ToolTip = 'Specifies how many units of the assembly item are posted as assembled output.';
                    ApplicationArea = All;
                }
                field(assembledQuantityBase; Rec."Assembled Quantity (Base)")
                {
                    Caption = 'Assembled Quantity (Base)';
                    ToolTip = 'Specifies the Assembled Quantity (Base).';
                    ApplicationArea = All;
                }
                field(quantityToAssemble; Rec."Quantity to Assemble")
                {
                    Caption = 'Quantity to Assemble';
                    ToolTip = 'Specifies how many of the assembly item units you want to partially post. To post the full quantity on the assembly order, leave the field unchanged.';
                    ApplicationArea = All;
                }
                field(quantityToAssembleBase; Rec."Quantity to Assemble (Base)")
                {
                    Caption = 'Quantity to Assemble (Base)';
                    ToolTip = 'Specifies the Quantity to Assemble (Base).';
                    ApplicationArea = All;
                }
                field(reservedQuantity; Rec."Reserved Quantity")
                {
                    Caption = 'Reserved Quantity';
                    ToolTip = 'Specifies how many units of the assembly item are reserved for this assembly order header.';
                    ApplicationArea = All;
                }
                field(reservedQtyBase; Rec."Reserved Qty. (Base)")
                {
                    Caption = 'Reserved Qty. (Base)';
                    ToolTip = 'Specifies how many assembly items, which are stated in the base unit of measure, are reserved for this assembly order header.';
                    ApplicationArea = All;
                }
                field(planningFlexibility; Rec."Planning Flexibility")
                {
                    Caption = 'Planning Flexibility';
                    ToolTip = 'Specifies whether the supply represented by the assembly order is considered by the planning system when calculating action messages.';
                    ApplicationArea = All;
                }
                field(mpsOrder; Rec."MPS Order")
                {
                    Caption = 'MPS Order';
                    ToolTip = 'Specifies the MPS Order.';
                    ApplicationArea = All;
                }
                field(assembleToOrder; Rec."Assemble to Order")
                {
                    Caption = 'Assemble to Order';
                    ToolTip = 'Specifies if the assembly order is linked to a sales order, which indicates that the item is assembled to order.';
                    ApplicationArea = All;
                }
                field(postingNo; Rec."Posting No.")
                {
                    Caption = 'Posting No.';
                    ToolTip = 'Specifies the Posting No..';
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
                    ToolTip = 'Specifies the total unit cost of the assembly order.';
                    ApplicationArea = All;
                }
                field(rolledUpAssemblyCost; Rec."Rolled-up Assembly Cost")
                {
                    Caption = 'Rolled-up Assembly Cost';
                    ToolTip = 'Specifies the Rolled-up Assembly Cost.';
                    ApplicationArea = All;
                }
                field(indirectCostPct; Rec."Indirect Cost %")
                {
                    Caption = 'Indirect Cost %';
                    ToolTip = 'Specifies the percentage of the item''s last purchase cost that includes indirect costs, such as freight that is associated with the purchase of the item.';
                    ApplicationArea = All;
                }
                field(overheadRate; Rec."Overhead Rate")
                {
                    Caption = 'Overhead Rate';
                    ToolTip = 'Specifies the indirect cost of the assembly item as an absolute amount.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
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
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the No. Series.';
                    ApplicationArea = All;
                }
                field(postingNoSeries; Rec."Posting No. Series")
                {
                    Caption = 'Posting No. Series';
                    ToolTip = 'Specifies the Posting No. Series.';
                    ApplicationArea = All;
                }
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies if the document is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
                field(assignedUserId; Rec."Assigned User ID")
                {
                    Caption = 'Assigned User ID';
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
