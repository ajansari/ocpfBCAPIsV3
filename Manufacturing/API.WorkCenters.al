namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.WorkCenter;

page 90944 "ocpfWorkCenters"
{
    PageType = API;
    Caption = 'Work Centers — capacity resources (departments, lines, or cells) on which routing operations are performed, including costing and calendar settings.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfWorkCenter';
    EntitySetName = 'ocpfWorkCenters';
    SourceTable = "Work Center";
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
                    ToolTip = 'Specifies the name of the work center.';
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
                field(alternateWorkCenter; Rec."Alternate Work Center")
                {
                    Caption = 'Alternate Work Center';
                    ToolTip = 'Specifies an alternate work center.';
                    ApplicationArea = All;
                }
                field(workCenterGroupCode; Rec."Work Center Group Code")
                {
                    Caption = 'Work Center Group Code';
                    ToolTip = 'Specifies the work center group, if the work center or underlying machine center is assigned to a work center group.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    ApplicationArea = All;
                }
                field(subcontractorNo; Rec."Subcontractor No.")
                {
                    Caption = 'Subcontractor No.';
                    ToolTip = 'Specifies the number of a subcontractor who supplies this work center.';
                    ApplicationArea = All;
                }
                field(directUnitCost; Rec."Direct Unit Cost")
                {
                    Caption = 'Direct Unit Cost';
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
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
                    ToolTip = 'Specifies the queue time of the work center.';
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
                    ToolTip = 'Specifies when the work center card was last modified.';
                    ApplicationArea = All;
                }
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    ApplicationArea = All;
                }
                field(capacity; Rec."Capacity")
                {
                    Caption = 'Capacity';
                    ToolTip = 'Specifies the amount of work that can be done in a specified time period. The capacity of a work center indicates how many machines or persons are working at the same time. If you enter 2, for example, the work center will take half of the time compared to a work center with the capacity of 1. ';
                    ApplicationArea = All;
                }
                field(efficiency; Rec."Efficiency")
                {
                    Caption = 'Efficiency';
                    ToolTip = 'Specifies the efficiency factor as a percentage of the work center.';
                    ApplicationArea = All;
                }
                field(maximumEfficiency; Rec."Maximum Efficiency")
                {
                    Caption = 'Maximum Efficiency';
                    ToolTip = 'Specifies the maximum efficiency factor of the work center.';
                    ApplicationArea = All;
                }
                field(minimumEfficiency; Rec."Minimum Efficiency")
                {
                    Caption = 'Minimum Efficiency';
                    ToolTip = 'Specifies the minimum efficiency factor of the work center.';
                    ApplicationArea = All;
                }
                field(calendarRoundingPrecision; Rec."Calendar Rounding Precision")
                {
                    Caption = 'Calendar Rounding Precision';
                    ToolTip = 'Specifies how calendar entries are rounded, such as whether minutes are rounded to hours.';
                    ApplicationArea = All;
                }
                field(simulationType; Rec."Simulation Type")
                {
                    Caption = 'Simulation Type';
                    ToolTip = 'Specifies the simulation type for the work center.';
                    ApplicationArea = All;
                }
                field(shopCalendarCode; Rec."Shop Calendar Code")
                {
                    Caption = 'Shop Calendar Code';
                    ToolTip = 'Specifies the shop calendar code that the planning of this work center refers to.';
                    ApplicationArea = All;
                }
                field(blocked; Rec."Blocked")
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies whether the work center is blocked from being posted in transactions, for example, if the machine center is out of order.';
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
                    ToolTip = 'Specifies the effective available capacity of the work center.';
                    ApplicationArea = All;
                }
                field(prodOrderNeedQty; Rec."Prod. Order Need (Qty.)")
                {
                    Caption = 'Prod. Order Need (Qty.)';
                    ToolTip = 'Specifies the calculated capacity requirements for production orders at this work center.';
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
                field(unitCostCalculation; Rec."Unit Cost Calculation")
                {
                    Caption = 'Unit Cost Calculation';
                    ToolTip = 'Specifies the unit cost calculation that is to be made.';
                    ApplicationArea = All;
                }
                field(specificUnitCost; Rec."Specific Unit Cost")
                {
                    Caption = 'Specific Unit Cost';
                    ToolTip = 'Specifies where to define the unit costs. If you place a check mark in this field, you can define the unit costs on the routing line. This allows you to have individual costs on every routing line. This is useful for subcontracting operations with varying rates.';
                    ApplicationArea = All;
                }
                field(consolidatedCalendar; Rec."Consolidated Calendar")
                {
                    Caption = 'Consolidated Calendar';
                    ToolTip = 'Specifies whether the consolidated calendar is used.';
                    ApplicationArea = All;
                }
                field(flushingMethod; Rec."Flushing Method")
                {
                    Caption = 'Flushing Method';
                    ToolTip = 'Specifies the method to use to calculate and handle output at the work center. Manual: Output must be posted manually by using the output journal. Forward: Output is automatically calculated and posted when you change the status of a simulated, planned (or firm planned) production order to Released. You can still post output manually from the output journal. Backward: Output is automatically calculated and posted when you change the status of a released production order to Finished or when the last operation is finished. You can still post output manually from the output journal. The setting you make in this field is copied to the Flushing Method field on the production order routing line according to the machine/work center of the master routing, but you can change the field for an individual production order to allow a different output (or consumption) posting of that order.';
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
                    ToolTip = 'Specifies the overhead rate of this work center.';
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
                    ToolTip = 'Specifies the location where the work center operates by default.';
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
                    ToolTip = 'Specifies the bin in the production area where components that are picked for production are placed by default before they can be consumed.';
                    ApplicationArea = All;
                }
                field(fromProductionBinCode; Rec."From-Production Bin Code")
                {
                    Caption = 'From-Production Bin Code';
                    ToolTip = 'Specifies the bin in the production area where finished end items are taken by default when the process involves warehouse activity.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
