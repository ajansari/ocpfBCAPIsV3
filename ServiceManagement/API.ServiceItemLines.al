namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Document;

page 90986 "ocpfServiceItemLines"
{
    PageType = API;
    Caption = 'Service Item Lines — the service items being worked on within a service order, with fault/resolution and repair status.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceItemLine';
    EntitySetName = 'ocpfServiceItemLines';
    SourceTable = "Service Item Line";
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
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the number of the service order linked to this service item line.';
                    ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ToolTip = 'Specifies the number of the line.';
                    ApplicationArea = All;
                }
                field(serviceItemNo; Rec."Service Item No.")
                {
                    Caption = 'Service Item No.';
                    ToolTip = 'Specifies the service item number registered in the Service Item table.';
                    ApplicationArea = All;
                }
                field(serviceItemGroupCode; Rec."Service Item Group Code")
                {
                    Caption = 'Service Item Group Code';
                    ToolTip = 'Specifies the code of the service item group for this item.';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the item number linked to this service item.';
                    ApplicationArea = All;
                }
                field(serialNo; Rec."Serial No.")
                {
                    Caption = 'Serial No.';
                    ToolTip = 'Specifies the serial number of this item.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of this service item.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies an additional description of this item.';
                    ApplicationArea = All;
                }
                field(repairStatusCode; Rec."Repair Status Code")
                {
                    Caption = 'Repair Status Code';
                    ToolTip = 'Specifies the repair status of this service item.';
                    ApplicationArea = All;
                }
                field(priority; Rec."Priority")
                {
                    Caption = 'Priority';
                    ToolTip = 'Specifies the service priority for this item.';
                    ApplicationArea = All;
                }
                field(responseTimeHours; Rec."Response Time (Hours)")
                {
                    Caption = 'Response Time (Hours)';
                    ToolTip = 'Specifies the estimated hours from order creation, to the time when the repair status of the item line changes from Initial, to In Process.';
                    ApplicationArea = All;
                }
                field(responseDate; Rec."Response Date")
                {
                    Caption = 'Response Date';
                    ToolTip = 'Specifies the estimated date when service should start on this service item line.';
                    ApplicationArea = All;
                }
                field(responseTime; Rec."Response Time")
                {
                    Caption = 'Response Time';
                    ToolTip = 'Specifies the estimated time when service should start on this service item.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the date when service on this item began and when the repair status changed to In process.';
                    ApplicationArea = All;
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                    ToolTip = 'Specifies the time when service on this item began and when the repair status changed to In process.';
                    ApplicationArea = All;
                }
                field(finishingDate; Rec."Finishing Date")
                {
                    Caption = 'Finishing Date';
                    ToolTip = 'Specifies the finishing date of the service and when the repair status of this item changes to Finished.';
                    ApplicationArea = All;
                }
                field(finishingTime; Rec."Finishing Time")
                {
                    Caption = 'Finishing Time';
                    ToolTip = 'Specifies the finishing time of the service and when the repair status of this item changes to Finished.';
                    ApplicationArea = All;
                }
                field(serviceShelfNo; Rec."Service Shelf No.")
                {
                    Caption = 'Service Shelf No.';
                    ToolTip = 'Specifies the number of the service shelf this item is stored on.';
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
                field(warranty; Rec."Warranty")
                {
                    Caption = 'Warranty';
                    ToolTip = 'Specifies that warranty on either parts or labor exists for this item.';
                    ApplicationArea = All;
                }
                field(warrantyPctParts; Rec."Warranty % (Parts)")
                {
                    Caption = 'Warranty % (Parts)';
                    ToolTip = 'Specifies the percentage of spare parts costs covered by the warranty for this item.';
                    ApplicationArea = All;
                }
                field(warrantyPctLabor; Rec."Warranty % (Labor)")
                {
                    Caption = 'Warranty % (Labor)';
                    ToolTip = 'Specifies the percentage of labor costs covered by the warranty for this item.';
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
                field(contractNo; Rec."Contract No.")
                {
                    Caption = 'Contract No.';
                    ToolTip = 'Specifies the number of the service contract associated with the item or service on the line.';
                    ApplicationArea = All;
                }
                field(locationOfServiceItem; Rec."Location of Service Item")
                {
                    Caption = 'Location of Service Item';
                    ToolTip = 'Specifies the code of the location of this item.';
                    ApplicationArea = All;
                }
                field(loanerNo; Rec."Loaner No.")
                {
                    Caption = 'Loaner No.';
                    ToolTip = 'Specifies the number of the loaner that has been lent to the customer in the service order to replace this item.';
                    ApplicationArea = All;
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the number of the vendor of this item.';
                    ApplicationArea = All;
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    ToolTip = 'Specifies the number that the vendor uses for this item.';
                    ApplicationArea = All;
                }
                field(faultReasonCode; Rec."Fault Reason Code")
                {
                    Caption = 'Fault Reason Code';
                    ToolTip = 'Specifies the fault reason code for the item.';
                    ApplicationArea = All;
                }
                field(servicePriceGroupCode; Rec."Service Price Group Code")
                {
                    Caption = 'Service Price Group Code';
                    ToolTip = 'Specifies the code of the service price group associated with the item.';
                    ApplicationArea = All;
                }
                field(faultAreaCode; Rec."Fault Area Code")
                {
                    Caption = 'Fault Area Code';
                    ToolTip = 'Specifies the fault area code for this item.';
                    ApplicationArea = All;
                }
                field(symptomCode; Rec."Symptom Code")
                {
                    Caption = 'Symptom Code';
                    ToolTip = 'Specifies the symptom code for this item.';
                    ApplicationArea = All;
                }
                field(faultCode; Rec."Fault Code")
                {
                    Caption = 'Fault Code';
                    ToolTip = 'Specifies the fault code for this item.';
                    ApplicationArea = All;
                }
                field(resolutionCode; Rec."Resolution Code")
                {
                    Caption = 'Resolution Code';
                    ToolTip = 'Specifies the resolution code for this item.';
                    ApplicationArea = All;
                }
                field(faultComment; Rec."Fault Comment")
                {
                    Caption = 'Fault Comment';
                    ToolTip = 'Specifies the Fault Comment.';
                    ApplicationArea = All;
                }
                field(resolutionComment; Rec."Resolution Comment")
                {
                    Caption = 'Resolution Comment';
                    ToolTip = 'Specifies the Resolution Comment.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant of the item on the line.';
                    ApplicationArea = All;
                }
                field(serviceItemLoanerComment; Rec."Service Item Loaner Comment")
                {
                    Caption = 'Service Item Loaner Comment';
                    ToolTip = 'Specifies the Service Item Loaner Comment.';
                    ApplicationArea = All;
                }
                field(actualResponseTimeHours; Rec."Actual Response Time (Hours)")
                {
                    Caption = 'Actual Response Time (Hours)';
                    ToolTip = 'Specifies the Actual Response Time (Hours).';
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies whether the service document is a service order or service quote.';
                    ApplicationArea = All;
                }
                field(servPriceAdjmtGrCode; Rec."Serv. Price Adjmt. Gr. Code")
                {
                    Caption = 'Serv. Price Adjmt. Gr. Code';
                    ToolTip = 'Specifies the Serv. Price Adjmt. Gr. Code.';
                    ApplicationArea = All;
                }
                field(adjustmentType; Rec."Adjustment Type")
                {
                    Caption = 'Adjustment Type';
                    ToolTip = 'Specifies the adjustment type for the line.';
                    ApplicationArea = All;
                }
                field(baseAmountToAdjust; Rec."Base Amount to Adjust")
                {
                    Caption = 'Base Amount to Adjust';
                    ToolTip = 'Specifies the amount that the service line, linked to this service item line, will be adjusted to.';
                    ApplicationArea = All;
                }
                field(noOfActiveFinishedAllocs; Rec."No. of Active/Finished Allocs")
                {
                    Caption = 'No. of Active/Finished Allocs';
                    ToolTip = 'Specifies the No. of Active/Finished Allocs.';
                    ApplicationArea = All;
                }
                field(noOfAllocations; Rec."No. of Allocations")
                {
                    Caption = 'No. of Allocations';
                    ToolTip = 'Specifies the number of resource allocations with the allocation status specified in the Allocation Status Filter field.';
                    ApplicationArea = All;
                }
                field(noOfPreviousServices; Rec."No. of Previous Services")
                {
                    Caption = 'No. of Previous Services';
                    ToolTip = 'Specifies the number of services performed on service items with the same item and serial number as this service item.';
                    ApplicationArea = All;
                }
                field(contractLineNo; Rec."Contract Line No.")
                {
                    Caption = 'Contract Line No.';
                    ToolTip = 'Specifies the Contract Line No..';
                    ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the customer number associated with the service contract.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the Date Filter.';
                    ApplicationArea = All;
                }
                field(resourceFilter; Rec."Resource Filter")
                {
                    Caption = 'Resource Filter';
                    ToolTip = 'Specifies the Resource Filter.';
                    ApplicationArea = All;
                }
                field(allocationDateFilter; Rec."Allocation Date Filter")
                {
                    Caption = 'Allocation Date Filter';
                    ToolTip = 'Specifies the Allocation Date Filter.';
                    ApplicationArea = All;
                }
                field(repairStatusCodeFilter; Rec."Repair Status Code Filter")
                {
                    Caption = 'Repair Status Code Filter';
                    ToolTip = 'Specifies the Repair Status Code Filter.';
                    ApplicationArea = All;
                }
                field(allocationStatusFilter; Rec."Allocation Status Filter")
                {
                    Caption = 'Allocation Status Filter';
                    ToolTip = 'Specifies the Allocation Status Filter.';
                    ApplicationArea = All;
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ToolTip = 'Specifies the Responsibility Center.';
                    ApplicationArea = All;
                }
                field(serviceOrderFilter; Rec."Service Order Filter")
                {
                    Caption = 'Service Order Filter';
                    ToolTip = 'Specifies the Service Order Filter.';
                    ApplicationArea = All;
                }
                field(resourceGroupFilter; Rec."Resource Group Filter")
                {
                    Caption = 'Resource Group Filter';
                    ToolTip = 'Specifies the Resource Group Filter.';
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
                field(releaseStatus; Rec."Release Status")
                {
                    Caption = 'Release Status';
                    ToolTip = 'Specifies the Release Status.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
