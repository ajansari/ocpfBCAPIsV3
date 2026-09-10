namespace OnlyCopilotFans.OCPFAPIsv3;

using System.Security.AccessControl;

page 91002 "ocpfUsers"
{
    PageType = API;
    Caption = 'Users — BC user accounts. Security-group rows also appear here (License Type AAD Group or Windows Group), shown for reference only; they are not valid targets for ocpfPermissionSetAssignments, which assigns permission sets to individual users. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_accessControl';
    APIVersion = 'v3.1';
    EntityName = 'ocpfUser';
    EntitySetName = 'ocpfUsers';
    SourceTable = User;
    ODataKeyFields = "User Security ID";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(userSecurityId; Rec."User Security ID")
                {
                    Caption = 'User Security ID';
                    ToolTip = 'Specifies the unique identifier of the user. Use this value as the assignee when assigning a permission set to a user through ocpfPermissionSetAssignments.';
                    ApplicationArea = All;
                }
                field(userName; Rec."User Name")
                {
                    Caption = 'User Name';
                    ToolTip = 'Specifies the user name, or the name of the security group for group rows.';
                    ApplicationArea = All;
                }
                field(fullName; Rec."Full Name")
                {
                    Caption = 'Full Name';
                    ToolTip = 'Specifies the full name of the user.';
                    ApplicationArea = All;
                }
                field(state; Rec.State)
                {
                    Caption = 'State';
                    ToolTip = 'Specifies whether the user account is Enabled or Disabled.';
                    ApplicationArea = All;
                }
                field(licenseType; Rec."License Type")
                {
                    Caption = 'License Type';
                    ToolTip = 'Specifies the license type of the account. AAD Group and Windows Group identify security-group rows rather than individual users.';
                    ApplicationArea = All;
                }
                field(expiryDate; Rec."Expiry Date")
                {
                    Caption = 'Expiry Date';
                    ToolTip = 'Specifies the date and time when the user account expires.';
                    ApplicationArea = All;
                }
                field(authenticationEmail; Rec."Authentication Email")
                {
                    Caption = 'Authentication Email';
                    ToolTip = 'Specifies the email address used to authenticate the user (the Microsoft Entra sign-in name).';
                    ApplicationArea = All;
                }
                field(contactEmail; Rec."Contact Email")
                {
                    Caption = 'Contact Email';
                    ToolTip = 'Specifies the email address used to contact the user.';
                    ApplicationArea = All;
                }
                field(exchangeIdentifier; Rec."Exchange Identifier")
                {
                    Caption = 'Exchange Identifier';
                    ToolTip = 'Specifies the identifier used to match the user with an Exchange account.';
                    ApplicationArea = All;
                }
                field(applicationId; Rec."Application ID")
                {
                    Caption = 'Application ID';
                    ToolTip = 'Specifies the application ID associated with the account, for service-to-service and agent accounts.';
                    ApplicationArea = All;
                }
                field(changePassword; Rec."Change Password")
                {
                    Caption = 'Change Password';
                    ToolTip = 'Specifies that the user must change the password at the next sign-in.';
                    ApplicationArea = All;
                }
                field(windowsSecurityId; Rec."Windows Security ID")
                {
                    Caption = 'Windows Security ID';
                    ToolTip = 'Specifies the Windows security identifier for the user, used only in on-premises Windows authentication deployments.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
