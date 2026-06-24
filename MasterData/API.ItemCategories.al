namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Item;

page 90840 "ocpfItemCategories"
{
    PageType = API;
    Caption = 'Item Categories — hierarchical classification codes for grouping items, used for reporting, default attributes, and costing.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfItemCategory';
    EntitySetName = 'ocpfItemCategories';
    SourceTable = "Item Category";
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
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for this item category record.';
                    ApplicationArea = All;
                }
                field(parentCategory; Rec."Parent Category")
                {
                    Caption = 'Parent Category';
                    ToolTip = 'Specifies the parent category for this item category record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this item category record.';
                    ApplicationArea = All;
                }
                field(indentation; Rec.Indentation)
                {
                    Caption = 'Indentation';
                    ToolTip = 'Specifies the indentation for this item category record.';
                    ApplicationArea = All;
                }
                field(presentationOrder; Rec."Presentation Order")
                {
                    Caption = 'Presentation Order';
                    ToolTip = 'Specifies the presentation order for this item category record.';
                    ApplicationArea = All;
                }
                field(hasChildren; Rec."Has Children")
                {
                    Caption = 'Has Children';
                    ToolTip = 'Specifies the has children for this item category record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this item category record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}