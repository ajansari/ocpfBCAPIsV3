namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.CRM.Team;

page 90858 "ocpfSalespeople"
{
    PageType = API;
    Caption = 'Salespeople and Purchasers — codes assigned to sales and purchase documents to track responsibility and commission.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfSalesperson';
    EntitySetName = 'ocpfSalespeople';
    SourceTable = "Salesperson/Purchaser";
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
                    ToolTip = 'Specifies the code for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(commission; Rec."Commission %")
                {
                    Caption = 'Commission %';
                    ToolTip = 'Specifies the commission % for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                    ToolTip = 'Specifies the image for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                    ToolTip = 'Specifies the privacy blocked for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dataverse';
                    ToolTip = 'Specifies the coupled to dataverse for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the e-mail for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the phone no. for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(nextTaskDate; Rec."Next Task Date")
                {
                    Caption = 'Next Task Date';
                    ToolTip = 'Specifies the next task date for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(noOfOpportunities; Rec."No. of Opportunities")
                {
                    Caption = 'No. of Opportunities';
                    ToolTip = 'Specifies the no. of opportunities for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(noOfInteractions; Rec."No. of Interactions")
                {
                    Caption = 'No. of Interactions';
                    ToolTip = 'Specifies the no. of interactions for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                    ToolTip = 'Specifies the job title for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(actionTakenFilter; Rec."Action Taken Filter")
                {
                    Caption = 'Action Taken Filter';
                    ToolTip = 'Specifies the action taken filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(salesCycleFilter; Rec."Sales Cycle Filter")
                {
                    Caption = 'Sales Cycle Filter';
                    ToolTip = 'Specifies the sales cycle filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(salesCycleStageFilter; Rec."Sales Cycle Stage Filter")
                {
                    Caption = 'Sales Cycle Stage Filter';
                    ToolTip = 'Specifies the sales cycle stage filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(probabilityFilter; Rec."Probability % Filter")
                {
                    Caption = 'Probability % Filter';
                    ToolTip = 'Specifies the probability % filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(completedFilter; Rec."Completed % Filter")
                {
                    Caption = 'Completed % Filter';
                    ToolTip = 'Specifies the completed % filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(contactFilter; Rec."Contact Filter")
                {
                    Caption = 'Contact Filter';
                    ToolTip = 'Specifies the contact filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(contactCompanyFilter; Rec."Contact Company Filter")
                {
                    Caption = 'Contact Company Filter';
                    ToolTip = 'Specifies the contact company filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(campaignFilter; Rec."Campaign Filter")
                {
                    Caption = 'Campaign Filter';
                    ToolTip = 'Specifies the campaign filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(estimatedValueFilter; Rec."Estimated Value Filter")
                {
                    Caption = 'Estimated Value Filter';
                    ToolTip = 'Specifies the estimated value filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(calcdCurrentValueFilter; Rec."Calcd. Current Value Filter")
                {
                    Caption = 'Calcd. Current Value Filter';
                    ToolTip = 'Specifies the calcd. current value filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(chancesOfSuccessFilter; Rec."Chances of Success % Filter")
                {
                    Caption = 'Chances of Success % Filter';
                    ToolTip = 'Specifies the chances of success % filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(taskStatusFilter; Rec."Task Status Filter")
                {
                    Caption = 'Task Status Filter';
                    ToolTip = 'Specifies the task status filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(closedTaskFilter; Rec."Closed Task Filter")
                {
                    Caption = 'Closed Task Filter';
                    ToolTip = 'Specifies the closed task filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(priorityFilter; Rec."Priority Filter")
                {
                    Caption = 'Priority Filter';
                    ToolTip = 'Specifies the priority filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(teamFilter; Rec."Team Filter")
                {
                    Caption = 'Team Filter';
                    ToolTip = 'Specifies the team filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(opportunityEntryExists; Rec."Opportunity Entry Exists")
                {
                    Caption = 'Opportunity Entry Exists';
                    ToolTip = 'Specifies the opportunity entry exists for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(taskEntryExists; Rec."Task Entry Exists")
                {
                    Caption = 'Task Entry Exists';
                    ToolTip = 'Specifies the task entry exists for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(closeOpportunityFilter; Rec."Close Opportunity Filter")
                {
                    Caption = 'Close Opportunity Filter';
                    ToolTip = 'Specifies the close opportunity filter for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(searchEMail; Rec."Search E-Mail")
                {
                    Caption = 'Search Email';
                    ToolTip = 'Specifies the search e-mail for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(eMail2; Rec."E-Mail 2")
                {
                    Caption = 'Email 2';
                    ToolTip = 'Specifies the e-mail 2 for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ToolTip = 'Specifies the blocked for this salesperson/purchaser record.';
                    ApplicationArea = All;
                }
                field(estimatedValueLcy; Rec."Estimated Value (LCY)")
                {
                    Caption = 'Estimated Value (LCY)';
                    ToolTip = 'Specifies the total estimated value of all the opportunities handled by the salesperson. The field is not editable.';
                    ApplicationArea = All;
                }
                field(calcdCurrentValueLcy; Rec."Calcd. Current Value (LCY)")
                {
                    Caption = 'Calcd. Current Value (LCY)';
                    ToolTip = 'Specifies the total calculated current value of all the opportunities handled by the salesperson. The field is not editable.';
                    ApplicationArea = All;
                }
                field(costLcy; Rec."Cost (LCY)")
                {
                    Caption = 'Cost (LCY)';
                    ToolTip = 'Specifies the total cost of all the interactions handled by the salesperson. The field is not editable.';
                    ApplicationArea = All;
                }
                field(durationMin; Rec."Duration (Min.)")
                {
                    Caption = 'Duration (Min.)';
                    ToolTip = 'Specifies the total duration of all the interactions handled by the salesperson. The field is not editable.';
                    ApplicationArea = All;
                }
                field(avgEstimatedValueLcy; Rec."Avg. Estimated Value (LCY)")
                {
                    Caption = 'Avg. Estimated Value (LCY)';
                    ToolTip = 'Specifies the average estimated value of the opportunities handled by the salesperson.';
                    ApplicationArea = All;
                }
                field(avgCalcdCurrentValueLcy; Rec."Avg.Calcd. Current Value (LCY)")
                {
                    Caption = 'Avg.Calcd. Current Value (LCY)';
                    ToolTip = 'Specifies the average calculated current value of the opportunities handled by that salesperson.';
                    ApplicationArea = All;
                }
            }
        }
    }
}