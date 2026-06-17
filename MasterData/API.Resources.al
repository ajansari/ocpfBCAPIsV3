namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Projects.Resources.Resource;

page 90854 "ocpfResources"
{
    PageType = API;
    Caption = 'Resources — people or machines whose time and costs can be sold or allocated to projects, with pricing and unit of measure settings.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfResource';
    EntitySetName = 'ocpfResources';
    SourceTable = Resource;
    ODataKeyFields = SystemId;
    DelayedInsert = true;

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
                    ToolTip = 'Specifies the no. for this resource record.';
                    ApplicationArea = All;
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type for this resource record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this resource record.';
                    ApplicationArea = All;
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies the search name for this resource record.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies the name 2 for this resource record.';
                    ApplicationArea = All;
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the address for this resource record.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies the address 2 for this resource record.';
                    ApplicationArea = All;
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city for this resource record.';
                    ApplicationArea = All;
                }
                field(socialSecurityNo; Rec."Social Security No.")
                {
                    Caption = 'Social Security No.';
                    ToolTip = 'Specifies the social security no. for this resource record.';
                    ApplicationArea = All;
                }
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                    ToolTip = 'Specifies the job title for this resource record.';
                    ApplicationArea = All;
                }
                field(education; Rec.Education)
                {
                    Caption = 'Education';
                    ToolTip = 'Specifies the education for this resource record.';
                    ApplicationArea = All;
                }
                field(contractClass; Rec."Contract Class")
                {
                    Caption = 'Contract Class';
                    ToolTip = 'Specifies the contract class for this resource record.';
                    ApplicationArea = All;
                }
                field(employmentDate; Rec."Employment Date")
                {
                    Caption = 'Employment Date';
                    ToolTip = 'Specifies the employment date for this resource record.';
                    ApplicationArea = All;
                }
                field(resourceGroupNo; Rec."Resource Group No.")
                {
                    Caption = 'Resource Group No.';
                    ToolTip = 'Specifies the resource group no. for this resource record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this resource record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this resource record.';
                    ApplicationArea = All;
                }
                field(baseUnitOfMeasure; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                    ToolTip = 'Specifies the base unit of measure for this resource record.';
                    ApplicationArea = All;
                }
                field(directUnitCost; Rec."Direct Unit Cost")
                {
                    Caption = 'Direct Unit Cost';
                    ToolTip = 'Specifies the direct unit cost for this resource record.';
                    ApplicationArea = All;
                }
                field(indirectCost; Rec."Indirect Cost %")
                {
                    Caption = 'Indirect Cost %';
                    ToolTip = 'Specifies the indirect cost % for this resource record.';
                    ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the unit cost for this resource record.';
                    ApplicationArea = All;
                }
                field(profit; Rec."Profit %")
                {
                    Caption = 'Profit %';
                    ToolTip = 'Specifies the profit % for this resource record.';
                    ApplicationArea = All;
                }
                field(priceProfitCalculation; Rec."Price/Profit Calculation")
                {
                    Caption = 'Price/Profit Calculation';
                    ToolTip = 'Specifies the price/profit calculation for this resource record.';
                    ApplicationArea = All;
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ToolTip = 'Specifies the unit price for this resource record.';
                    ApplicationArea = All;
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the vendor no. for this resource record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date modified for this resource record.';
                    ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the comment for this resource record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the blocked for this resource record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this resource record.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureFilter; Rec."Unit of Measure Filter")
                {
                    Caption = 'Unit of Measure Filter';
                    ToolTip = 'Specifies the unit of measure filter for this resource record.';
                    ApplicationArea = All;
                }
                field(capacity; Rec.Capacity)
                {
                    Caption = 'Capacity';
                    ToolTip = 'Specifies the capacity for this resource record.';
                    ApplicationArea = All;
                }
                field(chargeableFilter; Rec."Chargeable Filter")
                {
                    Caption = 'Chargeable Filter';
                    ToolTip = 'Specifies the chargeable filter for this resource record.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the gen. prod. posting group for this resource record.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the post code for this resource record.';
                    ApplicationArea = All;
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the county for this resource record.';
                    ApplicationArea = All;
                }
                field(automaticExtTexts; Rec."Automatic Ext. Texts")
                {
                    Caption = 'Automatic Ext. Texts';
                    ToolTip = 'Specifies the automatic ext. texts for this resource record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this resource record.';
                    ApplicationArea = All;
                }
                field(taxGroupCode; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';
                    ToolTip = 'Specifies the tax group code for this resource record.';
                    ApplicationArea = All;
                }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                    ToolTip = 'Specifies the vat prod. posting group for this resource record.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region code for this resource record.';
                    ApplicationArea = All;
                }
                field(iCPartnerPurchGLAccNo; Rec."IC Partner Purch. G/L Acc. No.")
                {
                    Caption = 'IC Partner Purch. G/L Acc. No.';
                    ToolTip = 'Specifies the ic partner purch. g/l acc. no. for this resource record.';
                    ApplicationArea = All;
                }
                field(unitGroupExists; Rec."Unit Group Exists")
                {
                    Caption = 'Unit Group Exists';
                    ToolTip = 'Specifies the unit group exists for this resource record.';
                    ApplicationArea = All;
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                    ToolTip = 'Specifies the image for this resource record.';
                    ApplicationArea = All;
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                    ToolTip = 'Specifies the privacy blocked for this resource record.';
                    ApplicationArea = All;
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dynamics 365 Sales';
                    ToolTip = 'Specifies the coupled to dataverse for this resource record.';
                    ApplicationArea = All;
                }
                field(qtyOnAssemblyOrder; Rec."Qty. on Assembly Order")
                {
                    Caption = 'Qty. on Assembly Order';
                    ToolTip = 'Specifies the qty. on assembly order for this resource record.';
                    ApplicationArea = All;
                }
                field(useTimeSheet; Rec."Use Time Sheet")
                {
                    Caption = 'Use Time Sheet';
                    ToolTip = 'Specifies the use time sheet for this resource record.';
                    ApplicationArea = All;
                }
                field(timeSheetOwnerUserId; Rec."Time Sheet Owner User ID")
                {
                    Caption = 'Time Sheet Owner User ID';
                    ToolTip = 'Specifies the time sheet owner user id for this resource record.';
                    ApplicationArea = All;
                }
                field(timeSheetApproverUserId; Rec."Time Sheet Approver User ID")
                {
                    Caption = 'Time Sheet Approver User ID';
                    ToolTip = 'Specifies the time sheet approver user id for this resource record.';
                    ApplicationArea = All;
                }
                field(defaultDeferralTemplateCode; Rec."Default Deferral Template Code")
                {
                    Caption = 'Default Deferral Template Code';
                    ToolTip = 'Specifies the default deferral template code for this resource record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}