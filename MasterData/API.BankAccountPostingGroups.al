namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Bank.BankAccount;

page 90831 "ocpfBankAccountPostingGroups"
{
    PageType = API;
    Caption = 'Bank Account Posting Groups — map bank accounts to the G/L accounts used when posting bank transactions.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfBankAccountPostingGroup';
    EntitySetName = 'ocpfBankAccountPostingGroups';
    SourceTable = "Bank Account Posting Group";
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
                    ToolTip = 'Specifies the code for this bank account posting group record.';
                    ApplicationArea = All;
                }
                field(gLAccountNo; Rec."G/L Account No.")
                {
                    Caption = 'G/L Account No.';
                    ToolTip = 'Specifies the g/l account no. for this bank account posting group record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}