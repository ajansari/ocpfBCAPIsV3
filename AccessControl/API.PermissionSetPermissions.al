namespace OnlyCopilotFans.OCPFAPIsv3;

using System.Security.AccessControl;

page 91001 "ocpfPermissionSetPermissions"
{
    PageType = API;
    Caption = 'Permission Set Permissions — the fully expanded object-level permissions granted by each permission set, for system, extension, and tenant sets. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_accessControl';
    APIVersion = 'v3.1';
    EntityName = 'ocpfPermissionSetPermission';
    EntitySetName = 'ocpfPermissionSetPermissions';
    SourceTable = "Expanded Permission";
    ODataKeyFields = Scope, "App ID", "Role ID", "Object Type", "Object ID";
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
                    ToolTip = 'Specifies whether the owning permission set is defined by the system/an extension (System) or created in this tenant (Tenant).';
                    ApplicationArea = All;
                }
                field(appId; Rec."App ID")
                {
                    Caption = 'App ID';
                    ToolTip = 'Specifies the ID of the extension that owns the permission set this permission belongs to. An empty GUID means the base application or the tenant.';
                    ApplicationArea = All;
                }
                field(roleId; Rec."Role ID")
                {
                    Caption = 'Role ID';
                    ToolTip = 'Specifies the identifier of the permission set this permission belongs to.';
                    ApplicationArea = All;
                }
                field(roleName; Rec."Role Name")
                {
                    Caption = 'Role Name';
                    ToolTip = 'Specifies the descriptive name of the permission set this permission belongs to.';
                    ApplicationArea = All;
                }
                field(objectType; Rec."Object Type")
                {
                    Caption = 'Object Type';
                    ToolTip = 'Specifies the type of object the permission applies to, such as Table Data, Table, Report, Codeunit, Page, or Query.';
                    ApplicationArea = All;
                }
                field(objectId; Rec."Object ID")
                {
                    Caption = 'Object ID';
                    ToolTip = 'Specifies the ID of the object the permission applies to. 0 means the permission applies to all objects of the given type.';
                    ApplicationArea = All;
                }
                field(objectName; Rec."Object Name")
                {
                    Caption = 'Object Name';
                    ToolTip = 'Specifies the name of the object the permission applies to.';
                    ApplicationArea = All;
                }
                field(alObjectName; Rec."AL Object Name")
                {
                    Caption = 'AL Object Name';
                    ToolTip = 'Specifies the AL (internal) name of the object the permission applies to.';
                    ApplicationArea = All;
                }
                field(readPermission; Rec."Read Permission")
                {
                    Caption = 'Read Permission';
                    ToolTip = 'Specifies the read permission: blank (none), Yes (direct), or Indirect (allowed only through another object).';
                    ApplicationArea = All;
                }
                field(insertPermission; Rec."Insert Permission")
                {
                    Caption = 'Insert Permission';
                    ToolTip = 'Specifies the insert permission: blank (none), Yes (direct), or Indirect (allowed only through another object).';
                    ApplicationArea = All;
                }
                field(modifyPermission; Rec."Modify Permission")
                {
                    Caption = 'Modify Permission';
                    ToolTip = 'Specifies the modify permission: blank (none), Yes (direct), or Indirect (allowed only through another object).';
                    ApplicationArea = All;
                }
                field(deletePermission; Rec."Delete Permission")
                {
                    Caption = 'Delete Permission';
                    ToolTip = 'Specifies the delete permission: blank (none), Yes (direct), or Indirect (allowed only through another object).';
                    ApplicationArea = All;
                }
                field(executePermission; Rec."Execute Permission")
                {
                    Caption = 'Execute Permission';
                    ToolTip = 'Specifies the execute permission: blank (none), Yes (direct), or Indirect (allowed only through another object).';
                    ApplicationArea = All;
                }
            }
        }
    }
}
