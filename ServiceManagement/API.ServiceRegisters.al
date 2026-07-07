namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Ledger;

page 90990 "ocpfServiceRegisters"
{
    PageType = API;
    Caption = 'Service Registers — audit registers linking ranges of posted service ledger entries. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceRegister';
    EntitySetName = 'ocpfServiceRegisters';
    SourceTable = "Service Register";
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
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(fromEntryNo; Rec."From Entry No.")
                {
                    Caption = 'From Entry No.';
                    ToolTip = 'Specifies the first item entry number in the register.';
                    ApplicationArea = All;
                }
                field(toEntryNo; Rec."To Entry No.")
                {
                    Caption = 'To Entry No.';
                    ToolTip = 'Specifies the last sequence number from the range of service ledger entries created for this register line.';
                    ApplicationArea = All;
                }
                field(fromWarrantyEntryNo; Rec."From Warranty Entry No.")
                {
                    Caption = 'From Warranty Entry No.';
                    ToolTip = 'Specifies the first sequence number from the range of warranty ledger entries created for this register line.';
                    ApplicationArea = All;
                }
                field(toWarrantyEntryNo; Rec."To Warranty Entry No.")
                {
                    Caption = 'To Warranty Entry No.';
                    ToolTip = 'Specifies the last sequence number from the range of warranty ledger entries created for this register line.';
                    ApplicationArea = All;
                }
                field(creationDate; Rec."Creation Date")
                {
                    Caption = 'Creation Date';
                    ToolTip = 'Specifies the date when the entries in the register were created.';
                    ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the Source Code.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                    ApplicationArea = All;
                }
                field(creationTime; Rec."Creation Time")
                {
                    Caption = 'Creation Time';
                    ToolTip = 'Specifies the Creation Time.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
