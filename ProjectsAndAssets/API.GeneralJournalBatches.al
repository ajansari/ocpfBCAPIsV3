namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Journal;

page 90920 "ocpfGeneralJournalBatches"
{
    PageType = API;
    Caption = 'General journal batches — named batches within a journal template.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0';
    EntityName = 'ocpfGeneralJournalBatch';
    EntitySetName = 'ocpfGeneralJournalBatches';
    SourceTable = "Gen. Journal Batch";
    ODataKeyFields = SystemId;
    Editable = false;

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
                field(journalTemplateName; Rec."Journal Template Name")
                    {
                        Caption = 'Journal Template Name';
                        ToolTip = 'Specifies the Journal Template Name.';
                        ApplicationArea = All;
                }
                field(name; Rec.Name)
                    {
                        Caption = 'Name';
                        ToolTip = 'Specifies the Name.';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                    {
                        Caption = 'Reason Code';
                        ToolTip = 'Specifies the Reason Code.';
                        ApplicationArea = All;
                }
                field(balAccountType; Rec."Bal. Account Type")
                    {
                        Caption = 'Bal. Account Type';
                        ToolTip = 'Specifies the Bal. Account Type.';
                        ApplicationArea = All;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                    {
                        Caption = 'Bal. Account No.';
                        ToolTip = 'Specifies the Bal. Account No..';
                        ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                    {
                        Caption = 'No. Series';
                        ToolTip = 'Specifies the No. Series.';
                        ApplicationArea = All;
                }
                field(postingNoSeries; Rec."Posting No. Series")
                    {
                        Caption = 'Posting No. Series';
                        ToolTip = 'Specifies the Posting No. Series.';
                        ApplicationArea = All;
                }
                field(copyVatSetupToJnlLines; Rec."Copy VAT Setup to Jnl. Lines")
                    {
                        Caption = 'Copy VAT Setup to Jnl. Lines';
                        ToolTip = 'Specifies the Copy VAT Setup to Jnl. Lines.';
                        ApplicationArea = All;
                }
                field(allowVatDifference; Rec."Allow VAT Difference")
                    {
                        Caption = 'Allow VAT Difference';
                        ToolTip = 'Specifies the Allow VAT Difference.';
                        ApplicationArea = All;
                }
                field(allowPaymentExport; Rec."Allow Payment Export")
                    {
                        Caption = 'Allow Payment Export';
                        ToolTip = 'Specifies the Allow Payment Export.';
                        ApplicationArea = All;
                }
                field(bankStatementImportFormat; Rec."Bank Statement Import Format")
                    {
                        Caption = 'Bank Statement Import Format';
                        ToolTip = 'Specifies the Bank Statement Import Format.';
                        ApplicationArea = All;
                }
                field(templateType; Rec."Template Type")
                    {
                        Caption = 'Template Type';
                        ToolTip = 'Specifies the Template Type.';
                        ApplicationArea = All;
                }
                field(recurring; Rec.Recurring)
                    {
                        Caption = 'Recurring';
                        ToolTip = 'Specifies the Recurring.';
                        ApplicationArea = All;
                }
                field(suggestBalancingAmount; Rec."Suggest Balancing Amount")
                    {
                        Caption = 'Suggest Balancing Amount';
                        ToolTip = 'Specifies the Suggest Balancing Amount.';
                        ApplicationArea = All;
                }
                field(pendingApproval; Rec."Pending Approval")
                    {
                        Caption = 'Pending Approval';
                        ToolTip = 'Specifies the Pending Approval.';
                        ApplicationArea = All;
                }
                field(copyToPostedJnlLines; Rec."Copy to Posted Jnl. Lines")
                    {
                        Caption = 'Copy to Posted Jnl. Lines';
                        ToolTip = 'Specifies the Copy to Posted Jnl. Lines.';
                        ApplicationArea = All;
                }
                field(lastModifiedDatetime; Rec."Last Modified DateTime")
                    {
                        Caption = 'Last Modified DateTime';
                        ToolTip = 'Specifies the Last Modified DateTime.';
                        ApplicationArea = All;
                }
                field(balaccountid; Rec.BalAccountId)
                    {
                        Caption = 'BalAccountId';
                        ToolTip = 'Specifies the BalAccountId.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
