namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Projects.Resources.Ledger;

page 90855 "ocpfResourceLedgerEntries"
{
    PageType = API;
    Caption = 'Resource Ledger Entries — posted usage and cost entries for resources, recording time spent on projects and service orders.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfResourceLedgerEntry';
    EntitySetName = 'ocpfResourceLedgerEntries';
    SourceTable = "Res. Ledger Entry";
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
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    ToolTip = 'Specifies the entry no. for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(entryType; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                    ToolTip = 'Specifies the entry type for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the document no. for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(resourceNo; Rec."Resource No.")
                {
                    Caption = 'Resource No.';
                    ToolTip = 'Specifies the resource no. for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(resourceGroupNo; Rec."Resource Group No.")
                {
                    Caption = 'Resource Group No.';
                    ToolTip = 'Specifies the resource group no. for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(workTypeCode; Rec."Work Type Code")
                {
                    Caption = 'Work Type Code';
                    ToolTip = 'Specifies the work type code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Project No.';
                    ToolTip = 'Specifies the job no. for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies the unit of measure code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the quantity for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(directUnitCost; Rec."Direct Unit Cost")
                {
                    Caption = 'Direct Unit Cost';
                    ToolTip = 'Specifies the direct unit cost for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the unit cost for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(totalCost; Rec."Total Cost")
                {
                    Caption = 'Total Cost';
                    ToolTip = 'Specifies the total cost for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ToolTip = 'Specifies the unit price for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(totalPrice; Rec."Total Price")
                {
                    Caption = 'Total Price';
                    ToolTip = 'Specifies the total price for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the user id for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the source code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(chargeable; Rec.Chargeable)
                {
                    Caption = 'Chargeable';
                    ToolTip = 'Specifies the chargeable for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                    ToolTip = 'Specifies the journal batch name for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                    ToolTip = 'Specifies the reason code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the gen. bus. posting group for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the gen. prod. posting group for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                    ToolTip = 'Specifies the document date for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ToolTip = 'Specifies the external document no. for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(sourceType; Rec."Source Type")
                {
                    Caption = 'Source Type';
                    ToolTip = 'Specifies the source type for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                    ToolTip = 'Specifies the source no. for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    ToolTip = 'Specifies the qty. per unit of measure for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(resourceRegisterNo; Rec."Resource Register No.")
                {
                    Caption = 'Resource Register No.';
                    ToolTip = 'Specifies the resource register no. for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(orderType; Rec."Order Type")
                {
                    Caption = 'Order Type';
                    ToolTip = 'Specifies the order type for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    ToolTip = 'Specifies the order no. for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(orderLineNo; Rec."Order Line No.")
                {
                    Caption = 'Order Line No.';
                    ToolTip = 'Specifies the order line no. for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the dimension set id for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                    ToolTip = 'Specifies the shortcut dimension 3 code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                    ToolTip = 'Specifies the shortcut dimension 4 code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Shortcut Dimension 5 Code';
                    ToolTip = 'Specifies the shortcut dimension 5 code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Shortcut Dimension 6 Code';
                    ToolTip = 'Specifies the shortcut dimension 6 code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 7 Code';
                    ToolTip = 'Specifies the shortcut dimension 7 code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                {
                    Caption = 'Shortcut Dimension 8 Code';
                    ToolTip = 'Specifies the shortcut dimension 8 code for this res. ledger entry record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}