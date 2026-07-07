namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.ProductionBOM;

page 90957 "ocpfProductionBomLines"
{
    PageType = API;
    Caption = 'Production BOM Lines — the component lines of a production BOM, with quantity per, scrap, and routing link.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfProductionBomLine';
    EntitySetName = 'ocpfProductionBomLines';
    SourceTable = "Production BOM Line";
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
                field(productionBomNo; Rec."Production BOM No.")
                {
                    Caption = 'Production BOM No.';
                    ToolTip = 'Specifies the Production BOM No..';
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the Line No..';
                    ApplicationArea = All;
                }
                field(versionCode; Rec."Version Code")
                {
                    Caption = 'Version Code';
                    ToolTip = 'Specifies the Version Code.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type of production BOM line.';
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
                    ToolTip = 'Specifies a description of the production BOM line.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item is measured, such as in pieces or tons. By default, the value in the Base Unit of Measure field on the item card is inserted.';
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
                    ToolTip = 'Specifies more exactly whether the component is to appear at a certain position in the BOM to represent a certain production process.';
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
                    ToolTip = 'Specifies the total number of days required to produce this item.';
                    ApplicationArea = All;
                }
                field(routingLinkCode; Rec."Routing Link Code")
                {
                    Caption = 'Routing Link Code';
                    ToolTip = 'Specifies the routing link code.';
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
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the date from which this production BOM is valid.';
                    ApplicationArea = All;
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                    ToolTip = 'Specifies the date from which this production BOM is no longer valid.';
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
            }
        }
    }
}
