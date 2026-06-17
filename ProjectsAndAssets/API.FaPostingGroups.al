namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.FixedAssets.FixedAsset;

page 90916 "ocpfFaPostingGroups"
{
    PageType = API;
    Caption = 'Fixed asset posting groups — G/L account mapping for FA transactions.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0';
    EntityName = 'ocpfFaPostingGroup';
    EntitySetName = 'ocpfFaPostingGroups';
    SourceTable = "FA Posting Group";
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
                field(acquisitionCostAccount; Rec."Acquisition Cost Account")
                    {
                        Caption = 'Acquisition Cost Account';
                        ToolTip = 'Specifies the Acquisition Cost Account.';
                        ApplicationArea = All;
                }
                field(accumDepreciationAccount; Rec."Accum. Depreciation Account")
                    {
                        Caption = 'Accum. Depreciation Account';
                        ToolTip = 'Specifies the Accum. Depreciation Account.';
                        ApplicationArea = All;
                }
                field(writeDownAccount; Rec."Write-Down Account")
                    {
                        Caption = 'Write-Down Account';
                        ToolTip = 'Specifies the Write-Down Account.';
                        ApplicationArea = All;
                }
                field(appreciationAccount; Rec."Appreciation Account")
                    {
                        Caption = 'Appreciation Account';
                        ToolTip = 'Specifies the Appreciation Account.';
                        ApplicationArea = All;
                }
                field(custom1Account; Rec."Custom 1 Account")
                    {
                        Caption = 'Custom 1 Account';
                        ToolTip = 'Specifies the Custom 1 Account.';
                        ApplicationArea = All;
                }
                field(custom2Account; Rec."Custom 2 Account")
                    {
                        Caption = 'Custom 2 Account';
                        ToolTip = 'Specifies the Custom 2 Account.';
                        ApplicationArea = All;
                }
                field(acqCostAccOnDisposal; Rec."Acq. Cost Acc. on Disposal")
                    {
                        Caption = 'Acq. Cost Acc. on Disposal';
                        ToolTip = 'Specifies the Acq. Cost Acc. on Disposal.';
                        ApplicationArea = All;
                }
                field(accumDeprAccOnDisposal; Rec."Accum. Depr. Acc. on Disposal")
                    {
                        Caption = 'Accum. Depr. Acc. on Disposal';
                        ToolTip = 'Specifies the Accum. Depr. Acc. on Disposal.';
                        ApplicationArea = All;
                }
                field(writeDownAccOnDisposal; Rec."Write-Down Acc. on Disposal")
                    {
                        Caption = 'Write-Down Acc. on Disposal';
                        ToolTip = 'Specifies the Write-Down Acc. on Disposal.';
                        ApplicationArea = All;
                }
                field(appreciationAccOnDisposal; Rec."Appreciation Acc. on Disposal")
                    {
                        Caption = 'Appreciation Acc. on Disposal';
                        ToolTip = 'Specifies the Appreciation Acc. on Disposal.';
                        ApplicationArea = All;
                }
                field(custom1AccountOnDisposal; Rec."Custom 1 Account on Disposal")
                    {
                        Caption = 'Custom 1 Account on Disposal';
                        ToolTip = 'Specifies the Custom 1 Account on Disposal.';
                        ApplicationArea = All;
                }
                field(custom2AccountOnDisposal; Rec."Custom 2 Account on Disposal")
                    {
                        Caption = 'Custom 2 Account on Disposal';
                        ToolTip = 'Specifies the Custom 2 Account on Disposal.';
                        ApplicationArea = All;
                }
                field(gainsAccOnDisposal; Rec."Gains Acc. on Disposal")
                    {
                        Caption = 'Gains Acc. on Disposal';
                        ToolTip = 'Specifies the Gains Acc. on Disposal.';
                        ApplicationArea = All;
                }
                field(lossesAccOnDisposal; Rec."Losses Acc. on Disposal")
                    {
                        Caption = 'Losses Acc. on Disposal';
                        ToolTip = 'Specifies the Losses Acc. on Disposal.';
                        ApplicationArea = All;
                }
                field(bookValAccOnDispGain; Rec."Book Val. Acc. on Disp. (Gain)")
                    {
                        Caption = 'Book Val. Acc. on Disp. (Gain)';
                        ToolTip = 'Specifies the Book Val. Acc. on Disp. (Gain).';
                        ApplicationArea = All;
                }
                field(salesAccOnDispGain; Rec."Sales Acc. on Disp. (Gain)")
                    {
                        Caption = 'Sales Acc. on Disp. (Gain)';
                        ToolTip = 'Specifies the Sales Acc. on Disp. (Gain).';
                        ApplicationArea = All;
                }
                field(writeDownBalAccOnDisp; Rec."Write-Down Bal. Acc. on Disp.")
                    {
                        Caption = 'Write-Down Bal. Acc. on Disp.';
                        ToolTip = 'Specifies the Write-Down Bal. Acc. on Disp..';
                        ApplicationArea = All;
                }
                field(apprecBalAccOnDisp; Rec."Apprec. Bal. Acc. on Disp.")
                    {
                        Caption = 'Apprec. Bal. Acc. on Disp.';
                        ToolTip = 'Specifies the Apprec. Bal. Acc. on Disp..';
                        ApplicationArea = All;
                }
                field(custom1BalAccOnDisposal; Rec."Custom 1 Bal. Acc. on Disposal")
                    {
                        Caption = 'Custom 1 Bal. Acc. on Disposal';
                        ToolTip = 'Specifies the Custom 1 Bal. Acc. on Disposal.';
                        ApplicationArea = All;
                }
                field(custom2BalAccOnDisposal; Rec."Custom 2 Bal. Acc. on Disposal")
                    {
                        Caption = 'Custom 2 Bal. Acc. on Disposal';
                        ToolTip = 'Specifies the Custom 2 Bal. Acc. on Disposal.';
                        ApplicationArea = All;
                }
                field(maintenanceExpenseAccount; Rec."Maintenance Expense Account")
                    {
                        Caption = 'Maintenance Expense Account';
                        ToolTip = 'Specifies the Maintenance Expense Account.';
                        ApplicationArea = All;
                }
                field(maintenanceBalAcc; Rec."Maintenance Bal. Acc.")
                    {
                        Caption = 'Maintenance Bal. Acc.';
                        ToolTip = 'Specifies the Maintenance Bal. Acc..';
                        ApplicationArea = All;
                }
                field(acquisitionCostBalAcc; Rec."Acquisition Cost Bal. Acc.")
                    {
                        Caption = 'Acquisition Cost Bal. Acc.';
                        ToolTip = 'Specifies the Acquisition Cost Bal. Acc..';
                        ApplicationArea = All;
                }
                field(depreciationExpenseAcc; Rec."Depreciation Expense Acc.")
                    {
                        Caption = 'Depreciation Expense Acc.';
                        ToolTip = 'Specifies the Depreciation Expense Acc..';
                        ApplicationArea = All;
                }
                field(writeDownExpenseAcc; Rec."Write-Down Expense Acc.")
                    {
                        Caption = 'Write-Down Expense Acc.';
                        ToolTip = 'Specifies the Write-Down Expense Acc..';
                        ApplicationArea = All;
                }
                field(appreciationBalAccount; Rec."Appreciation Bal. Account")
                    {
                        Caption = 'Appreciation Bal. Account';
                        ToolTip = 'Specifies the Appreciation Bal. Account.';
                        ApplicationArea = All;
                }
                field(custom1ExpenseAcc; Rec."Custom 1 Expense Acc.")
                    {
                        Caption = 'Custom 1 Expense Acc.';
                        ToolTip = 'Specifies the Custom 1 Expense Acc..';
                        ApplicationArea = All;
                }
                field(custom2ExpenseAcc; Rec."Custom 2 Expense Acc.")
                    {
                        Caption = 'Custom 2 Expense Acc.';
                        ToolTip = 'Specifies the Custom 2 Expense Acc..';
                        ApplicationArea = All;
                }
                field(salesBalAcc; Rec."Sales Bal. Acc.")
                    {
                        Caption = 'Sales Bal. Acc.';
                        ToolTip = 'Specifies the Sales Bal. Acc..';
                        ApplicationArea = All;
                }
                field(allocatedAcquisitionCostPct; Rec."Allocated Acquisition Cost %")
                    {
                        Caption = 'Allocated Acquisition Cost %';
                        ToolTip = 'Specifies the Allocated Acquisition Cost %.';
                        ApplicationArea = All;
                }
                field(allocatedDepreciationPct; Rec."Allocated Depreciation %")
                    {
                        Caption = 'Allocated Depreciation %';
                        ToolTip = 'Specifies the Allocated Depreciation %.';
                        ApplicationArea = All;
                }
                field(allocatedWriteDownPct; Rec."Allocated Write-Down %")
                    {
                        Caption = 'Allocated Write-Down %';
                        ToolTip = 'Specifies the Allocated Write-Down %.';
                        ApplicationArea = All;
                }
                field(allocatedAppreciationPct; Rec."Allocated Appreciation %")
                    {
                        Caption = 'Allocated Appreciation %';
                        ToolTip = 'Specifies the Allocated Appreciation %.';
                        ApplicationArea = All;
                }
                field(allocatedCustom1Pct; Rec."Allocated Custom 1 %")
                    {
                        Caption = 'Allocated Custom 1 %';
                        ToolTip = 'Specifies the Allocated Custom 1 %.';
                        ApplicationArea = All;
                }
                field(allocatedCustom2Pct; Rec."Allocated Custom 2 %")
                    {
                        Caption = 'Allocated Custom 2 %';
                        ToolTip = 'Specifies the Allocated Custom 2 %.';
                        ApplicationArea = All;
                }
                field(allocatedSalesPricePct; Rec."Allocated Sales Price %")
                    {
                        Caption = 'Allocated Sales Price %';
                        ToolTip = 'Specifies the Allocated Sales Price %.';
                        ApplicationArea = All;
                }
                field(allocatedMaintenancePct; Rec."Allocated Maintenance %")
                    {
                        Caption = 'Allocated Maintenance %';
                        ToolTip = 'Specifies the Allocated Maintenance %.';
                        ApplicationArea = All;
                }
                field(allocatedGainPct; Rec."Allocated Gain %")
                    {
                        Caption = 'Allocated Gain %';
                        ToolTip = 'Specifies the Allocated Gain %.';
                        ApplicationArea = All;
                }
                field(allocatedLossPct; Rec."Allocated Loss %")
                    {
                        Caption = 'Allocated Loss %';
                        ToolTip = 'Specifies the Allocated Loss %.';
                        ApplicationArea = All;
                }
                field(allocatedBookValuePctGain; Rec."Allocated Book Value % (Gain)")
                    {
                        Caption = 'Allocated Book Value % (Gain)';
                        ToolTip = 'Specifies the Allocated Book Value % (Gain).';
                        ApplicationArea = All;
                }
                field(allocatedBookValuePctLoss; Rec."Allocated Book Value % (Loss)")
                    {
                        Caption = 'Allocated Book Value % (Loss)';
                        ToolTip = 'Specifies the Allocated Book Value % (Loss).';
                        ApplicationArea = All;
                }
                field(salesAccOnDispLoss; Rec."Sales Acc. on Disp. (Loss)")
                    {
                        Caption = 'Sales Acc. on Disp. (Loss)';
                        ToolTip = 'Specifies the Sales Acc. on Disp. (Loss).';
                        ApplicationArea = All;
                }
                field(bookValAccOnDispLoss; Rec."Book Val. Acc. on Disp. (Loss)")
                    {
                        Caption = 'Book Val. Acc. on Disp. (Loss)';
                        ToolTip = 'Specifies the Book Val. Acc. on Disp. (Loss).';
                        ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                    {
                        Caption = 'Last Modified DateTime';
                        ToolTip = 'Specifies the Last Modified DateTime.';
                        ApplicationArea = All;
                    }
            }
        }
    }
}
