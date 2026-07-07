namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Assembly.Document;

page 90970 "ocpfAssemblyLines"
{
    PageType = API;
    Caption = 'Assembly Lines — component consumption lines of open assembly orders.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfAssemblyLine';
    EntitySetName = 'ocpfAssemblyLines';
    SourceTable = "Assembly Line";
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
                    ToolTip = 'Specifies the type of assembly document that the assembly order header represents in assemble-to-order scenarios.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the number of the assembly order header that the assembly order line refers to.';
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the Line No..';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies if the assembly order line is of type Item or Resource.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
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
                    ToolTip = 'Specifies the description of the assembly component.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies the second description of the assembly component.';
                    ApplicationArea = All;
                }
                field(leadTimeOffset; Rec."Lead-Time Offset")
                {
                    Caption = 'Lead-Time Offset';
                    ToolTip = 'Specifies the lead-time offset that is defined for the assembly component on the assembly BOM.';
                    ApplicationArea = All;
                }
                field(resourceUsageType; Rec."Resource Usage Type")
                {
                    Caption = 'Resource Usage Type';
                    ToolTip = 'Specifies how the cost of the resource on the assembly order line is allocated to the assembly item.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location from which you want to post consumption of the assembly component.';
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
                    ToolTip = 'Specifies the code of the bin where assembly components must be placed prior to assembly and from where they are posted as consumed.';
                    ApplicationArea = All;
                }
                field(position; Rec."Position")
                {
                    Caption = 'Position';
                    ToolTip = 'Specifies the Position.';
                    ApplicationArea = All;
                }
                field(position2; Rec."Position 2")
                {
                    Caption = 'Position 2';
                    ToolTip = 'Specifies the Position 2.';
                    ApplicationArea = All;
                }
                field(position3; Rec."Position 3")
                {
                    Caption = 'Position 3';
                    ToolTip = 'Specifies the Position 3.';
                    ApplicationArea = All;
                }
                field(applToItemEntry; Rec."Appl.-to Item Entry")
                {
                    Caption = 'Appl.-to Item Entry';
                    ToolTip = 'Specifies the number of the item ledger entry that the document or journal line is applied to.';
                    ApplicationArea = All;
                }
                field(applFromItemEntry; Rec."Appl.-from Item Entry")
                {
                    Caption = 'Appl.-from Item Entry';
                    ToolTip = 'Specifies the number of the item ledger entry that the document or journal line is applied from.';
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies how many units of the assembly component are expected to be consumed.';
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
                    ToolTip = 'Specifies how many units of the assembly component remain to be consumed during assembly.';
                    ApplicationArea = All;
                }
                field(remainingQuantityBase; Rec."Remaining Quantity (Base)")
                {
                    Caption = 'Remaining Quantity (Base)';
                    ToolTip = 'Specifies the Remaining Quantity (Base).';
                    ApplicationArea = All;
                }
                field(consumedQuantity; Rec."Consumed Quantity")
                {
                    Caption = 'Consumed Quantity';
                    ToolTip = 'Specifies how many units of the assembly component have been posted as consumed during the assembly.';
                    ApplicationArea = All;
                }
                field(consumedQuantityBase; Rec."Consumed Quantity (Base)")
                {
                    Caption = 'Consumed Quantity (Base)';
                    ToolTip = 'Specifies the Consumed Quantity (Base).';
                    ApplicationArea = All;
                }
                field(quantityToConsume; Rec."Quantity to Consume")
                {
                    Caption = 'Quantity to Consume';
                    ToolTip = 'Specifies how many units of the assembly component you want to post as consumed when you post the assembly order.';
                    ApplicationArea = All;
                }
                field(quantityToConsumeBase; Rec."Quantity to Consume (Base)")
                {
                    Caption = 'Quantity to Consume (Base)';
                    ToolTip = 'Specifies the Quantity to Consume (Base).';
                    ApplicationArea = All;
                }
                field(reservedQuantity; Rec."Reserved Quantity")
                {
                    Caption = 'Reserved Quantity';
                    ToolTip = 'Specifies how many units of the assembly component have been reserved for this assembly order line.';
                    ApplicationArea = All;
                }
                field(reservedQtyBase; Rec."Reserved Qty. (Base)")
                {
                    Caption = 'Reserved Qty. (Base)';
                    ToolTip = 'Specifies how many assembly components have been reserved for this assembly order line. The components are in the base unit of measure.';
                    ApplicationArea = All;
                }
                field(availWarning; Rec."Avail. Warning")
                {
                    Caption = 'Avail. Warning';
                    ToolTip = 'Specifies Yes if the assembly component is not available in the quantity and on the due date of the assembly order line.';
                    ApplicationArea = All;
                }
                field(substitutionAvailable; Rec."Substitution Available")
                {
                    Caption = 'Substitution Available';
                    ToolTip = 'Specifies if a substitute is available for the item on the assembly order line.';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Specifies the date when the assembly component must be available for consumption by the assembly order.';
                    ApplicationArea = All;
                }
                field(reserve; Rec."Reserve")
                {
                    Caption = 'Reserve';
                    ToolTip = 'Specifies the reserve option for the assembly order line.';
                    ApplicationArea = All;
                }
                field(quantityPer; Rec."Quantity per")
                {
                    Caption = 'Quantity per';
                    ToolTip = 'Specifies how many units of the assembly component are required to assemble one assembly item.';
                    ApplicationArea = All;
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    ToolTip = 'Specifies the quantity per unit of measure of the component item on the assembly order line.';
                    ApplicationArea = All;
                }
                field(inventoryPostingGroup; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                    ToolTip = 'Specifies links between business transactions made for the item and an inventory account in the general ledger, to group amounts for that item type.';
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
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                    ApplicationArea = All;
                }
                field(costAmount; Rec."Cost Amount")
                {
                    Caption = 'Cost Amount';
                    ToolTip = 'Specifies the cost of the assembly order line.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the Date Filter.';
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
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
                field(pickQty; Rec."Pick Qty.")
                {
                    Caption = 'Pick Qty.';
                    ToolTip = 'Specifies how many units of the assembly component are currently on warehouse pick lines.';
                    ApplicationArea = All;
                }
                field(pickQtyBase; Rec."Pick Qty. (Base)")
                {
                    Caption = 'Pick Qty. (Base)';
                    ToolTip = 'Specifies the Pick Qty. (Base).';
                    ApplicationArea = All;
                }
                field(qtyPicked; Rec."Qty. Picked")
                {
                    Caption = 'Qty. Picked';
                    ToolTip = 'Specifies how many units of the assembly component have been moved or picked for the assembly order line.';
                    ApplicationArea = All;
                }
                field(qtyPickedBase; Rec."Qty. Picked (Base)")
                {
                    Caption = 'Qty. Picked (Base)';
                    ToolTip = 'Specifies the Qty. Picked (Base).';
                    ApplicationArea = All;
                }
            }
        }
    }
}
