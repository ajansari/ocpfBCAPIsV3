namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Setup;

page 90939 "ocpfManufacturingSetup"
{
    PageType = API;
    Caption = 'Manufacturing Setup — company-wide settings that control planning, scheduling, and numbering for production.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfManufacturingSetup';
    EntitySetName = 'ocpfManufacturingSetup';
    SourceTable = "Manufacturing Setup";
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
                field(primaryKey; Rec."Primary Key")
                {
                    Caption = 'Primary Key';
                    ToolTip = 'Specifies the Primary Key.';
                    ApplicationArea = All;
                }
                field(normalStartingTime; Rec."Normal Starting Time")
                {
                    Caption = 'Normal Starting Time';
                    ToolTip = 'Specifies the normal starting time of the workday.';
                    ApplicationArea = All;
                }
                field(normalEndingTime; Rec."Normal Ending Time")
                {
                    Caption = 'Normal Ending Time';
                    ToolTip = 'Specifies the normal ending time of a workday.';
                    ApplicationArea = All;
                }
                field(docNoIsProdOrderNo; Rec."Doc. No. Is Prod. Order No.")
                {
                    Caption = 'Doc. No. Is Prod. Order No.';
                    ToolTip = 'Specifies that the production order number is also the document number in the ledger entries posted for the production order.';
                    ApplicationArea = All;
                }
                field(costInclSetup; Rec."Cost Incl. Setup")
                {
                    Caption = 'Cost Incl. Setup';
                    ToolTip = 'Specifies whether the setup times are to be included in the cost calculation of the Standard Cost field.';
                    ApplicationArea = All;
                }
                field(dynamicLowLevelCode; Rec."Dynamic Low-Level Code")
                {
                    Caption = 'Dynamic Low-Level Code';
                    ToolTip = 'Specifies low-level codes are dynamically assigned to each component in a product structure. Note that this may affect performance. The top final assembly level is denoted as level 0, the end item. The higher the low-level code number, the lower the item is in the hierarchy. The codes are used in the planning of component parts. When you calculate a plan, the BOM is exploded in the planning worksheet, and the gross requirements for level 0 are passed down the planning levels as gross requirements for the next planning level.';
                    ApplicationArea = All;
                }
                field(planningWarning; Rec."Planning Warning")
                {
                    Caption = 'Planning Warning';
                    ToolTip = 'Specifies whether to run the MRP engine to detect if planned shipment dates cannot be met.';
                    ApplicationArea = All;
                }
                field(simulatedOrderNos; Rec."Simulated Order Nos.")
                {
                    Caption = 'Simulated Order Nos.';
                    ToolTip = 'Specifies the number series code to use when assigning numbers to a simulated production order.';
                    ApplicationArea = All;
                }
                field(plannedOrderNos; Rec."Planned Order Nos.")
                {
                    Caption = 'Planned Order Nos.';
                    ToolTip = 'Specifies the number series code to use when assigning numbers to a planned production order.';
                    ApplicationArea = All;
                }
                field(firmPlannedOrderNos; Rec."Firm Planned Order Nos.")
                {
                    Caption = 'Firm Planned Order Nos.';
                    ToolTip = 'Specifies the number series code to use when assigning numbers to firm planned production orders.';
                    ApplicationArea = All;
                }
                field(releasedOrderNos; Rec."Released Order Nos.")
                {
                    Caption = 'Released Order Nos.';
                    ToolTip = 'Specifies the number series code to use when assigning numbers to a released production order.';
                    ApplicationArea = All;
                }
                field(workCenterNos; Rec."Work Center Nos.")
                {
                    Caption = 'Work Center Nos.';
                    ToolTip = 'Specifies the number series code to use when assigning numbers to work centers.';
                    ApplicationArea = All;
                }
                field(machineCenterNos; Rec."Machine Center Nos.")
                {
                    Caption = 'Machine Center Nos.';
                    ToolTip = 'Specifies the number series code to use when assigning numbers to machine centers.';
                    ApplicationArea = All;
                }
                field(productionBomNos; Rec."Production BOM Nos.")
                {
                    Caption = 'Production BOM Nos.';
                    ToolTip = 'Specifies the number series code to use when assigning numbers to production BOMs.';
                    ApplicationArea = All;
                }
                field(routingNos; Rec."Routing Nos.")
                {
                    Caption = 'Routing Nos.';
                    ToolTip = 'Specifies the number series code to use when assigning numbers to routings.';
                    ApplicationArea = All;
                }
                field(componentsAtLocation; Rec."Components at Location")
                {
                    Caption = 'Components at Location';
                    ToolTip = 'Specifies the inventory location from where the production order components are to be taken.';
                    ApplicationArea = All;
                }
                field(showCapacityIn; Rec."Show Capacity In")
                {
                    Caption = 'Show Capacity In';
                    ToolTip = 'Specifies which capacity unit of measure to use by default to record and track capacity.';
                    ApplicationArea = All;
                }
                field(defaultConsumCalcBasedOn; Rec."Default Consum. Calc. Based on")
                {
                    Caption = 'Default Consumption Calculation Based on';
                    ToolTip = 'Specifies default calculation based on, used for consumption calculation. Whether the calculation of the quantity to consume is based on the actual output or on the expected output (the quantity of finished goods that you expect to produce).';
                    ApplicationArea = All;
                }
                field(finishOrderWithoutOutput; Rec."Finish Order without Output")
                {
                    Caption = 'Allow Finishing Prod. Order with no Output';
                    ToolTip = 'Specifies that status of orders with no output can be changed to finished and the WIP will be written off to Inventory Adjustment Account.';
                    ApplicationArea = All;
                }
                field(incNonInvCostToProd; Rec."Inc. Non. Inv. Cost To Prod")
                {
                    Caption = 'Include Non-Inventory Items to Produced Items';
                    ToolTip = 'Specifies whether to include the cost of non-inventory items in the cost of produced items.';
                    ApplicationArea = All;
                }
                field(loadSkuCostOnManufacturing; Rec."Load SKU Cost on Manufacturing")
                {
                    Caption = 'Load SKU Cost on Manufacturing';
                    ToolTip = 'Specifies if you want to load SKU Cost in the item at the time of manufacturing.';
                    ApplicationArea = All;
                }
                field(manualScheduling; Rec."Manual Scheduling")
                {
                    Caption = 'Manual Scheduling';
                    ToolTip = 'Specifies that the End/Due Dates on the production have been scheduled manually.';
                    ApplicationArea = All;
                }
                field(safetyLeadTimeForManSch; Rec."Safety Lead Time for Man. Sch.")
                {
                    Caption = 'Safety Lead Time for Manual Scheduling';
                    ToolTip = 'Specifies the time that will be added to the End date to calculate the Due Date when the production order is manually scheduled.';
                    ApplicationArea = All;
                }
                field(defaultGenBusPostGroup; Rec."Default Gen. Bus. Post. Group")
                {
                    Caption = 'Default General Business Posting Group';
                    ToolTip = 'Specifies the default general business posting group for production orders.';
                    ApplicationArea = All;
                }
                field(defaultFlushingMethod; Rec."Default Flushing Method")
                {
                    Caption = 'Default Flushing Method';
                    ToolTip = 'Specifies default flushing method assigned to new items. A different flushing method on item cards will override this default.';
                    ApplicationArea = All;
                }
                field(presetOutputQuantity; Rec."Preset Output Quantity")
                {
                    Caption = 'Preset Output Quantity';
                    ToolTip = 'Specifies what to show in the Output Quantity field of a production journal when it is first opened.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
