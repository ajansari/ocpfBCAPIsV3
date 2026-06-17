namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.FinanceCharge;

page 90935 "ocpfFinanceChargeMemoHeaders"
{
    PageType = API;
    Caption = 'Finance charge memo headers — open finance charge documents for overdue customers.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_systemAndSetup';
    APIVersion = 'v3.0';
    EntityName = 'ocpfFinanceChargeMemoHeader';
    EntitySetName = 'ocpfFinanceChargeMemoHeaders';
    SourceTable = "Finance Charge Memo Header";
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
                field(customerNo; Rec."Customer No.")
                    {
                        Caption = 'Customer No.';
                        ToolTip = 'Specifies the Customer No..';
                        ApplicationArea = All;
                }
                field(name; Rec.Name)
                    {
                        Caption = 'Name';
                        ToolTip = 'Specifies the Name.';
                        ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                    {
                        Caption = 'Name 2';
                        ToolTip = 'Specifies the Name 2.';
                        ApplicationArea = All;
                }
                field(address; Rec.Address)
                    {
                        Caption = 'Address';
                        ToolTip = 'Specifies the Address.';
                        ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                    {
                        Caption = 'Address 2';
                        ToolTip = 'Specifies the Address 2.';
                        ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                    {
                        Caption = 'Post Code';
                        ToolTip = 'Specifies the Post Code.';
                        ApplicationArea = All;
                }
                field(city; Rec.City)
                    {
                        Caption = 'City';
                        ToolTip = 'Specifies the City.';
                        ApplicationArea = All;
                }
                field(county; Rec.County)
                    {
                        Caption = 'County';
                        ToolTip = 'Specifies the County.';
                        ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                    {
                        Caption = 'Country/Region Code';
                        ToolTip = 'Specifies the Country/Region Code.';
                        ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                    {
                        Caption = 'Language Code';
                        ToolTip = 'Specifies the Language Code.';
                        ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                    {
                        Caption = 'Currency Code';
                        ToolTip = 'Specifies the Currency Code.';
                        ApplicationArea = All;
                }
                field(contact; Rec.Contact)
                    {
                        Caption = 'Contact';
                        ToolTip = 'Specifies the Contact.';
                        ApplicationArea = All;
                }
                field(yourReference; Rec."Your Reference")
                    {
                        Caption = 'Your Reference';
                        ToolTip = 'Specifies the Your Reference.';
                        ApplicationArea = All;
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                    {
                        Caption = 'Shortcut Dimension 1 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 1 Code.';
                        ApplicationArea = All;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                    {
                        Caption = 'Shortcut Dimension 2 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 2 Code.';
                        ApplicationArea = All;
                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                    {
                        Caption = 'Customer Posting Group';
                        ToolTip = 'Specifies the Customer Posting Group.';
                        ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                    {
                        Caption = 'Gen. Bus. Posting Group';
                        ToolTip = 'Specifies the Gen. Bus. Posting Group.';
                        ApplicationArea = All;
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                    {
                        Caption = 'VAT Registration No.';
                        ToolTip = 'Specifies the VAT Registration No..';
                        ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                    {
                        Caption = 'Reason Code';
                        ToolTip = 'Specifies the Reason Code.';
                        ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                    {
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the Posting Date.';
                        ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                    {
                        Caption = 'Document Date';
                        ToolTip = 'Specifies the Document Date.';
                        ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                    {
                        Caption = 'Due Date';
                        ToolTip = 'Specifies the Due Date.';
                        ApplicationArea = All;
                }
                field(finChargeTermsCode; Rec."Fin. Charge Terms Code")
                    {
                        Caption = 'Fin. Charge Terms Code';
                        ToolTip = 'Specifies the Fin. Charge Terms Code.';
                        ApplicationArea = All;
                }
                field(postInterest; Rec."Post Interest")
                    {
                        Caption = 'Post Interest';
                        ToolTip = 'Specifies the Post Interest.';
                        ApplicationArea = All;
                }
                field(postAdditionalFee; Rec."Post Additional Fee")
                    {
                        Caption = 'Post Additional Fee';
                        ToolTip = 'Specifies the Post Additional Fee.';
                        ApplicationArea = All;
                }
                field(postingDescription; Rec."Posting Description")
                    {
                        Caption = 'Posting Description';
                        ToolTip = 'Specifies the Posting Description.';
                        ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                    {
                        Caption = 'Comment';
                        ToolTip = 'Specifies the Comment.';
                        ApplicationArea = All;
                }
                field(remainingAmount; Rec."Remaining Amount")
                    {
                        Caption = 'Remaining Amount';
                        ToolTip = 'Specifies the Remaining Amount.';
                        ApplicationArea = All;
                }
                field(interestAmount; Rec."Interest Amount")
                    {
                        Caption = 'Interest Amount';
                        ToolTip = 'Specifies the Interest Amount.';
                        ApplicationArea = All;
                }
                field(additionalFee; Rec."Additional Fee")
                    {
                        Caption = 'Additional Fee';
                        ToolTip = 'Specifies the Additional Fee.';
                        ApplicationArea = All;
                }
                field(vatAmount; Rec."VAT Amount")
                    {
                        Caption = 'VAT Amount';
                        ToolTip = 'Specifies the VAT Amount.';
                        ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                    {
                        Caption = 'No. Series';
                        ToolTip = 'Specifies the No. Series.';
                        ApplicationArea = All;
                }
                field(issuingNoSeries; Rec."Issuing No. Series")
                    {
                        Caption = 'Issuing No. Series';
                        ToolTip = 'Specifies the Issuing No. Series.';
                        ApplicationArea = All;
                }
                field(issuingNo; Rec."Issuing No.")
                    {
                        Caption = 'Issuing No.';
                        ToolTip = 'Specifies the Issuing No..';
                        ApplicationArea = All;
                }
                field(taxAreaCode; Rec."Tax Area Code")
                    {
                        Caption = 'Tax Area Code';
                        ToolTip = 'Specifies the Tax Area Code.';
                        ApplicationArea = All;
                }
                field(taxLiable; Rec."Tax Liable")
                    {
                        Caption = 'Tax Liable';
                        ToolTip = 'Specifies the Tax Liable.';
                        ApplicationArea = All;
                }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                    {
                        Caption = 'VAT Bus. Posting Group';
                        ToolTip = 'Specifies the VAT Bus. Posting Group.';
                        ApplicationArea = All;
                }
                field(vatReportingDate; Rec."VAT Reporting Date")
                    {
                        Caption = 'VAT Date';
                        ToolTip = 'Specifies the VAT Reporting Date.';
                        ApplicationArea = All;
                }
                field(formatRegion; Rec."Format Region")
                    {
                        Caption = 'Format Region';
                        ToolTip = 'Specifies the Format Region.';
                        ApplicationArea = All;
                }
                field(companyBankAccountCode; Rec."Company Bank Account Code")
                    {
                        Caption = 'Company Bank Account Code';
                        ToolTip = 'Specifies the Company Bank Account Code.';
                        ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                    {
                        Caption = 'Dimension Set ID';
                        ToolTip = 'Specifies the Dimension Set ID.';
                        ApplicationArea = All;
                }
                field(assignedUserId; Rec."Assigned User ID")
                    {
                        Caption = 'Assigned User ID';
                        ToolTip = 'Specifies the Assigned User ID.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
