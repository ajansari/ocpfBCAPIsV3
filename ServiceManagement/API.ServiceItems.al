namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Item;

page 90983 "ocpfServiceItems"
{
    PageType = API;
    Caption = 'Service Items — customer-owned equipment units that are serviced, with warranty, contract, and installation details.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceItem';
    EntitySetName = 'ocpfServiceItems';
    SourceTable = "Service Item";
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
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(serialNo; Rec."Serial No.")
                {
                    Caption = 'Serial No.';
                    ToolTip = 'Specifies the serial number of this item.';
                    ApplicationArea = All;
                }
                field(serviceItemGroupCode; Rec."Service Item Group Code")
                {
                    Caption = 'Service Item Group Code';
                    ToolTip = 'Specifies the code of the service item group associated with this item.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of this item.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies the Description 2.';
                    ApplicationArea = All;
                }
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the status of the service item.';
                    ApplicationArea = All;
                }
                field(priority; Rec."Priority")
                {
                    Caption = 'Priority';
                    ToolTip = 'Specifies the service priority for this item.';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the number of the customer who owns this item.';
                    ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the item number linked to the service item.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    ApplicationArea = All;
                }
                field(locationOfServiceItem; Rec."Location of Service Item")
                {
                    Caption = 'Location of Service Item';
                    ToolTip = 'Specifies the code of the location of this item.';
                    ApplicationArea = All;
                }
                field(salesUnitPrice; Rec."Sales Unit Price")
                {
                    Caption = 'Sales Unit Price';
                    ToolTip = 'Specifies the unit price of this item when it was sold.';
                    ApplicationArea = All;
                }
                field(salesUnitCost; Rec."Sales Unit Cost")
                {
                    Caption = 'Sales Unit Cost';
                    ToolTip = 'Specifies the unit cost of this item when it was sold.';
                    ApplicationArea = All;
                }
                field(warrantyStartingDateLabor; Rec."Warranty Starting Date (Labor)")
                {
                    Caption = 'Warranty Starting Date (Labor)';
                    ToolTip = 'Specifies the starting date of the labor warranty for this item.';
                    ApplicationArea = All;
                }
                field(warrantyEndingDateLabor; Rec."Warranty Ending Date (Labor)")
                {
                    Caption = 'Warranty Ending Date (Labor)';
                    ToolTip = 'Specifies the ending date of the labor warranty for this item.';
                    ApplicationArea = All;
                }
                field(warrantyStartingDateParts; Rec."Warranty Starting Date (Parts)")
                {
                    Caption = 'Warranty Starting Date (Parts)';
                    ToolTip = 'Specifies the starting date of the spare parts warranty for this item.';
                    ApplicationArea = All;
                }
                field(warrantyEndingDateParts; Rec."Warranty Ending Date (Parts)")
                {
                    Caption = 'Warranty Ending Date (Parts)';
                    ToolTip = 'Specifies the ending date of the spare parts warranty for this item.';
                    ApplicationArea = All;
                }
                field(warrantyPctParts; Rec."Warranty % (Parts)")
                {
                    Caption = 'Warranty % (Parts)';
                    ToolTip = 'Specifies the percentage of spare parts costs covered by the warranty for the item.';
                    ApplicationArea = All;
                }
                field(warrantyPctLabor; Rec."Warranty % (Labor)")
                {
                    Caption = 'Warranty % (Labor)';
                    ToolTip = 'Specifies the percentage of labor costs covered by the warranty for this item.';
                    ApplicationArea = All;
                }
                field(responseTimeHours; Rec."Response Time (Hours)")
                {
                    Caption = 'Response Time (Hours)';
                    ToolTip = 'Specifies the estimated number of hours this item requires before service on it should be started.';
                    ApplicationArea = All;
                }
                field(installationDate; Rec."Installation Date")
                {
                    Caption = 'Installation Date';
                    ToolTip = 'Specifies the date when this item was installed at the customer''s site.';
                    ApplicationArea = All;
                }
                field(salesDate; Rec."Sales Date")
                {
                    Caption = 'Sales Date';
                    ToolTip = 'Specifies the date when this item was sold.';
                    ApplicationArea = All;
                }
                field(lastServiceDate; Rec."Last Service Date")
                {
                    Caption = 'Last Service Date';
                    ToolTip = 'Specifies the date of the last service on this item.';
                    ApplicationArea = All;
                }
                field(defaultContractValue; Rec."Default Contract Value")
                {
                    Caption = 'Default Contract Value';
                    ToolTip = 'Specifies the default contract value of an item that later will be included in a service contract or contract quote.';
                    ApplicationArea = All;
                }
                field(defaultContractDiscountPct; Rec."Default Contract Discount %")
                {
                    Caption = 'Default Contract Discount %';
                    ToolTip = 'Specifies a default contract discount percentage for an item, if this item will be part of a service contract.';
                    ApplicationArea = All;
                }
                field(noOfActiveContracts; Rec."No. of Active Contracts")
                {
                    Caption = 'No. of Active Contracts';
                    ToolTip = 'Specifies the No. of Active Contracts.';
                    ApplicationArea = All;
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the number of the vendor for this item.';
                    ApplicationArea = All;
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    ToolTip = 'Specifies the number that the vendor uses for this item.';
                    ApplicationArea = All;
                }
                field(blocked; Rec."Blocked")
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies that the service item is blocked from being used in service contracts or used and posted in transactions via service documents, except credit memos.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the No. Series.';
                    ApplicationArea = All;
                }
                field(itemDescription; Rec."Item Description")
                {
                    Caption = 'Item Description';
                    ToolTip = 'Specifies the description of the item that the service item is linked to.';
                    ApplicationArea = All;
                }
                field(name; Rec."Name")
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name of the customer who owns this item.';
                    ApplicationArea = All;
                }
                field(address; Rec."Address")
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the address of the customer who owns this item.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies additional address information.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the postal code.';
                    ApplicationArea = All;
                }
                field(city; Rec."City")
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city of the customer address.';
                    ApplicationArea = All;
                }
                field(contact; Rec."Contact")
                {
                    Caption = 'Contact';
                    ToolTip = 'Specifies the name of the person you regularly contact when you do business with the customer who owns this item.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the customer phone number.';
                    ApplicationArea = All;
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                    ToolTip = 'Specifies the name of the customer at the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToAddress; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address';
                    ToolTip = 'Specifies the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToAddress2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address 2';
                    ToolTip = 'Specifies an additional part of the ship-to address, in case it is a long address.';
                    ApplicationArea = All;
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                    ToolTip = 'Specifies the postal code of the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToCity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';
                    ToolTip = 'Specifies the city of the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                    Caption = 'Ship-to Contact';
                    ToolTip = 'Specifies the name of the contact person at the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToPhoneNo; Rec."Ship-to Phone No.")
                {
                    Caption = 'Ship-to Phone No.';
                    ToolTip = 'Specifies the phone number at address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(usageCost; Rec."Usage (Cost)")
                {
                    Caption = 'Usage (Cost)';
                    ToolTip = 'Specifies the Usage (Cost).';
                    ApplicationArea = All;
                }
                field(usageAmount; Rec."Usage (Amount)")
                {
                    Caption = 'Usage (Amount)';
                    ToolTip = 'Specifies the Usage (Amount).';
                    ApplicationArea = All;
                }
                field(invoicedAmount; Rec."Invoiced Amount")
                {
                    Caption = 'Invoiced Amount';
                    ToolTip = 'Specifies the Invoiced Amount.';
                    ApplicationArea = All;
                }
                field(totalQuantity; Rec."Total Quantity")
                {
                    Caption = 'Total Quantity';
                    ToolTip = 'Specifies the Total Quantity.';
                    ApplicationArea = All;
                }
                field(totalQtyInvoiced; Rec."Total Qty. Invoiced")
                {
                    Caption = 'Total Qty. Invoiced';
                    ToolTip = 'Specifies the Total Qty. Invoiced.';
                    ApplicationArea = All;
                }
                field(resourcesUsed; Rec."Resources Used")
                {
                    Caption = 'Resources Used';
                    ToolTip = 'Specifies the Resources Used.';
                    ApplicationArea = All;
                }
                field(partsUsed; Rec."Parts Used")
                {
                    Caption = 'Parts Used';
                    ToolTip = 'Specifies the Parts Used.';
                    ApplicationArea = All;
                }
                field(costUsed; Rec."Cost Used")
                {
                    Caption = 'Cost Used';
                    ToolTip = 'Specifies the Cost Used.';
                    ApplicationArea = All;
                }
                field(vendorName; Rec."Vendor Name")
                {
                    Caption = 'Vendor Name';
                    ToolTip = 'Specifies the vendor name for this item.';
                    ApplicationArea = All;
                }
                field(vendorItemName; Rec."Vendor Item Name")
                {
                    Caption = 'Vendor Item Name';
                    ToolTip = 'Specifies the name assigned to this item by the vendor.';
                    ApplicationArea = All;
                }
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
                    ApplicationArea = All;
                }
                field(serviceItemComponents; Rec."Service Item Components")
                {
                    Caption = 'Service Item Components';
                    ToolTip = 'Specifies that there is a component for this service item.';
                    ApplicationArea = All;
                }
                field(preferredResource; Rec."Preferred Resource")
                {
                    Caption = 'Preferred Resource';
                    ToolTip = 'Specifies the number of the resource that the customer prefers for servicing of the item.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant of the item on the line.';
                    ApplicationArea = All;
                }
                field(county; Rec."County")
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the state, province or county as a part of the address.';
                    ApplicationArea = All;
                }
                field(shipToCounty; Rec."Ship-to County")
                {
                    Caption = 'Ship-to County';
                    ToolTip = 'Specifies the Ship-to County.';
                    ApplicationArea = All;
                }
                field(contractCost; Rec."Contract Cost")
                {
                    Caption = 'Contract Cost';
                    ToolTip = 'Specifies the Contract Cost.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region of the address.';
                    ApplicationArea = All;
                }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';
                    ToolTip = 'Specifies the Ship-to Country/Region Code.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies the Name 2.';
                    ApplicationArea = All;
                }
                field(shipToName2; Rec."Ship-to Name 2")
                {
                    Caption = 'Ship-to Name 2';
                    ToolTip = 'Specifies an additional part of the name of the customer at the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(servicePriceGroupCode; Rec."Service Price Group Code")
                {
                    Caption = 'Service Price Group Code';
                    ToolTip = 'Specifies the code of the Service Price Group associated with this item.';
                    ApplicationArea = All;
                }
                field(defaultContractCost; Rec."Default Contract Cost")
                {
                    Caption = 'Default Contract Cost';
                    ToolTip = 'Specifies the default contract cost of a service item that later will be included in a service contract or contract quote.';
                    ApplicationArea = All;
                }
                field(prepaidAmount; Rec."Prepaid Amount")
                {
                    Caption = 'Prepaid Amount';
                    ToolTip = 'Specifies the Prepaid Amount.';
                    ApplicationArea = All;
                }
                field(searchDescription; Rec."Search Description")
                {
                    Caption = 'Search Description';
                    ToolTip = 'Specifies an alternate description to search for the service item.';
                    ApplicationArea = All;
                }
                field(serviceContracts; Rec."Service Contracts")
                {
                    Caption = 'Service Contracts';
                    ToolTip = 'Specifies that this service item is associated with one or more service contracts/quotes.';
                    ApplicationArea = All;
                }
                field(totalQtyConsumed; Rec."Total Qty. Consumed")
                {
                    Caption = 'Total Qty. Consumed';
                    ToolTip = 'Specifies the Total Qty. Consumed.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the Date Filter.';
                    ApplicationArea = All;
                }
                field(typeFilter; Rec."Type Filter")
                {
                    Caption = 'Type Filter';
                    ToolTip = 'Specifies the Type Filter.';
                    ApplicationArea = All;
                }
                field(contractFilter; Rec."Contract Filter")
                {
                    Caption = 'Contract Filter';
                    ToolTip = 'Specifies the Contract Filter.';
                    ApplicationArea = All;
                }
                field(serviceOrderFilter; Rec."Service Order Filter")
                {
                    Caption = 'Service Order Filter';
                    ToolTip = 'Specifies the Service Order Filter.';
                    ApplicationArea = All;
                }
                field(salesServShptDocumentNo; Rec."Sales/Serv. Shpt. Document No.")
                {
                    Caption = 'Sales/Serv. Shpt. Document No.';
                    ToolTip = 'Specifies the Sales/Serv. Shpt. Document No..';
                    ApplicationArea = All;
                }
                field(salesServShptLineNo; Rec."Sales/Serv. Shpt. Line No.")
                {
                    Caption = 'Sales/Serv. Shpt. Line No.';
                    ToolTip = 'Specifies the Sales/Serv. Shpt. Line No..';
                    ApplicationArea = All;
                }
                field(shipmentType; Rec."Shipment Type")
                {
                    Caption = 'Shipment Type';
                    ToolTip = 'Specifies the Shipment Type.';
                    ApplicationArea = All;
                }
                field(shipToEMail; Rec."Ship-to E-Mail")
                {
                    Caption = 'Ship-to Email';
                    ToolTip = 'Specifies the Ship-to Email.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
