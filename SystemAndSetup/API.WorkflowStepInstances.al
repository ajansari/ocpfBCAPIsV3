namespace OnlyCopilotFans.OCPFAPIsv3;

using System.Automation;

page 90938 "ocpfWorkflowStepInstances"
{
    PageType = API;
    Caption = 'Workflow step instances — active steps within running workflow instances.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_systemAndSetup';
    APIVersion = 'v3.0';
    EntityName = 'ocpfWorkflowStepInstance';
    EntitySetName = 'ocpfWorkflowStepInstances';
    SourceTable = "Workflow Step Instance";
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
                field(id; Rec.ID)
                    {
                        Caption = 'ID';
                        ToolTip = 'Specifies the ID.';
                        ApplicationArea = All;
                }
                field(workflowCode; Rec."Workflow Code")
                    {
                        Caption = 'Workflow Code';
                        ToolTip = 'Specifies the Workflow Code.';
                        ApplicationArea = All;
                }
                field(workflowStepId; Rec."Workflow Step ID")
                    {
                        Caption = 'Workflow Step ID';
                        ToolTip = 'Specifies the Workflow Step ID.';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(entryPoint; Rec."Entry Point")
                    {
                        Caption = 'Entry Point';
                        ToolTip = 'Specifies the Entry Point.';
                        ApplicationArea = All;
                }
                field(recordId; Rec."Record ID")
                    {
                        Caption = 'Record ID';
                        ToolTip = 'Specifies the Record ID.';
                        ApplicationArea = All;
                }
                field(createdDateTime; Rec."Created Date-Time")
                    {
                        Caption = 'Created Date-Time';
                        ToolTip = 'Specifies the Created Date-Time.';
                        ApplicationArea = All;
                }
                field(createdByUserId; Rec."Created By User ID")
                    {
                        Caption = 'Created By User ID';
                        ToolTip = 'Specifies the Created By User ID.';
                        ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec."Last Modified Date-Time")
                    {
                        Caption = 'Last Modified Date-Time';
                        ToolTip = 'Specifies the Last Modified Date-Time.';
                        ApplicationArea = All;
                }
                field(lastModifiedByUserId; Rec."Last Modified By User ID")
                    {
                        Caption = 'Last Modified By User ID';
                        ToolTip = 'Specifies the Last Modified By User ID.';
                        ApplicationArea = All;
                }
                field(status; Rec.Status)
                    {
                        Caption = 'Status';
                        ToolTip = 'Specifies the Status.';
                        ApplicationArea = All;
                }
                field(previousWorkflowStepId; Rec."Previous Workflow Step ID")
                    {
                        Caption = 'Previous Workflow Step ID';
                        ToolTip = 'Specifies the Previous Workflow Step ID.';
                        ApplicationArea = All;
                }
                field(nextWorkflowStepId; Rec."Next Workflow Step ID")
                    {
                        Caption = 'Next Workflow Step ID';
                        ToolTip = 'Specifies the Next Workflow Step ID.';
                        ApplicationArea = All;
                }
                field(type; Rec.Type)
                    {
                        Caption = 'Type';
                        ToolTip = 'Specifies the Type.';
                        ApplicationArea = All;
                }
                field(functionName; Rec."Function Name")
                    {
                        Caption = 'Function Name';
                        ToolTip = 'Specifies the Function Name.';
                        ApplicationArea = All;
                }
                field(argument; Rec.Argument)
                    {
                        Caption = 'Argument';
                        ToolTip = 'Specifies the Argument.';
                        ApplicationArea = All;
                }
                field(originalWorkflowCode; Rec."Original Workflow Code")
                    {
                        Caption = 'Original Workflow Code';
                        ToolTip = 'Specifies the Original Workflow Code.';
                        ApplicationArea = All;
                }
                field(originalWorkflowStepId; Rec."Original Workflow Step ID")
                    {
                        Caption = 'Original Workflow Step ID';
                        ToolTip = 'Specifies the Original Workflow Step ID.';
                        ApplicationArea = All;
                }
                field(sequenceNo; Rec."Sequence No.")
                    {
                        Caption = 'Sequence No.';
                        ToolTip = 'Specifies the Sequence No..';
                        ApplicationArea = All;
                }
            }
        }
    }
}
