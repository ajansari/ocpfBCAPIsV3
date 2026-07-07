namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Capacity;

page 90948 "ocpfCalendarAbsenceEntries"
{
    PageType = API;
    Caption = 'Calendar Absence Entries — registered capacity downtime (maintenance, holidays) per work/machine center. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfCalendarAbsenceEntry';
    EntitySetName = 'ocpfCalendarAbsenceEntries';
    SourceTable = "Calendar Absence Entry";
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
                    ToolTip = 'Specifies the Capacity Type.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the No..';
                    ApplicationArea = All;
                }
                field(date; Rec."Date")
                {
                    Caption = 'Date';
                    ToolTip = 'Specifies the date associated with this absence entry.';
                    ApplicationArea = All;
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                    ToolTip = 'Specifies the starting time of the absence entry.';
                    ApplicationArea = All;
                }
                field(endingTime; Rec."Ending Time")
                {
                    Caption = 'Ending Time';
                    ToolTip = 'Specifies the ending time of the absence entry.';
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
                field(capacity; Rec."Capacity")
                {
                    Caption = 'Capacity';
                    ToolTip = 'Specifies the capacity of the absence entry, which was planned for this work center or machine center.';
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
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for the absence entry, for example, holiday or vacation"';
                    ApplicationArea = All;
                }
                field(updated; Rec."Updated")
                {
                    Caption = 'Updated';
                    ToolTip = 'Specifies the calendar has been updated with this absence entry.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
