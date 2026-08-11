namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Pricing.PriceList;

page 90923 "ocpfPriceListLines"
{
    PageType = API;
    Caption = 'Price list lines — individual price or discount rules within a price list.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfPriceListLine';
    EntitySetName = 'ocpfPriceListLines';
    SourceTable = "Price List Line";
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
                field(priceListCode; Rec."Price List Code")
                    {
                        Caption = 'Price List Code';
                        ToolTip = 'Specifies the Price List Code.';
                        ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                    {
                        Caption = 'Line No.';
                        ToolTip = 'Specifies the Line No..';
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
                        Caption = 'Assign-to Parent No. (custom)';
                        ToolTip = 'Specifies the Parent Source No..';
                        ApplicationArea = All;
                }
                field(sourceId; Rec."Source ID")
                    {
                        Caption = 'Assign-to ID';
                        ToolTip = 'Specifies the Source ID.';
                        ApplicationArea = All;
                }
                field(assetType; Rec."Asset Type")
                    {
                        Caption = 'Product Type';
                        ToolTip = 'Specifies the Asset Type.';
                        ApplicationArea = All;
                }
                field(assetNo; Rec."Asset No.")
                    {
                        Caption = 'Product No. (custom)';
                        ToolTip = 'Specifies the Asset No..';
                        ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                    {
                        Caption = 'Variant Code (custom)';
                        ToolTip = 'Specifies the Variant Code.';
                        ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                    {
                        Caption = 'Currency Code';
                        ToolTip = 'Specifies the Currency Code.';
                        ApplicationArea = All;
                }
                field(workTypeCode; Rec."Work Type Code")
                    {
                        Caption = 'Work Type Code';
                        ToolTip = 'Specifies the Work Type Code.';
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
                field(minimumQuantity; Rec."Minimum Quantity")
                    {
                        Caption = 'Minimum Quantity';
                        ToolTip = 'Specifies the Minimum Quantity.';
                        ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                    {
                        Caption = 'Unit of Measure Code (custom)';
                        ToolTip = 'Specifies the Unit of Measure Code.';
                        ApplicationArea = All;
                }
                field(amountType; Rec."Amount Type")
                    {
                        Caption = 'Defines';
                        ToolTip = 'Specifies the Amount Type.';
                        ApplicationArea = All;
                }
                field(unitPrice; Rec."Unit Price")
                    {
                        Caption = 'Unit Price';
                        ToolTip = 'Specifies the Unit Price.';
                        ApplicationArea = All;
                }
                field(costFactor; Rec."Cost Factor")
                    {
                        Caption = 'Cost Factor';
                        ToolTip = 'Specifies the Cost Factor.';
                        ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                    {
                        Caption = 'Unit Cost';
                        ToolTip = 'Specifies the Unit Cost.';
                        ApplicationArea = All;
                }
                field(lineDiscountPct; Rec."Line Discount %")
                    {
                        Caption = 'Line Discount %';
                        ToolTip = 'Specifies the Line Discount %.';
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
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
                    {
                        Caption = 'VAT Prod. Posting Group';
                        ToolTip = 'Specifies the VAT Prod. Posting Group.';
                        ApplicationArea = All;
                }
                field(assetId; Rec."Asset ID")
                    {
                        Caption = 'Asset ID';
                        ToolTip = 'Specifies the Asset ID.';
                        ApplicationArea = All;
                }
                field(lineAmount; Rec."Line Amount")
                    {
                        Caption = 'Line Amount';
                        ToolTip = 'Specifies the Line Amount.';
                        ApplicationArea = All;
                }
                field(priceType; Rec."Price Type")
                    {
                        Caption = 'Price Type';
                        ToolTip = 'Specifies the Price Type.';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(status; Rec.Status)
                    {
                        Caption = 'Price Status';
                        ToolTip = 'Specifies the Status.';
                        ApplicationArea = All;
                }
                field(directUnitCost; Rec."Direct Unit Cost")
                    {
                        Caption = 'Direct Unit Cost';
                        ToolTip = 'Specifies the Direct Unit Cost.';
                        ApplicationArea = All;
                }
                field(sourceGroup; Rec."Source Group")
                    {
                        Caption = 'Source Group';
                        ToolTip = 'Specifies the Source Group.';
                        ApplicationArea = All;
                }
                field(productNo; Rec."Product No.")
                    {
                        Caption = 'Product No.';
                        ToolTip = 'Specifies the Product No..';
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
                field(variantCodeLookup; Rec."Variant Code Lookup")
                    {
                        Caption = 'Variant Code';
                        ToolTip = 'Specifies the Variant Code Lookup.';
                        ApplicationArea = All;
                }
                field(unitOfMeasureCodeLookup; Rec."Unit of Measure Code Lookup")
                    {
                        Caption = 'Unit of Measure Code';
                        ToolTip = 'Specifies the Unit of Measure Code Lookup.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
