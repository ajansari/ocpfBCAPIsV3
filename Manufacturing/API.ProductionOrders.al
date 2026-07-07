namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Document;

page 90961 "ocpfProductionOrders"
{
    PageType = API;
    Caption = 'Production Orders — orders (simulated through finished) that drive manufacturing of items, with status, dates, and quantities.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfProductionOrder';
    EntitySetName = 'ocpfProductionOrders';
    SourceTable = "Production Order";
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
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the status of the production order.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description of the production order.';
                    ApplicationArea = All;
                }
                field(searchDescription; Rec."Search Description")
                {
                    Caption = 'Search Description';
                    ToolTip = 'Specifies the search description.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies information in addition to the description.';
                    ApplicationArea = All;
                }
                field(creationDate; Rec."Creation Date")
                {
                    Caption = 'Creation Date';
                    ToolTip = 'Specifies the date on which you created the production order.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies when the production order card was last modified.';
                    ApplicationArea = All;
                }
                field(sourceType; Rec."Source Type")
                {
                    Caption = 'Source Type';
                    ToolTip = 'Specifies the source type of the production order.';
                    ApplicationArea = All;
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                    ToolTip = 'Specifies the number of the source document that the entry originates from.';
                    ApplicationArea = All;
                }
                field(routingNo; Rec."Routing No.")
                {
                    Caption = 'Routing No.';
                    ToolTip = 'Specifies the routing number used for this production order.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant code for production order item.';
                    ApplicationArea = All;
                }
                field(inventoryPostingGroup; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                    ToolTip = 'Specifies links between business transactions made for the item and an inventory account in the general ledger, to group amounts for that item type.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                    ApplicationArea = All;
                }
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
                    ApplicationArea = All;
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                    ToolTip = 'Specifies the starting time of the production order.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the starting date of the production order.';
                    ApplicationArea = All;
                }
                field(endingTime; Rec."Ending Time")
                {
                    Caption = 'Ending Time';
                    ToolTip = 'Specifies the ending time of the production order.';
                    ApplicationArea = All;
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                    ToolTip = 'Specifies the ending date of the production order.';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Specifies the due date of the production order.';
                    ApplicationArea = All;
                }
                field(finishedDate; Rec."Finished Date")
                {
                    Caption = 'Finished Date';
                    ToolTip = 'Specifies the actual finishing date of a finished production order.';
                    ApplicationArea = All;
                }
                field(blocked; Rec."Blocked")
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies that the posting of consumption and output transactions for the released production order is blocked.';
                    ApplicationArea = All;
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location code to which you want to post the finished product from this production order.';
                    ApplicationArea = All;
                }
                field(binCode; Rec."Bin Code")
                {
                    Caption = 'Bin Code';
                    ToolTip = 'Specifies a bin to which you want to post the finished items.';
                    ApplicationArea = All;
                }
                field(replanRefNo; Rec."Replan Ref. No.")
                {
                    Caption = 'Replan Ref. No.';
                    ToolTip = 'Specifies the Replan Ref. No..';
                    ApplicationArea = All;
                }
                field(replanRefStatus; Rec."Replan Ref. Status")
                {
                    Caption = 'Replan Ref. Status';
                    ToolTip = 'Specifies the Replan Ref. Status.';
                    ApplicationArea = All;
                }
                field(lowLevelCode; Rec."Low-Level Code")
                {
                    Caption = 'Low-Level Code';
                    ToolTip = 'Specifies the Low-Level Code.';
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies how many units of the item or the family to produce (production quantity).';
                    ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the Unit Cost.';
                    ApplicationArea = All;
                }
                field(costAmount; Rec."Cost Amount")
                {
                    Caption = 'Cost Amount';
                    ToolTip = 'Specifies the Cost Amount.';
                    ApplicationArea = All;
                }
                field(workCenterFilter; Rec."Work Center Filter")
                {
                    Caption = 'Work Center Filter';
                    ToolTip = 'Specifies the Work Center Filter.';
                    ApplicationArea = All;
                }
                field(capacityTypeFilter; Rec."Capacity Type Filter")
                {
                    Caption = 'Capacity Type Filter';
                    ToolTip = 'Specifies the Capacity Type Filter.';
                    ApplicationArea = All;
                }
                field(capacityNoFilter; Rec."Capacity No. Filter")
                {
                    Caption = 'Capacity No. Filter';
                    ToolTip = 'Specifies the Capacity No. Filter.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the Date Filter.';
                    ApplicationArea = All;
                }
                field(expectedOperationCostAmt; Rec."Expected Operation Cost Amt.")
                {
                    Caption = 'Expected Operation Cost Amt.';
                    ToolTip = 'Specifies the Expected Operation Cost Amt..';
                    ApplicationArea = All;
                }
                field(expectedComponentCostAmt; Rec."Expected Component Cost Amt.")
                {
                    Caption = 'Expected Component Cost Amt.';
                    ToolTip = 'Specifies the Expected Component Cost Amt..';
                    ApplicationArea = All;
                }
                field(actualTimeUsed; Rec."Actual Time Used")
                {
                    Caption = 'Actual Time Used';
                    ToolTip = 'Specifies the Actual Time Used.';
                    ApplicationArea = All;
                }
                field(allocatedCapacityNeed; Rec."Allocated Capacity Need")
                {
                    Caption = 'Allocated Capacity Need';
                    ToolTip = 'Specifies the Allocated Capacity Need.';
                    ApplicationArea = All;
                }
                field(expectedCapacityNeed; Rec."Expected Capacity Need")
                {
                    Caption = 'Expected Capacity Need';
                    ToolTip = 'Specifies the Expected Capacity Need.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the No. Series.';
                    ApplicationArea = All;
                }
                field(plannedOrderNo; Rec."Planned Order No.")
                {
                    Caption = 'Planned Order No.';
                    ToolTip = 'Specifies the Planned Order No..';
                    ApplicationArea = All;
                }
                field(firmPlannedOrderNo; Rec."Firm Planned Order No.")
                {
                    Caption = 'Firm Planned Order No.';
                    ToolTip = 'Specifies the Firm Planned Order No..';
                    ApplicationArea = All;
                }
                field(simulatedOrderNo; Rec."Simulated Order No.")
                {
                    Caption = 'Simulated Order No.';
                    ToolTip = 'Specifies the Simulated Order No..';
                    ApplicationArea = All;
                }
                field(expectedMaterialOvhdCost; Rec."Expected Material Ovhd. Cost")
                {
                    Caption = 'Expected Material Ovhd. Cost';
                    ToolTip = 'Specifies the Expected Material Ovhd. Cost.';
                    ApplicationArea = All;
                }
                field(expectedCapacityOvhdCost; Rec."Expected Capacity Ovhd. Cost")
                {
                    Caption = 'Expected Capacity Ovhd. Cost';
                    ToolTip = 'Specifies the Expected Capacity Ovhd. Cost.';
                    ApplicationArea = All;
                }
                field(startingDateTime; Rec."Starting Date-Time")
                {
                    Caption = 'Starting Date-Time';
                    ToolTip = 'Specifies the starting date and starting time of the production order.';
                    ApplicationArea = All;
                }
                field(endingDateTime; Rec."Ending Date-Time")
                {
                    Caption = 'Ending Date-Time';
                    ToolTip = 'Specifies the ending date and ending time of the production order.';
                    ApplicationArea = All;
                }
                field(documentPutAwayStatus; Rec."Document Put-away Status")
                {
                    Caption = 'Document Put-away Status';
                    ToolTip = 'Specifies the status of the warehouse put-away.';
                    ApplicationArea = All;
                }
                field(reopened; Rec."Reopened")
                {
                    Caption = 'Reopened';
                    ToolTip = 'Specifies if the production order is reopened.';
                    ApplicationArea = All;
                }
                field(manualScheduling; Rec."Manual Scheduling")
                {
                    Caption = 'Manual Scheduling';
                    ToolTip = 'Specifies that the End/Due Dates on the production have been scheduled manually.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
                field(completelyPicked; Rec."Completely Picked")
                {
                    Caption = 'Completely Picked';
                    ToolTip = 'Specifies whether all production components have been completely picked.';
                    ApplicationArea = All;
                }
                field(assignedUserId; Rec."Assigned User ID")
                {
                    Caption = 'Assigned User ID';
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
