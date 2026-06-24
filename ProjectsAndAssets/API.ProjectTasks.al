namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Projects.Project.Job;

page 90912 "ocpfProjectTasks"
{
    PageType = API;
    Caption = 'Project tasks — work breakdown structure lines within a project.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0';
    EntityName = 'ocpfProjectTask';
    EntitySetName = 'ocpfProjectTasks';
    SourceTable = "Job Task";
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
                field(jobNo; Rec."Job No.")
                    {
                        Caption = 'Project No.';
                        ToolTip = 'Specifies the Job No..';
                        ApplicationArea = All;
                }
                field(jobTaskNo; Rec."Job Task No.")
                    {
                        Caption = 'Project Task No.';
                        ToolTip = 'Specifies the Job Task No..';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(jobTaskType; Rec."Job Task Type")
                    {
                        Caption = 'Project Task Type';
                        ToolTip = 'Specifies the Job Task Type.';
                        ApplicationArea = All;
                }
                field(wipTotal; Rec."WIP-Total")
                    {
                        Caption = 'WIP-Total';
                        ToolTip = 'Specifies the WIP-Total.';
                        ApplicationArea = All;
                }
                field(jobPostingGroup; Rec."Job Posting Group")
                    {
                        Caption = 'Project Posting Group';
                        ToolTip = 'Specifies the Job Posting Group.';
                        ApplicationArea = All;
                }
                field(wipMethod; Rec."WIP Method")
                    {
                        Caption = 'WIP Method';
                        ToolTip = 'Specifies the WIP Method.';
                        ApplicationArea = All;
                }
                field(scheduleTotalCost; Rec."Schedule (Total Cost)")
                    {
                        Caption = 'Budget (Total Cost)';
                        ToolTip = 'Specifies the Schedule (Total Cost).';
                        ApplicationArea = All;
                }
                field(scheduleTotalPrice; Rec."Schedule (Total Price)")
                    {
                        Caption = 'Budget (Total Price)';
                        ToolTip = 'Specifies the Schedule (Total Price).';
                        ApplicationArea = All;
                }
                field(usageTotalCost; Rec."Usage (Total Cost)")
                    {
                        Caption = 'Actual (Total Cost)';
                        ToolTip = 'Specifies the Usage (Total Cost).';
                        ApplicationArea = All;
                }
                field(usageTotalPrice; Rec."Usage (Total Price)")
                    {
                        Caption = 'Actual (Total Price)';
                        ToolTip = 'Specifies the Usage (Total Price).';
                        ApplicationArea = All;
                }
                field(contractTotalCost; Rec."Contract (Total Cost)")
                    {
                        Caption = 'Billable (Total Cost)';
                        ToolTip = 'Specifies the Contract (Total Cost).';
                        ApplicationArea = All;
                }
                field(contractTotalPrice; Rec."Contract (Total Price)")
                    {
                        Caption = 'Billable (Total Price)';
                        ToolTip = 'Specifies the Contract (Total Price).';
                        ApplicationArea = All;
                }
                field(contractInvoicedPrice; Rec."Contract (Invoiced Price)")
                    {
                        Caption = 'Invoiced (Total Price)';
                        ToolTip = 'Specifies the Contract (Invoiced Price).';
                        ApplicationArea = All;
                }
                field(contractInvoicedCost; Rec."Contract (Invoiced Cost)")
                    {
                        Caption = 'Invoiced (Total Cost)';
                        ToolTip = 'Specifies the Contract (Invoiced Cost).';
                        ApplicationArea = All;
                }
                field(postingDateFilter; Rec."Posting Date Filter")
                    {
                        Caption = 'Posting Date Filter';
                        ToolTip = 'Specifies the Posting Date Filter.';
                        ApplicationArea = All;
                }
                field(planningDateFilter; Rec."Planning Date Filter")
                    {
                        Caption = 'Planning Date Filter';
                        ToolTip = 'Specifies the Planning Date Filter.';
                        ApplicationArea = All;
                }
                field(totaling; Rec.Totaling)
                    {
                        Caption = 'Totaling';
                        ToolTip = 'Specifies the Totaling.';
                        ApplicationArea = All;
                }
                field(newPage; Rec."New Page")
                    {
                        Caption = 'New Page';
                        ToolTip = 'Specifies the New Page.';
                        ApplicationArea = All;
                }
                field(noOfBlankLines; Rec."No. of Blank Lines")
                    {
                        Caption = 'No. of Blank Lines';
                        ToolTip = 'Specifies the No. of Blank Lines.';
                        ApplicationArea = All;
                }
                field(indentation; Rec.Indentation)
                    {
                        Caption = 'Indentation';
                        ToolTip = 'Specifies the Indentation.';
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
                field(recognizedSalesAmount; Rec."Recognized Sales Amount")
                    {
                        Caption = 'Recognized Sales Amount';
                        ToolTip = 'Specifies the Recognized Sales Amount.';
                        ApplicationArea = All;
                }
                field(recognizedCostsAmount; Rec."Recognized Costs Amount")
                    {
                        Caption = 'Recognized Costs Amount';
                        ToolTip = 'Specifies the Recognized Costs Amount.';
                        ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                    {
                        Caption = 'Language Code';
                        ToolTip = 'Specifies the Language Code.';
                        ApplicationArea = All;
                }
                field(recognizedSalesGLAmount; Rec."Recognized Sales G/L Amount")
                    {
                        Caption = 'Recognized Sales G/L Amount';
                        ToolTip = 'Specifies the Recognized Sales G/L Amount.';
                        ApplicationArea = All;
                }
                field(recognizedCostsGLAmount; Rec."Recognized Costs G/L Amount")
                    {
                        Caption = 'Recognized Costs G/L Amount';
                        ToolTip = 'Specifies the Recognized Costs G/L Amount.';
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
                field(outstandingOrders; Rec."Outstanding Orders")
                    {
                        Caption = 'Outstanding Orders';
                        ToolTip = 'Specifies the Outstanding Orders.';
                        ApplicationArea = All;
                }
                field(amtRcdNotInvoiced; Rec."Amt. Rcd. Not Invoiced")
                    {
                        Caption = 'Amt. Rcd. Not Invoiced';
                        ToolTip = 'Specifies the Amt. Rcd. Not Invoiced.';
                        ApplicationArea = All;
                }
                field(remainingTotalCost; Rec."Remaining (Total Cost)")
                    {
                        Caption = 'Remaining (Total Cost)';
                        ToolTip = 'Specifies the Remaining (Total Cost).';
                        ApplicationArea = All;
                }
                field(remainingTotalPrice; Rec."Remaining (Total Price)")
                    {
                        Caption = 'Remaining (Total Price)';
                        ToolTip = 'Specifies the Remaining (Total Price).';
                        ApplicationArea = All;
                }
                field(startDate; Rec."Start Date")
                    {
                        Caption = 'Start Date';
                        ToolTip = 'Specifies the Start Date.';
                        ApplicationArea = All;
                }
                field(endDate; Rec."End Date")
                    {
                        Caption = 'End Date';
                        ToolTip = 'Specifies the End Date.';
                        ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                    {
                        Caption = 'Bill-to Customer No.';
                        ToolTip = 'Specifies the Bill-to Customer No..';
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
                field(invoiceCurrencyCode; Rec."Invoice Currency Code")
                    {
                        Caption = 'Invoice Currency Code';
                        ToolTip = 'Specifies the Invoice Currency Code.';
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
