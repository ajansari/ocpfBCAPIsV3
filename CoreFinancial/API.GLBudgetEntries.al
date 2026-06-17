namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Budget;

page 90804 "ocpfGLBudgetEntries"
{
    PageType = API;
    Caption = 'G/L Budget Entries — budgeted amounts per G/L account, dimension, and period used for budget vs. actual analysis.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfGLBudgetEntry';
    EntitySetName = 'ocpfGLBudgetEntries';
    SourceTable = "G/L Budget Entry";
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
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    ToolTip = 'Specifies the entry no. for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(budgetName; Rec."Budget Name")
                {
                    Caption = 'Budget Name';
                    ToolTip = 'Specifies the budget name for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(gLAccountNo; Rec."G/L Account No.")
                {
                    Caption = 'G/L Account No.';
                    ToolTip = 'Specifies the g/l account no. for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(date; Rec.Date)
                {
                    Caption = 'Date';
                    ToolTip = 'Specifies the date for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the amount for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(businessUnitCode; Rec."Business Unit Code")
                {
                    Caption = 'Business Unit Code';
                    ToolTip = 'Specifies the business unit code for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the user id for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(budgetDimension1Code; Rec."Budget Dimension 1 Code")
                {
                    Caption = 'Budget Dimension 1 Code';
                    ToolTip = 'Specifies the budget dimension 1 code for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(budgetDimension2Code; Rec."Budget Dimension 2 Code")
                {
                    Caption = 'Budget Dimension 2 Code';
                    ToolTip = 'Specifies the budget dimension 2 code for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(budgetDimension3Code; Rec."Budget Dimension 3 Code")
                {
                    Caption = 'Budget Dimension 3 Code';
                    ToolTip = 'Specifies the budget dimension 3 code for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(budgetDimension4Code; Rec."Budget Dimension 4 Code")
                {
                    Caption = 'Budget Dimension 4 Code';
                    ToolTip = 'Specifies the budget dimension 4 code for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date modified for this g/l budget entry record.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the dimension set id for this g/l budget entry record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}