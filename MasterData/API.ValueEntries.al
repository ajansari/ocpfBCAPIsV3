namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Ledger;

page 90848 "ocpfValueEntries"
{
    PageType = API;
    Caption = 'Value Entries — the cost layer behind every item ledger entry, recording the monetary value of inventory movements for costing and valuation.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0';
    EntityName = 'ocpfValueEntry';
    EntitySetName = 'ocpfValueEntries';
    SourceTable = "Value Entry";
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
                    ToolTip = 'Specifies the entry no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the item no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date for this value entry record.';
                    ApplicationArea = All;
                }
                field(itemLedgerEntryType; Rec."Item Ledger Entry Type")
                {
                    Caption = 'Item Ledger Entry Type';
                    ToolTip = 'Specifies the item ledger entry type for this value entry record.';
                    ApplicationArea = All;
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                    ToolTip = 'Specifies the source no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the document no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this value entry record.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location code for this value entry record.';
                    ApplicationArea = All;
                }
                field(inventoryPostingGroup; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                    ToolTip = 'Specifies the inventory posting group for this value entry record.';
                    ApplicationArea = All;
                }
                field(sourcePostingGroup; Rec."Source Posting Group")
                {
                    Caption = 'Source Posting Group';
                    ToolTip = 'Specifies the source posting group for this value entry record.';
                    ApplicationArea = All;
                }
                field(itemLedgerEntryNo; Rec."Item Ledger Entry No.")
                {
                    Caption = 'Item Ledger Entry No.';
                    ToolTip = 'Specifies the item ledger entry no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(valuedQuantity; Rec."Valued Quantity")
                {
                    Caption = 'Valued Quantity';
                    ToolTip = 'Specifies the valued quantity for this value entry record.';
                    ApplicationArea = All;
                }
                field(itemLedgerEntryQuantity; Rec."Item Ledger Entry Quantity")
                {
                    Caption = 'Item Ledger Entry Quantity';
                    ToolTip = 'Specifies the item ledger entry quantity for this value entry record.';
                    ApplicationArea = All;
                }
                field(invoicedQuantity; Rec."Invoiced Quantity")
                {
                    Caption = 'Invoiced Quantity';
                    ToolTip = 'Specifies the invoiced quantity for this value entry record.';
                    ApplicationArea = All;
                }
                field(costPerUnit; Rec."Cost per Unit")
                {
                    Caption = 'Cost per Unit';
                    ToolTip = 'Specifies the cost per unit for this value entry record.';
                    ApplicationArea = All;
                }
                field(itemRegisterNo; Rec."Item Register No.")
                {
                    Caption = 'Item Register No.';
                    ToolTip = 'Specifies the item register no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(sIFTBucketNo; Rec."SIFT Bucket No.")
                {
                    Caption = 'SIFT Bucket No.';
                    ToolTip = 'Specifies an automatically generated number that is used by the system to enable better concurrency.';
                    ApplicationArea = All;
                }
                field(salespersPurchCode; Rec."Salespers./Purch. Code")
                {
                    Caption = 'Salespers./Purch. Code';
                    ToolTip = 'Specifies the salespers./purch. code for this value entry record.';
                    ApplicationArea = All;
                }
                field(discountAmount; Rec."Discount Amount")
                {
                    Caption = 'Discount Amount';
                    ToolTip = 'Specifies the discount amount for this value entry record.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the user id for this value entry record.';
                    ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                    ToolTip = 'Specifies the source code for this value entry record.';
                    ApplicationArea = All;
                }
                field(appliesToEntry; Rec."Applies-to Entry")
                {
                    Caption = 'Applies-to Entry';
                    ToolTip = 'Specifies the applies-to entry for this value entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this value entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this value entry record.';
                    ApplicationArea = All;
                }
                field(sourceType; Rec."Source Type")
                {
                    Caption = 'Source Type';
                    ToolTip = 'Specifies the source type for this value entry record.';
                    ApplicationArea = All;
                }
                field(costPostedToGL; Rec."Cost Posted to G/L")
                {
                    Caption = 'Cost Posted to G/L';
                    ToolTip = 'Specifies the cost posted to g/l for this value entry record.';
                    ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                    ToolTip = 'Specifies the reason code for this value entry record.';
                    ApplicationArea = All;
                }
                field(dropShipment; Rec."Drop Shipment")
                {
                    Caption = 'Drop Shipment';
                    ToolTip = 'Specifies the drop shipment for this value entry record.';
                    ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                    ToolTip = 'Specifies the journal batch name for this value entry record.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the gen. bus. posting group for this value entry record.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the gen. prod. posting group for this value entry record.';
                    ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                    ToolTip = 'Specifies the document date for this value entry record.';
                    ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ToolTip = 'Specifies the external document no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies the document type for this value entry record.';
                    ApplicationArea = All;
                }
                field(documentLineNo; Rec."Document Line No.")
                {
                    Caption = 'Document Line No.';
                    ToolTip = 'Specifies the document line no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(vATReportingDate; Rec."VAT Reporting Date")
                {
                    Caption = 'VAT Date';
                    ToolTip = 'Specifies the vat reporting date for this value entry record.';
                    ApplicationArea = All;
                }
                field(orderType; Rec."Order Type")
                {
                    Caption = 'Order Type';
                    ToolTip = 'Specifies the order type for this value entry record.';
                    ApplicationArea = All;
                }
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    ToolTip = 'Specifies the order no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(orderLineNo; Rec."Order Line No.")
                {
                    Caption = 'Order Line No.';
                    ToolTip = 'Specifies the order line no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(expectedCost; Rec."Expected Cost")
                {
                    Caption = 'Expected Cost';
                    ToolTip = 'Specifies the expected cost for this value entry record.';
                    ApplicationArea = All;
                }
                field(itemChargeNo; Rec."Item Charge No.")
                {
                    Caption = 'Item Charge No.';
                    ToolTip = 'Specifies the item charge no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(valuedByAverageCost; Rec."Valued By Average Cost")
                {
                    Caption = 'Valued By Average Cost';
                    ToolTip = 'Specifies the valued by average cost for this value entry record.';
                    ApplicationArea = All;
                }
                field(partialRevaluation; Rec."Partial Revaluation")
                {
                    Caption = 'Partial Revaluation';
                    ToolTip = 'Specifies the partial revaluation for this value entry record.';
                    ApplicationArea = All;
                }
                field(inventoriable; Rec.Inventoriable)
                {
                    Caption = 'Inventoriable';
                    ToolTip = 'Specifies the inventoriable for this value entry record.';
                    ApplicationArea = All;
                }
                field(valuationDate; Rec."Valuation Date")
                {
                    Caption = 'Valuation Date';
                    ToolTip = 'Specifies the valuation date for this value entry record.';
                    ApplicationArea = All;
                }
                field(entryType; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                    ToolTip = 'Specifies the entry type for this value entry record.';
                    ApplicationArea = All;
                }
                field(varianceType; Rec."Variance Type")
                {
                    Caption = 'Variance Type';
                    ToolTip = 'Specifies the variance type for this value entry record.';
                    ApplicationArea = All;
                }
                field(expectedCostPostedToGL; Rec."Expected Cost Posted to G/L")
                {
                    Caption = 'Expected Cost Posted to G/L';
                    ToolTip = 'Specifies the expected cost posted to g/l for this value entry record.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the dimension set id for this value entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                    ToolTip = 'Specifies the shortcut dimension 3 code for this value entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                    ToolTip = 'Specifies the shortcut dimension 4 code for this value entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Shortcut Dimension 5 Code';
                    ToolTip = 'Specifies the shortcut dimension 5 code for this value entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Shortcut Dimension 6 Code';
                    ToolTip = 'Specifies the shortcut dimension 6 code for this value entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 7 Code';
                    ToolTip = 'Specifies the shortcut dimension 7 code for this value entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                {
                    Caption = 'Shortcut Dimension 8 Code';
                    ToolTip = 'Specifies the shortcut dimension 8 code for this value entry record.';
                    ApplicationArea = All;
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Project No.';
                    ToolTip = 'Specifies the job no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Project Task No.';
                    ToolTip = 'Specifies the job task no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(jobLedgerEntryNo; Rec."Job Ledger Entry No.")
                {
                    Caption = 'Project Ledger Entry No.';
                    ToolTip = 'Specifies the job ledger entry no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant code for this value entry record.';
                    ApplicationArea = All;
                }
                field(adjustment; Rec.Adjustment)
                {
                    Caption = 'Adjustment';
                    ToolTip = 'Specifies the adjustment for this value entry record.';
                    ApplicationArea = All;
                }
                field(averageCostException; Rec."Average Cost Exception")
                {
                    Caption = 'Average Cost Exception';
                    ToolTip = 'Specifies the average cost exception for this value entry record.';
                    ApplicationArea = All;
                }
                field(capacityLedgerEntryNo; Rec."Capacity Ledger Entry No.")
                {
                    Caption = 'Capacity Ledger Entry No.';
                    ToolTip = 'Specifies the capacity ledger entry no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type for this value entry record.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the no. for this value entry record.';
                    ApplicationArea = All;
                }
                field(returnReasonCode; Rec."Return Reason Code")
                {
                    Caption = 'Return Reason Code';
                    ToolTip = 'Specifies the return reason code for this value entry record.';
                    ApplicationArea = All;
                }
                field(itemDescription; Rec."Item Description")
                {
                    Caption = 'Item Description';
                    ToolTip = 'Specifies the item description for this value entry record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}