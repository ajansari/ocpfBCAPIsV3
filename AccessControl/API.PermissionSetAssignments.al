namespace OnlyCopilotFans.OCPFAPIsv3;

using System.Security.AccessControl;

page 91003 "ocpfPermissionSetAssignments"
{
    PageType = API;
    Caption = 'Permission Set Assignments — which permission set is granted to which user, and in which company. POST a record to assign a permission set to a user; DELETE it to revoke. Assigning a permission set to a security group is not supported here — use the Business Central UI.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_accessControl';
    APIVersion = 'v3.1';
    EntityName = 'ocpfPermissionSetAssignment';
    EntitySetName = 'ocpfPermissionSetAssignments';
    SourceTable = "Access Control";
    ODataKeyFields = "App ID", "Role ID", "User Security ID", "Company Name";
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(userSecurityId; Rec."User Security ID")
                {
                    Caption = 'User Security ID';
                    ToolTip = 'Specifies the user that the permission set is assigned to. Take this value from ocpfUsers. Assigning to a security group is not supported through this API — use the Business Central UI.';
                    ApplicationArea = All;
                }
                field(roleId; Rec."Role ID")
                {
                    Caption = 'Role ID';
                    ToolTip = 'Specifies the identifier of the permission set being assigned, for example D365 BASIC. Take this value from ocpfPermissionSets.';
                    ApplicationArea = All;
                }
                field(scope; Rec.Scope)
                {
                    Caption = 'Scope';
                    ToolTip = 'Specifies whether the assigned permission set is a System (system or extension) or Tenant permission set. Must match the scope reported for the permission set in ocpfPermissionSets.';
                    ApplicationArea = All;
                }
                field(appId; Rec."App ID")
                {
                    Caption = 'App ID';
                    ToolTip = 'Specifies the ID of the extension that owns the assigned permission set. Must match the app ID reported for the permission set in ocpfPermissionSets; use an empty GUID for base-application and tenant permission sets.';
                    ApplicationArea = All;
                }
                field(companyName; Rec."Company Name")
                {
                    Caption = 'Company Name';
                    ToolTip = 'Specifies the company the assignment applies to. Leave blank to grant the permission set in all companies.';
                    ApplicationArea = All;
                }
                field(userName; Rec."User Name")
                {
                    Caption = 'User Name';
                    ToolTip = 'Specifies the name of the user the permission set is assigned to.';
                    ApplicationArea = All;
                }
                field(roleName; Rec."Role Name")
                {
                    Caption = 'Role Name';
                    ToolTip = 'Specifies the descriptive name of the assigned permission set.';
                    ApplicationArea = All;
                }
                field(appName; Rec."App Name")
                {
                    Caption = 'App Name';
                    ToolTip = 'Specifies the name of the extension that owns the assigned permission set.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
