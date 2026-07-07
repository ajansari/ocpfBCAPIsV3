namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.BOM;

page 90968 "ocpfBomComponents"
{
    PageType = API;
    Caption = 'Assembly BOM Components — the component lines (items or resources) that define an assembly item''s bill of materials.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfBomComponent';
    EntitySetName = 'ocpfBomComponents';
    SourceTable = "BOM Component";
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
                field(parentItemNo; Rec."Parent Item No.")
                {
                    Caption = 'Parent Item No.';
                    ToolTip = 'Specifies the number of the assembly item that the assembly BOM component belongs to.';
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
                    ToolTip = 'Specifies if the assembly BOM component is an item or a resource.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(assemblyBom; Rec."Assembly BOM")
                {
                    Caption = 'Assembly BOM';
                    ToolTip = 'Specifies if the assembly BOM component is an assembly BOM.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the assembly BOM component.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    ApplicationArea = All;
                }
                field(quantityPer; Rec."Quantity per")
                {
                    Caption = 'Quantity per';
                    ToolTip = 'Specifies how many units of the component are required to produce or assemble the parent item.';
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
                    ToolTip = 'Specifies the component''s position in the assembly BOM structure.';
                    ApplicationArea = All;
                }
                field(position3; Rec."Position 3")
                {
                    Caption = 'Position 3';
                    ToolTip = 'Specifies the third reference number for the component position on a bill of material, such as the alternate position number of a component on a print card.';
                    ApplicationArea = All;
                }
                field(machineNo; Rec."Machine No.")
                {
                    Caption = 'Machine No.';
                    ToolTip = 'Specifies a machine that should be used when processing the component on this line of the assembly BOM.';
                    ApplicationArea = All;
                }
                field(leadTimeOffset; Rec."Lead-Time Offset")
                {
                    Caption = 'Lead-Time Offset';
                    ToolTip = 'Specifies the total number of days required to assemble the item on the assembly BOM line.';
                    ApplicationArea = All;
                }
                field(bomDescription; Rec."BOM Description")
                {
                    Caption = 'BOM Description';
                    ToolTip = 'Specifies a description of the assembly BOM if the item on the line is an assembly BOM.';
                    ApplicationArea = All;
                }
                field(resourceUsageType; Rec."Resource Usage Type")
                {
                    Caption = 'Resource Usage Type';
                    ToolTip = 'Specifies how the cost of the resource on the assembly BOM is allocated during assembly.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant of the item on the line.';
                    ApplicationArea = All;
                }
                field(installedInLineNo; Rec."Installed in Line No.")
                {
                    Caption = 'Installed in Line No.';
                    ToolTip = 'Specifies the Installed in Line No..';
                    ApplicationArea = All;
                }
                field(installedInItemNo; Rec."Installed in Item No.")
                {
                    Caption = 'Installed in Item No.';
                    ToolTip = 'Specifies which service item the component on the line is used in.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
