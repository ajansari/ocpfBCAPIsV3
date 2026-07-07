namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Setup;

page 90973 "ocpfServiceZones"
{
    PageType = API;
    Caption = 'Service Zones — geographic zones used to assign resources to customer service areas.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceZone';
    EntitySetName = 'ocpfServiceZones';
    SourceTable = "Service Zone";
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
                    ToolTip = 'Specifies a code for the service zone.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the service zone.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
