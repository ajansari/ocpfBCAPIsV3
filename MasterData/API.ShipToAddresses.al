namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Sales.Customer;

page 90859 "ocpfShipToAddresses"
{
    PageType = API;
    Caption = 'Ship-to Addresses — alternate delivery addresses defined per customer for use on sales and service documents.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.1';
    EntityName = 'ocpfShipToAddress';
    EntitySetName = 'ocpfShipToAddresses';
    SourceTable = "Ship-to Address";
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
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the customer number.';
                    ApplicationArea = All;
                }
                field(code; Rec."Code")
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies a ship-to address code.';
                    ApplicationArea = All;
                }
                field(name; Rec."Name")
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name associated with the ship-to address.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies an additional part of the name.';
                    ApplicationArea = All;
                }
                field(address; Rec."Address")
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the ship-to address.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies additional address information.';
                    ApplicationArea = All;
                }
                field(city; Rec."City")
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city the items are being shipped to.';
                    ApplicationArea = All;
                }
                field(contact; Rec."Contact")
                {
                    Caption = 'Contact';
                    ToolTip = 'Specifies the name of the person you contact about orders shipped to this address.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the recipient''s telephone number.';
                    ApplicationArea = All;
                }
                field(telexNo; Rec."Telex No.")
                {
                    Caption = 'Telex No.';
                    ToolTip = 'Specifies the Telex No..';
                    ApplicationArea = All;
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                    ToolTip = 'Specifies a code for the salesperson who normally handles this customer''s recipient.';
                    ApplicationArea = All;
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                    ToolTip = 'Specifies a code for the shipment method to be used for the recipient.';
                    ApplicationArea = All;
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                    ToolTip = 'Specifies the code for the shipping agent who is transporting the items.';
                    ApplicationArea = All;
                }
                field(placeOfExport; Rec."Place of Export")
                {
                    Caption = 'Place of Export';
                    ToolTip = 'Specifies the Place of Export.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region of the address.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies when the ship-to address was last modified.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location code to be used for the recipient.';
                    ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the recipient''s fax number.';
                    ApplicationArea = All;
                }
                field(telexAnswerBack; Rec."Telex Answer Back")
                {
                    Caption = 'Telex Answer Back';
                    ToolTip = 'Specifies the Telex Answer Back.';
                    ApplicationArea = All;
                }
                field(gln; Rec."GLN")
                {
                    Caption = 'GLN';
                    ToolTip = 'Specifies the recipient''s GLN code.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the postal code.';
                    ApplicationArea = All;
                }
                field(county; Rec."County")
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the state, province, or county as a part of the address.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the recipient''s email address.';
                    ApplicationArea = All;
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Home Page';
                    ToolTip = 'Specifies the recipient''s web site.';
                    ApplicationArea = All;
                }
                field(taxAreaCode; Rec."Tax Area Code")
                {
                    Caption = 'Tax Area Code';
                    ToolTip = 'Specifies the tax area that is used to calculate and post sales tax.';
                    ApplicationArea = All;
                }
                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';
                    ToolTip = 'Specifies if the customer or vendor is liable for sales tax.';
                    ApplicationArea = All;
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                    ToolTip = 'Specifies the code for the service, such as a one-day delivery, that is offered by the shipping agent.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
