namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Pricing;

page 90926 "ocpfServiceCosts"
{
    PageType = API;
    Caption = 'Service Costs — predefined cost lines (travel, call-out fees) that can be added to service documents.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceCost';
    EntitySetName = 'ocpfServiceCosts';
    SourceTable = "Service Cost";
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
                    ToolTip = 'Specifies a code for the service cost.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the service cost.';
                    ApplicationArea = All;
                }
                field(accountNo; Rec."Account No.")
                {
                    Caption = 'Account No.';
                    ToolTip = 'Specifies the general ledger account number to which the service cost will be posted.';
                    ApplicationArea = All;
                }
                field(defaultUnitPrice; Rec."Default Unit Price")
                {
                    Caption = 'Default Unit Price';
                    ToolTip = 'Specifies the default unit price of the cost that is copied to the service lines containing this service cost.';
                    ApplicationArea = All;
                }
                field(defaultQuantity; Rec."Default Quantity")
                {
                    Caption = 'Default Quantity';
                    ToolTip = 'Specifies the default quantity that is copied to the service lines containing this service cost.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    ApplicationArea = All;
                }
                field(costType; Rec."Cost Type")
                {
                    Caption = 'Cost Type';
                    ToolTip = 'Specifies the cost type.';
                    ApplicationArea = All;
                }
                field(serviceZoneCode; Rec."Service Zone Code")
                {
                    Caption = 'Service Zone Code';
                    ToolTip = 'Specifies the code of the service zone, to which travel applies if the Cost Type is Travel.';
                    ApplicationArea = All;
                }
                field(defaultUnitCost; Rec."Default Unit Cost")
                {
                    Caption = 'Default Unit Cost';
                    ToolTip = 'Specifies the default unit cost that is copied to the service lines containing this service cost.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
