namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.VAT.Setup;

page 90818 "ocpfVatProductPostingGroups"
{
    PageType = API;
    Caption = 'VAT Product Posting Groups — classify items and G/L accounts for VAT calculation, determining which VAT Posting Setup row applies to a transaction.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfVatProductPostingGroup';
    EntitySetName = 'ocpfVatProductPostingGroups';
    SourceTable = "VAT Product Posting Group";
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
                    ToolTip = 'Specifies the code for this vat product posting group record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this vat product posting group record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDatetime; Rec."Last Modified DateTime")
                {
                    Caption = 'Last Modified DateTime';
                    ToolTip = 'Specifies the last modified datetime for this vat product posting group record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}