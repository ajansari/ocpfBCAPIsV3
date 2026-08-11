namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.FixedAssets.FixedAsset;

page 90915 "ocpfFixedAssets"
{
    PageType = API;
    Caption = 'Fixed assets — capital assets tracked for depreciation and disposal.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfFixedAsset';
    EntitySetName = 'ocpfFixedAssets';
    SourceTable = "Fixed Asset";
    ODataKeyFields = SystemId;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                    {
                        Caption = 'ID';
                        ToolTip = 'Unique system-assigned identifier for this record. Used as the OData key.';
                        ApplicationArea = All;
                }
                field(no; Rec."No.")
                    {
                        Caption = 'No.';
                        ToolTip = 'Specifies the No..';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies a description of the fixed asset.';
                        ApplicationArea = All;
                }
                field(searchDescription; Rec."Search Description")
                    {
                        Caption = 'Search Description';
                        ToolTip = 'Specifies the Search Description.';
                        ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                    {
                        Caption = 'Description 2';
                        ToolTip = 'Specifies the Description 2.';
                        ApplicationArea = All;
                }
                field(faClassCode; Rec."FA Class Code")
                    {
                        Caption = 'FA Class Code';
                        ToolTip = 'Specifies the FA Class Code.';
                        ApplicationArea = All;
                }
                field(faSubclassCode; Rec."FA Subclass Code")
                    {
                        Caption = 'FA Subclass Code';
                        ToolTip = 'Specifies the FA Subclass Code.';
                        ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                    {
                        Caption = 'Global Dimension 1 Code';
                        ToolTip = 'Specifies the Global Dimension 1 Code.';
                        ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                    {
                        Caption = 'Global Dimension 2 Code';
                        ToolTip = 'Specifies the Global Dimension 2 Code.';
                        ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                    {
                        Caption = 'Location Code';
                        ToolTip = 'Specifies the Location Code.';
                        ApplicationArea = All;
                }
                field(faLocationCode; Rec."FA Location Code")
                    {
                        Caption = 'FA Location Code';
                        ToolTip = 'Specifies the FA Location Code.';
                        ApplicationArea = All;
                }
                field(vendorNo; Rec."Vendor No.")
                    {
                        Caption = 'Vendor No.';
                        ToolTip = 'Specifies the Vendor No..';
                        ApplicationArea = All;
                }
                field(mainAssetComponent; Rec."Main Asset/Component")
                    {
                        Caption = 'Main Asset/Component';
                        ToolTip = 'Specifies the Main Asset/Component.';
                        ApplicationArea = All;
                }
                field(componentOfMainAsset; Rec."Component of Main Asset")
                    {
                        Caption = 'Component of Main Asset';
                        ToolTip = 'Specifies the Component of Main Asset.';
                        ApplicationArea = All;
                }
                field(budgetedAsset; Rec."Budgeted Asset")
                    {
                        Caption = 'Budgeted Asset';
                        ToolTip = 'Specifies the Budgeted Asset.';
                        ApplicationArea = All;
                }
                field(warrantyDate; Rec."Warranty Date")
                    {
                        Caption = 'Warranty Date';
                        ToolTip = 'Specifies the Warranty Date.';
                        ApplicationArea = All;
                }
                field(responsibleEmployee; Rec."Responsible Employee")
                    {
                        Caption = 'Responsible Employee';
                        ToolTip = 'Specifies the Responsible Employee.';
                        ApplicationArea = All;
                }
                field(serialNo; Rec."Serial No.")
                    {
                        Caption = 'Serial No.';
                        ToolTip = 'Specifies the Serial No..';
                        ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                    {
                        Caption = 'Last Date Modified';
                        ToolTip = 'Specifies the Last Date Modified.';
                        ApplicationArea = All;
                }
                field(insured; Rec.Insured)
                    {
                        Caption = 'Insured';
                        ToolTip = 'Specifies the Insured.';
                        ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                    {
                        Caption = 'Comment';
                        ToolTip = 'Specifies the Comment.';
                        ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                    {
                        Caption = 'Blocked';
                        ToolTip = 'Specifies the Blocked.';
                        ApplicationArea = All;
                }
                field(maintenanceVendorNo; Rec."Maintenance Vendor No.")
                    {
                        Caption = 'Maintenance Vendor No.';
                        ToolTip = 'Specifies the Maintenance Vendor No..';
                        ApplicationArea = All;
                }
                field(underMaintenance; Rec."Under Maintenance")
                    {
                        Caption = 'Under Maintenance';
                        ToolTip = 'Specifies the Under Maintenance.';
                        ApplicationArea = All;
                }
                field(nextServiceDate; Rec."Next Service Date")
                    {
                        Caption = 'Next Service Date';
                        ToolTip = 'Specifies the Next Service Date.';
                        ApplicationArea = All;
                }
                field(inactive; Rec.Inactive)
                    {
                        Caption = 'Inactive';
                        ToolTip = 'Specifies the Inactive.';
                        ApplicationArea = All;
                }
                field(faPostingDateFilter; Rec."FA Posting Date Filter")
                    {
                        Caption = 'FA Posting Date Filter';
                        ToolTip = 'Specifies the FA Posting Date Filter.';
                        ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                    {
                        Caption = 'No. Series';
                        ToolTip = 'Specifies the No. Series.';
                        ApplicationArea = All;
                }
                field(faPostingGroup; Rec."FA Posting Group")
                    {
                        Caption = 'FA Posting Group';
                        ToolTip = 'Specifies the FA Posting Group.';
                        ApplicationArea = All;
                }
                field(acquired; Rec.Acquired)
                    {
                        Caption = 'Acquired';
                        ToolTip = 'Specifies the Acquired.';
                        ApplicationArea = All;
                }
                field(image; Rec.Image)
                    {
                        Caption = 'Image';
                        ToolTip = 'Specifies the Image.';
                        ApplicationArea = All;
                }
                field(faLocationId; Rec."FA Location Id")
                    {
                        Caption = 'FA Location Id';
                        ToolTip = 'Specifies the FA Location Id.';
                        ApplicationArea = All;
                }
                field(responsibleEmployeeId; Rec."Responsible Employee Id")
                    {
                        Caption = 'Responsible Employee';
                        ToolTip = 'Specifies the Responsible Employee Id.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
