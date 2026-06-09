namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Projects.Project.Job;

page 90911 "ocpfProjectPostingGroups"
{
    PageType = API;
    Caption = 'Project posting groups — defines G/L accounts for project transactions.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0';
    EntityName = 'ocpfProjectPostingGroup';
    EntitySetName = 'ocpfProjectPostingGroups';
    SourceTable = "Job Posting Group";
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
                field(code; Rec.Code)
                    {
                        Caption = 'Code';
                        ToolTip = 'Specifies the Code.';
                        ApplicationArea = All;
                }
                field(wipCostsAccount; Rec."WIP Costs Account")
                    {
                        Caption = 'WIP Costs Account';
                        ToolTip = 'Specifies the WIP Costs Account.';
                        ApplicationArea = All;
                }
                field(wipAccruedCostsAccount; Rec."WIP Accrued Costs Account")
                    {
                        Caption = 'WIP Accrued Costs Account';
                        ToolTip = 'Specifies the WIP Accrued Costs Account.';
                        ApplicationArea = All;
                }
                field(jobCostsAppliedAccount; Rec."Job Costs Applied Account")
                    {
                        Caption = 'Project Costs Applied Account';
                        ToolTip = 'Specifies the Job Costs Applied Account.';
                        ApplicationArea = All;
                }
                field(jobCostsAdjustmentAccount; Rec."Job Costs Adjustment Account")
                    {
                        Caption = 'Project Costs Adjustment Account';
                        ToolTip = 'Specifies the Job Costs Adjustment Account.';
                        ApplicationArea = All;
                }
                field(gLExpenseAccContract; Rec."G/L Expense Acc. (Contract)")
                    {
                        Caption = 'G/L Expense Acc. (Contract)';
                        ToolTip = 'Specifies the G/L Expense Acc. (Contract).';
                        ApplicationArea = All;
                }
                field(jobSalesAdjustmentAccount; Rec."Job Sales Adjustment Account")
                    {
                        Caption = 'Project Sales Adjustment Account';
                        ToolTip = 'Specifies the Job Sales Adjustment Account.';
                        ApplicationArea = All;
                }
                field(wipAccruedSalesAccount; Rec."WIP Accrued Sales Account")
                    {
                        Caption = 'WIP Accrued Sales Account';
                        ToolTip = 'Specifies the WIP Accrued Sales Account.';
                        ApplicationArea = All;
                }
                field(wipInvoicedSalesAccount; Rec."WIP Invoiced Sales Account")
                    {
                        Caption = 'WIP Invoiced Sales Account';
                        ToolTip = 'Specifies the WIP Invoiced Sales Account.';
                        ApplicationArea = All;
                }
                field(jobSalesAppliedAccount; Rec."Job Sales Applied Account")
                    {
                        Caption = 'Project Sales Applied Account';
                        ToolTip = 'Specifies the Job Sales Applied Account.';
                        ApplicationArea = All;
                }
                field(recognizedCostsAccount; Rec."Recognized Costs Account")
                    {
                        Caption = 'Recognized Costs Account';
                        ToolTip = 'Specifies the Recognized Costs Account.';
                        ApplicationArea = All;
                }
                field(recognizedSalesAccount; Rec."Recognized Sales Account")
                    {
                        Caption = 'Recognized Sales Account';
                        ToolTip = 'Specifies the Recognized Sales Account.';
                        ApplicationArea = All;
                }
                field(itemCostsAppliedAccount; Rec."Item Costs Applied Account")
                    {
                        Caption = 'Item Costs Applied Account';
                        ToolTip = 'Specifies the Item Costs Applied Account.';
                        ApplicationArea = All;
                }
                field(resourceCostsAppliedAccount; Rec."Resource Costs Applied Account")
                    {
                        Caption = 'Resource Costs Applied Account';
                        ToolTip = 'Specifies the Resource Costs Applied Account.';
                        ApplicationArea = All;
                }
                field(gLCostsAppliedAccount; Rec."G/L Costs Applied Account")
                    {
                        Caption = 'G/L Costs Applied Account';
                        ToolTip = 'Specifies the G/L Costs Applied Account.';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
