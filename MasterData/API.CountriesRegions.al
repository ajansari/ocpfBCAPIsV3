namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Foundation.Address;

page 90836 "ocpfCountriesRegions"
{
    PageType = API;
    Caption = 'Countries and Regions — reference data for country and region codes used on addresses, customers, vendors, and contacts.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfCountryRegion';
    EntitySetName = 'ocpfCountriesRegions';
    SourceTable = "Country/Region";
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
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for this country/region record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this country/region record.';
                    ApplicationArea = All;
                }
                field(iSOCode; Rec."ISO Code")
                {
                    Caption = 'ISO Code';
                    ToolTip = 'Specifies the iso code for this country/region record.';
                    ApplicationArea = All;
                }
                field(iSONumericCode; Rec."ISO Numeric Code")
                {
                    Caption = 'ISO Numeric Code';
                    ToolTip = 'Specifies the iso numeric code for this country/region record.';
                    ApplicationArea = All;
                }
                field(eUCountryRegionCode; Rec."EU Country/Region Code")
                {
                    Caption = 'EU Country/Region Code';
                    ToolTip = 'Specifies the eu country/region code for this country/region record.';
                    ApplicationArea = All;
                }
                field(intrastatCode; Rec."Intrastat Code")
                {
                    Caption = 'Intrastat Code';
                    ToolTip = 'Specifies the intrastat code for this country/region record.';
                    ApplicationArea = All;
                }
                field(addressFormat; Rec."Address Format")
                {
                    Caption = 'Address Format';
                    ToolTip = 'Specifies the address format for this country/region record.';
                    ApplicationArea = All;
                }
                field(contactAddressFormat; Rec."Contact Address Format")
                {
                    Caption = 'Contact Address Format';
                    ToolTip = 'Specifies the contact address format for this country/region record.';
                    ApplicationArea = All;
                }
                field(vATScheme; Rec."VAT Scheme")
                {
                    Caption = 'VAT Scheme';
                    ToolTip = 'Specifies the vat scheme for this country/region record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this country/region record.';
                    ApplicationArea = All;
                }
                field(countyName; Rec."County Name")
                {
                    Caption = 'County Name';
                    ToolTip = 'Specifies the county name for this country/region record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}