namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.HumanResources.Employee;

page 90857 "ocpfEmployees"
{
    PageType = API;
    Caption = 'Employees — human resources records for company staff, including personal details, employment terms, and payroll-related settings.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfEmployee';
    EntitySetName = 'ocpfEmployees';
    SourceTable = Employee;
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
                    ToolTip = 'Specifies the no. for this employee record.';
                    ApplicationArea = All;
                }
                field(firstName; Rec."First Name")
                {
                    Caption = 'First Name';
                    ToolTip = 'Specifies the first name for this employee record.';
                    ApplicationArea = All;
                }
                field(middleName; Rec."Middle Name")
                {
                    Caption = 'Middle Name';
                    ToolTip = 'Specifies the middle name for this employee record.';
                    ApplicationArea = All;
                }
                field(lastName; Rec."Last Name")
                {
                    Caption = 'Last Name';
                    ToolTip = 'Specifies the last name for this employee record.';
                    ApplicationArea = All;
                }
                field(initials; Rec.Initials)
                {
                    Caption = 'Initials';
                    ToolTip = 'Specifies the initials for this employee record.';
                    ApplicationArea = All;
                }
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                    ToolTip = 'Specifies the job title for this employee record.';
                    ApplicationArea = All;
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies the search name for this employee record.';
                    ApplicationArea = All;
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the address for this employee record.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies the address 2 for this employee record.';
                    ApplicationArea = All;
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city for this employee record.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the post code for this employee record.';
                    ApplicationArea = All;
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the county for this employee record.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the phone no. for this employee record.';
                    ApplicationArea = All;
                }
                field(mobilePhoneNo; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No.';
                    ToolTip = 'Specifies the mobile phone no. for this employee record.';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the e-mail for this employee record.';
                    ApplicationArea = All;
                }
                field(altAddressCode; Rec."Alt. Address Code")
                {
                    Caption = 'Alt. Address Code';
                    ToolTip = 'Specifies the alt. address code for this employee record.';
                    ApplicationArea = All;
                }
                field(altAddressStartDate; Rec."Alt. Address Start Date")
                {
                    Caption = 'Alt. Address Start Date';
                    ToolTip = 'Specifies the alt. address start date for this employee record.';
                    ApplicationArea = All;
                }
                field(altAddressEndDate; Rec."Alt. Address End Date")
                {
                    Caption = 'Alt. Address End Date';
                    ToolTip = 'Specifies the alt. address end date for this employee record.';
                    ApplicationArea = All;
                }
                field(birthDate; Rec."Birth Date")
                {
                    Caption = 'Birth Date';
                    ToolTip = 'Specifies the birth date for this employee record.';
                    ApplicationArea = All;
                }
                field(socialSecurityNo; Rec."Social Security No.")
                {
                    Caption = 'Social Security No.';
                    ToolTip = 'Specifies the social security no. for this employee record.';
                    ApplicationArea = All;
                }
                field(unionCode; Rec."Union Code")
                {
                    Caption = 'Union Code';
                    ToolTip = 'Specifies the union code for this employee record.';
                    ApplicationArea = All;
                }
                field(unionMembershipNo; Rec."Union Membership No.")
                {
                    Caption = 'Union Membership No.';
                    ToolTip = 'Specifies the union membership no. for this employee record.';
                    ApplicationArea = All;
                }
                field(gender; Rec.Gender)
                {
                    Caption = 'Gender';
                    ToolTip = 'Specifies the gender for this employee record.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region code for this employee record.';
                    ApplicationArea = All;
                }
                field(managerNo; Rec."Manager No.")
                {
                    Caption = 'Manager No.';
                    ToolTip = 'Specifies the manager no. for this employee record.';
                    ApplicationArea = All;
                }
                field(emplymtContractCode; Rec."Emplymt. Contract Code")
                {
                    Caption = 'Emplymt. Contract Code';
                    ToolTip = 'Specifies the emplymt. contract code for this employee record.';
                    ApplicationArea = All;
                }
                field(statisticsGroupCode; Rec."Statistics Group Code")
                {
                    Caption = 'Statistics Group Code';
                    ToolTip = 'Specifies the statistics group code for this employee record.';
                    ApplicationArea = All;
                }
                field(employmentDate; Rec."Employment Date")
                {
                    Caption = 'Employment Date';
                    ToolTip = 'Specifies the employment date for this employee record.';
                    ApplicationArea = All;
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the status for this employee record.';
                    ApplicationArea = All;
                }
                field(inactiveDate; Rec."Inactive Date")
                {
                    Caption = 'Inactive Date';
                    ToolTip = 'Specifies the inactive date for this employee record.';
                    ApplicationArea = All;
                }
                field(causeOfInactivityCode; Rec."Cause of Inactivity Code")
                {
                    Caption = 'Cause of Inactivity Code';
                    ToolTip = 'Specifies the cause of inactivity code for this employee record.';
                    ApplicationArea = All;
                }
                field(terminationDate; Rec."Termination Date")
                {
                    Caption = 'Termination Date';
                    ToolTip = 'Specifies the termination date for this employee record.';
                    ApplicationArea = All;
                }
                field(groundsForTermCode; Rec."Grounds for Term. Code")
                {
                    Caption = 'Grounds for Term. Code';
                    ToolTip = 'Specifies the grounds for term. code for this employee record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this employee record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this employee record.';
                    ApplicationArea = All;
                }
                field(resourceNo; Rec."Resource No.")
                {
                    Caption = 'Resource No.';
                    ToolTip = 'Specifies the resource no. for this employee record.';
                    ApplicationArea = All;
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the comment for this employee record.';
                    ApplicationArea = All;
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ToolTip = 'Specifies the last date modified for this employee record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this employee record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Filter; Rec."Global Dimension 1 Filter")
                {
                    Caption = 'Global Dimension 1 Filter';
                    ToolTip = 'Specifies the global dimension 1 filter for this employee record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Filter; Rec."Global Dimension 2 Filter")
                {
                    Caption = 'Global Dimension 2 Filter';
                    ToolTip = 'Specifies the global dimension 2 filter for this employee record.';
                    ApplicationArea = All;
                }
                field(causeOfAbsenceFilter; Rec."Cause of Absence Filter")
                {
                    Caption = 'Cause of Absence Filter';
                    ToolTip = 'Specifies the cause of absence filter for this employee record.';
                    ApplicationArea = All;
                }
                field(extension; Rec.Extension)
                {
                    Caption = 'Extension';
                    ToolTip = 'Specifies the extension for this employee record.';
                    ApplicationArea = All;
                }
                field(employeeNoFilter; Rec."Employee No. Filter")
                {
                    Caption = 'Employee No. Filter';
                    ToolTip = 'Specifies the employee no. filter for this employee record.';
                    ApplicationArea = All;
                }
                field(pager; Rec.Pager)
                {
                    Caption = 'Pager';
                    ToolTip = 'Specifies the pager for this employee record.';
                    ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the fax no. for this employee record.';
                    ApplicationArea = All;
                }
                field(companyEMail; Rec."Company E-Mail")
                {
                    Caption = 'Company Email';
                    ToolTip = 'Specifies the company e-mail for this employee record.';
                    ApplicationArea = All;
                }
                field(title; Rec.Title)
                {
                    Caption = 'Title';
                    ToolTip = 'Specifies the title for this employee record.';
                    ApplicationArea = All;
                }
                field(salespersPurchCode; Rec."Salespers./Purch. Code")
                {
                    Caption = 'Salespers./Purch. Code';
                    ToolTip = 'Specifies the salespers./purch. code for this employee record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this employee record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date Time';
                    ToolTip = 'Specifies the last modified date time for this employee record.';
                    ApplicationArea = All;
                }
                field(employeePostingGroup; Rec."Employee Posting Group")
                {
                    Caption = 'Employee Posting Group';
                    ToolTip = 'Specifies the employee posting group for this employee record.';
                    ApplicationArea = All;
                }
                field(bankBranchNo; Rec."Bank Branch No.")
                {
                    Caption = 'Bank Branch No.';
                    ToolTip = 'Specifies the bank branch no. for this employee record.';
                    ApplicationArea = All;
                }
                field(bankAccountNo; Rec."Bank Account No.")
                {
                    Caption = 'Bank Account No.';
                    ToolTip = 'Specifies the bank account no. for this employee record.';
                    ApplicationArea = All;
                }
                field(iBAN; Rec.IBAN)
                {
                    Caption = 'IBAN';
                    ToolTip = 'Specifies the iban for this employee record.';
                    ApplicationArea = All;
                }
                field(balance; Rec.Balance)
                {
                    Caption = 'Balance';
                    ToolTip = 'Specifies the amount the employee owes the company, or the company owes them. For example, for an overpayment, or for expenses, respectively. The word "balance" indicates the amount can be positive (e';
                    ApplicationArea = All;
                }
                field(sWIFTCode; Rec."SWIFT Code")
                {
                    Caption = 'SWIFT Code';
                    ToolTip = 'Specifies the amount the employee owes the company, or the company owes them in local currency. For example, for an overpayment, or for expenses, respectively. The word "balance" indicates the amount ';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency code for this employee record.';
                    ApplicationArea = All;
                }
                field(applicationMethod; Rec."Application Method")
                {
                    Caption = 'Application Method';
                    ToolTip = 'Specifies the application method for this employee record.';
                    ApplicationArea = All;
                }
                field(currencyFilter; Rec."Currency Filter")
                {
                    Caption = 'Currency Filter';
                    ToolTip = 'Specifies the currency filter for this employee record.';
                    ApplicationArea = All;
                }
                field(engagementType; Rec."Engagement Type")
                {
                    Caption = 'Engagement Type';
                    ToolTip = 'Specifies the engagement type for this employee record.';
                    ApplicationArea = All;
                }
                field(collectiveBargainAgmtInfo; Rec."Collective Bargain. Agmt. Info")
                {
                    Caption = 'Collective Bargaining Agreement Info';
                    ToolTip = 'Specifies the collective bargain. agmt. info for this employee record.';
                    ApplicationArea = All;
                }
                field(boardMember; Rec."Board Member")
                {
                    Caption = 'Board Member';
                    ToolTip = 'Specifies the board member for this employee record.';
                    ApplicationArea = All;
                }
                field(managerRole; Rec."Manager Role")
                {
                    Caption = 'Manager Role';
                    ToolTip = 'Specifies the manager role for this employee record.';
                    ApplicationArea = All;
                }
                field(payroll; Rec.Payroll)
                {
                    Caption = 'Payroll';
                    ToolTip = 'Specifies the payroll for this employee record.';
                    ApplicationArea = All;
                }
                field(payrollCurrencyCode; Rec."Payroll Currency Code")
                {
                    Caption = 'Payroll Currency Code';
                    ToolTip = 'Specifies the payroll currency code for this employee record.';
                    ApplicationArea = All;
                }
                field(payrollCurrencyFactor; Rec."Payroll Currency Factor")
                {
                    Caption = 'Payroll Currency Factor';
                    ToolTip = 'Specifies the payroll currency factor for this employee record.';
                    ApplicationArea = All;
                }
                field(nationality; Rec.Nationality)
                {
                    Caption = 'Nationality';
                    ToolTip = 'Specifies the nationality for this employee record.';
                    ApplicationArea = All;
                }
                field(workingType; Rec."Working Type")
                {
                    Caption = 'Working Type';
                    ToolTip = 'Specifies the working type for this employee record.';
                    ApplicationArea = All;
                }
                field(workingHours; Rec."Working Hours")
                {
                    Caption = 'Working Hours';
                    ToolTip = 'Specifies the working hours for this employee record.';
                    ApplicationArea = All;
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                    ToolTip = 'Specifies the image for this employee record.';
                    ApplicationArea = All;
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                    ToolTip = 'Specifies the privacy blocked for this employee record.';
                    ApplicationArea = All;
                }
                field(allowMultiplePostingGroups; Rec."Allow Multiple Posting Groups")
                {
                    Caption = 'Allow Multiple Posting Groups';
                    ToolTip = 'Specifies if multiple posting groups can be used for posting business transactions for this customer.';
                    ApplicationArea = All;
                }
                field(costCenterCode; Rec."Cost Center Code")
                {
                    Caption = 'Cost Center Code';
                    ToolTip = 'Specifies the cost center code for this employee record.';
                    ApplicationArea = All;
                }
                field(costObjectCode; Rec."Cost Object Code")
                {
                    Caption = 'Cost Object Code';
                    ToolTip = 'Specifies the cost object code for this employee record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}