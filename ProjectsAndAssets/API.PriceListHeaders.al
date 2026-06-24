namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Pricing.PriceList;

page 90922 "ocpfPriceListHeaders"
{
    PageType = API;
    Caption = 'Price list headers — named price lists with effectivity dates and assignment scope.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0';
    EntityName = 'ocpfPriceListHeader';
    EntitySetName = 'ocpfPriceListHeaders';
    SourceTable = "Price List Header";
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
                field(code; Rec.Code)
                    {
                        Caption = 'Code';
                        ToolTip = 'Specifies the Code.';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(sourceGroup; Rec."Source Group")
                    {
                        Caption = 'Assign-to Group';
                        ToolTip = 'Specifies the Source Group.';
                        ApplicationArea = All;
                }
                field(sourceType; Rec."Source Type")
                    {
                        Caption = 'Assign-to Type';
                        ToolTip = 'Specifies the Source Type.';
                        ApplicationArea = All;
                }
                field(sourceNo; Rec."Source No.")
                    {
                        Caption = 'Assign-to No. (custom)';
                        ToolTip = 'Specifies the Source No..';
                        ApplicationArea = All;
                }
                field(parentSourceNo; Rec."Parent Source No.")
                    {
                        Caption = 'Assign-to Parent No. (projects)';
                        ToolTip = 'Specifies the Parent Source No..';
                        ApplicationArea = All;
                }
                field(sourceId; Rec."Source ID")
                    {
                        Caption = 'Assign-to ID';
                        ToolTip = 'Specifies the Source ID.';
                        ApplicationArea = All;
                }
                field(priceType; Rec."Price Type")
                    {
                        Caption = 'Price Type';
                        ToolTip = 'Specifies the Price Type.';
                        ApplicationArea = All;
                }
                field(amountType; Rec."Amount Type")
                    {
                        Caption = 'Defines';
                        ToolTip = 'Specifies the Amount Type.';
                        ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                    {
                        Caption = 'Currency Code';
                        ToolTip = 'Specifies the Currency Code.';
                        ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                    {
                        Caption = 'Starting Date';
                        ToolTip = 'Specifies the Starting Date.';
                        ApplicationArea = All;
                }
                field(endingDate; Rec."Ending Date")
                    {
                        Caption = 'Ending Date';
                        ToolTip = 'Specifies the Ending Date.';
                        ApplicationArea = All;
                }
                field(priceIncludesVat; Rec."Price Includes VAT")
                    {
                        Caption = 'Price Includes VAT';
                        ToolTip = 'Specifies the Price Includes VAT.';
                        ApplicationArea = All;
                }
                field(vatBusPostingGrPrice; Rec."VAT Bus. Posting Gr. (Price)")
                    {
                        Caption = 'VAT Bus. Posting Gr. (Price)';
                        ToolTip = 'Specifies the VAT Bus. Posting Gr. (Price).';
                        ApplicationArea = All;
                }
                field(allowLineDisc; Rec."Allow Line Disc.")
                    {
                        Caption = 'Allow Line Disc.';
                        ToolTip = 'Specifies the Allow Line Disc..';
                        ApplicationArea = All;
                }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
                    {
                        Caption = 'Allow Invoice Disc.';
                        ToolTip = 'Specifies the Allow Invoice Disc..';
                        ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                    {
                        Caption = 'No. Series';
                        ToolTip = 'Specifies the No. Series.';
                        ApplicationArea = All;
                }
                field(status; Rec.Status)
                    {
                        Caption = 'Status';
                        ToolTip = 'Specifies the Status.';
                        ApplicationArea = All;
                }
                field(filterSourceNo; Rec."Filter Source No.")
                    {
                        Caption = 'Filter Source No.';
                        ToolTip = 'Specifies the Filter Source No..';
                        ApplicationArea = All;
                }
                field(allowUpdatingDefaults; Rec."Allow Updating Defaults")
                    {
                        Caption = 'Allow Updating Defaults';
                        ToolTip = 'Specifies the Allow Updating Defaults.';
                        ApplicationArea = All;
                }
                field(assignToNo; Rec."Assign-to No.")
                    {
                        Caption = 'Assign-to No.';
                        ToolTip = 'Specifies the Assign-to No..';
                        ApplicationArea = All;
                }
                field(assignToParentNo; Rec."Assign-to Parent No.")
                    {
                        Caption = 'Assign-to Parent No.';
                        ToolTip = 'Specifies the Assign-to Parent No..';
                        ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                    {
                        Caption = 'Last Modified DateTime';
                        ToolTip = 'Specifies the Last Modified DateTime.';
                        ApplicationArea = All;
                    }
            }
        }
    }
}
