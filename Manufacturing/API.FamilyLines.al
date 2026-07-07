namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Family;

page 90960 "ocpfFamilyLines"
{
    PageType = API;
    Caption = 'Family Lines — the items and quantities that make up a production family.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfFamilyLine';
    EntitySetName = 'ocpfFamilyLines';
    SourceTable = "Family Line";
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
                field(familyNo; Rec."Family No.")
                {
                    Caption = 'Family No.';
                    ToolTip = 'Specifies the Family No..';
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the line number of the product family line.';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies which items belong to a family.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description for the product family line.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies an extended description if there is not enough space in the Description field.';
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
                    ToolTip = 'Specifies the quantity for the item in this family line.';
                    ApplicationArea = All;
                }
                field(lowLevelCode; Rec."Low-Level Code")
                {
                    Caption = 'Low-Level Code';
                    ToolTip = 'Specifies the Low-Level Code.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
