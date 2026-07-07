namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Family;

page 90959 "ocpfFamilies"
{
    PageType = API;
    Caption = 'Families — groups of items produced together in a single production run.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfFamily';
    EntitySetName = 'ocpfFamilies';
    SourceTable = "Family";
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
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description for a product family.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies an additional description of the product family if there is not enough space in the Description field.';
                    ApplicationArea = All;
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                    ApplicationArea = All;
                }
                field(blocked; Rec."Blocked")
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies that the family is blocked. This field is for information only and does not affect the posting in transactions.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies when the standard data of this production family was last modified.';
                    ApplicationArea = All;
                }
                field(routingNo; Rec."Routing No.")
                {
                    Caption = 'Routing No.';
                    ToolTip = 'Specifies the number of the routing which is used for the production of the family.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
