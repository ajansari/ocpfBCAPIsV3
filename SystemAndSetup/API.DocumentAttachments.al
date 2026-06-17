namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Foundation.Attachment;

page 90930 "ocpfDocumentAttachments"
{
    PageType = API;
    Caption = 'Document attachments — files and links attached to any BC record.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_systemAndSetup';
    APIVersion = 'v3.0';
    EntityName = 'ocpfDocumentAttachment';
    EntitySetName = 'ocpfDocumentAttachments';
    SourceTable = "Document Attachment";
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
                field(id; Rec.ID)
                    {
                        Caption = 'ID';
                        ToolTip = 'Specifies the ID.';
                        ApplicationArea = All;
                }
                field(tableId; Rec."Table ID")
                    {
                        Caption = 'Table ID';
                        ToolTip = 'Specifies the Table ID.';
                        ApplicationArea = All;
                }
                field(no; Rec."No.")
                    {
                        Caption = 'No.';
                        ToolTip = 'Specifies the No..';
                        ApplicationArea = All;
                }
                field(attachedDate; Rec."Attached Date")
                    {
                        Caption = 'Attached Date';
                        ToolTip = 'Specifies the Attached Date.';
                        ApplicationArea = All;
                }
                field(fileName; Rec."File Name")
                    {
                        Caption = 'Attachment';
                        ToolTip = 'Specifies the File Name.';
                        ApplicationArea = All;
                }
                field(fileType; Rec."File Type")
                    {
                        Caption = 'File Type';
                        ToolTip = 'Specifies the File Type.';
                        ApplicationArea = All;
                }
                field(fileExtension; Rec."File Extension")
                    {
                        Caption = 'File Extension';
                        ToolTip = 'Specifies the File Extension.';
                        ApplicationArea = All;
                }
                field(documentReferenceId; Rec."Document Reference ID")
                    {
                        Caption = 'Document Reference ID';
                        ToolTip = 'Specifies the Document Reference ID.';
                        ApplicationArea = All;
                }
                field(attachedBy; Rec."Attached By")
                    {
                        Caption = 'Attached By';
                        ToolTip = 'Specifies the Attached By.';
                        ApplicationArea = All;
                }
                field(user; Rec.User)
                    {
                        Caption = 'User';
                        ToolTip = 'Specifies the User.';
                        ApplicationArea = All;
                }
                field(documentFlowPurchase; Rec."Document Flow Purchase")
                    {
                        Caption = 'Flow to Purch. Trx';
                        ToolTip = 'Specifies the Document Flow Purchase.';
                        ApplicationArea = All;
                }
                field(documentFlowSales; Rec."Document Flow Sales")
                    {
                        Caption = 'Flow to Sales Trx';
                        ToolTip = 'Specifies the Document Flow Sales.';
                        ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                    {
                        Caption = 'Document Type';
                        ToolTip = 'Specifies the Document Type.';
                        ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                    {
                        Caption = 'Line No.';
                        ToolTip = 'Specifies the Line No..';
                        ApplicationArea = All;
                }
                field(vatReportConfigCode; Rec."VAT Report Config. Code")
                    {
                        Caption = 'VAT Report Config. Code';
                        ToolTip = 'Specifies the VAT Report Config. Code.';
                        ApplicationArea = All;
                }
                field(documentFlowService; Rec."Document Flow Service")
                    {
                        Caption = 'Flow to Service Trx';
                        ToolTip = 'Specifies the Document Flow Service.';
                        ApplicationArea = All;
                }
                field(documentFlowProduction; Rec."Document Flow Production")
                    {
                        Caption = 'Flow to Production Trx';
                        ToolTip = 'Specifies the Document Flow Production.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
