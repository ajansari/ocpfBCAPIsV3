namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Setup;

page 90925 "ocpfServiceOrderTypes"
{
    PageType = API;
    Caption = 'Service Order Types — categories for classifying service orders.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceOrderType';
    EntitySetName = 'ocpfServiceOrderTypes';
    SourceTable = "Service Order Type";
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
                    ToolTip = 'Specifies a code for the service order type.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the service order type.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
