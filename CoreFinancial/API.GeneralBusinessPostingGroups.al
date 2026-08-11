namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Setup;

page 90811 "ocpfGenBusPostingGroups"
{
    PageType = API;
    Caption = 'General Business Posting Groups — customer and vendor classification codes that determine which general posting setup row is used for a transaction.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfGenBusPostingGroup';
    EntitySetName = 'ocpfGenBusPostingGroups';
    SourceTable = "Gen. Business Posting Group";
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
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for this gen. business posting group record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this gen. business posting group record.';
                    ApplicationArea = All;
                }
                field(defVatBusPostingGroup; Rec."Def. VAT Bus. Posting Group")
                {
                    Caption = 'Def. VAT Bus. Posting Group';
                    ToolTip = 'Specifies the def. vat bus. posting group for this gen. business posting group record.';
                    ApplicationArea = All;
                }
                field(autoInsertDefault; Rec."Auto Insert Default")
                {
                    Caption = 'Auto Insert Default';
                    ToolTip = 'Specifies the auto insert default for this gen. business posting group record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}