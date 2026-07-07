namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Maintenance;

page 90979 "ocpfFaultReasonCodes"
{
    PageType = API;
    Caption = 'Fault Reason Codes — root-cause reasons for faults, with options to exclude warranty or contract discounts.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfFaultReasonCode';
    EntitySetName = 'ocpfFaultReasonCodes';
    SourceTable = "Fault Reason Code";
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
                field(code; Rec."Code")
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies a code for the fault reason.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the fault reason code.';
                    ApplicationArea = All;
                }
                field(excludeWarrantyDiscount; Rec."Exclude Warranty Discount")
                {
                    Caption = 'Exclude Warranty Discount';
                    ToolTip = 'Specifies that you want to exclude a warranty discount for the service item assigned this fault reason code.';
                    ApplicationArea = All;
                }
                field(excludeContractDiscount; Rec."Exclude Contract Discount")
                {
                    Caption = 'Exclude Contract Discount';
                    ToolTip = 'Specifies that you want to exclude a contract/service discount for the service item assigned this fault reason code.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
