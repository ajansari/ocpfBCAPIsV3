namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.WorkCenter;

page 90943 "ocpfWorkCenterGroups"
{
    PageType = API;
    Caption = 'Work Center Groups — groupings of work centers for consolidated capacity views.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfWorkCenterGroup';
    EntitySetName = 'ocpfWorkCenterGroups';
    SourceTable = "Work Center Group";
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
                    ToolTip = 'Specifies the code for the work center group.';
                    ApplicationArea = All;
                }
                field(name; Rec."Name")
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies a name for the work center group.';
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
                    ToolTip = 'Specifies the Capacity (Effective).';
                    ApplicationArea = All;
                }
                field(prodOrderNeedQty; Rec."Prod. Order Need (Qty.)")
                {
                    Caption = 'Prod. Order Need (Qty.)';
                    ToolTip = 'Specifies the Prod. Order Need (Qty.).';
                    ApplicationArea = All;
                }
                field(prodOrderStatusFilter; Rec."Prod. Order Status Filter")
                {
                    Caption = 'Prod. Order Status Filter';
                    ToolTip = 'Specifies the Prod. Order Status Filter.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
