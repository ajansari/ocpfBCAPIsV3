namespace OnlyCopilotFans.OCPFAPIsv3;

using System.Security.AccessControl;

page 91000 "ocpfPermissionSets"
{
    PageType = API;
    Caption = 'Permission Sets — every permission set available in the environment (system, extension/AppSource/PTE, and tenant-defined). Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_accessControl';
    APIVersion = 'v3.1';
    EntityName = 'ocpfPermissionSet';
    EntitySetName = 'ocpfPermissionSets';
    SourceTable = "Aggregate Permission Set";
    ODataKeyFields = Scope, "App ID", "Role ID";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(scope; Rec.Scope)
                {
                    Caption = 'Scope';
                    ToolTip = 'Specifies whether the permission set is defined by the system/an extension (System) or created in this tenant (Tenant). Tenant permission sets are the only ones that can be modified.';
                    ApplicationArea = All;
                }
                field(appId; Rec."App ID")
                {
                    Caption = 'App ID';
                    ToolTip = 'Specifies the ID of the extension that owns this permission set. An empty GUID means the permission set is defined by the base application or the tenant. Use this value together with the role ID when assigning the permission set.';
                    ApplicationArea = All;
                }
                field(appName; Rec."App Name")
                {
                    Caption = 'App Name';
                    ToolTip = 'Specifies the name of the extension that owns this permission set.';
                    ApplicationArea = All;
                }
                field(roleId; Rec."Role ID")
                {
                    Caption = 'Role ID';
                    ToolTip = 'Specifies the identifier of the permission set, for example D365 BASIC. This is the value used when assigning the permission set to a user.';
                    ApplicationArea = All;
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the descriptive name of the permission set.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
