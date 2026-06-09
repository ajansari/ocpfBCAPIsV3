namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Foundation.PaymentTerms;

page 90833 "ocpfPaymentTerms"
{
    PageType = API;
    Caption = 'Payment Terms — define due date calculation rules and early payment discount conditions applied to sales and purchase documents.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfPaymentTerm';
    EntitySetName = 'ocpfPaymentTerms';
    SourceTable = "Payment Terms";
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
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for this payment terms record.';
                    ApplicationArea = All;
                }
                field(dueDateCalculation; Rec."Due Date Calculation")
                {
                    Caption = 'Due Date Calculation';
                    ToolTip = 'Specifies the due date calculation for this payment terms record.';
                    ApplicationArea = All;
                }
                field(discountDateCalculation; Rec."Discount Date Calculation")
                {
                    Caption = 'Discount Date Calculation';
                    ToolTip = 'Specifies the discount date calculation for this payment terms record.';
                    ApplicationArea = All;
                }
                field(discount; Rec."Discount %")
                {
                    Caption = 'Discount %';
                    ToolTip = 'Specifies the discount % for this payment terms record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this payment terms record.';
                    ApplicationArea = All;
                }
                field(calcPmtDiscOnCrMemos; Rec."Calc. Pmt. Disc. on Cr. Memos")
                {
                    Caption = 'Calc. Pmt. Disc. on Cr. Memos';
                    ToolTip = 'Specifies the calc. pmt. disc. on cr. memos for this payment terms record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this payment terms record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}