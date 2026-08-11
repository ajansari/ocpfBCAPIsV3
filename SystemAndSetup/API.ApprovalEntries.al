namespace OnlyCopilotFans.OCPFAPIsv3;

using System.Automation;

page 90937 "ocpfApprovalEntries"
{
    PageType = API;
    Caption = 'Approval entries — workflow approval requests and their current status.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_systemAndSetup';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfApprovalEntry';
    EntitySetName = 'ocpfApprovalEntries';
    SourceTable = "Approval Entry";
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
                field(tableId; Rec."Table ID")
                    {
                        Caption = 'Table ID';
                        ToolTip = 'Specifies the Table ID.';
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
                field(sequenceNo; Rec."Sequence No.")
                    {
                        Caption = 'Sequence No.';
                        ToolTip = 'Specifies the Sequence No..';
                        ApplicationArea = All;
                }
                field(approvalCode; Rec."Approval Code")
                    {
                        Caption = 'Approval Code';
                        ToolTip = 'Specifies the Approval Code.';
                        ApplicationArea = All;
                }
                field(senderId; Rec."Sender ID")
                    {
                        Caption = 'Sender ID';
                        ToolTip = 'Specifies the Sender ID.';
                        ApplicationArea = All;
                }
                field(salespersPurchCode; Rec."Salespers./Purch. Code")
                    {
                        Caption = 'Salespers./Purch. Code';
                        ToolTip = 'Specifies the Salespers./Purch. Code.';
                        ApplicationArea = All;
                }
                field(approverId; Rec."Approver ID")
                    {
                        Caption = 'Approver ID';
                        ToolTip = 'Specifies the Approver ID.';
                        ApplicationArea = All;
                }
                field(status; Rec.Status)
                    {
                        Caption = 'Status';
                        ToolTip = 'Specifies the Status.';
                        ApplicationArea = All;
                }
                field(dateTimeSentForApproval; Rec."Date-Time Sent for Approval")
                    {
                        Caption = 'Date-Time Sent for Approval';
                        ToolTip = 'Specifies the Date-Time Sent for Approval.';
                        ApplicationArea = All;
                }
                field(lastDateTimeModified; Rec."Last Date-Time Modified")
                    {
                        Caption = 'Last Date-Time Modified';
                        ToolTip = 'Specifies the Last Date-Time Modified.';
                        ApplicationArea = All;
                }
                field(lastModifiedByUserId; Rec."Last Modified By User ID")
                    {
                        Caption = 'Last Modified By User ID';
                        ToolTip = 'Specifies the Last Modified By User ID.';
                        ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                    {
                        Caption = 'Comment';
                        ToolTip = 'Specifies the Comment.';
                        ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                    {
                        Caption = 'Approval Due Date';
                        ToolTip = 'Specifies the Due Date.';
                        ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                    {
                        Caption = 'Amount';
                        ToolTip = 'Specifies the Amount.';
                        ApplicationArea = All;
                }
                field(amountLcy; Rec."Amount (LCY)")
                    {
                        Caption = 'Amount (LCY)';
                        ToolTip = 'Specifies the Amount (LCY).';
                        ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                    {
                        Caption = 'Currency Code';
                        ToolTip = 'Specifies the Currency Code.';
                        ApplicationArea = All;
                }
                field(approvalType; Rec."Approval Type")
                    {
                        Caption = 'Approval Type';
                        ToolTip = 'Specifies the Approval Type.';
                        ApplicationArea = All;
                }
                field(limitType; Rec."Limit Type")
                    {
                        Caption = 'Limit Type';
                        ToolTip = 'Specifies the Limit Type.';
                        ApplicationArea = All;
                }
                field(availableCreditLimitLcy; Rec."Available Credit Limit (LCY)")
                    {
                        Caption = 'Available Credit Limit (LCY)';
                        ToolTip = 'Specifies the Available Credit Limit (LCY).';
                        ApplicationArea = All;
                }
                field(pendingApprovals; Rec."Pending Approvals")
                    {
                        Caption = 'Pending Approvals';
                        ToolTip = 'Specifies the Pending Approvals.';
                        ApplicationArea = All;
                }
                field(recordIdToApprove; Rec."Record ID to Approve")
                    {
                        Caption = 'Record ID to Approve';
                        ToolTip = 'Specifies the Record ID to Approve.';
                        ApplicationArea = All;
                }
                field(delegationDateFormula; Rec."Delegation Date Formula")
                    {
                        Caption = 'Delegation Date Formula';
                        ToolTip = 'Specifies the Delegation Date Formula.';
                        ApplicationArea = All;
                }
                field(numberOfApprovedRequests; Rec."Number of Approved Requests")
                    {
                        Caption = 'Number of Approved Requests';
                        ToolTip = 'Specifies the Number of Approved Requests.';
                        ApplicationArea = All;
                }
                field(numberOfRejectedRequests; Rec."Number of Rejected Requests")
                    {
                        Caption = 'Number of Rejected Requests';
                        ToolTip = 'Specifies the Number of Rejected Requests.';
                        ApplicationArea = All;
                }
                field(entryNo; Rec."Entry No.")
                    {
                        Caption = 'Entry No.';
                        ToolTip = 'Specifies the Entry No..';
                        ApplicationArea = All;
                }
                field(workflowStepInstanceId; Rec."Workflow Step Instance ID")
                    {
                        Caption = 'Workflow Step Instance ID';
                        ToolTip = 'Specifies the Workflow Step Instance ID.';
                        ApplicationArea = All;
                }
                field(relatedToChange; Rec."Related to Change")
                    {
                        Caption = 'Related to Change';
                        ToolTip = 'Specifies the Related to Change.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
