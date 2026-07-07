namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Capacity;

page 90942 "ocpfShopCalendarWorkingDays"
{
    PageType = API;
    Caption = 'Shop Calendar Working Days — the weekday/shift lines that make up each shop calendar.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfShopCalendarWorkingDay';
    EntitySetName = 'ocpfShopCalendarWorkingDays';
    SourceTable = "Shop Calendar Working Days";
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
                field(shopCalendarCode; Rec."Shop Calendar Code")
                {
                    Caption = 'Shop Calendar Code';
                    ToolTip = 'Specifies the Shop Calendar Code.';
                    ApplicationArea = All;
                }
                field(day; Rec."Day")
                {
                    Caption = 'Day';
                    ToolTip = 'Specifies your working days of the week.';
                    ApplicationArea = All;
                }
                field(workShiftCode; Rec."Work Shift Code")
                {
                    Caption = 'Work Shift Code';
                    ToolTip = 'Specifies the work shift that this working day refers to.';
                    ApplicationArea = All;
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                    ToolTip = 'Specifies the starting time of the shift for this working day.';
                    ApplicationArea = All;
                }
                field(endingTime; Rec."Ending Time")
                {
                    Caption = 'Ending Time';
                    ToolTip = 'Specifies the ending time of the shift for this working day.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
