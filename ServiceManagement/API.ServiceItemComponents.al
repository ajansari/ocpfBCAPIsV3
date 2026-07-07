namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Item;

page 90984 "ocpfServiceItemComponents"
{
    PageType = API;
    Caption = 'Service Item Components — the parts that make up a service item, tracked for replacement history.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceItemComponent';
    EntitySetName = 'ocpfServiceItemComponents';
    SourceTable = "Service Item Component";
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
                field(parentServiceItemNo; Rec."Parent Service Item No.")
                {
                    Caption = 'Parent Service Item No.';
                    ToolTip = 'Specifies the number of the service item in which the component is included.';
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the number of the line.';
                    ApplicationArea = All;
                }
                field(active; Rec."Active")
                {
                    Caption = 'Active';
                    ToolTip = 'Specifies that the component is in use.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the component type.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(dateInstalled; Rec."Date Installed")
                {
                    Caption = 'Date Installed';
                    ToolTip = 'Specifies the date when the component was installed.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant of the item on the line.';
                    ApplicationArea = All;
                }
                field(serialNo; Rec."Serial No.")
                {
                    Caption = 'Serial No.';
                    ToolTip = 'Specifies the serial number of the component.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the component.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies the Description 2.';
                    ApplicationArea = All;
                }
                field(serviceOrderNo; Rec."Service Order No.")
                {
                    Caption = 'Service Order No.';
                    ToolTip = 'Specifies the number of the service order under which this component was replaced.';
                    ApplicationArea = All;
                }
                field(fromLineNo; Rec."From Line No.")
                {
                    Caption = 'From Line No.';
                    ToolTip = 'Specifies the line number assigned to the component when it was an active component of the service item.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the date when the component was last modified.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
