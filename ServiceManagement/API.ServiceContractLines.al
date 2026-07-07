namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Contract;

page 90992 "ocpfServiceContractLines"
{
    PageType = API;
    Caption = 'Service Contract Lines — the service items covered by each service contract.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceContractLine';
    EntitySetName = 'ocpfServiceContractLines';
    SourceTable = "Service Contract Line";
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
                field(contractType; Rec."Contract Type")
                {
                    Caption = 'Contract Type';
                    ToolTip = 'Specifies the type of the contract.';
                    ApplicationArea = All;
                }
                field(contractNo; Rec."Contract No.")
                {
                    Caption = 'Contract No.';
                    ToolTip = 'Specifies the number of the service contract or service contract quote associated with the service contract line.';
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the Line No..';
                    ApplicationArea = All;
                }
                field(contractStatus; Rec."Contract Status")
                {
                    Caption = 'Contract Status';
                    ToolTip = 'Specifies the status of the contract.';
                    ApplicationArea = All;
                }
                field(serviceItemNo; Rec."Service Item No.")
                {
                    Caption = 'Service Item No.';
                    ToolTip = 'Specifies the number of the service item that is subject to the service contract.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description of the service item that is subject to the contract.';
                    ApplicationArea = All;
                }
                field(serialNo; Rec."Serial No.")
                {
                    Caption = 'Serial No.';
                    ToolTip = 'Specifies the serial number of the service item that is subject to the contract.';
                    ApplicationArea = All;
                }
                field(serviceItemGroupCode; Rec."Service Item Group Code")
                {
                    Caption = 'Service Item Group Code';
                    ToolTip = 'Specifies the Service Item Group Code.';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the number of the customer associated with the service contract.';
                    ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the number of the item linked to the service item in the service contract.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    ApplicationArea = All;
                }
                field(responseTimeHours; Rec."Response Time (Hours)")
                {
                    Caption = 'Response Time (Hours)';
                    ToolTip = 'Specifies the response time for the service item associated with the service contract.';
                    ApplicationArea = All;
                }
                field(lastPlannedServiceDate; Rec."Last Planned Service Date")
                {
                    Caption = 'Last Planned Service Date';
                    ToolTip = 'Specifies the date of the last planned service on this item.';
                    ApplicationArea = All;
                }
                field(nextPlannedServiceDate; Rec."Next Planned Service Date")
                {
                    Caption = 'Next Planned Service Date';
                    ToolTip = 'Specifies the date of the next planned service on the item included in the contract.';
                    ApplicationArea = All;
                }
                field(lastServiceDate; Rec."Last Service Date")
                {
                    Caption = 'Last Service Date';
                    ToolTip = 'Specifies the date when the service item on the line was last serviced.';
                    ApplicationArea = All;
                }
                field(lastPreventiveMaintDate; Rec."Last Preventive Maint. Date")
                {
                    Caption = 'Last Preventive Maint. Date';
                    ToolTip = 'Specifies the date when the last time preventative service was performed on this item.';
                    ApplicationArea = All;
                }
                field(invoicedToDate; Rec."Invoiced to Date")
                {
                    Caption = 'Invoiced to Date';
                    ToolTip = 'Specifies the Invoiced to Date.';
                    ApplicationArea = All;
                }
                field(creditMemoDate; Rec."Credit Memo Date")
                {
                    Caption = 'Credit Memo Date';
                    ToolTip = 'Specifies the date when you can create a credit memo for the service item that needs to be removed from the service contract.';
                    ApplicationArea = All;
                }
                field(contractExpirationDate; Rec."Contract Expiration Date")
                {
                    Caption = 'Contract Expiration Date';
                    ToolTip = 'Specifies the date when an item should be removed from the contract.';
                    ApplicationArea = All;
                }
                field(servicePeriod; Rec."Service Period")
                {
                    Caption = 'Service Period';
                    ToolTip = 'Specifies the period of time that must pass between each servicing of an item.';
                    ApplicationArea = All;
                }
                field(lineValue; Rec."Line Value")
                {
                    Caption = 'Line Value';
                    ToolTip = 'Specifies the value of the service item line in the contract or contract quote.';
                    ApplicationArea = All;
                }
                field(lineDiscountPct; Rec."Line Discount %")
                {
                    Caption = 'Line Discount %';
                    ToolTip = 'Specifies the discount percentage that is granted for the item on the line.';
                    ApplicationArea = All;
                }
                field(lineAmount; Rec."Line Amount")
                {
                    Caption = 'Line Amount';
                    ToolTip = 'Specifies the net amount, excluding any invoice discount amount, that must be paid for products on the line.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant of the item on the line.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the starting date of the service contract.';
                    ApplicationArea = All;
                }
                field(newLine; Rec."New Line")
                {
                    Caption = 'New Line';
                    ToolTip = 'Specifies whether the service contract line is new or existing.';
                    ApplicationArea = All;
                }
                field(credited; Rec."Credited")
                {
                    Caption = 'Credited';
                    ToolTip = 'Specifies if the service contract line has been credited.';
                    ApplicationArea = All;
                }
                field(lineCost; Rec."Line Cost")
                {
                    Caption = 'Line Cost';
                    ToolTip = 'Specifies the calculated cost of the service item line in the service contract or contract quote.';
                    ApplicationArea = All;
                }
                field(lineDiscountAmount; Rec."Line Discount Amount")
                {
                    Caption = 'Line Discount Amount';
                    ToolTip = 'Specifies the discount amount that is granted for the item on the line.';
                    ApplicationArea = All;
                }
                field(profit; Rec."Profit")
                {
                    Caption = 'Profit';
                    ToolTip = 'Specifies the profit, expressed as the difference between the Line Amount and Line Cost fields on the service contract line.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
