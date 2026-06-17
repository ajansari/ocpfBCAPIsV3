namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Ledger;

page 90805 "ocpfGLRegisters"
{
    PageType = API;
    Caption = 'G/L Registers — audit trail records that group G/L entries posted in the same batch, enabling traceability back to the originating journal.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfGLRegister';
    EntitySetName = 'ocpfGLRegisters';
    SourceTable = "G/L Register";
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
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the no. for this g/l register record.';
                    ApplicationArea = All;
                }
                field(fromEntryNo; Rec."From Entry No.")
                {
                    Caption = 'From Entry No.';
                    ToolTip = 'Specifies the from entry no. for this g/l register record.';
                    ApplicationArea = All;
                }
                field(toEntryNo; Rec."To Entry No.")
                {
                    Caption = 'To Entry No.';
                    ToolTip = 'Specifies the to entry no. for this g/l register record.';
                    ApplicationArea = All;
                }
                field(creationDate; Rec."Creation Date")
                {
                    Caption = 'Creation Date';
                    ToolTip = 'Specifies the creation date for this g/l register record.';
                    ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the source code for this g/l register record.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the user id for this g/l register record.';
                    ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                    ToolTip = 'Specifies the journal batch name for this g/l register record.';
                    ApplicationArea = All;
                }
                field(fromVatEntryNo; Rec."From VAT Entry No.")
                {
                    Caption = 'From VAT Entry No.';
                    ToolTip = 'Specifies the from vat entry no. for this g/l register record.';
                    ApplicationArea = All;
                }
                field(toVatEntryNo; Rec."To VAT Entry No.")
                {
                    Caption = 'To VAT Entry No.';
                    ToolTip = 'Specifies the to vat entry no. for this g/l register record.';
                    ApplicationArea = All;
                }
                field(reversed; Rec.Reversed)
                {
                    Caption = 'Reversed';
                    ToolTip = 'Specifies the reversed for this g/l register record.';
                    ApplicationArea = All;
                }
                field(creationTime; Rec."Creation Time")
                {
                    Caption = 'Creation Time';
                    ToolTip = 'Specifies the creation time for this g/l register record.';
                    ApplicationArea = All;
                }
                field(journalTemplName; Rec."Journal Templ. Name")
                {
                    Caption = 'Journal Template Name';
                    ToolTip = 'Specifies the journal templ. name for this g/l register record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}