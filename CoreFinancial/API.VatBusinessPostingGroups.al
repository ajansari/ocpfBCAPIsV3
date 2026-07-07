namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.VAT.Setup;

page 90817 "ocpfVatBusinessPostingGroups"
{
    PageType = API;
    Caption = 'VAT Business Posting Groups — classify customers and vendors for VAT calculation, determining which VAT Posting Setup row applies to a transaction.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfVatBusinessPostingGroup';
    EntitySetName = 'ocpfVatBusinessPostingGroups';
    SourceTable = "VAT Business Posting Group";
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
                    ToolTip = 'Specifies the code for this vat business posting group record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this vat business posting group record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this vat business posting group record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}