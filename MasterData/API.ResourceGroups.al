namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Projects.Resources.Resource;

page 90856 "ocpfResourceGroups"
{
    PageType = API;
    Caption = 'Resource Groups — groupings of resources used for capacity planning, project budgeting, and reporting.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfResourceGroup';
    EntitySetName = 'ocpfResourceGroups';
    SourceTable = "Resource Group";
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
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the no. for this resource group record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this resource group record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this resource group record.';
                    ApplicationArea = All;
                }
                field(capacity; Rec.Capacity)
                {
                    Caption = 'Capacity';
                    ToolTip = 'Specifies the capacity for this resource group record.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureFilter; Rec."Unit of Measure Filter")
                {
                    Caption = 'Unit of Measure Filter';
                    ToolTip = 'Specifies the unit of measure filter for this resource group record.';
                    ApplicationArea = All;
                }
                field(chargeableFilter; Rec."Chargeable Filter")
                {
                    Caption = 'Chargeable Filter';
                    ToolTip = 'Specifies the chargeable filter for this resource group record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this resource group record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this resource group record.';
                    ApplicationArea = All;
                }
                field(noOfResourcesAssigned; Rec."No. of Resources Assigned")
                {
                    Caption = 'No. of Resources Assigned';
                    ToolTip = 'Specifies the no. of resources assigned for this resource group record.';
                    ApplicationArea = All;
                }
                field(qtyOnOrderJob; Rec."Qty. on Order (Job)")
                {
                    Caption = 'Qty. on Order (Project)';
                    ToolTip = 'Specifies the Qty. on Order (Project).';
                    ApplicationArea = All;
                }
                field(qtyQuotedJob; Rec."Qty. Quoted (Job)")
                {
                    Caption = 'Qty. Quoted (Project)';
                    ToolTip = 'Specifies the Qty. Quoted (Project).';
                    ApplicationArea = All;
                }
                field(usageQty; Rec."Usage (Qty.)")
                {
                    Caption = 'Usage (Qty.)';
                    ToolTip = 'Specifies the Usage (Qty.).';
                    ApplicationArea = All;
                }
                field(usageCost; Rec."Usage (Cost)")
                {
                    Caption = 'Usage (Cost)';
                    ToolTip = 'Specifies the Usage (Cost).';
                    ApplicationArea = All;
                }
                field(usagePrice; Rec."Usage (Price)")
                {
                    Caption = 'Usage (Price)';
                    ToolTip = 'Specifies the Usage (Price).';
                    ApplicationArea = All;
                }
                field(salesQty; Rec."Sales (Qty.)")
                {
                    Caption = 'Sales (Qty.)';
                    ToolTip = 'Specifies the Sales (Qty.).';
                    ApplicationArea = All;
                }
                field(salesCost; Rec."Sales (Cost)")
                {
                    Caption = 'Sales (Cost)';
                    ToolTip = 'Specifies the Sales (Cost).';
                    ApplicationArea = All;
                }
                field(salesPrice; Rec."Sales (Price)")
                {
                    Caption = 'Sales (Price)';
                    ToolTip = 'Specifies the Sales (Price).';
                    ApplicationArea = All;
                }
            }
        }
    }
}