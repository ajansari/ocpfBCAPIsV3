namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.ProductionBOM;

page 90958 "ocpfProductionBomVersions"
{
    PageType = API;
    Caption = 'Production BOM Versions — dated alternative versions of a production BOM.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfProductionBomVersion';
    EntitySetName = 'ocpfProductionBomVersions';
    SourceTable = "Production BOM Version";
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
                field(productionBomNo; Rec."Production BOM No.")
                {
                    Caption = 'Production BOM No.';
                    ToolTip = 'Specifies the Production BOM No..';
                    ApplicationArea = All;
                }
                field(versionCode; Rec."Version Code")
                {
                    Caption = 'Version Code';
                    ToolTip = 'Specifies the version code of the production BOM.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description for the production BOM version.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the starting date for this production BOM version.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies the manufacturing batch unit of measure.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies when the production BOM version card was last modified.';
                    ApplicationArea = All;
                }
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the status of this production BOM version.';
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
