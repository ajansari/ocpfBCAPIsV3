namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Maintenance;

page 90975 "ocpfRepairStatuses"
{
    PageType = API;
    Caption = 'Repair Statuses — stages of repair work on service item lines and how they affect service order status.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfRepairStatus';
    EntitySetName = 'ocpfRepairStatuses';
    SourceTable = "Repair Status";
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
                    ToolTip = 'Specifies the code for the repair status.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the repair status.';
                    ApplicationArea = All;
                }
                field(serviceOrderStatus; Rec."Service Order Status")
                {
                    Caption = 'Service Order Status';
                    ToolTip = 'Specifies the service order status that is linked to this repair status.';
                    ApplicationArea = All;
                }
                field(priority; Rec."Priority")
                {
                    Caption = 'Priority';
                    ToolTip = 'Specifies the priority of the service order status.';
                    ApplicationArea = All;
                }
                field(initial; Rec."Initial")
                {
                    Caption = 'Initial';
                    ToolTip = 'Specifies that no service has been performed.';
                    ApplicationArea = All;
                }
                field(partlyServiced; Rec."Partly Serviced")
                {
                    Caption = 'Partly Serviced';
                    ToolTip = 'Specifies that the service item has been partly serviced. Further work is needed.';
                    ApplicationArea = All;
                }
                field(inProcess; Rec."In Process")
                {
                    Caption = 'In Process';
                    ToolTip = 'Specifies that the service of the item is in process.';
                    ApplicationArea = All;
                }
                field(finished; Rec."Finished")
                {
                    Caption = 'Finished';
                    ToolTip = 'Specifies that the service of the item has been finished.';
                    ApplicationArea = All;
                }
                field(referred; Rec."Referred")
                {
                    Caption = 'Referred';
                    ToolTip = 'Specifies that the service of the item has been referred to another resource. No service has been performed on the service item.';
                    ApplicationArea = All;
                }
                field(sparePartOrdered; Rec."Spare Part Ordered")
                {
                    Caption = 'Spare Part Ordered';
                    ToolTip = 'Specifies that a spare part has been ordered for the service item.';
                    ApplicationArea = All;
                }
                field(sparePartReceived; Rec."Spare Part Received")
                {
                    Caption = 'Spare Part Received';
                    ToolTip = 'Specifies that a spare part has been received for the service item.';
                    ApplicationArea = All;
                }
                field(waitingForCustomer; Rec."Waiting for Customer")
                {
                    Caption = 'Waiting for Customer';
                    ToolTip = 'Specifies that you are waiting for a customer response.';
                    ApplicationArea = All;
                }
                field(quoteFinished; Rec."Quote Finished")
                {
                    Caption = 'Quote Finished';
                    ToolTip = 'Specifies that quoting work on the service item is finished.';
                    ApplicationArea = All;
                }
                field(postingAllowed; Rec."Posting Allowed")
                {
                    Caption = 'Posting Allowed';
                    ToolTip = 'Specifies that you can post a service order, if it includes a service item with this repair status.';
                    ApplicationArea = All;
                }
                field(pendingStatusAllowed; Rec."Pending Status Allowed")
                {
                    Caption = 'Pending Status Allowed';
                    ToolTip = 'Specifies that you can manually change the Status of a service order to Pending, if it includes a service item with this repair status.';
                    ApplicationArea = All;
                }
                field(inProcessStatusAllowed; Rec."In Process Status Allowed")
                {
                    Caption = 'In Process Status Allowed';
                    ToolTip = 'Specifies that you can manually change the Status of a service order to In Process, if it includes a service item with this repair status.';
                    ApplicationArea = All;
                }
                field(finishedStatusAllowed; Rec."Finished Status Allowed")
                {
                    Caption = 'Finished Status Allowed';
                    ToolTip = 'Specifies that you can manually change the Status of a service order to Finished, if it includes a service item with this repair status.';
                    ApplicationArea = All;
                }
                field(onHoldStatusAllowed; Rec."On Hold Status Allowed")
                {
                    Caption = 'On Hold Status Allowed';
                    ToolTip = 'Specifies that you can manually change the Status of a service order to On Hold, if it includes a service item with this repair status.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
