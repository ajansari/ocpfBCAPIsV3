namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Document;

page 90965 "ocpfProdOrderCapacityNeeds"
{
    PageType = API;
    Caption = 'Production Order Capacity Needs — calculated capacity requirements per operation and time bucket. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfProdOrderCapacityNeed';
    EntitySetName = 'ocpfProdOrderCapacityNeeds';
    SourceTable = "Prod. Order Capacity Need";
    ODataKeyFields = SystemId;
    Editable = false;

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
                field(prodOrderNo; Rec."Prod. Order No.")
                {
                    Caption = 'Prod. Order No.';
                    ToolTip = 'Specifies the number of the related production order.';
                    ApplicationArea = All;
                }
                field(routingNo; Rec."Routing No.")
                {
                    Caption = 'Routing No.';
                    ToolTip = 'Specifies the routing number.';
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the Line No..';
                    ApplicationArea = All;
                }
                field(operationNo; Rec."Operation No.")
                {
                    Caption = 'Operation No.';
                    ToolTip = 'Specifies the operation number.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type of capacity need. Here you can see whether this capacity need is for a machine center or a work center.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the Number of the machine center or work center depending on the entry in the Type field.';
                    ApplicationArea = All;
                }
                field(workCenterNo; Rec."Work Center No.")
                {
                    Caption = 'Work Center No.';
                    ToolTip = 'Specifies the work center number of the capacity need. If this capacity need occurs at a machine center that is assigned to a work center, that work center number will be shown here. If the capacity need is for a work center, the No. field and this field will show the same number.';
                    ApplicationArea = All;
                }
                field(workCenterGroupCode; Rec."Work Center Group Code")
                {
                    Caption = 'Work Center Group Code';
                    ToolTip = 'Specifies the Work Center Group Code.';
                    ApplicationArea = All;
                }
                field(routingReferenceNo; Rec."Routing Reference No.")
                {
                    Caption = 'Routing Reference No.';
                    ToolTip = 'Specifies the Routing Reference No..';
                    ApplicationArea = All;
                }
                field(date; Rec."Date")
                {
                    Caption = 'Date';
                    ToolTip = 'Specifies the date when this capacity need occurred.';
                    ApplicationArea = All;
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                    ToolTip = 'Specifies the starting time of the capacity need.';
                    ApplicationArea = All;
                }
                field(endingTime; Rec."Ending Time")
                {
                    Caption = 'Ending Time';
                    ToolTip = 'Specifies the ending time of the capacity need.';
                    ApplicationArea = All;
                }
                field(allocatedTime; Rec."Allocated Time")
                {
                    Caption = 'Allocated Time';
                    ToolTip = 'Specifies the capacity need of planned operations.';
                    ApplicationArea = All;
                }
                field(sendAheadType; Rec."Send-Ahead Type")
                {
                    Caption = 'Send-Ahead Type';
                    ToolTip = 'Specifies if the send-ahead quantity is of type Input, Output, or Both.';
                    ApplicationArea = All;
                }
                field(timeType; Rec."Time Type")
                {
                    Caption = 'Time Type';
                    ToolTip = 'Specifies the time type of the capacity need. Two options are available: Setup Time and Run Time.';
                    ApplicationArea = All;
                }
                field(neededTime; Rec."Needed Time")
                {
                    Caption = 'Needed Time';
                    ToolTip = 'Specifies how much time is required to meet the needs resulting from the specified capacity.';
                    ApplicationArea = All;
                }
                field(neededTimeMs; Rec."Needed Time (ms)")
                {
                    Caption = 'Needed Time (ms)';
                    ToolTip = 'Specifies how much time (in ms) is required to meet the needs resulting from the specified capacity.';
                    ApplicationArea = All;
                }
                field(lotSize; Rec."Lot Size")
                {
                    Caption = 'Lot Size';
                    ToolTip = 'Specifies the Lot Size.';
                    ApplicationArea = All;
                }
                field(concurrentCapacities; Rec."Concurrent Capacities")
                {
                    Caption = 'Concurrent Capacities';
                    ToolTip = 'Specifies the concurrent capacity of the operation.';
                    ApplicationArea = All;
                }
                field(efficiency; Rec."Efficiency")
                {
                    Caption = 'Efficiency';
                    ToolTip = 'Specifies the efficiency of the production order capacity need.';
                    ApplicationArea = All;
                }
                field(startingDateTime; Rec."Starting Date-Time")
                {
                    Caption = 'Starting Date-Time';
                    ToolTip = 'Specifies the date and the starting time, which are combined in a format called "starting date-time".';
                    ApplicationArea = All;
                }
                field(endingDateTime; Rec."Ending Date-Time")
                {
                    Caption = 'Ending Date-Time';
                    ToolTip = 'Specifies the date and the ending time, which are combined in a format called "ending date-time".';
                    ApplicationArea = All;
                }
                field(worksheetTemplateName; Rec."Worksheet Template Name")
                {
                    Caption = 'Worksheet Template Name';
                    ToolTip = 'Specifies the Worksheet Template Name.';
                    ApplicationArea = All;
                }
                field(worksheetBatchName; Rec."Worksheet Batch Name")
                {
                    Caption = 'Worksheet Batch Name';
                    ToolTip = 'Specifies the Worksheet Batch Name.';
                    ApplicationArea = All;
                }
                field(worksheetLineNo; Rec."Worksheet Line No.")
                {
                    Caption = 'Worksheet Line No.';
                    ToolTip = 'Specifies the Worksheet Line No..';
                    ApplicationArea = All;
                }
                field(active; Rec."Active")
                {
                    Caption = 'Active';
                    ToolTip = 'Specifies the Active.';
                    ApplicationArea = All;
                }
                field(requestedOnly; Rec."Requested Only")
                {
                    Caption = 'Requested Only';
                    ToolTip = 'Specifies the Requested Only.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
