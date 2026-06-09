namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.Reminder;

page 90934 "ocpfReminderLines"
{
    PageType = API;
    Caption = 'Reminder lines — individual overdue invoice lines within a reminder document.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_systemAndSetup';
    APIVersion = 'v3.0';
    EntityName = 'ocpfReminderLine';
    EntitySetName = 'ocpfReminderLines';
    SourceTable = "Reminder Line";
    ODataKeyFields = SystemId;
    Editable = false;

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
                field(reminderNo; Rec."Reminder No.")
                    {
                        Caption = 'Reminder No.';
                        ToolTip = 'Specifies the Reminder No..';
                        ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                    {
                        Caption = 'Line No.';
                        ToolTip = 'Specifies the Line No..';
                        ApplicationArea = All;
                }
                field(attachedToLineNo; Rec."Attached to Line No.")
                    {
                        Caption = 'Attached to Line No.';
                        ToolTip = 'Specifies the Attached to Line No..';
                        ApplicationArea = All;
                }
                field(type; Rec.Type)
                    {
                        Caption = 'Type';
                        ToolTip = 'Specifies the Type.';
                        ApplicationArea = All;
                }
                field(entryNo; Rec."Entry No.")
                    {
                        Caption = 'Entry No.';
                        ToolTip = 'Specifies the Entry No..';
                        ApplicationArea = All;
                }
                field(noOfReminders; Rec."No. of Reminders")
                    {
                        Caption = 'No. of Reminders';
                        ToolTip = 'Specifies the No. of Reminders.';
                        ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                    {
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the Posting Date.';
                        ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                    {
                        Caption = 'Document Date';
                        ToolTip = 'Specifies the Document Date.';
                        ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                    {
                        Caption = 'Due Date';
                        ToolTip = 'Specifies the Due Date.';
                        ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                    {
                        Caption = 'Document Type';
                        ToolTip = 'Specifies the Document Type.';
                        ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                    {
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the Document No..';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(originalAmount; Rec."Original Amount")
                    {
                        Caption = 'Original Amount';
                        ToolTip = 'Specifies the Original Amount.';
                        ApplicationArea = All;
                }
                field(remainingAmount; Rec."Remaining Amount")
                    {
                        Caption = 'Remaining Amount';
                        ToolTip = 'Specifies the Remaining Amount.';
                        ApplicationArea = All;
                }
                field(no; Rec."No.")
                    {
                        Caption = 'No.';
                        ToolTip = 'Specifies the No..';
                        ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                    {
                        Caption = 'Amount';
                        ToolTip = 'Specifies the Amount.';
                        ApplicationArea = All;
                }
                field(interestRate; Rec."Interest Rate")
                    {
                        Caption = 'Interest Rate';
                        ToolTip = 'Specifies the Interest Rate.';
                        ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                    {
                        Caption = 'Gen. Prod. Posting Group';
                        ToolTip = 'Specifies the Gen. Prod. Posting Group.';
                        ApplicationArea = All;
                }
                field(vatPct; Rec."VAT %")
                    {
                        Caption = 'VAT %';
                        ToolTip = 'Specifies the VAT %.';
                        ApplicationArea = All;
                }
                field(vatCalculationType; Rec."VAT Calculation Type")
                    {
                        Caption = 'VAT Calculation Type';
                        ToolTip = 'Specifies the VAT Calculation Type.';
                        ApplicationArea = All;
                }
                field(vatAmount; Rec."VAT Amount")
                    {
                        Caption = 'VAT Amount';
                        ToolTip = 'Specifies the VAT Amount.';
                        ApplicationArea = All;
                }
                field(taxGroupCode; Rec."Tax Group Code")
                    {
                        Caption = 'Tax Group Code';
                        ToolTip = 'Specifies the Tax Group Code.';
                        ApplicationArea = All;
                }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
                    {
                        Caption = 'VAT Prod. Posting Group';
                        ToolTip = 'Specifies the VAT Prod. Posting Group.';
                        ApplicationArea = All;
                }
                field(vatIdentifier; Rec."VAT Identifier")
                    {
                        Caption = 'VAT Identifier';
                        ToolTip = 'Specifies the VAT Identifier.';
                        ApplicationArea = All;
                }
                field(lineType; Rec."Line Type")
                    {
                        Caption = 'Line Type';
                        ToolTip = 'Specifies the Line Type.';
                        ApplicationArea = All;
                }
                field(vatClauseCode; Rec."VAT Clause Code")
                    {
                        Caption = 'VAT Clause Code';
                        ToolTip = 'Specifies the VAT Clause Code.';
                        ApplicationArea = All;
                }
                field(appliesToDocumentType; Rec."Applies-to Document Type")
                    {
                        Caption = 'Applies-to Document Type';
                        ToolTip = 'Specifies the Applies-to Document Type.';
                        ApplicationArea = All;
                }
                field(appliesToDocumentNo; Rec."Applies-to Document No.")
                    {
                        Caption = 'Applies-to Document No.';
                        ToolTip = 'Specifies the Applies-to Document No..';
                        ApplicationArea = All;
                }
                field(detailedInterestRatesEntry; Rec."Detailed Interest Rates Entry")
                    {
                        Caption = 'Detailed Interest Rates Entry';
                        ToolTip = 'Specifies the Detailed Interest Rates Entry.';
                        ApplicationArea = All;
                }
                field(systemCreatedEntry; Rec."System-Created Entry")
                    {
                        Caption = 'System-Created Entry';
                        ToolTip = 'Specifies the System-Created Entry.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
