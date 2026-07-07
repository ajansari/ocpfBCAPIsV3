namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Assembly.History;

page 90972 "ocpfPostedAssemblyLines"
{
    PageType = API;
    Caption = 'Posted Assembly Lines — component lines of posted assembly orders. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfPostedAssemblyLine';
    EntitySetName = 'ocpfPostedAssemblyLines';
    SourceTable = "Posted Assembly Line";
    ODataKeyFields = SystemId;
    Editable = false;

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
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    ToolTip = 'Specifies the Order No..';
                    ApplicationArea = All;
                }
                field(orderLineNo; Rec."Order Line No.")
                {
                    Caption = 'Order Line No.';
                    ToolTip = 'Specifies the number of the assembly order line that the posted assembly order line originates from.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies if the posted assembly order line is of type Item or Resource.';
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
                    ToolTip = 'Specifies the description of the assembly component on the posted assembly line.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies the second description of the assembly component on the posted assembly line.';
                    ApplicationArea = All;
                }
                field(leadTimeOffset; Rec."Lead-Time Offset")
                {
                    Caption = 'Lead-Time Offset';
                    ToolTip = 'Specifies the Lead-Time Offset.';
                    ApplicationArea = All;
                }
                field(resourceUsageType; Rec."Resource Usage Type")
                {
                    Caption = 'Resource Usage Type';
                    ToolTip = 'Specifies how the cost of the resource on the posted assembly order line is allocated to the assembly item.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies from which location the assembly component was consumed on this posted assembly order line.';
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
                    ToolTip = 'Specifies from which bin the assembly component was consumed on the posted assembly order line.';
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
                field(itemShptEntryNo; Rec."Item Shpt. Entry No.")
                {
                    Caption = 'Item Shpt. Entry No.';
                    ToolTip = 'Specifies the Item Shpt. Entry No..';
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies how many units of the assembly component were posted as consumed by the posted assembly order line.';
                    ApplicationArea = All;
                }
                field(quantityBase; Rec."Quantity (Base)")
                {
                    Caption = 'Quantity (Base)';
                    ToolTip = 'Specifies the Quantity (Base).';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Specifies the Due Date.';
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
                    ToolTip = 'Specifies the quantity per unit of measure of the component item on the posted assembly order line.';
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
                    ToolTip = 'Specifies the cost of the posted assembly order line.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
