namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.CRM.BusinessRelation;

page 90845 "ocpfContactBusinessRelations"
{
    PageType = API;
    Caption = 'Contact Business Relations — links between contacts and their associated business entities such as customers, vendors, or bank accounts.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfContactBusinessRelation';
    EntitySetName = 'ocpfContactBusinessRelations';
    SourceTable = "Contact Business Relation";
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
                field(contactNo; Rec."Contact No.")
                {
                    Caption = 'Contact No.';
                    ToolTip = 'Specifies the contact no. for this contact business relation record.';
                    ApplicationArea = All;
                }
                field(businessRelationCode; Rec."Business Relation Code")
                {
                    Caption = 'Business Relation Code';
                    ToolTip = 'Specifies the business relation code for this contact business relation record.';
                    ApplicationArea = All;
                }
                field(linkToTable; Rec."Link to Table")
                {
                    Caption = 'Link to Table';
                    ToolTip = 'Specifies the link to table for this contact business relation record.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the no. for this contact business relation record.';
                    ApplicationArea = All;
                }
                field(businessRelationDescription; Rec."Business Relation Description")
                {
                    Caption = 'Business Relation Description';
                    ToolTip = 'Specifies the business relation description for this contact business relation record.';
                    ApplicationArea = All;
                }
                field(contactName; Rec."Contact Name")
                {
                    Caption = 'Contact Name';
                    ToolTip = 'Specifies the contact name for this contact business relation record.';
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