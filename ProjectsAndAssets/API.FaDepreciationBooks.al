namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.FixedAssets.Depreciation;

page 90918 "ocpfFaDepreciationBooks"
{
    PageType = API;
    Caption = 'Fixed asset depreciation books — depreciation method and schedule per asset.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0';
    EntityName = 'ocpfFaDepreciationBook';
    EntitySetName = 'ocpfFaDepreciationBooks';
    SourceTable = "FA Depreciation Book";
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
                field(faNo; Rec."FA No.")
                    {
                        Caption = 'FA No.';
                        ToolTip = 'Specifies the FA No..';
                        ApplicationArea = All;
                }
                field(depreciationBookCode; Rec."Depreciation Book Code")
                    {
                        Caption = 'Depreciation Book Code';
                        ToolTip = 'Specifies the Depreciation Book Code.';
                        ApplicationArea = All;
                }
                field(depreciationMethod; Rec."Depreciation Method")
                    {
                        Caption = 'Depreciation Method';
                        ToolTip = 'Specifies the Depreciation Method.';
                        ApplicationArea = All;
                }
                field(depreciationStartingDate; Rec."Depreciation Starting Date")
                    {
                        Caption = 'Depreciation Starting Date';
                        ToolTip = 'Specifies the Depreciation Starting Date.';
                        ApplicationArea = All;
                }
                field(straightLinePct; Rec."Straight-Line %")
                    {
                        Caption = 'Straight-Line %';
                        ToolTip = 'Specifies the Straight-Line %.';
                        ApplicationArea = All;
                }
                field(noOfDepreciationYears; Rec."No. of Depreciation Years")
                    {
                        Caption = 'No. of Depreciation Years';
                        ToolTip = 'Specifies the No. of Depreciation Years.';
                        ApplicationArea = All;
                }
                field(noOfDepreciationMonths; Rec."No. of Depreciation Months")
                    {
                        Caption = 'No. of Depreciation Months';
                        ToolTip = 'Specifies the No. of Depreciation Months.';
                        ApplicationArea = All;
                }
                field(fixedDeprAmount; Rec."Fixed Depr. Amount")
                    {
                        Caption = 'Fixed Depr. Amount';
                        ToolTip = 'Specifies the Fixed Depr. Amount.';
                        ApplicationArea = All;
                }
                field(decliningBalancePct; Rec."Declining-Balance %")
                    {
                        Caption = 'Declining-Balance %';
                        ToolTip = 'Specifies the Declining-Balance %.';
                        ApplicationArea = All;
                }
                field(depreciationTableCode; Rec."Depreciation Table Code")
                    {
                        Caption = 'Depreciation Table Code';
                        ToolTip = 'Specifies the Depreciation Table Code.';
                        ApplicationArea = All;
                }
                field(finalRoundingAmount; Rec."Final Rounding Amount")
                    {
                        Caption = 'Final Rounding Amount';
                        ToolTip = 'Specifies the Final Rounding Amount.';
                        ApplicationArea = All;
                }
                field(endingBookValue; Rec."Ending Book Value")
                    {
                        Caption = 'Ending Book Value';
                        ToolTip = 'Specifies the Ending Book Value.';
                        ApplicationArea = All;
                }
                field(faPostingGroup; Rec."FA Posting Group")
                    {
                        Caption = 'FA Posting Group';
                        ToolTip = 'Specifies the FA Posting Group.';
                        ApplicationArea = All;
                }
                field(depreciationEndingDate; Rec."Depreciation Ending Date")
                    {
                        Caption = 'Depreciation Ending Date';
                        ToolTip = 'Specifies the Depreciation Ending Date.';
                        ApplicationArea = All;
                }
                field(acquisitionCost; Rec."Acquisition Cost")
                    {
                        Caption = 'Acquisition Cost';
                        ToolTip = 'Specifies the Acquisition Cost.';
                        ApplicationArea = All;
                }
                field(depreciation; Rec.Depreciation)
                    {
                        Caption = 'Depreciation';
                        ToolTip = 'Specifies the Depreciation.';
                        ApplicationArea = All;
                }
                field(bookValue; Rec."Book Value")
                    {
                        Caption = 'Book Value';
                        ToolTip = 'Specifies the Book Value.';
                        ApplicationArea = All;
                }
                field(proceedsOnDisposal; Rec."Proceeds on Disposal")
                    {
                        Caption = 'Proceeds on Disposal';
                        ToolTip = 'Specifies the Proceeds on Disposal.';
                        ApplicationArea = All;
                }
                field(gainLoss; Rec."Gain/Loss")
                    {
                        Caption = 'Gain/Loss';
                        ToolTip = 'Specifies the Gain/Loss.';
                        ApplicationArea = All;
                }
                field(writeDown; Rec."Write-Down")
                    {
                        Caption = 'Write-Down';
                        ToolTip = 'Specifies the Write-Down.';
                        ApplicationArea = All;
                }
                field(appreciation; Rec.Appreciation)
                    {
                        Caption = 'Appreciation';
                        ToolTip = 'Specifies the Appreciation.';
                        ApplicationArea = All;
                }
                field(custom1; Rec."Custom 1")
                    {
                        Caption = 'Custom 1';
                        ToolTip = 'Specifies the Custom 1.';
                        ApplicationArea = All;
                }
                field(custom2; Rec."Custom 2")
                    {
                        Caption = 'Custom 2';
                        ToolTip = 'Specifies the Custom 2.';
                        ApplicationArea = All;
                }
                field(depreciableBasis; Rec."Depreciable Basis")
                    {
                        Caption = 'Depreciable Basis';
                        ToolTip = 'Specifies the Depreciable Basis.';
                        ApplicationArea = All;
                }
                field(salvageValue; Rec."Salvage Value")
                    {
                        Caption = 'Salvage Value';
                        ToolTip = 'Specifies the Salvage Value.';
                        ApplicationArea = All;
                }
                field(bookValueOnDisposal; Rec."Book Value on Disposal")
                    {
                        Caption = 'Book Value on Disposal';
                        ToolTip = 'Specifies the Book Value on Disposal.';
                        ApplicationArea = All;
                }
                field(maintenance; Rec.Maintenance)
                    {
                        Caption = 'Maintenance';
                        ToolTip = 'Specifies the Maintenance.';
                        ApplicationArea = All;
                }
                field(maintenanceCodeFilter; Rec."Maintenance Code Filter")
                    {
                        Caption = 'Maintenance Code Filter';
                        ToolTip = 'Specifies the Maintenance Code Filter.';
                        ApplicationArea = All;
                }
                field(faPostingDateFilter; Rec."FA Posting Date Filter")
                    {
                        Caption = 'FA Posting Date Filter';
                        ToolTip = 'Specifies the FA Posting Date Filter.';
                        ApplicationArea = All;
                }
                field(acquisitionDate; Rec."Acquisition Date")
                    {
                        Caption = 'Acquisition Date';
                        ToolTip = 'Specifies the Acquisition Date.';
                        ApplicationArea = All;
                }
                field(gLAcquisitionDate; Rec."G/L Acquisition Date")
                    {
                        Caption = 'G/L Acquisition Date';
                        ToolTip = 'Specifies the G/L Acquisition Date.';
                        ApplicationArea = All;
                }
                field(disposalDate; Rec."Disposal Date")
                    {
                        Caption = 'Disposal Date';
                        ToolTip = 'Specifies the Disposal Date.';
                        ApplicationArea = All;
                }
                field(lastAcquisitionCostDate; Rec."Last Acquisition Cost Date")
                    {
                        Caption = 'Last Acquisition Cost Date';
                        ToolTip = 'Specifies the Last Acquisition Cost Date.';
                        ApplicationArea = All;
                }
                field(lastDepreciationDate; Rec."Last Depreciation Date")
                    {
                        Caption = 'Last Depreciation Date';
                        ToolTip = 'Specifies the Last Depreciation Date.';
                        ApplicationArea = All;
                }
                field(lastWriteDownDate; Rec."Last Write-Down Date")
                    {
                        Caption = 'Last Write-Down Date';
                        ToolTip = 'Specifies the Last Write-Down Date.';
                        ApplicationArea = All;
                }
                field(lastAppreciationDate; Rec."Last Appreciation Date")
                    {
                        Caption = 'Last Appreciation Date';
                        ToolTip = 'Specifies the Last Appreciation Date.';
                        ApplicationArea = All;
                }
                field(lastCustom1Date; Rec."Last Custom 1 Date")
                    {
                        Caption = 'Last Custom 1 Date';
                        ToolTip = 'Specifies the Last Custom 1 Date.';
                        ApplicationArea = All;
                }
                field(lastCustom2Date; Rec."Last Custom 2 Date")
                    {
                        Caption = 'Last Custom 2 Date';
                        ToolTip = 'Specifies the Last Custom 2 Date.';
                        ApplicationArea = All;
                }
                field(lastSalvageValueDate; Rec."Last Salvage Value Date")
                    {
                        Caption = 'Last Salvage Value Date';
                        ToolTip = 'Specifies the Last Salvage Value Date.';
                        ApplicationArea = All;
                }
                field(faExchangeRate; Rec."FA Exchange Rate")
                    {
                        Caption = 'FA Exchange Rate';
                        ToolTip = 'Specifies the FA Exchange Rate.';
                        ApplicationArea = All;
                }
                field(fixedDeprAmountBelowZero; Rec."Fixed Depr. Amount below Zero")
                    {
                        Caption = 'Fixed Depr. Amount below Zero';
                        ToolTip = 'Specifies the Fixed Depr. Amount below Zero.';
                        ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                    {
                        Caption = 'Last Date Modified';
                        ToolTip = 'Specifies the Last Date Modified.';
                        ApplicationArea = All;
                }
                field(firstUserDefinedDeprDate; Rec."First User-Defined Depr. Date")
                    {
                        Caption = 'First User-Defined Depr. Date';
                        ToolTip = 'Specifies the First User-Defined Depr. Date.';
                        ApplicationArea = All;
                }
                field(useFaLedgerCheck; Rec."Use FA Ledger Check")
                    {
                        Caption = 'Use FA Ledger Check';
                        ToolTip = 'Specifies the Use FA Ledger Check.';
                        ApplicationArea = All;
                }
                field(lastMaintenanceDate; Rec."Last Maintenance Date")
                    {
                        Caption = 'Last Maintenance Date';
                        ToolTip = 'Specifies the Last Maintenance Date.';
                        ApplicationArea = All;
                }
                field(deprBelowZeroPct; Rec."Depr. below Zero %")
                    {
                        Caption = 'Depr. below Zero %';
                        ToolTip = 'Specifies the Depr. below Zero %.';
                        ApplicationArea = All;
                }
                field(projectedDisposalDate; Rec."Projected Disposal Date")
                    {
                        Caption = 'Projected Disposal Date';
                        ToolTip = 'Specifies the Projected Disposal Date.';
                        ApplicationArea = All;
                }
                field(projectedProceedsOnDisposal; Rec."Projected Proceeds on Disposal")
                    {
                        Caption = 'Projected Proceeds on Disposal';
                        ToolTip = 'Specifies the Projected Proceeds on Disposal.';
                        ApplicationArea = All;
                }
                field(deprStartingDateCustom1; Rec."Depr. Starting Date (Custom 1)")
                    {
                        Caption = 'Depr. Starting Date (Custom 1)';
                        ToolTip = 'Specifies the Depr. Starting Date (Custom 1).';
                        ApplicationArea = All;
                }
                field(deprEndingDateCustom1; Rec."Depr. Ending Date (Custom 1)")
                    {
                        Caption = 'Depr. Ending Date (Custom 1)';
                        ToolTip = 'Specifies the Depr. Ending Date (Custom 1).';
                        ApplicationArea = All;
                }
                field(accumDeprPctCustom1; Rec."Accum. Depr. % (Custom 1)")
                    {
                        Caption = 'Accum. Depr. % (Custom 1)';
                        ToolTip = 'Specifies the Accum. Depr. % (Custom 1).';
                        ApplicationArea = All;
                }
                field(deprThisYearPctCustom1; Rec."Depr. This Year % (Custom 1)")
                    {
                        Caption = 'Depr. This Year % (Custom 1)';
                        ToolTip = 'Specifies the Depr. This Year % (Custom 1).';
                        ApplicationArea = All;
                }
                field(propertyClassCustom1; Rec."Property Class (Custom 1)")
                    {
                        Caption = 'Property Class (Custom 1)';
                        ToolTip = 'Specifies the Property Class (Custom 1).';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(mainAssetComponent; Rec."Main Asset/Component")
                    {
                        Caption = 'Main Asset/Component';
                        ToolTip = 'Specifies the Main Asset/Component.';
                        ApplicationArea = All;
                }
                field(componentOfMainAsset; Rec."Component of Main Asset")
                    {
                        Caption = 'Component of Main Asset';
                        ToolTip = 'Specifies the Component of Main Asset.';
                        ApplicationArea = All;
                }
                field(faAddCurrencyFactor; Rec."FA Add.-Currency Factor")
                    {
                        Caption = 'FA Add.-Currency Factor';
                        ToolTip = 'Specifies the FA Add.-Currency Factor.';
                        ApplicationArea = All;
                }
                field(useHalfYearConvention; Rec."Use Half-Year Convention")
                    {
                        Caption = 'Use Half-Year Convention';
                        ToolTip = 'Specifies the Use Half-Year Convention.';
                        ApplicationArea = All;
                }
                field(useDbPctFirstFiscalYear; Rec."Use DB% First Fiscal Year")
                    {
                        Caption = 'Use DB% First Fiscal Year';
                        ToolTip = 'Specifies the Use DB% First Fiscal Year.';
                        ApplicationArea = All;
                }
                field(tempEndingDate; Rec."Temp. Ending Date")
                    {
                        Caption = 'Temp. Ending Date';
                        ToolTip = 'Specifies the Temp. Ending Date.';
                        ApplicationArea = All;
                }
                field(tempFixedDeprAmount; Rec."Temp. Fixed Depr. Amount")
                    {
                        Caption = 'Temp. Fixed Depr. Amount';
                        ToolTip = 'Specifies the Temp. Fixed Depr. Amount.';
                        ApplicationArea = All;
                }
                field(ignoreDefEndingBookValue; Rec."Ignore Def. Ending Book Value")
                    {
                        Caption = 'Ignore Def. Ending Book Value';
                        ToolTip = 'Specifies the Ignore Def. Ending Book Value.';
                        ApplicationArea = All;
                }
                field(defaultFaDepreciationBook; Rec."Default FA Depreciation Book")
                    {
                        Caption = 'Default FA Depreciation Book';
                        ToolTip = 'Specifies the Default FA Depreciation Book.';
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
