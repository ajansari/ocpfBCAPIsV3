namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Capacity;

page 90947 "ocpfCalendarEntries"
{
    PageType = API;
    Caption = 'Calendar Entries — calculated available capacity per work/machine center, date, and shift. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfCalendarEntry';
    EntitySetName = 'ocpfCalendarEntries';
    SourceTable = "Calendar Entry";
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
                field(capacityType; Rec."Capacity Type")
                {
                    Caption = 'Capacity Type';
                    ToolTip = 'Specifies the type of capacity for the calendar entry.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(date; Rec."Date")
                {
                    Caption = 'Date';
                    ToolTip = 'Specifies the date when this capacity refers to.';
                    ApplicationArea = All;
                }
                field(workShiftCode; Rec."Work Shift Code")
                {
                    Caption = 'Work Shift Code';
                    ToolTip = 'Specifies code for the work shift that the capacity refers to.';
                    ApplicationArea = All;
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                    ToolTip = 'Specifies the starting time of this calendar entry.';
                    ApplicationArea = All;
                }
                field(endingTime; Rec."Ending Time")
                {
                    Caption = 'Ending Time';
                    ToolTip = 'Specifies the ending time of this calendar entry.';
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
                field(capacityTotal; Rec."Capacity (Total)")
                {
                    Caption = 'Capacity (Total)';
                    ToolTip = 'Specifies the total capacity of this calendar entry.';
                    ApplicationArea = All;
                }
                field(capacityEffective; Rec."Capacity (Effective)")
                {
                    Caption = 'Capacity (Effective)';
                    ToolTip = 'Specifies the effective capacity of this calendar entry.';
                    ApplicationArea = All;
                }
                field(efficiency; Rec."Efficiency")
                {
                    Caption = 'Efficiency';
                    ToolTip = 'Specifies the efficiency of this calendar entry.';
                    ApplicationArea = All;
                }
                field(capacity; Rec."Capacity")
                {
                    Caption = 'Capacity';
                    ToolTip = 'Specifies the capacity of this calendar entry.';
                    ApplicationArea = All;
                }
                field(absenceEfficiency; Rec."Absence Efficiency")
                {
                    Caption = 'Absence Efficiency';
                    ToolTip = 'Specifies the Absence Efficiency.';
                    ApplicationArea = All;
                }
                field(absenceCapacity; Rec."Absence Capacity")
                {
                    Caption = 'Absence Capacity';
                    ToolTip = 'Specifies the Absence Capacity.';
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
            }
        }
    }
}
