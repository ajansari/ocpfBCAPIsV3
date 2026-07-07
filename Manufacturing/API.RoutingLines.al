namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Routing;

page 90954 "ocpfRoutingLines"
{
    PageType = API;
    Caption = 'Routing Lines — the individual operations of a routing: work/machine center, times, and scheduling parameters.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfRoutingLine';
    EntitySetName = 'ocpfRoutingLines';
    SourceTable = "Routing Line";
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
                    ToolTip = 'Specifies the Routing No..';
                    ApplicationArea = All;
                }
                field(versionCode; Rec."Version Code")
                {
                    Caption = 'Version Code';
                    ToolTip = 'Specifies the Version Code.';
                    ApplicationArea = All;
                }
                field(operationNo; Rec."Operation No.")
                {
                    Caption = 'Operation No.';
                    ToolTip = 'Specifies the operation number for this routing line.';
                    ApplicationArea = All;
                }
                field(nextOperationNo; Rec."Next Operation No.")
                {
                    Caption = 'Next Operation No.';
                    ToolTip = 'Specifies the next operation number. You use this field if you use parallel routings.';
                    ApplicationArea = All;
                }
                field(previousOperationNo; Rec."Previous Operation No.")
                {
                    Caption = 'Previous Operation No.';
                    ToolTip = 'Specifies the previous operation number, which is automatically assigned.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the kind of capacity type to use for the actual operation.';
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
                    ToolTip = 'Specifies a description of the entry.';
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
                    ToolTip = 'Specifies the wait time according to the value in the Wait Time Unit of Measure field.';
                    ApplicationArea = All;
                }
                field(moveTime; Rec."Move Time")
                {
                    Caption = 'Move Time';
                    ToolTip = 'Specifies the move time according to the value in the Move Time Unit of Measure field.';
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
                    ToolTip = 'Specifies a minimum process time.';
                    ApplicationArea = All;
                }
                field(maximumProcessTime; Rec."Maximum Process Time")
                {
                    Caption = 'Maximum Process Time';
                    ToolTip = 'Specifies a maximum process time.';
                    ApplicationArea = All;
                }
                field(concurrentCapacities; Rec."Concurrent Capacities")
                {
                    Caption = 'Concurrent Capacities';
                    ToolTip = 'Specifies the number of machines or persons that are working concurrently.';
                    ApplicationArea = All;
                }
                field(sendAheadQuantity; Rec."Send-Ahead Quantity")
                {
                    Caption = 'Send-Ahead Quantity';
                    ToolTip = 'Specifies the send-ahead quantity.';
                    ApplicationArea = All;
                }
                field(routingLinkCode; Rec."Routing Link Code")
                {
                    Caption = 'Routing Link Code';
                    ToolTip = 'Specifies the routing link code.';
                    ApplicationArea = All;
                }
                field(standardTaskCode; Rec."Standard Task Code")
                {
                    Caption = 'Standard Task Code';
                    ToolTip = 'Specifies a standard task.';
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
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
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
            }
        }
    }
}
