namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Purchases.Vendor;

page 90860 "ocpfVendorBankAccounts"
{
    PageType = API;
    Caption = 'Vendor Bank Accounts — bank account details defined per vendor, used for electronic payments and remittance.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.1';
    EntityName = 'ocpfVendorBankAccount';
    EntitySetName = 'ocpfVendorBankAccounts';
    SourceTable = "Vendor Bank Account";
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
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the vendor no. for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(code; Rec."Code")
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(name; Rec."Name")
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies the name 2 for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(address; Rec."Address")
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the address for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies the address 2 for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(city; Rec."City")
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the post code for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(contact; Rec."Contact")
                {
                    Caption = 'Contact';
                    ToolTip = 'Specifies the contact for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the phone no. for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(telexNo; Rec."Telex No.")
                {
                    Caption = 'Telex No.';
                    ToolTip = 'Specifies the telex no. for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(bankBranchNo; Rec."Bank Branch No.")
                {
                    Caption = 'Bank Branch No.';
                    ToolTip = 'Specifies the bank branch no. for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(bankAccountNo; Rec."Bank Account No.")
                {
                    Caption = 'Bank Account No.';
                    ToolTip = 'Specifies the bank account no. for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(transitNo; Rec."Transit No.")
                {
                    Caption = 'Transit No.';
                    ToolTip = 'Specifies the transit no. for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region code for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(county; Rec."County")
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the county for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the fax no. for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(telexAnswerBack; Rec."Telex Answer Back")
                {
                    Caption = 'Telex Answer Back';
                    ToolTip = 'Specifies the telex answer back for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                    ToolTip = 'Specifies the language code for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                    ToolTip = 'Specifies the e-mail for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Home Page';
                    ToolTip = 'Specifies the home page for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(iban; Rec."IBAN")
                {
                    Caption = 'IBAN';
                    ToolTip = 'Specifies the iban for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(swiftCode; Rec."SWIFT Code")
                {
                    Caption = 'SWIFT Code';
                    ToolTip = 'Specifies the swift code for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(bankClearingCode; Rec."Bank Clearing Code")
                {
                    Caption = 'Bank Clearing Code';
                    ToolTip = 'Specifies the bank clearing code for this vendor bank account record.';
                    ApplicationArea = All;
                }
                field(bankClearingStandard; Rec."Bank Clearing Standard")
                {
                    Caption = 'Bank Clearing Standard';
                    ToolTip = 'Specifies the bank clearing standard for this vendor bank account record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
