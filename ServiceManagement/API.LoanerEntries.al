namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Loaner;

page 90982 "ocpfLoanerEntries"
{
    PageType = API;
    Caption = 'Loaner Entries — the lending and receiving history of loaner units. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfLoanerEntry';
    EntitySetName = 'ocpfLoanerEntries';
    SourceTable = "Loaner Entry";
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
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                    ApplicationArea = All;
                }
                field(loanerNo; Rec."Loaner No.")
                {
                    Caption = 'Loaner No.';
                    ToolTip = 'Specifies the number of the loaner.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the number of the service document specifying the service item you have replaced with the loaner.';
                    ApplicationArea = All;
                }
                field(serviceItemLineNo; Rec."Service Item Line No.")
                {
                    Caption = 'Service Item Line No.';
                    ToolTip = 'Specifies the number of the service item line for which you have lent the loaner.';
                    ApplicationArea = All;
                }
                field(serviceItemNo; Rec."Service Item No.")
                {
                    Caption = 'Service Item No.';
                    ToolTip = 'Specifies the number of the service item that you have replaced with the loaner.';
                    ApplicationArea = All;
                }
                field(serviceItemGroupCode; Rec."Service Item Group Code")
                {
                    Caption = 'Service Item Group Code';
                    ToolTip = 'Specifies the service item group code of the service item that you have replaced with the loaner.';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the number of the customer to whom you have lent the loaner.';
                    ApplicationArea = All;
                }
                field(dateLent; Rec."Date Lent")
                {
                    Caption = 'Date Lent';
                    ToolTip = 'Specifies the date when you lent the loaner.';
                    ApplicationArea = All;
                }
                field(timeLent; Rec."Time Lent")
                {
                    Caption = 'Time Lent';
                    ToolTip = 'Specifies the time when you lent the loaner.';
                    ApplicationArea = All;
                }
                field(dateReceived; Rec."Date Received")
                {
                    Caption = 'Date Received';
                    ToolTip = 'Specifies the date when you received the loaner.';
                    ApplicationArea = All;
                }
                field(timeReceived; Rec."Time Received")
                {
                    Caption = 'Time Received';
                    ToolTip = 'Specifies the time when you received the loaner.';
                    ApplicationArea = All;
                }
                field(lent; Rec."Lent")
                {
                    Caption = 'Lent';
                    ToolTip = 'Specifies that the loaner is lent.';
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies whether the document type of the entry is a quote or order.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
