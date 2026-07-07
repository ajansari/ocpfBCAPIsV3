namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.MachineCenter;

page 90945 "ocpfMachineCenters"
{
    PageType = API;
    Caption = 'Machine Centers — individual machines belonging to a work center, with their own capacity, efficiency, and cost settings.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfMachineCenter';
    EntitySetName = 'ocpfMachineCenters';
    SourceTable = "Machine Center";
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
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(name; Rec."Name")
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies a name for the machine center.';
                    ApplicationArea = All;
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies the Name 2.';
                    ApplicationArea = All;
                }
                field(address; Rec."Address")
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the Address.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies the Address 2.';
                    ApplicationArea = All;
                }
                field(city; Rec."City")
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the City.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the Post Code.';
                    ApplicationArea = All;
                }
                field(workCenterNo; Rec."Work Center No.")
                {
                    Caption = 'Work Center No.';
                    ToolTip = 'Specifies the number of the work center to assign this machine center to.';
                    ApplicationArea = All;
                }
                field(directUnitCost; Rec."Direct Unit Cost")
                {
                    Caption = 'Direct Unit Cost';
                    ToolTip = 'Specifies the direct unit cost of the machine center at one unit of measure. The basis of the direct unit cost is the usage quantity per time interval set in the Unit of Measure Code field in the assigned Work Center. The calculation is based on the amount of time used.';
                    ApplicationArea = All;
                }
                field(indirectCostPct; Rec."Indirect Cost %")
                {
                    Caption = 'Indirect Cost %';
                    ToolTip = 'Specifies the percentage of the center''s cost that includes indirect costs, such as machine maintenance.';
                    ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                    ApplicationArea = All;
                }
                field(queueTime; Rec."Queue Time")
                {
                    Caption = 'Queue Time';
                    ToolTip = 'Specifies the queue time of the machine center.';
                    ApplicationArea = All;
                }
                field(queueTimeUnitOfMeasCode; Rec."Queue Time Unit of Meas. Code")
                {
                    Caption = 'Queue Time Unit of Meas. Code';
                    ToolTip = 'Specifies the queue time unit of measure code.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies when the machine center card was last modified.';
                    ApplicationArea = All;
                }
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
                    ApplicationArea = All;
                }
                field(capacity; Rec."Capacity")
                {
                    Caption = 'Capacity';
                    ToolTip = 'Specifies the capacity of the machine center.';
                    ApplicationArea = All;
                }
                field(efficiency; Rec."Efficiency")
                {
                    Caption = 'Efficiency';
                    ToolTip = 'Specifies the efficiency factor as a percentage of the machine center.';
                    ApplicationArea = All;
                }
                field(maximumEfficiency; Rec."Maximum Efficiency")
                {
                    Caption = 'Maximum Efficiency';
                    ToolTip = 'Specifies the maximum efficiency of this machine center.';
                    ApplicationArea = All;
                }
                field(minimumEfficiency; Rec."Minimum Efficiency")
                {
                    Caption = 'Minimum Efficiency';
                    ToolTip = 'Specifies the minimum efficiency of this machine center.';
                    ApplicationArea = All;
                }
                field(blocked; Rec."Blocked")
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies whether the machine center is blocked from being posted in transactions, for example, if the machine center is out of order.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the Date Filter.';
                    ApplicationArea = All;
                }
                field(workShiftFilter; Rec."Work Shift Filter")
                {
                    Caption = 'Work Shift Filter';
                    ToolTip = 'Specifies the Work Shift Filter.';
                    ApplicationArea = All;
                }
                field(capacityTotal; Rec."Capacity (Total)")
                {
                    Caption = 'Capacity (Total)';
                    ToolTip = 'Specifies the Capacity (Total).';
                    ApplicationArea = All;
                }
                field(capacityEffective; Rec."Capacity (Effective)")
                {
                    Caption = 'Capacity (Effective)';
                    ToolTip = 'Specifies the effective available capacity of the machine center.';
                    ApplicationArea = All;
                }
                field(prodOrderNeedQty; Rec."Prod. Order Need (Qty.)")
                {
                    Caption = 'Prod. Order Need (Qty.)';
                    ToolTip = 'Specifies the calculated capacity requirements for production orders at this machine center.';
                    ApplicationArea = All;
                }
                field(prodOrderNeedAmount; Rec."Prod. Order Need Amount")
                {
                    Caption = 'Prod. Order Need Amount';
                    ToolTip = 'Specifies the Prod. Order Need Amount.';
                    ApplicationArea = All;
                }
                field(prodOrderStatusFilter; Rec."Prod. Order Status Filter")
                {
                    Caption = 'Prod. Order Status Filter';
                    ToolTip = 'Specifies the Prod. Order Status Filter.';
                    ApplicationArea = All;
                }
                field(setupTime; Rec."Setup Time")
                {
                    Caption = 'Setup Time';
                    ToolTip = 'Specifies how long it takes to set up the machine.';
                    ApplicationArea = All;
                }
                field(waitTime; Rec."Wait Time")
                {
                    Caption = 'Wait Time';
                    ToolTip = 'Specifies the time a job remains at the machine center after an operation is completed, until it is moved to the next operation.';
                    ApplicationArea = All;
                }
                field(moveTime; Rec."Move Time")
                {
                    Caption = 'Move Time';
                    ToolTip = 'Specifies the move time required for a production lot on this machine.';
                    ApplicationArea = All;
                }
                field(fixedScrapQuantity; Rec."Fixed Scrap Quantity")
                {
                    Caption = 'Fixed Scrap Quantity';
                    ToolTip = 'Specifies the fixed scrap quantity.';
                    ApplicationArea = All;
                }
                field(scrapPct; Rec."Scrap %")
                {
                    Caption = 'Scrap %';
                    ToolTip = 'Specifies the scrap in percent.';
                    ApplicationArea = All;
                }
                field(setupTimeUnitOfMeasCode; Rec."Setup Time Unit of Meas. Code")
                {
                    Caption = 'Setup Time Unit of Meas. Code';
                    ToolTip = 'Specifies the Setup Time Unit of Meas. Code.';
                    ApplicationArea = All;
                }
                field(waitTimeUnitOfMeasCode; Rec."Wait Time Unit of Meas. Code")
                {
                    Caption = 'Wait Time Unit of Meas. Code';
                    ToolTip = 'Specifies the Wait Time Unit of Meas. Code.';
                    ApplicationArea = All;
                }
                field(sendAheadQuantity; Rec."Send-Ahead Quantity")
                {
                    Caption = 'Send-Ahead Quantity';
                    ToolTip = 'Specifies the send-ahead quantity.';
                    ApplicationArea = All;
                }
                field(moveTimeUnitOfMeasCode; Rec."Move Time Unit of Meas. Code")
                {
                    Caption = 'Move Time Unit of Meas. Code';
                    ToolTip = 'Specifies the Move Time Unit of Meas. Code.';
                    ApplicationArea = All;
                }
                field(flushingMethod; Rec."Flushing Method")
                {
                    Caption = 'Flushing Method';
                    ToolTip = 'Specifies the method to use to calculate and handle output at the machine center. Manual: Output must be posted manually by using the output journal. Forward: Output is automatically calculated and posted when you change the status of a simulated, planned (or firm planned) production order to Released. You can still post output manually from the output journal. Backward: Output is automatically calculated and posted when you change the status of a released production order to Finished. You can still post output manually from the output journal. The setting you make in this field is copied to the Flushing Method field on the production order routing line according to the machine/work center of the master routing, but you can change the field for an individual production order to allow a different output posting of that order.';
                    ApplicationArea = All;
                }
                field(minimumProcessTime; Rec."Minimum Process Time")
                {
                    Caption = 'Minimum Process Time';
                    ToolTip = 'Specifies the minimum process time of the machine center.';
                    ApplicationArea = All;
                }
                field(maximumProcessTime; Rec."Maximum Process Time")
                {
                    Caption = 'Maximum Process Time';
                    ToolTip = 'Specifies the maximum process time of the machine center.';
                    ApplicationArea = All;
                }
                field(concurrentCapacities; Rec."Concurrent Capacities")
                {
                    Caption = 'Concurrent Capacities';
                    ToolTip = 'Specifies how much available capacity must be concurrently planned for one operation at this machine center.';
                    ApplicationArea = All;
                }
                field(itemFilter; Rec."Item Filter")
                {
                    Caption = 'Item Filter';
                    ToolTip = 'Specifies the Item Filter.';
                    ApplicationArea = All;
                }
                field(stopCodeFilter; Rec."Stop Code Filter")
                {
                    Caption = 'Stop Code Filter';
                    ToolTip = 'Specifies the Stop Code Filter.';
                    ApplicationArea = All;
                }
                field(scrapCodeFilter; Rec."Scrap Code Filter")
                {
                    Caption = 'Scrap Code Filter';
                    ToolTip = 'Specifies the Scrap Code Filter.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the No. Series.';
                    ApplicationArea = All;
                }
                field(overheadRate; Rec."Overhead Rate")
                {
                    Caption = 'Overhead Rate';
                    ToolTip = 'Specifies the overhead rate of this machine center.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                    ApplicationArea = All;
                }
                field(county; Rec."County")
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the County.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the Country/Region Code.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location where the machine center operates by default.';
                    ApplicationArea = All;
                }
                field(openShopFloorBinCode; Rec."Open Shop Floor Bin Code")
                {
                    Caption = 'Open Shop Floor Bin Code';
                    ToolTip = 'Specifies the bin that functions as the default open shop floor bin at the work center.';
                    ApplicationArea = All;
                }
                field(toProductionBinCode; Rec."To-Production Bin Code")
                {
                    Caption = 'To-Production Bin Code';
                    ToolTip = 'Specifies the bin where components picked for production are placed by default before they can be consumed.';
                    ApplicationArea = All;
                }
                field(fromProductionBinCode; Rec."From-Production Bin Code")
                {
                    Caption = 'From-Production Bin Code';
                    ToolTip = 'Specifies the bin where finished end items are taken from by default when the process involves warehouse activity.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
