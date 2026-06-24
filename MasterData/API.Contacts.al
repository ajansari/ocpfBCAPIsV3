namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.CRM.Contact;

page 90844 "ocpfContacts"
{
    PageType = API;
    Caption = 'Contacts — individuals and companies in the CRM module, linked to customers, vendors, or standalone for prospecting.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfContact';
    EntitySetName = 'ocpfContacts';
    SourceTable = Contact;
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
                    ToolTip = 'Specifies the no. for this contact record.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name for this contact record.';
                    ApplicationArea = All;
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies the search name for this contact record.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies the name 2 for this contact record.';
                    ApplicationArea = All;
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the address for this contact record.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies the address 2 for this contact record.';
                    ApplicationArea = All;
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city for this contact record.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the phone no. for this contact record.';
                    ApplicationArea = All;
                }
                field(telexNo; Rec."Telex No.")
                {
                    Caption = 'Telex No.';
                    ToolTip = 'Specifies the telex no. for this contact record.';
                    ApplicationArea = All;
                }
                field(territoryCode; Rec."Territory Code")
                {
                    Caption = 'Territory Code';
                    ToolTip = 'Specifies the territory code for this contact record.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this contact record.';
                    ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                    ToolTip = 'Specifies the language code for this contact record.';
                    ApplicationArea = All;
                }
                field(registrationNumber; Rec."Registration Number")
                {
                    Caption = 'Registration No.';
                    ToolTip = 'Specifies the registration number for this contact record.';
                    ApplicationArea = All;
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                    ToolTip = 'Specifies the salesperson code for this contact record.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region code for this contact record.';
                    ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the comment for this contact record.';
                    ApplicationArea = All;
                }
                field(formatRegion; Rec."Format Region")
                {
                    Caption = 'Format Region';
                    ToolTip = 'Specifies the format region for this contact record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date modified for this contact record.';
                    ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the fax no. for this contact record.';
                    ApplicationArea = All;
                }
                field(telexAnswerBack; Rec."Telex Answer Back")
                {
                    Caption = 'Telex Answer Back';
                    ToolTip = 'Specifies the telex answer back for this contact record.';
                    ApplicationArea = All;
                }
                field(vATRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                    ToolTip = 'Specifies the vat registration no. for this contact record.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the post code for this contact record.';
                    ApplicationArea = All;
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the county for this contact record.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the e-mail for this contact record.';
                    ApplicationArea = All;
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Home Page';
                    ToolTip = 'Specifies the home page for this contact record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this contact record.';
                    ApplicationArea = All;
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                    ToolTip = 'Specifies the image for this contact record.';
                    ApplicationArea = All;
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                    ToolTip = 'Specifies the privacy blocked for this contact record.';
                    ApplicationArea = All;
                }
                field(minor; Rec.Minor)
                {
                    Caption = 'Minor';
                    ToolTip = 'Specifies the minor for this contact record.';
                    ApplicationArea = All;
                }
                field(parentalConsentReceived; Rec."Parental Consent Received")
                {
                    Caption = 'Parental Consent Received';
                    ToolTip = 'Specifies the parental consent received for this contact record.';
                    ApplicationArea = All;
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dataverse';
                    ToolTip = 'Specifies the coupled to dataverse for this contact record.';
                    ApplicationArea = All;
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type for this contact record.';
                    ApplicationArea = All;
                }
                field(companyNo; Rec."Company No.")
                {
                    Caption = 'Company No.';
                    ToolTip = 'Specifies the company no. for this contact record.';
                    ApplicationArea = All;
                }
                field(companyName; Rec."Company Name")
                {
                    Caption = 'Company Name';
                    ToolTip = 'Specifies the company name for this contact record.';
                    ApplicationArea = All;
                }
                field(lookupContactNo; Rec."Lookup Contact No.")
                {
                    Caption = 'Lookup Contact No.';
                    ToolTip = 'Specifies the lookup contact no. for this contact record.';
                    ApplicationArea = All;
                }
                field(firstName; Rec."First Name")
                {
                    Caption = 'First Name';
                    ToolTip = 'Specifies the first name for this contact record.';
                    ApplicationArea = All;
                }
                field(middleName; Rec."Middle Name")
                {
                    Caption = 'Middle Name';
                    ToolTip = 'Specifies the middle name for this contact record.';
                    ApplicationArea = All;
                }
                field(surname; Rec.Surname)
                {
                    Caption = 'Surname';
                    ToolTip = 'Specifies the surname for this contact record.';
                    ApplicationArea = All;
                }
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                    ToolTip = 'Specifies the job title for this contact record.';
                    ApplicationArea = All;
                }
                field(initials; Rec.Initials)
                {
                    Caption = 'Initials';
                    ToolTip = 'Specifies the initials for this contact record.';
                    ApplicationArea = All;
                }
                field(extensionNo; Rec."Extension No.")
                {
                    Caption = 'Extension No.';
                    ToolTip = 'Specifies the extension no. for this contact record.';
                    ApplicationArea = All;
                }
                field(mobilePhoneNo; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No.';
                    ToolTip = 'Specifies the mobile phone no. for this contact record.';
                    ApplicationArea = All;
                }
                field(pager; Rec.Pager)
                {
                    Caption = 'Pager';
                    ToolTip = 'Specifies the pager for this contact record.';
                    ApplicationArea = All;
                }
                field(organizationalLevelCode; Rec."Organizational Level Code")
                {
                    Caption = 'Organizational Level Code';
                    ToolTip = 'Specifies the organizational level code for this contact record.';
                    ApplicationArea = All;
                }
                field(excludeFromSegment; Rec."Exclude from Segment")
                {
                    Caption = 'Exclude from Segment';
                    ToolTip = 'Specifies the exclude from segment for this contact record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this contact record.';
                    ApplicationArea = All;
                }
                field(nextTaskDate; Rec."Next Task Date")
                {
                    Caption = 'Next Task Date';
                    ToolTip = 'Specifies the next task date for this contact record.';
                    ApplicationArea = All;
                }
                field(lastDateAttempted; Rec."Last Date Attempted")
                {
                    Caption = 'Last Date Attempted';
                    ToolTip = 'Specifies the last date attempted for this contact record.';
                    ApplicationArea = All;
                }
                field(dateOfLastInteraction; Rec."Date of Last Interaction")
                {
                    Caption = 'Date of Last Interaction';
                    ToolTip = 'Specifies the date of last interaction for this contact record.';
                    ApplicationArea = All;
                }
                field(noOfJobResponsibilities; Rec."No. of Job Responsibilities")
                {
                    Caption = 'No. of Job Responsibilities';
                    ToolTip = 'Specifies the no. of job responsibilities for this contact record.';
                    ApplicationArea = All;
                }
                field(noOfIndustryGroups; Rec."No. of Industry Groups")
                {
                    Caption = 'No. of Industry Groups';
                    ToolTip = 'Specifies the no. of industry groups for this contact record.';
                    ApplicationArea = All;
                }
                field(noOfBusinessRelations; Rec."No. of Business Relations")
                {
                    Caption = 'No. of Business Relations';
                    ToolTip = 'Specifies the no. of business relations for this contact record.';
                    ApplicationArea = All;
                }
                field(noOfMailingGroups; Rec."No. of Mailing Groups")
                {
                    Caption = 'No. of Mailing Groups';
                    ToolTip = 'Specifies the no. of mailing groups for this contact record.';
                    ApplicationArea = All;
                }
                field(externalId; Rec."External ID")
                {
                    Caption = 'External ID';
                    ToolTip = 'Specifies the external id for this contact record.';
                    ApplicationArea = All;
                }
                field(noOfInteractions; Rec."No. of Interactions")
                {
                    Caption = 'No. of Interactions';
                    ToolTip = 'Specifies the no. of interactions for this contact record.';
                    ApplicationArea = All;
                }
                field(noOfOpportunities; Rec."No. of Opportunities")
                {
                    Caption = 'No. of Opportunities';
                    ToolTip = 'Specifies the no. of opportunities for this contact record.';
                    ApplicationArea = All;
                }
                field(opportunityEntryExists; Rec."Opportunity Entry Exists")
                {
                    Caption = 'Opportunity Entry Exists';
                    ToolTip = 'Specifies the opportunity entry exists for this contact record.';
                    ApplicationArea = All;
                }
                field(taskEntryExists; Rec."Task Entry Exists")
                {
                    Caption = 'Task Entry Exists';
                    ToolTip = 'Specifies the task entry exists for this contact record.';
                    ApplicationArea = All;
                }
                field(salespersonFilter; Rec."Salesperson Filter")
                {
                    Caption = 'Salesperson Filter';
                    ToolTip = 'Specifies the salesperson filter for this contact record.';
                    ApplicationArea = All;
                }
                field(campaignFilter; Rec."Campaign Filter")
                {
                    Caption = 'Campaign Filter';
                    ToolTip = 'Specifies the campaign filter for this contact record.';
                    ApplicationArea = All;
                }
                field(contactBusinessRelation; Rec."Contact Business Relation")
                {
                    Caption = 'Contact Business Relation';
                    ToolTip = 'Specifies the contact business relation for this contact record.';
                    ApplicationArea = All;
                }
                field(actionTakenFilter; Rec."Action Taken Filter")
                {
                    Caption = 'Action Taken Filter';
                    ToolTip = 'Specifies the action taken filter for this contact record.';
                    ApplicationArea = All;
                }
                field(salesCycleFilter; Rec."Sales Cycle Filter")
                {
                    Caption = 'Sales Cycle Filter';
                    ToolTip = 'Specifies the sales cycle filter for this contact record.';
                    ApplicationArea = All;
                }
                field(salesCycleStageFilter; Rec."Sales Cycle Stage Filter")
                {
                    Caption = 'Sales Cycle Stage Filter';
                    ToolTip = 'Specifies the sales cycle stage filter for this contact record.';
                    ApplicationArea = All;
                }
                field(probabilityFilter; Rec."Probability % Filter")
                {
                    Caption = 'Probability % Filter';
                    ToolTip = 'Specifies the probability % filter for this contact record.';
                    ApplicationArea = All;
                }
                field(completedFilter; Rec."Completed % Filter")
                {
                    Caption = 'Completed % Filter';
                    ToolTip = 'Specifies the completed % filter for this contact record.';
                    ApplicationArea = All;
                }
                field(estimatedValueFilter; Rec."Estimated Value Filter")
                {
                    Caption = 'Estimated Value Filter';
                    ToolTip = 'Specifies the estimated value filter for this contact record.';
                    ApplicationArea = All;
                }
                field(calcdCurrentValueFilter; Rec."Calcd. Current Value Filter")
                {
                    Caption = 'Calcd. Current Value Filter';
                    ToolTip = 'Specifies the calcd. current value filter for this contact record.';
                    ApplicationArea = All;
                }
                field(chancesOfSuccessFilter; Rec."Chances of Success % Filter")
                {
                    Caption = 'Chances of Success % Filter';
                    ToolTip = 'Specifies the chances of success % filter for this contact record.';
                    ApplicationArea = All;
                }
                field(taskStatusFilter; Rec."Task Status Filter")
                {
                    Caption = 'Task Status Filter';
                    ToolTip = 'Specifies the task status filter for this contact record.';
                    ApplicationArea = All;
                }
                field(taskClosedFilter; Rec."Task Closed Filter")
                {
                    Caption = 'Task Closed Filter';
                    ToolTip = 'Specifies the task closed filter for this contact record.';
                    ApplicationArea = All;
                }
                field(priorityFilter; Rec."Priority Filter")
                {
                    Caption = 'Priority Filter';
                    ToolTip = 'Specifies the priority filter for this contact record.';
                    ApplicationArea = All;
                }
                field(teamFilter; Rec."Team Filter")
                {
                    Caption = 'Team Filter';
                    ToolTip = 'Specifies the team filter for this contact record.';
                    ApplicationArea = All;
                }
                field(closeOpportunityFilter; Rec."Close Opportunity Filter")
                {
                    Caption = 'Close Opportunity Filter';
                    ToolTip = 'Specifies the close opportunity filter for this contact record.';
                    ApplicationArea = All;
                }
                field(correspondenceType; Rec."Correspondence Type")
                {
                    Caption = 'Correspondence Type';
                    ToolTip = 'Specifies the correspondence type for this contact record.';
                    ApplicationArea = All;
                }
                field(salutationCode; Rec."Salutation Code")
                {
                    Caption = 'Salutation Code';
                    ToolTip = 'Specifies the salutation code for this contact record.';
                    ApplicationArea = All;
                }
                field(searchEMail; Rec."Search E-Mail")
                {
                    Caption = 'Search Email';
                    ToolTip = 'Specifies the search e-mail for this contact record.';
                    ApplicationArea = All;
                }
                field(lastTimeModified; Rec."Last Time Modified")
                {
                    Caption = 'Last Time Modified';
                    ToolTip = 'Specifies the last time modified for this contact record.';
                    ApplicationArea = All;
                }
                field(eMail2; Rec."E-Mail 2")
                {
                    Caption = 'Email 2';
                    ToolTip = 'Specifies the e-mail 2 for this contact record.';
                    ApplicationArea = All;
                }
                field(jobResponsibilityFilter; Rec."Job Responsibility Filter")
                {
                    Caption = 'Job Responsibility Filter';
                    ToolTip = 'Specifies the job responsibility filter for this contact record.';
                    ApplicationArea = All;
                }
                field(xrmId; Rec."Xrm Id")
                {
                    Caption = 'Xrm Id';
                    ToolTip = 'Specifies the xrm id for this contact record.';
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