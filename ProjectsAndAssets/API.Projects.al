namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Projects.Project.Job;

page 90910 "ocpfProjects"
{
    PageType = API;
    Caption = 'Projects (formerly Jobs) — tracks costs, budgets, and revenue for project work.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfProject';
    EntitySetName = 'ocpfProjects';
    SourceTable = Job;
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
                field(searchDescription; Rec."Search Description")
                    {
                        Caption = 'Search Description';
                        ToolTip = 'Specifies the Search Description.';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                    {
                        Caption = 'Description 2';
                        ToolTip = 'Specifies the Description 2.';
                        ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                    {
                        Caption = 'Bill-to Customer No.';
                        ToolTip = 'Specifies the Bill-to Customer No..';
                        ApplicationArea = All;
                }
                field(creationDate; Rec."Creation Date")
                    {
                        Caption = 'Creation Date';
                        ToolTip = 'Specifies the Creation Date.';
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
                field(status; Rec.Status)
                    {
                        Caption = 'Status';
                        ToolTip = 'Specifies the Status.';
                        ApplicationArea = All;
                }
                field(personResponsible; Rec."Person Responsible")
                    {
                        Caption = 'Person Responsible';
                        ToolTip = 'Specifies the Person Responsible.';
                        ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                    {
                        Caption = 'Global Dimension 1 Code';
                        ToolTip = 'Specifies the Global Dimension 1 Code.';
                        ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                    {
                        Caption = 'Global Dimension 2 Code';
                        ToolTip = 'Specifies the Global Dimension 2 Code.';
                        ApplicationArea = All;
                }
                field(jobPostingGroup; Rec."Job Posting Group")
                    {
                        Caption = 'Project Posting Group';
                        ToolTip = 'Specifies the Job Posting Group.';
                        ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                    {
                        Caption = 'Blocked';
                        ToolTip = 'Specifies the Blocked.';
                        ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                    {
                        Caption = 'Last Date Modified';
                        ToolTip = 'Specifies the Last Date Modified.';
                        ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                    {
                        Caption = 'Comment';
                        ToolTip = 'Specifies the Comment.';
                        ApplicationArea = All;
                }
                field(customerDiscGroup; Rec."Customer Disc. Group")
                    {
                        Caption = 'Customer Disc. Group';
                        ToolTip = 'Specifies the Customer Disc. Group.';
                        ApplicationArea = All;
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                    {
                        Caption = 'Customer Price Group';
                        ToolTip = 'Specifies the Customer Price Group.';
                        ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                    {
                        Caption = 'Location Code';
                        ToolTip = 'Specifies the Location Code.';
                        ApplicationArea = All;
                }
                field(binCode; Rec."Bin Code")
                    {
                        Caption = 'Bin Code';
                        ToolTip = 'Specifies the Bin Code.';
                        ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                    {
                        Caption = 'Language Code';
                        ToolTip = 'Specifies the Language Code.';
                        ApplicationArea = All;
                }
                field(scheduledResQty; Rec."Scheduled Res. Qty.")
                    {
                        Caption = 'Scheduled Res. Qty.';
                        ToolTip = 'Specifies the Scheduled Res. Qty..';
                        ApplicationArea = All;
                }
                field(resourceFilter; Rec."Resource Filter")
                    {
                        Caption = 'Resource Filter';
                        ToolTip = 'Specifies the Resource Filter.';
                        ApplicationArea = All;
                }
                field(postingDateFilter; Rec."Posting Date Filter")
                    {
                        Caption = 'Posting Date Filter';
                        ToolTip = 'Specifies the Posting Date Filter.';
                        ApplicationArea = All;
                }
                field(resourceGrFilter; Rec."Resource Gr. Filter")
                    {
                        Caption = 'Resource Gr. Filter';
                        ToolTip = 'Specifies the Resource Gr. Filter.';
                        ApplicationArea = All;
                }
                field(scheduledResGrQty; Rec."Scheduled Res. Gr. Qty.")
                    {
                        Caption = 'Scheduled Res. Gr. Qty.';
                        ToolTip = 'Specifies the Scheduled Res. Gr. Qty..';
                        ApplicationArea = All;
                }
                field(billToName; Rec."Bill-to Name")
                    {
                        Caption = 'Bill-to Name';
                        ToolTip = 'Specifies the Bill-to Name.';
                        ApplicationArea = All;
                }
                field(billToAddress; Rec."Bill-to Address")
                    {
                        Caption = 'Bill-to Address';
                        ToolTip = 'Specifies the Bill-to Address.';
                        ApplicationArea = All;
                }
                field(billToAddress2; Rec."Bill-to Address 2")
                    {
                        Caption = 'Bill-to Address 2';
                        ToolTip = 'Specifies the Bill-to Address 2.';
                        ApplicationArea = All;
                }
                field(billToCity; Rec."Bill-to City")
                    {
                        Caption = 'Bill-to City';
                        ToolTip = 'Specifies the Bill-to City.';
                        ApplicationArea = All;
                }
                field(billToCounty; Rec."Bill-to County")
                    {
                        Caption = 'Bill-to County';
                        ToolTip = 'Specifies the Bill-to County.';
                        ApplicationArea = All;
                }
                field(billToPostCode; Rec."Bill-to Post Code")
                    {
                        Caption = 'Bill-to Post Code';
                        ToolTip = 'Specifies the Bill-to Post Code.';
                        ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                    {
                        Caption = 'No. Series';
                        ToolTip = 'Specifies the No. Series.';
                        ApplicationArea = All;
                }
                field(billToCountryRegionCode; Rec."Bill-to Country/Region Code")
                    {
                        Caption = 'Bill-to Country/Region Code';
                        ToolTip = 'Specifies the Bill-to Country/Region Code.';
                        ApplicationArea = All;
                }
                field(billToName2; Rec."Bill-to Name 2")
                    {
                        Caption = 'Bill-to Name 2';
                        ToolTip = 'Specifies an additional part of the name of the customer who pays for the project.';
                        ApplicationArea = All;
                }
                field(taskBillingMethod; Rec."Task Billing Method")
                    {
                        Caption = 'Task Billing Method';
                        ToolTip = 'Specifies the Task Billing Method.';
                        ApplicationArea = All;
                }
                field(reserve; Rec.Reserve)
                    {
                        Caption = 'Reserve';
                        ToolTip = 'Specifies the Reserve.';
                        ApplicationArea = All;
                }
                field(image; Rec.Image)
                    {
                        Caption = 'Image';
                        ToolTip = 'Specifies the Image.';
                        ApplicationArea = All;
                }
                field(shipToPhoneNo; Rec."Ship-to Phone No.")
                    {
                        Caption = 'Ship-to Phone No.';
                        ToolTip = 'Specifies the Ship-to Phone No..';
                        ApplicationArea = All;
                }
                field(wipMethod; Rec."WIP Method")
                    {
                        Caption = 'WIP Method';
                        ToolTip = 'Specifies the WIP Method.';
                        ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                    {
                        Caption = 'Currency Code';
                        ToolTip = 'Specifies the Currency Code.';
                        ApplicationArea = All;
                }
                field(billToContactNo; Rec."Bill-to Contact No.")
                    {
                        Caption = 'Bill-to Contact No.';
                        ToolTip = 'Specifies the Bill-to Contact No..';
                        ApplicationArea = All;
                }
                field(billToContact; Rec."Bill-to Contact")
                    {
                        Caption = 'Bill-to Contact';
                        ToolTip = 'Specifies the Bill-to Contact.';
                        ApplicationArea = All;
                }
                field(planningDateFilter; Rec."Planning Date Filter")
                    {
                        Caption = 'Planning Date Filter';
                        ToolTip = 'Specifies the Planning Date Filter.';
                        ApplicationArea = All;
                }
                field(totalWipCostAmount; Rec."Total WIP Cost Amount")
                    {
                        Caption = 'Total WIP Cost Amount';
                        ToolTip = 'Specifies the Total WIP Cost Amount.';
                        ApplicationArea = All;
                }
                field(totalWipCostGLAmount; Rec."Total WIP Cost G/L Amount")
                    {
                        Caption = 'Total WIP Cost G/L Amount';
                        ToolTip = 'Specifies the Total WIP Cost G/L Amount.';
                        ApplicationArea = All;
                }
                field(wipEntriesExist; Rec."WIP Entries Exist")
                    {
                        Caption = 'WIP Entries Exist';
                        ToolTip = 'Specifies the WIP Entries Exist.';
                        ApplicationArea = All;
                }
                field(wipPostingDate; Rec."WIP Posting Date")
                    {
                        Caption = 'WIP Posting Date';
                        ToolTip = 'Specifies the WIP Posting Date.';
                        ApplicationArea = All;
                }
                field(wipGLPostingDate; Rec."WIP G/L Posting Date")
                    {
                        Caption = 'WIP G/L Posting Date';
                        ToolTip = 'Specifies the WIP G/L Posting Date.';
                        ApplicationArea = All;
                }
                field(invoiceCurrencyCode; Rec."Invoice Currency Code")
                    {
                        Caption = 'Invoice Currency Code';
                        ToolTip = 'Specifies the Invoice Currency Code.';
                        ApplicationArea = All;
                }
                field(exchCalculationCost; Rec."Exch. Calculation (Cost)")
                    {
                        Caption = 'Exch. Calculation (Cost)';
                        ToolTip = 'Specifies the Exch. Calculation (Cost).';
                        ApplicationArea = All;
                }
                field(exchCalculationPrice; Rec."Exch. Calculation (Price)")
                    {
                        Caption = 'Exch. Calculation (Price)';
                        ToolTip = 'Specifies the Exch. Calculation (Price).';
                        ApplicationArea = All;
                }
                field(allowScheduleContractLines; Rec."Allow Schedule/Contract Lines")
                    {
                        Caption = 'Allow Budget/Billable Lines';
                        ToolTip = 'Specifies the Allow Schedule/Contract Lines.';
                        ApplicationArea = All;
                }
                field(complete; Rec.Complete)
                    {
                        Caption = 'Complete';
                        ToolTip = 'Specifies the Complete.';
                        ApplicationArea = All;
                }
                field(recogSalesAmount; Rec."Recog. Sales Amount")
                    {
                        Caption = 'Recog. Sales Amount';
                        ToolTip = 'Specifies the Recog. Sales Amount.';
                        ApplicationArea = All;
                }
                field(recogSalesGLAmount; Rec."Recog. Sales G/L Amount")
                    {
                        Caption = 'Recog. Sales G/L Amount';
                        ToolTip = 'Specifies the Recog. Sales G/L Amount.';
                        ApplicationArea = All;
                }
                field(recogCostsAmount; Rec."Recog. Costs Amount")
                    {
                        Caption = 'Recog. Costs Amount';
                        ToolTip = 'Specifies the Recog. Costs Amount.';
                        ApplicationArea = All;
                }
                field(recogCostsGLAmount; Rec."Recog. Costs G/L Amount")
                    {
                        Caption = 'Recog. Costs G/L Amount';
                        ToolTip = 'Specifies the Recog. Costs G/L Amount.';
                        ApplicationArea = All;
                }
                field(totalWipSalesAmount; Rec."Total WIP Sales Amount")
                    {
                        Caption = 'Total WIP Sales Amount';
                        ToolTip = 'Specifies the Total WIP Sales Amount.';
                        ApplicationArea = All;
                }
                field(totalWipSalesGLAmount; Rec."Total WIP Sales G/L Amount")
                    {
                        Caption = 'Total WIP Sales G/L Amount';
                        ToolTip = 'Specifies the Total WIP Sales G/L Amount.';
                        ApplicationArea = All;
                }
                field(wipCompletionCalculated; Rec."WIP Completion Calculated")
                    {
                        Caption = 'WIP Completion Calculated';
                        ToolTip = 'Specifies the WIP Completion Calculated.';
                        ApplicationArea = All;
                }
                field(nextInvoiceDate; Rec."Next Invoice Date")
                    {
                        Caption = 'Next Invoice Date';
                        ToolTip = 'Specifies the Next Invoice Date.';
                        ApplicationArea = All;
                }
                field(applyUsageLink; Rec."Apply Usage Link")
                    {
                        Caption = 'Apply Usage Link';
                        ToolTip = 'Specifies the Apply Usage Link.';
                        ApplicationArea = All;
                }
                field(wipWarnings; Rec."WIP Warnings")
                    {
                        Caption = 'WIP Warnings';
                        ToolTip = 'Specifies the WIP Warnings.';
                        ApplicationArea = All;
                }
                field(wipPostingMethod; Rec."WIP Posting Method")
                    {
                        Caption = 'WIP Posting Method';
                        ToolTip = 'Specifies the WIP Posting Method.';
                        ApplicationArea = All;
                }
                field(appliedCostsGLAmount; Rec."Applied Costs G/L Amount")
                    {
                        Caption = 'Applied Costs G/L Amount';
                        ToolTip = 'Specifies the Applied Costs G/L Amount.';
                        ApplicationArea = All;
                }
                field(appliedSalesGLAmount; Rec."Applied Sales G/L Amount")
                    {
                        Caption = 'Applied Sales G/L Amount';
                        ToolTip = 'Specifies the Applied Sales G/L Amount.';
                        ApplicationArea = All;
                }
                field(calcRecogSalesAmount; Rec."Calc. Recog. Sales Amount")
                    {
                        Caption = 'Calc. Recog. Sales Amount';
                        ToolTip = 'Specifies the Calc. Recog. Sales Amount.';
                        ApplicationArea = All;
                }
                field(calcRecogCostsAmount; Rec."Calc. Recog. Costs Amount")
                    {
                        Caption = 'Calc. Recog. Costs Amount';
                        ToolTip = 'Specifies the Calc. Recog. Costs Amount.';
                        ApplicationArea = All;
                }
                field(calcRecogSalesGLAmount; Rec."Calc. Recog. Sales G/L Amount")
                    {
                        Caption = 'Calc. Recog. Sales G/L Amount';
                        ToolTip = 'Specifies the Calc. Recog. Sales G/L Amount.';
                        ApplicationArea = All;
                }
                field(calcRecogCostsGLAmount; Rec."Calc. Recog. Costs G/L Amount")
                    {
                        Caption = 'Calc. Recog. Costs G/L Amount';
                        ToolTip = 'Specifies the Calc. Recog. Costs G/L Amount.';
                        ApplicationArea = All;
                }
                field(wipCompletionPosted; Rec."WIP Completion Posted")
                    {
                        Caption = 'WIP Completion Posted';
                        ToolTip = 'Specifies the WIP Completion Posted.';
                        ApplicationArea = All;
                }
                field(overBudget; Rec."Over Budget")
                    {
                        Caption = 'Over Budget';
                        ToolTip = 'Specifies the Over Budget.';
                        ApplicationArea = All;
                }
                field(projectManager; Rec."Project Manager")
                    {
                        Caption = 'Project Manager';
                        ToolTip = 'Specifies the Project Manager.';
                        ApplicationArea = All;
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                    {
                        Caption = 'Sell-to Customer No.';
                        ToolTip = 'Specifies the Sell-to Customer No..';
                        ApplicationArea = All;
                }
                field(sellToCustomerName; Rec."Sell-to Customer Name")
                    {
                        Caption = 'Sell-to Customer Name';
                        ToolTip = 'Specifies the Sell-to Customer Name.';
                        ApplicationArea = All;
                }
                field(sellToCustomerName2; Rec."Sell-to Customer Name 2")
                    {
                        Caption = 'Sell-to Customer Name 2';
                        ToolTip = 'Specifies an additional part of the name of the customer who will receive the products and be billed by default.';
                        ApplicationArea = All;
                }
                field(sellToAddress; Rec."Sell-to Address")
                    {
                        Caption = 'Sell-to Address';
                        ToolTip = 'Specifies the Sell-to Address.';
                        ApplicationArea = All;
                }
                field(sellToAddress2; Rec."Sell-to Address 2")
                    {
                        Caption = 'Sell-to Address 2';
                        ToolTip = 'Specifies the Sell-to Address 2.';
                        ApplicationArea = All;
                }
                field(sellToCity; Rec."Sell-to City")
                    {
                        Caption = 'Sell-to City';
                        ToolTip = 'Specifies the Sell-to City.';
                        ApplicationArea = All;
                }
                field(sellToContact; Rec."Sell-to Contact")
                    {
                        Caption = 'Sell-to Contact';
                        ToolTip = 'Specifies the Sell-to Contact.';
                        ApplicationArea = All;
                }
                field(sellToPostCode; Rec."Sell-to Post Code")
                    {
                        Caption = 'Sell-to Post Code';
                        ToolTip = 'Specifies the Sell-to Post Code.';
                        ApplicationArea = All;
                }
                field(sellToCounty; Rec."Sell-to County")
                    {
                        Caption = 'Sell-to County';
                        ToolTip = 'Specifies the Sell-to County.';
                        ApplicationArea = All;
                }
                field(sellToCountryRegionCode; Rec."Sell-to Country/Region Code")
                    {
                        Caption = 'Sell-to Country/Region Code';
                        ToolTip = 'Specifies the Sell-to Country/Region Code.';
                        ApplicationArea = All;
                }
                field(sellToPhoneNo; Rec."Sell-to Phone No.")
                    {
                        Caption = 'Sell-to Phone No.';
                        ToolTip = 'Specifies the Sell-to Phone No..';
                        ApplicationArea = All;
                }
                field(sellToEMail; Rec."Sell-to E-Mail")
                    {
                        Caption = 'Email';
                        ToolTip = 'Specifies the Sell-to E-Mail.';
                        ApplicationArea = All;
                }
                field(sellToContactNo; Rec."Sell-to Contact No.")
                    {
                        Caption = 'Sell-to Contact No.';
                        ToolTip = 'Specifies the Sell-to Contact No..';
                        ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                    {
                        Caption = 'Ship-to Code';
                        ToolTip = 'Specifies the Ship-to Code.';
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
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code")
                    {
                        Caption = 'Ship-to Country/Region Code';
                        ToolTip = 'Specifies the Ship-to Country/Region Code.';
                        ApplicationArea = All;
                }
                field(noOfArchivedVersions; Rec."No. of Archived Versions")
                    {
                        Caption = 'No. of Archived Versions';
                        ToolTip = 'Specifies the No. of Archived Versions.';
                        ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                    {
                        Caption = 'External Document No.';
                        ToolTip = 'Specifies the External Document No..';
                        ApplicationArea = All;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                    {
                        Caption = 'Payment Method Code';
                        ToolTip = 'Specifies the Payment Method Code.';
                        ApplicationArea = All;
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                    {
                        Caption = 'Payment Terms Code';
                        ToolTip = 'Specifies the Payment Terms Code.';
                        ApplicationArea = All;
                }
                field(yourReference; Rec."Your Reference")
                    {
                        Caption = 'Your Reference';
                        ToolTip = 'Specifies the Your Reference.';
                        ApplicationArea = All;
                }
                field(priceCalculationMethod; Rec."Price Calculation Method")
                    {
                        Caption = 'Price Calculation Method';
                        ToolTip = 'Specifies the Price Calculation Method.';
                        ApplicationArea = All;
                }
                field(costCalculationMethod; Rec."Cost Calculation Method")
                    {
                        Caption = 'Cost Calculation Method';
                        ToolTip = 'Specifies the Cost Calculation Method.';
                        ApplicationArea = All;
                }
                field(completelyPicked; Rec."Completely Picked")
                    {
                        Caption = 'Completely Picked';
                        ToolTip = 'Specifies the Completely Picked.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
