namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Setup;

page 90813 "ocpfGeneralPostingSetup"
{
    PageType = API;
    Caption = 'General Posting Setup — matrix mapping Gen. Business and Gen. Product Posting Groups to the G/L accounts used when posting sales and purchase transactions.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfGeneralPostingSetup';
    EntitySetName = 'ocpfGeneralPostingSetup';
    SourceTable = "General Posting Setup";
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
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the gen. bus. posting group for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the gen. prod. posting group for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(salesAccount; Rec."Sales Account")
                {
                    Caption = 'Sales Account';
                    ToolTip = 'Specifies the sales account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(salesLineDiscAccount; Rec."Sales Line Disc. Account")
                {
                    Caption = 'Sales Line Disc. Account';
                    ToolTip = 'Specifies the sales line disc. account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(salesInvDiscAccount; Rec."Sales Inv. Disc. Account")
                {
                    Caption = 'Sales Inv. Disc. Account';
                    ToolTip = 'Specifies the sales inv. disc. account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(salesPmtDiscDebitAcc; Rec."Sales Pmt. Disc. Debit Acc.")
                {
                    Caption = 'Sales Pmt. Disc. Debit Acc.';
                    ToolTip = 'Specifies the sales pmt. disc. debit acc. for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchAccount; Rec."Purch. Account")
                {
                    Caption = 'Purch. Account';
                    ToolTip = 'Specifies the purch. account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchLineDiscAccount; Rec."Purch. Line Disc. Account")
                {
                    Caption = 'Purch. Line Disc. Account';
                    ToolTip = 'Specifies the purch. line disc. account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchInvDiscAccount; Rec."Purch. Inv. Disc. Account")
                {
                    Caption = 'Purch. Inv. Disc. Account';
                    ToolTip = 'Specifies the purch. inv. disc. account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchPmtDiscCreditAcc; Rec."Purch. Pmt. Disc. Credit Acc.")
                {
                    Caption = 'Purch. Pmt. Disc. Credit Acc.';
                    ToolTip = 'Specifies the purch. pmt. disc. credit acc. for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(cOGSAccount; Rec."COGS Account")
                {
                    Caption = 'COGS Account';
                    ToolTip = 'Specifies the cogs account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(inventoryAdjmtAccount; Rec."Inventory Adjmt. Account")
                {
                    Caption = 'Inventory Adjmt. Account';
                    ToolTip = 'Specifies the inventory adjmt. account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(salesCreditMemoAccount; Rec."Sales Credit Memo Account")
                {
                    Caption = 'Sales Credit Memo Account';
                    ToolTip = 'Specifies the sales credit memo account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchCreditMemoAccount; Rec."Purch. Credit Memo Account")
                {
                    Caption = 'Purch. Credit Memo Account';
                    ToolTip = 'Specifies the purch. credit memo account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(salesPmtDiscCreditAcc; Rec."Sales Pmt. Disc. Credit Acc.")
                {
                    Caption = 'Sales Pmt. Disc. Credit Acc.';
                    ToolTip = 'Specifies the sales pmt. disc. credit acc. for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchPmtDiscDebitAcc; Rec."Purch. Pmt. Disc. Debit Acc.")
                {
                    Caption = 'Purch. Pmt. Disc. Debit Acc.';
                    ToolTip = 'Specifies the purch. pmt. disc. debit acc. for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(salesPmtTolDebitAcc; Rec."Sales Pmt. Tol. Debit Acc.")
                {
                    Caption = 'Sales Pmt. Tol. Debit Acc.';
                    ToolTip = 'Specifies the sales pmt. tol. debit acc. for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(salesPmtTolCreditAcc; Rec."Sales Pmt. Tol. Credit Acc.")
                {
                    Caption = 'Sales Pmt. Tol. Credit Acc.';
                    ToolTip = 'Specifies the sales pmt. tol. credit acc. for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchPmtTolDebitAcc; Rec."Purch. Pmt. Tol. Debit Acc.")
                {
                    Caption = 'Purch. Pmt. Tol. Debit Acc.';
                    ToolTip = 'Specifies the purch. pmt. tol. debit acc. for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchPmtTolCreditAcc; Rec."Purch. Pmt. Tol. Credit Acc.")
                {
                    Caption = 'Purch. Pmt. Tol. Credit Acc.';
                    ToolTip = 'Specifies the purch. pmt. tol. credit acc. for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(salesPrepaymentsAccount; Rec."Sales Prepayments Account")
                {
                    Caption = 'Sales Prepayments Account';
                    ToolTip = 'Specifies the sales prepayments account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchPrepaymentsAccount; Rec."Purch. Prepayments Account")
                {
                    Caption = 'Purch. Prepayments Account';
                    ToolTip = 'Specifies the purch. prepayments account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(viewAllAccountsOnLookup; Rec."View All Accounts on Lookup")
                {
                    Caption = 'View All Accounts on Lookup';
                    ToolTip = 'Specifies the view all accounts on lookup for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the blocked for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchFaDiscAccount; Rec."Purch. FA Disc. Account")
                {
                    Caption = 'Purch. FA Disc. Account';
                    ToolTip = 'Specifies the purch. fa disc. account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(directCostNonInvAppAcc; Rec."Direct Cost Non-Inv. App. Acc.")
                {
                    Caption = 'Direct Cost Non-Inventory Applied Account';
                    ToolTip = 'Specifies the general ledger account number to post the direct cost non-inventory applied with this particular combination of business posting group and product posting group.';
                    ApplicationArea = All;
                }
                field(directCostAppliedAccount; Rec."Direct Cost Applied Account")
                {
                    Caption = 'Direct Cost Applied Account';
                    ToolTip = 'Specifies the direct cost applied account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(overheadAppliedAccount; Rec."Overhead Applied Account")
                {
                    Caption = 'Overhead Applied Account';
                    ToolTip = 'Specifies the overhead applied account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(purchaseVarianceAccount; Rec."Purchase Variance Account")
                {
                    Caption = 'Purchase Variance Account';
                    ToolTip = 'Specifies the purchase variance account for this general posting setup record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified DateTime';
                    ToolTip = 'Specifies the Last Modified DateTime.';
                    ApplicationArea = All;
                }
            }
        }
    }
}