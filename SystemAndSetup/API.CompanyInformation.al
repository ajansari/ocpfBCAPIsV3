namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Foundation.Company;

page 90931 "ocpfCompanyInformation"
{
    PageType = API;
    Caption = 'Company information — name, address, registration, and contact details for this company.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_systemAndSetup';
    APIVersion = 'v3.0';
    EntityName = 'ocpfCompanyInformation';
    EntitySetName = 'ocpfCompanyInformation';
    SourceTable = "Company Information";
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
                field(primaryKey; Rec."Primary Key")
                    {
                        Caption = 'Primary Key';
                        ToolTip = 'Specifies the Primary Key.';
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
                field(city; Rec.City)
                    {
                        Caption = 'City';
                        ToolTip = 'Specifies the City.';
                        ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                    {
                        Caption = 'Phone No.';
                        ToolTip = 'Specifies the Phone No..';
                        ApplicationArea = All;
                }
                field(phoneNo2; Rec."Phone No. 2")
                    {
                        Caption = 'Phone No. 2';
                        ToolTip = 'Specifies the Phone No. 2.';
                        ApplicationArea = All;
                }
                field(telexNo; Rec."Telex No.")
                    {
                        Caption = 'Telex No.';
                        ToolTip = 'Specifies the Telex No..';
                        ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                    {
                        Caption = 'Fax No.';
                        ToolTip = 'Specifies the Fax No..';
                        ApplicationArea = All;
                }
                field(giroNo; Rec."Giro No.")
                    {
                        Caption = 'Giro No.';
                        ToolTip = 'Specifies the Giro No..';
                        ApplicationArea = All;
                }
                field(bankName; Rec."Bank Name")
                    {
                        Caption = 'Bank Name';
                        ToolTip = 'Specifies the Bank Name.';
                        ApplicationArea = All;
                }
                field(bankBranchNo; Rec."Bank Branch No.")
                    {
                        Caption = 'Bank Branch No.';
                        ToolTip = 'Specifies the Bank Branch No..';
                        ApplicationArea = All;
                }
                field(bankAccountNo; Rec."Bank Account No.")
                    {
                        Caption = 'Bank Account No.';
                        ToolTip = 'Specifies the Bank Account No..';
                        ApplicationArea = All;
                }
                field(paymentRoutingNo; Rec."Payment Routing No.")
                    {
                        Caption = 'Payment Routing No.';
                        ToolTip = 'Specifies the Payment Routing No..';
                        ApplicationArea = All;
                }
                field(customsPermitNo; Rec."Customs Permit No.")
                    {
                        Caption = 'Customs Permit No.';
                        ToolTip = 'Specifies the Customs Permit No..';
                        ApplicationArea = All;
                }
                field(customsPermitDate; Rec."Customs Permit Date")
                    {
                        Caption = 'Customs Permit Date';
                        ToolTip = 'Specifies the Customs Permit Date.';
                        ApplicationArea = All;
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                    {
                        Caption = 'VAT Registration No.';
                        ToolTip = 'Specifies the VAT Registration No..';
                        ApplicationArea = All;
                }
                field(registrationNo; Rec."Registration No.")
                    {
                        Caption = 'Registration No.';
                        ToolTip = 'Specifies the Registration No..';
                        ApplicationArea = All;
                }
                field(telexAnswerBack; Rec."Telex Answer Back")
                    {
                        Caption = 'Telex Answer Back';
                        ToolTip = 'Specifies the Telex Answer Back.';
                        ApplicationArea = All;
                }
                field(shipToName; Rec."Ship-to Name")
                    {
                        Caption = 'Ship-to Name';
                        ToolTip = 'Specifies the Ship-to Name.';
                        ApplicationArea = All;
                }
                field(shipToName2; Rec."Ship-to Name 2")
                    {
                        Caption = 'Ship-to Name 2';
                        ToolTip = 'Specifies the Ship-to Name 2.';
                        ApplicationArea = All;
                }
                field(shipToAddress; Rec."Ship-to Address")
                    {
                        Caption = 'Ship-to Address';
                        ToolTip = 'Specifies the Ship-to Address.';
                        ApplicationArea = All;
                }
                field(shipToAddress2; Rec."Ship-to Address 2")
                    {
                        Caption = 'Ship-to Address 2';
                        ToolTip = 'Specifies the Ship-to Address 2.';
                        ApplicationArea = All;
                }
                field(shipToCity; Rec."Ship-to City")
                    {
                        Caption = 'Ship-to City';
                        ToolTip = 'Specifies the Ship-to City.';
                        ApplicationArea = All;
                }
                field(shipToContact; Rec."Ship-to Contact")
                    {
                        Caption = 'Ship-to Contact';
                        ToolTip = 'Specifies the Ship-to Contact.';
                        ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                    {
                        Caption = 'Location Code';
                        ToolTip = 'Specifies the Location Code.';
                        ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                    {
                        Caption = 'Post Code';
                        ToolTip = 'Specifies the Post Code.';
                        ApplicationArea = All;
                }
                field(county; Rec.County)
                    {
                        Caption = 'County';
                        ToolTip = 'Specifies the County.';
                        ApplicationArea = All;
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                    {
                        Caption = 'Ship-to Post Code';
                        ToolTip = 'Specifies the Ship-to Post Code.';
                        ApplicationArea = All;
                }
                field(shipToCounty; Rec."Ship-to County")
                    {
                        Caption = 'Ship-to County';
                        ToolTip = 'Specifies the Ship-to County.';
                        ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                    {
                        Caption = 'Email';
                        ToolTip = 'Specifies the E-Mail.';
                        ApplicationArea = All;
                }
                field(homePage; Rec."Home Page")
                    {
                        Caption = 'Home Page';
                        ToolTip = 'Specifies the Home Page.';
                        ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                    {
                        Caption = 'Country/Region Code';
                        ToolTip = 'Specifies the Country/Region Code.';
                        ApplicationArea = All;
                }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code")
                    {
                        Caption = 'Ship-to Country/Region Code';
                        ToolTip = 'Specifies the Ship-to Country/Region Code.';
                        ApplicationArea = All;
                }
                field(iban; Rec.IBAN)
                    {
                        Caption = 'IBAN';
                        ToolTip = 'Specifies the IBAN.';
                        ApplicationArea = All;
                }
                field(swiftCode; Rec."SWIFT Code")
                    {
                        Caption = 'SWIFT Code';
                        ToolTip = 'Specifies the SWIFT Code.';
                        ApplicationArea = All;
                }
                field(industrialClassification; Rec."Industrial Classification")
                    {
                        Caption = 'Industrial Classification';
                        ToolTip = 'Specifies the Industrial Classification.';
                        ApplicationArea = All;
                }
                field(systemIndicator; Rec."System Indicator")
                    {
                        Caption = 'System Indicator';
                        ToolTip = 'Specifies the System Indicator.';
                        ApplicationArea = All;
                }
                field(customSystemIndicatorText; Rec."Custom System Indicator Text")
                    {
                        Caption = 'Custom System Indicator Text';
                        ToolTip = 'Specifies the Custom System Indicator Text.';
                        ApplicationArea = All;
                }
                field(systemIndicatorStyle; Rec."System Indicator Style")
                    {
                        Caption = 'System Indicator Style';
                        ToolTip = 'Specifies the System Indicator Style.';
                        ApplicationArea = All;
                }
                field(allowBlankPaymentInfo; Rec."Allow Blank Payment Info.")
                    {
                        Caption = 'Allow Blank Payment Info.';
                        ToolTip = 'Specifies the Allow Blank Payment Info..';
                        ApplicationArea = All;
                }
                field(contactPerson; Rec."Contact Person")
                    {
                        Caption = 'Contact Person';
                        ToolTip = 'Specifies the Contact Person.';
                        ApplicationArea = All;
                }
                field(shipToPhoneNo; Rec."Ship-to Phone No.")
                    {
                        Caption = 'Ship-to Phone No.';
                        ToolTip = 'Specifies the Ship-to Phone No..';
                        ApplicationArea = All;
                }
                field(gln; Rec.GLN)
                    {
                        Caption = 'GLN';
                        ToolTip = 'Specifies the GLN.';
                        ApplicationArea = All;
                }
                field(eoriNumber; Rec."EORI Number")
                    {
                        Caption = 'EORI Number';
                        ToolTip = 'Specifies the EORI Number.';
                        ApplicationArea = All;
                }
                field(useGlnInElectronicDocument; Rec."Use GLN in Electronic Document")
                    {
                        Caption = 'Use GLN in Electronic Documents';
                        ToolTip = 'Specifies the Use GLN in Electronic Document.';
                        ApplicationArea = All;
                }
                field(pictureLastModDateTime; Rec."Picture - Last Mod. Date Time")
                    {
                        Caption = 'Picture - Last Mod. Date Time';
                        ToolTip = 'Specifies the Picture - Last Mod. Date Time.';
                        ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                    {
                        Caption = 'Last Modified Date Time';
                        ToolTip = 'Specifies the Last Modified Date Time.';
                        ApplicationArea = All;
                }
                field(createdDatetime; Rec."Created DateTime")
                    {
                        Caption = 'Created DateTime';
                        ToolTip = 'Specifies the Created DateTime.';
                        ApplicationArea = All;
                }
                field(demoCompany; Rec."Demo Company")
                    {
                        Caption = 'Demo Company';
                        ToolTip = 'Specifies the Demo Company.';
                        ApplicationArea = All;
                }
                field(alternativeLanguageCode; Rec."Alternative Language Code")
                    {
                        Caption = 'Alternative Language Code';
                        ToolTip = 'Specifies the Alternative Language Code.';
                        ApplicationArea = All;
                }
                field(brandColorValue; Rec."Brand Color Value")
                    {
                        Caption = 'Brand Color Value';
                        ToolTip = 'Specifies the Brand Color Value.';
                        ApplicationArea = All;
                }
                field(brandColorCode; Rec."Brand Color Code")
                    {
                        Caption = 'Brand Color Code';
                        ToolTip = 'Specifies the Brand Color Code.';
                        ApplicationArea = All;
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                    {
                        Caption = 'Responsibility Center';
                        ToolTip = 'Specifies the Responsibility Center.';
                        ApplicationArea = All;
                }
                field(checkAvailPeriodCalc; Rec."Check-Avail. Period Calc.")
                    {
                        Caption = 'Check-Avail. Period Calc.';
                        ToolTip = 'Specifies the Check-Avail. Period Calc..';
                        ApplicationArea = All;
                }
                field(checkAvailTimeBucket; Rec."Check-Avail. Time Bucket")
                    {
                        Caption = 'Check-Avail. Time Bucket';
                        ToolTip = 'Specifies the Check-Avail. Time Bucket.';
                        ApplicationArea = All;
                }
                field(baseCalendarCode; Rec."Base Calendar Code")
                    {
                        Caption = 'Base Calendar Code';
                        ToolTip = 'Specifies the Base Calendar Code.';
                        ApplicationArea = All;
                }
                field(calConvergenceTimeFrame; Rec."Cal. Convergence Time Frame")
                    {
                        Caption = 'Cal. Convergence Time Frame';
                        ToolTip = 'Specifies the Cal. Convergence Time Frame.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
