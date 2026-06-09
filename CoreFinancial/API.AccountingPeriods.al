namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Foundation.Period;

page 90803 "ocpfAccountingPeriods"
{
    PageType = API;
    Caption = 'Accounting Periods — fiscal periods that control which dates are open for posting and define the financial year structure.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfAccountingPeriod';
    EntitySetName = 'ocpfAccountingPeriods';
    SourceTable = "Accounting Period";
    ODataKeyFields = SystemId;
    DelayedInsert = true;

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
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the starting date for this accounting period record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this accounting period record.';
                    ApplicationArea = All;
                }
                field(newFiscalYear; Rec."New Fiscal Year")
                {
                    Caption = 'New Fiscal Year';
                    ToolTip = 'Specifies the new fiscal year for this accounting period record.';
                    ApplicationArea = All;
                }
                field(closed; Rec.Closed)
                {
                    Caption = 'Closed';
                    ToolTip = 'Specifies the closed for this accounting period record.';
                    ApplicationArea = All;
                }
                field(dateLocked; Rec."Date Locked")
                {
                    Caption = 'Date Locked';
                    ToolTip = 'Specifies the date locked for this accounting period record.';
                    ApplicationArea = All;
                }
                field(averageCostCalcType; Rec."Average Cost Calc. Type")
                {
                    Caption = 'Average Cost Calc. Type';
                    ToolTip = 'Specifies the average cost calc. type for this accounting period record.';
                    ApplicationArea = All;
                }
                field(averageCostPeriod; Rec."Average Cost Period")
                {
                    Caption = 'Average Cost Period';
                    ToolTip = 'Specifies the average cost period for this accounting period record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}