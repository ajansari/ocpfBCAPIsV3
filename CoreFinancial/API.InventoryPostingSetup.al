namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Item;

page 90824 "ocpfInventoryPostingSetup"
{
    PageType = API;
    Caption = 'Inventory posting setup — maps inventory posting groups and locations to G/L accounts.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfInventoryPostingSetup';
    EntitySetName = 'ocpfInventoryPostingSetup';
    SourceTable = "Inventory Posting Setup";
    ODataKeyFields = SystemId;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
            field(id; Rec.SystemId)
            {
                Caption = 'ID';
                ToolTip = 'Unique system-assigned identifier for this record. Used as the OData key.';
                ApplicationArea = All;
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'Location Code';
                ToolTip = 'Specifies the Location Code.';
                ApplicationArea = All;
            }
            field(invtPostingGroupCode; Rec."Invt. Posting Group Code")
            {
                Caption = 'Invt. Posting Group Code';
                ToolTip = 'Specifies the Invt. Posting Group Code.';
                ApplicationArea = All;
            }
            field(inventoryAccount; Rec."Inventory Account")
            {
                Caption = 'Inventory Account';
                ToolTip = 'Specifies the Inventory Account.';
                ApplicationArea = All;
            }
            field(description; Rec.Description)
            {
                Caption = 'Description';
                ToolTip = 'Specifies the Description.';
                ApplicationArea = All;
            }
            field(viewAllAccountsOnLookup; Rec."View All Accounts on Lookup")
            {
                Caption = 'View All Accounts on Lookup';
                ToolTip = 'Specifies the View All Accounts on Lookup.';
                ApplicationArea = All;
            }
            field(inventoryAccountInterim; Rec."Inventory Account (Interim)")
            {
                Caption = 'Inventory Account (Interim)';
                ToolTip = 'Specifies the Inventory Account (Interim).';
                ApplicationArea = All;
            }
            field(wipAccount; Rec."WIP Account")
            {
                Caption = 'WIP Account';
                ToolTip = 'Specifies the WIP Account.';
                ApplicationArea = All;
            }
            field(materialVarianceAccount; Rec."Material Variance Account")
            {
                Caption = 'Material Variance Account';
                ToolTip = 'Specifies the Material Variance Account.';
                ApplicationArea = All;
            }
            field(capacityVarianceAccount; Rec."Capacity Variance Account")
            {
                Caption = 'Capacity Variance Account';
                ToolTip = 'Specifies the Capacity Variance Account.';
                ApplicationArea = All;
            }
            field(mfgOverheadVarianceAccount; Rec."Mfg. Overhead Variance Account")
            {
                Caption = 'Mfg. Overhead Variance Account';
                ToolTip = 'Specifies the Mfg. Overhead Variance Account.';
                ApplicationArea = All;
            }
            field(capOverheadVarianceAccount; Rec."Cap. Overhead Variance Account")
            {
                Caption = 'Cap. Overhead Variance Account';
                ToolTip = 'Specifies the Cap. Overhead Variance Account.';
                ApplicationArea = All;
            }
            field(subcontractedVarianceAccount; Rec."Subcontracted Variance Account")
            {
                Caption = 'Subcontracted Variance Account';
                ToolTip = 'Specifies the Subcontracted Variance Account.';
                ApplicationArea = All;
            }
            field(matNonInvVarianceAcc; Rec."Mat. Non-Inv. Variance Acc.")
            {
                Caption = 'Material Non-Inventory Variance Account';
                ToolTip = 'Specifies the general ledger account number to which to post material non-inventory variance transactions for items in this combination.';
                ApplicationArea = All;
            }
            }
        }
    }
}
