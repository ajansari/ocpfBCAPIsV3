namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Item;

page 90974 "ocpfServiceItemGroups"
{
    PageType = API;
    Caption = 'Service Item Groups — groupings of service items with shared defaults for contracts, warranty, and response time.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceItemGroup';
    EntitySetName = 'ocpfServiceItemGroups';
    SourceTable = "Service Item Group";
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
                    ToolTip = 'Specifies a code for the service item group.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the service item group.';
                    ApplicationArea = All;
                }
                field(createServiceItem; Rec."Create Service Item")
                {
                    Caption = 'Create Service Item';
                    ToolTip = 'Specifies that when you ship an item associated with this group, the item is registered as a service item in the Service Item table.';
                    ApplicationArea = All;
                }
                field(defaultContractDiscountPct; Rec."Default Contract Discount %")
                {
                    Caption = 'Default Contract Discount %';
                    ToolTip = 'Specifies the discount percentage used as the default quote discount in a service contract quote.';
                    ApplicationArea = All;
                }
                field(defaultServPriceGroupCode; Rec."Default Serv. Price Group Code")
                {
                    Caption = 'Default Serv. Price Group Code';
                    ToolTip = 'Specifies the service price group code used as the default service price group in the Service Price Group table.';
                    ApplicationArea = All;
                }
                field(defaultResponseTimeHours; Rec."Default Response Time (Hours)")
                {
                    Caption = 'Default Response Time (Hours)';
                    ToolTip = 'Specifies the default response time for the service item group.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
