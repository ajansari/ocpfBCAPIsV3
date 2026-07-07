namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Document;

page 90964 "ocpfProdOrderRoutingLines"
{
    PageType = API;
    Caption = 'Production Order Routing Lines — the scheduled operations for each production order.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfProdOrderRoutingLine';
    EntitySetName = 'ocpfProdOrderRoutingLines';
    SourceTable = "Prod. Order Routing Line";
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
                field(routingNo; Rec."Routing No.")
                {
                    Caption = 'Routing No.';
                    ToolTip = 'Specifies the routing number.';
                    ApplicationArea = All;
                }
                field(routingReferenceNo; Rec."Routing Reference No.")
                {
                    Caption = 'Routing Reference No.';
                    ToolTip = 'Specifies that the routing reference number.';
                    ApplicationArea = All;
                }
                field(operationNo; Rec."Operation No.")
                {
                    Caption = 'Operation No.';
                    ToolTip = 'Specifies the operation number.';
                    ApplicationArea = All;
                }
                field(nextOperationNo; Rec."Next Operation No.")
                {
                    Caption = 'Next Operation No.';
                    ToolTip = 'Specifies the next operation number.';
                    ApplicationArea = All;
                }
                field(previousOperationNo; Rec."Previous Operation No.")
                {
                    Caption = 'Previous Operation No.';
                    ToolTip = 'Specifies the previous operation number.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type of operation.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(workCenterNo; Rec."Work Center No.")
                {
                    Caption = 'Work Center No.';
                    ToolTip = 'Specifies the Work Center No..';
                    ApplicationArea = All;
                }
                field(workCenterGroupCode; Rec."Work Center Group Code")
                {
                    Caption = 'Work Center Group Code';
                    ToolTip = 'Specifies the Work Center Group Code.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description of the operation.';
                    ApplicationArea = All;
                }
                field(setupTime; Rec."Setup Time")
                {
                    Caption = 'Setup Time';
                    ToolTip = 'Specifies the setup time of the operation.';
                    ApplicationArea = All;
                }
                field(runTime; Rec."Run Time")
                {
                    Caption = 'Run Time';
                    ToolTip = 'Specifies the run time of the operation.';
                    ApplicationArea = All;
                }
                field(waitTime; Rec."Wait Time")
                {
                    Caption = 'Wait Time';
                    ToolTip = 'Specifies the wait time after processing.';
                    ApplicationArea = All;
                }
                field(moveTime; Rec."Move Time")
                {
                    Caption = 'Move Time';
                    ToolTip = 'Specifies the move time.';
                    ApplicationArea = All;
                }
                field(fixedScrapQuantity; Rec."Fixed Scrap Quantity")
                {
                    Caption = 'Fixed Scrap Quantity';
                    ToolTip = 'Specifies the fixed scrap quantity.';
                    ApplicationArea = All;
                }
                field(lotSize; Rec."Lot Size")
                {
                    Caption = 'Lot Size';
                    ToolTip = 'Specifies the number of items that are included in the same operation at the same time. The run time on routing lines is reduced proportionally to the lot size. For example, if the lot size is two pieces, the run time will be reduced by half.';
                    ApplicationArea = All;
                }
                field(scrapFactorPct; Rec."Scrap Factor %")
                {
                    Caption = 'Scrap Factor %';
                    ToolTip = 'Specifies the scrap factor in percent.';
                    ApplicationArea = All;
                }
                field(setupTimeUnitOfMeasCode; Rec."Setup Time Unit of Meas. Code")
                {
                    Caption = 'Setup Time Unit of Meas. Code';
                    ToolTip = 'Specifies the unit of measure code that applies to the setup time of the operation.';
                    ApplicationArea = All;
                }
                field(runTimeUnitOfMeasCode; Rec."Run Time Unit of Meas. Code")
                {
                    Caption = 'Run Time Unit of Meas. Code';
                    ToolTip = 'Specifies the unit of measure code that applies to the run time of the operation.';
                    ApplicationArea = All;
                }
                field(waitTimeUnitOfMeasCode; Rec."Wait Time Unit of Meas. Code")
                {
                    Caption = 'Wait Time Unit of Meas. Code';
                    ToolTip = 'Specifies the unit of measure code that applies to the wait time.';
                    ApplicationArea = All;
                }
                field(moveTimeUnitOfMeasCode; Rec."Move Time Unit of Meas. Code")
                {
                    Caption = 'Move Time Unit of Meas. Code';
                    ToolTip = 'Specifies the unit of measure code that applies to the move time.';
                    ApplicationArea = All;
                }
                field(minimumProcessTime; Rec."Minimum Process Time")
                {
                    Caption = 'Minimum Process Time';
                    ToolTip = 'Specifies the Minimum Process Time.';
                    ApplicationArea = All;
                }
                field(maximumProcessTime; Rec."Maximum Process Time")
                {
                    Caption = 'Maximum Process Time';
                    ToolTip = 'Specifies the Maximum Process Time.';
                    ApplicationArea = All;
                }
                field(concurrentCapacities; Rec."Concurrent Capacities")
                {
                    Caption = 'Concurrent Capacities';
                    ToolTip = 'Specifies the concurrent capacity of the operation.';
                    ApplicationArea = All;
                }
                field(sendAheadQuantity; Rec."Send-Ahead Quantity")
                {
                    Caption = 'Send-Ahead Quantity';
                    ToolTip = 'Specifies the send-ahead quantity of the operation.';
                    ApplicationArea = All;
                }
                field(routingLinkCode; Rec."Routing Link Code")
                {
                    Caption = 'Routing Link Code';
                    ToolTip = 'Specifies a routing link code.';
                    ApplicationArea = All;
                }
                field(standardTaskCode; Rec."Standard Task Code")
                {
                    Caption = 'Standard Task Code';
                    ToolTip = 'Specifies the standard task code that applies to the operation.';
                    ApplicationArea = All;
                }
                field(unitCostPer; Rec."Unit Cost per")
                {
                    Caption = 'Unit Cost per';
                    ToolTip = 'Specifies the unit cost for this operation if it is different than the unit cost on the work center or machine center card.';
                    ApplicationArea = All;
                }
                field(recalculate; Rec."Recalculate")
                {
                    Caption = 'Recalculate';
                    ToolTip = 'Specifies the Recalculate.';
                    ApplicationArea = All;
                }
                field(sequenceNoForward; Rec."Sequence No. (Forward)")
                {
                    Caption = 'Sequence No. (Forward)';
                    ToolTip = 'Specifies the Sequence No. (Forward).';
                    ApplicationArea = All;
                }
                field(sequenceNoBackward; Rec."Sequence No. (Backward)")
                {
                    Caption = 'Sequence No. (Backward)';
                    ToolTip = 'Specifies the Sequence No. (Backward).';
                    ApplicationArea = All;
                }
                field(fixedScrapQtyAccum; Rec."Fixed Scrap Qty. (Accum.)")
                {
                    Caption = 'Fixed Scrap Qty. (Accum.)';
                    ToolTip = 'Specifies the Fixed Scrap Qty. (Accum.).';
                    ApplicationArea = All;
                }
                field(scrapFactorPctAccumulated; Rec."Scrap Factor % (Accumulated)")
                {
                    Caption = 'Scrap Factor % (Accumulated)';
                    ToolTip = 'Specifies the Scrap Factor % (Accumulated).';
                    ApplicationArea = All;
                }
                field(sequenceNoActual; Rec."Sequence No. (Actual)")
                {
                    Caption = 'Sequence No. (Actual)';
                    ToolTip = 'Specifies the Sequence No. (Actual).';
                    ApplicationArea = All;
                }
                field(directUnitCost; Rec."Direct Unit Cost")
                {
                    Caption = 'Direct Unit Cost';
                    ToolTip = 'Specifies the Direct Unit Cost.';
                    ApplicationArea = All;
                }
                field(indirectCostPct; Rec."Indirect Cost %")
                {
                    Caption = 'Indirect Cost %';
                    ToolTip = 'Specifies the Indirect Cost %.';
                    ApplicationArea = All;
                }
                field(overheadRate; Rec."Overhead Rate")
                {
                    Caption = 'Overhead Rate';
                    ToolTip = 'Specifies the Overhead Rate.';
                    ApplicationArea = All;
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                    ToolTip = 'Specifies the starting time of the routing line (operation).';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the starting date of the routing line (operation).';
                    ApplicationArea = All;
                }
                field(endingTime; Rec."Ending Time")
                {
                    Caption = 'Ending Time';
                    ToolTip = 'Specifies the ending time of the routing line (operation).';
                    ApplicationArea = All;
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                    ToolTip = 'Specifies the ending date of the routing line (operation).';
                    ApplicationArea = All;
                }
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the status of the routing line.';
                    ApplicationArea = All;
                }
                field(prodOrderNo; Rec."Prod. Order No.")
                {
                    Caption = 'Prod. Order No.';
                    ToolTip = 'Specifies the number of the related production order.';
                    ApplicationArea = All;
                }
                field(unitCostCalculation; Rec."Unit Cost Calculation")
                {
                    Caption = 'Unit Cost Calculation';
                    ToolTip = 'Specifies the Unit Cost Calculation.';
                    ApplicationArea = All;
                }
                field(inputQuantity; Rec."Input Quantity")
                {
                    Caption = 'Input Quantity';
                    ToolTip = 'Specifies the Input Quantity.';
                    ApplicationArea = All;
                }
                field(criticalPath; Rec."Critical Path")
                {
                    Caption = 'Critical Path';
                    ToolTip = 'Specifies the Critical Path.';
                    ApplicationArea = All;
                }
                field(routingStatus; Rec."Routing Status")
                {
                    Caption = 'Routing Status';
                    ToolTip = 'Specifies the status of the routing line, such as Planned, In Progress, or Finished.';
                    ApplicationArea = All;
                }
                field(flushingMethod; Rec."Flushing Method")
                {
                    Caption = 'Flushing Method';
                    ToolTip = 'Specifies the method to use to calculate and handle output at the work or machine center. Manual: Output must be posted manually by using the output journal. Forward: Output is automatically calculated and posted when you change the status of a simulated, planned (or firm planned) production order to Released. You can still post output manually from the output journal. Backward: Output is automatically calculated and posted when you change the status of a released production order to Finished. You can still post output manually from the output journal.';
                    ApplicationArea = All;
                }
                field(expectedOperationCostAmt; Rec."Expected Operation Cost Amt.")
                {
                    Caption = 'Expected Operation Cost Amt.';
                    ToolTip = 'Specifies the total cost of operations. It is automatically calculated from the capacity need, when a production order is refreshed or replanned.';
                    ApplicationArea = All;
                }
                field(expectedCapacityNeed; Rec."Expected Capacity Need")
                {
                    Caption = 'Expected Capacity Need';
                    ToolTip = 'Specifies the expected capacity need for the production order.';
                    ApplicationArea = All;
                }
                field(expectedCapacityOvhdCost; Rec."Expected Capacity Ovhd. Cost")
                {
                    Caption = 'Expected Capacity Ovhd. Cost';
                    ToolTip = 'Specifies the capacity overhead. It is automatically calculated from the capacity need, when a production order is refreshed or replanned.';
                    ApplicationArea = All;
                }
                field(startingDateTime; Rec."Starting Date-Time")
                {
                    Caption = 'Starting Date-Time';
                    ToolTip = 'Specifies the starting date and the starting time, which are combined in a format called "starting date-time".';
                    ApplicationArea = All;
                }
                field(endingDateTime; Rec."Ending Date-Time")
                {
                    Caption = 'Ending Date-Time';
                    ToolTip = 'Specifies the ending date and the ending time, which are combined in a format called "ending date-time".';
                    ApplicationArea = All;
                }
                field(scheduleManually; Rec."Schedule Manually")
                {
                    Caption = 'Schedule Manually';
                    ToolTip = 'Specifies that the underlying capacity need is recalculated each time a change is made in the schedule of the routing.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location where the machine or work center on the production order routing line operates.';
                    ApplicationArea = All;
                }
                field(openShopFloorBinCode; Rec."Open Shop Floor Bin Code")
                {
                    Caption = 'Open Shop Floor Bin Code';
                    ToolTip = 'Specifies the corresponding bin at the machine or work center, if the location code matches the setup of that machine or work center.';
                    ApplicationArea = All;
                }
                field(toProductionBinCode; Rec."To-Production Bin Code")
                {
                    Caption = 'To-Production Bin Code';
                    ToolTip = 'Specifies the bin that holds components with a flushing method, that involves a warehouse activity to bring the items to the bin.';
                    ApplicationArea = All;
                }
                field(fromProductionBinCode; Rec."From-Production Bin Code")
                {
                    Caption = 'From-Production Bin Code';
                    ToolTip = 'Specifies the corresponding bin at the machine or work center if the location code matches the setup of that machine or work center.';
                    ApplicationArea = All;
                }
                field(postedOutputQuantity; Rec."Posted Output Quantity")
                {
                    Caption = 'Posted Output Quantity';
                    ToolTip = 'Specifies the total output quantity that has been posted to the capacity ledger. Value expressed in base unit of measure.';
                    ApplicationArea = All;
                }
                field(postedScrapQuantity; Rec."Posted Scrap Quantity")
                {
                    Caption = 'Posted Scrap Quantity';
                    ToolTip = 'Specifies the total scrap quantity that has been posted to the capacity ledger. Value expressed in base unit of measure.';
                    ApplicationArea = All;
                }
                field(postedRunTime; Rec."Posted Run Time")
                {
                    Caption = 'Posted Run Time';
                    ToolTip = 'Specifies the total run time that has been posted to the capacity ledger.';
                    ApplicationArea = All;
                }
                field(postedSetupTime; Rec."Posted Setup Time")
                {
                    Caption = 'Posted Setup Time';
                    ToolTip = 'Specifies the total set up time that has been posted to the capacity ledger.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
