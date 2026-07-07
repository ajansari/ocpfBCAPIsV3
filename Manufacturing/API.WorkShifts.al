namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Setup;

page 90940 "ocpfWorkShifts"
{
    PageType = API;
    Caption = 'Work Shifts — named shifts used to define working time in shop calendars.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfWorkShift';
    EntitySetName = 'ocpfWorkShifts';
    SourceTable = "Work Shift";
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
                field(code; Rec."Code")
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies a code to identify this work shift.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the work shift.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
