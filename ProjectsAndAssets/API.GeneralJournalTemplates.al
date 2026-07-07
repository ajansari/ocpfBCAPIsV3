namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Journal;

page 90919 "ocpfGeneralJournalTemplates"
{
    PageType = API;
    Caption = 'General journal templates — named journal templates controlling posting behavior.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfGeneralJournalTemplate';
    EntitySetName = 'ocpfGeneralJournalTemplates';
    SourceTable = "Gen. Journal Template";
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
                field(name; Rec.Name)
                    {
                        Caption = 'Name';
                        ToolTip = 'Specifies the Name.';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(testReportId; Rec."Test Report ID")
                    {
                        Caption = 'Test Report ID';
                        ToolTip = 'Specifies the Test Report ID.';
                        ApplicationArea = All;
                }
                field(pageId; Rec."Page ID")
                    {
                        Caption = 'Page ID';
                        ToolTip = 'Specifies the Page ID.';
                        ApplicationArea = All;
                }
                field(postingReportId; Rec."Posting Report ID")
                    {
                        Caption = 'Posting Report ID';
                        ToolTip = 'Specifies the Posting Report ID.';
                        ApplicationArea = All;
                }
                field(forcePostingReport; Rec."Force Posting Report")
                    {
                        Caption = 'Force Posting Report';
                        ToolTip = 'Specifies the Force Posting Report.';
                        ApplicationArea = All;
                }
                field(type; Rec.Type)
                    {
                        Caption = 'Type';
                        ToolTip = 'Specifies the Type.';
                        ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                    {
                        Caption = 'Source Code';
                        ToolTip = 'Specifies the Source Code.';
                        ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                    {
                        Caption = 'Reason Code';
                        ToolTip = 'Specifies the Reason Code.';
                        ApplicationArea = All;
                }
                field(recurring; Rec.Recurring)
                    {
                        Caption = 'Recurring';
                        ToolTip = 'Specifies the Recurring.';
                        ApplicationArea = All;
                }
                field(testReportCaption; Rec."Test Report Caption")
                    {
                        Caption = 'Test Report Caption';
                        ToolTip = 'Specifies the Test Report Caption.';
                        ApplicationArea = All;
                }
                field(pageCaption; Rec."Page Caption")
                    {
                        Caption = 'Page Caption';
                        ToolTip = 'Specifies the Page Caption.';
                        ApplicationArea = All;
                }
                field(postingReportCaption; Rec."Posting Report Caption")
                    {
                        Caption = 'Posting Report Caption';
                        ToolTip = 'Specifies the Posting Report Caption.';
                        ApplicationArea = All;
                }
                field(forceDocBalance; Rec."Force Doc. Balance")
                    {
                        Caption = 'Force Doc. Balance';
                        ToolTip = 'Specifies the Force Doc. Balance.';
                        ApplicationArea = All;
                }
                field(balAccountType; Rec."Bal. Account Type")
                    {
                        Caption = 'Bal. Account Type';
                        ToolTip = 'Specifies the Bal. Account Type.';
                        ApplicationArea = All;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                    {
                        Caption = 'Bal. Account No.';
                        ToolTip = 'Specifies the Bal. Account No..';
                        ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                    {
                        Caption = 'No. Series';
                        ToolTip = 'Specifies the No. Series.';
                        ApplicationArea = All;
                }
                field(postingNoSeries; Rec."Posting No. Series")
                    {
                        Caption = 'Posting No. Series';
                        ToolTip = 'Specifies the Posting No. Series.';
                        ApplicationArea = All;
                }
                field(copyVatSetupToJnlLines; Rec."Copy VAT Setup to Jnl. Lines")
                    {
                        Caption = 'Copy VAT Setup to Jnl. Lines';
                        ToolTip = 'Specifies the Copy VAT Setup to Jnl. Lines.';
                        ApplicationArea = All;
                }
                field(allowVatDifference; Rec."Allow VAT Difference")
                    {
                        Caption = 'Allow VAT Difference';
                        ToolTip = 'Specifies the Allow VAT Difference.';
                        ApplicationArea = All;
                }
                field(custReceiptReportId; Rec."Cust. Receipt Report ID")
                    {
                        Caption = 'Cust. Receipt Report ID';
                        ToolTip = 'Specifies the Cust. Receipt Report ID.';
                        ApplicationArea = All;
                }
                field(custReceiptReportCaption; Rec."Cust. Receipt Report Caption")
                    {
                        Caption = 'Cust. Receipt Report Caption';
                        ToolTip = 'Specifies the Cust. Receipt Report Caption.';
                        ApplicationArea = All;
                }
                field(vendorReceiptReportId; Rec."Vendor Receipt Report ID")
                    {
                        Caption = 'Vendor Receipt Report ID';
                        ToolTip = 'Specifies the Vendor Receipt Report ID.';
                        ApplicationArea = All;
                }
                field(vendorReceiptReportCaption; Rec."Vendor Receipt Report Caption")
                    {
                        Caption = 'Vendor Receipt Report Caption';
                        ToolTip = 'Specifies the Vendor Receipt Report Caption.';
                        ApplicationArea = All;
                }
                field(incrementBatchName; Rec."Increment Batch Name")
                    {
                        Caption = 'Increment Batch Name';
                        ToolTip = 'Specifies the Increment Batch Name.';
                        ApplicationArea = All;
                }
                field(copyToPostedJnlLines; Rec."Copy to Posted Jnl. Lines")
                    {
                        Caption = 'Copy to Posted Jnl. Lines';
                        ToolTip = 'Specifies the Copy to Posted Jnl. Lines.';
                        ApplicationArea = All;
                }
                field(allowPostingDateFrom; Rec."Allow Posting Date From")
                    {
                        Caption = 'Allow Posting Date From';
                        ToolTip = 'Specifies the Allow Posting Date From.';
                        ApplicationArea = All;
                }
                field(allowPostingDateTo; Rec."Allow Posting Date To")
                    {
                        Caption = 'Allow Posting Date To';
                        ToolTip = 'Specifies the Allow Posting Date To.';
                        ApplicationArea = All;
                }
                field(unlinkIncDocOnPosting; Rec."Unlink Inc. Doc On Posting")
                    {
                        Caption = 'Unlink Incoming Documents On Posting';
                        ToolTip = 'Specifies the Unlink Inc. Doc On Posting.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
