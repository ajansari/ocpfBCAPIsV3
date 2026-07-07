namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Item;

page 90816 "ocpfInventoryPostingGroups"
{
    PageType = API;
    Caption = 'Inventory Posting Groups — classify items for inventory account determination when posting item transactions.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfInventoryPostingGroup';
    EntitySetName = 'ocpfInventoryPostingGroups';
    SourceTable = "Inventory Posting Group";
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
                    ToolTip = 'Specifies the code for this inventory posting group record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this inventory posting group record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}