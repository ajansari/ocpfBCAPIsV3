namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.VAT.Setup;

page 90819 "ocpfVatPostingSetup"
{
    PageType = API;
    Caption = 'VAT Posting Setup — matrix mapping VAT Business and VAT Product Posting Groups to VAT rates, calculation types, and the G/L accounts used when posting VAT.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfVatPostingSetup';
    EntitySetName = 'ocpfVatPostingSetup';
    SourceTable = "VAT Posting Setup";
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
                field(vATBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ToolTip = 'Specifies the vat bus. posting group for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                    ToolTip = 'Specifies the vat prod. posting group for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(vATCalculationType; Rec."VAT Calculation Type")
                {
                    Caption = 'VAT Calculation Type';
                    ToolTip = 'Specifies the vat calculation type for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(vAT; Rec."VAT %")
                {
                    Caption = 'VAT %';
                    ToolTip = 'Specifies the vat % for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(unrealizedVatType; Rec."Unrealized VAT Type")
                {
                    Caption = 'Unrealized VAT Type';
                    ToolTip = 'Specifies the unrealized vat type for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(adjustForPaymentDiscount; Rec."Adjust for Payment Discount")
                {
                    Caption = 'Adjust for Payment Discount';
                    ToolTip = 'Specifies the adjust for payment discount for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(salesVatAccount; Rec."Sales VAT Account")
                {
                    Caption = 'Sales VAT Account';
                    ToolTip = 'Specifies the sales vat account for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(salesVatUnrealAccount; Rec."Sales VAT Unreal. Account")
                {
                    Caption = 'Sales VAT Unreal. Account';
                    ToolTip = 'Specifies the sales vat unreal. account for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(purchaseVatAccount; Rec."Purchase VAT Account")
                {
                    Caption = 'Purchase VAT Account';
                    ToolTip = 'Specifies the purchase vat account for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(purchVatUnrealAccount; Rec."Purch. VAT Unreal. Account")
                {
                    Caption = 'Purch. VAT Unreal. Account';
                    ToolTip = 'Specifies the purch. vat unreal. account for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(reverseChrgVatAcc; Rec."Reverse Chrg. VAT Acc.")
                {
                    Caption = 'Reverse Chrg. VAT Acc.';
                    ToolTip = 'Specifies the reverse chrg. vat acc. for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(reverseChrgVatUnrealAcc; Rec."Reverse Chrg. VAT Unreal. Acc.")
                {
                    Caption = 'Reverse Chrg. VAT Unreal. Acc.';
                    ToolTip = 'Specifies the reverse chrg. vat unreal. acc. for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(vATIdentifier; Rec."VAT Identifier")
                {
                    Caption = 'VAT Identifier';
                    ToolTip = 'Specifies the vat identifier for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(eUService; Rec."EU Service")
                {
                    Caption = 'EU Service';
                    ToolTip = 'Specifies the eu service for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(vATClauseCode; Rec."VAT Clause Code")
                {
                    Caption = 'VAT Clause Code';
                    ToolTip = 'Specifies the vat clause code for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(certificateOfSupplyRequired; Rec."Certificate of Supply Required")
                {
                    Caption = 'Certificate of Supply Required';
                    ToolTip = 'Specifies the certificate of supply required for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(taxCategory; Rec."Tax Category")
                {
                    Caption = 'Tax Category';
                    ToolTip = 'Specifies the tax category for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the blocked for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(saleVatReportingCode; Rec."Sale VAT Reporting Code")
                {
                    Caption = 'Sale VAT Reporting Code';
                    ToolTip = 'Specifies the sale vat reporting code for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(purchVatReportingCode; Rec."Purch. VAT Reporting Code")
                {
                    Caption = 'Purchase VAT Reporting Code';
                    ToolTip = 'Specifies the purch. vat reporting code for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(nonDeductibleVat; Rec."Non-Deductible VAT %")
                {
                    Caption = 'Non-Deductible VAT %';
                    ToolTip = 'Specifies the non-deductible vat % for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(nonDedPurchaseVatAccount; Rec."Non-Ded. Purchase VAT Account")
                {
                    Caption = 'Non-Deductible Purchase VAT Account';
                    ToolTip = 'Specifies the non-ded. purchase vat account for this vat posting setup record.';
                    ApplicationArea = All;
                }
                field(allowNonDeductibleVat; Rec."Allow Non-Deductible VAT")
                {
                    Caption = 'Allow Non-Deductible VAT';
                    ToolTip = 'Specifies the allow non-deductible vat for this vat posting setup record.';
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