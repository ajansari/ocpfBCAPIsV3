namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Contract;

page 90993 "ocpfContractGroups"
{
    PageType = API;
    Caption = 'Contract Groups — groupings of service contracts for filtering and bulk operations.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfContractGroup';
    EntitySetName = 'ocpfContractGroups';
    SourceTable = "Contract Group";
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
                    ToolTip = 'Specifies a code for the contract group.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the contract group.';
                    ApplicationArea = All;
                }
                field(discOnContrOrdersOnly; Rec."Disc. on Contr. Orders Only")
                {
                    Caption = 'Disc. on Contr. Orders Only';
                    ToolTip = 'Specifies that contract/service discounts only apply to service lines linked to service orders created for the service contracts in the contract group.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the Date Filter.';
                    ApplicationArea = All;
                }
                field(contractGainLossAmount; Rec."Contract Gain/Loss Amount")
                {
                    Caption = 'Contract Gain/Loss Amount';
                    ToolTip = 'Specifies the Contract Gain/Loss Amount.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
