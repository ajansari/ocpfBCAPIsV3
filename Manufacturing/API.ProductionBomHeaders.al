namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.ProductionBOM;

page 90956 "ocpfProductionBomHeaders"
{
    PageType = API;
    Caption = 'Production BOMs — headers listing the materials and components required to produce an item.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfProductionBomHeader';
    EntitySetName = 'ocpfProductionBomHeaders';
    SourceTable = "Production BOM Header";
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
                    ToolTip = 'Specifies a description for the production BOM.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies an extended description for the BOM if there is not enough space in the Description field.';
                    ApplicationArea = All;
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies the manufacturing batch unit of measure.';
                    ApplicationArea = All;
                }
                field(lowLevelCode; Rec."Low-Level Code")
                {
                    Caption = 'Low-Level Code';
                    ToolTip = 'Specifies the Low-Level Code.';
                    ApplicationArea = All;
                }
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
                    ApplicationArea = All;
                }
                field(creationDate; Rec."Creation Date")
                {
                    Caption = 'Creation Date';
                    ToolTip = 'Specifies the Creation Date.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date that was modified.';
                    ApplicationArea = All;
                }
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the status of the production BOM.';
                    ApplicationArea = All;
                }
                field(versionNos; Rec."Version Nos.")
                {
                    Caption = 'Version Nos.';
                    ToolTip = 'Specifies the version number series that the production BOM versions refer to.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the No. Series.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
