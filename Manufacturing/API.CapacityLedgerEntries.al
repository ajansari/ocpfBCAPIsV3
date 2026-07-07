namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Manufacturing.Capacity;

page 90966 "ocpfCapacityLedgerEntries"
{
    PageType = API;
    Caption = 'Capacity Ledger Entries — posted output, run times, and stop/scrap quantities per operation. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfCapacityLedgerEntry';
    EntitySetName = 'ocpfCapacityLedgerEntries';
    SourceTable = "Capacity Ledger Entry";
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
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date of the entry.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type of capacity entry.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the document number of the entry.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the entry.';
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the quantity of this entry, in base units of measure.';
                    ApplicationArea = All;
                }
                field(invoicedQuantity; Rec."Invoiced Quantity")
                {
                    Caption = 'Invoiced Quantity';
                    ToolTip = 'Specifies the Invoiced Quantity.';
                    ApplicationArea = All;
                }
                field(itemRegisterNo; Rec."Item Register No.")
                {
                    Caption = 'Item Register No.';
                    ToolTip = 'Specifies the Item Register No..';
                    ApplicationArea = All;
                }
                field(siftBucketNo; Rec."SIFT Bucket No.")
                {
                    Caption = 'SIFT Bucket No.';
                    ToolTip = 'Specifies an automatically generated number that is used by the system to enable better concurrency.';
                    ApplicationArea = All;
                }
                field(capUnitOfMeasureCode; Rec."Cap. Unit of Measure Code")
                {
                    Caption = 'Cap. Unit of Measure Code';
                    ToolTip = 'Specifies the unit of measure code for the capacity usage.';
                    ApplicationArea = All;
                }
                field(qtyPerCapUnitOfMeasure; Rec."Qty. per Cap. Unit of Measure")
                {
                    Caption = 'Qty. per Cap. Unit of Measure';
                    ToolTip = 'Specifies the Qty. per Cap. Unit of Measure.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    ApplicationArea = All;
                }
                field(completelyInvoiced; Rec."Completely Invoiced")
                {
                    Caption = 'Completely Invoiced';
                    ToolTip = 'Specifies if the entry has been fully invoiced or if more posted invoices are expected.';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the item number.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant of the item on the line.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies the Unit of Measure Code.';
                    ApplicationArea = All;
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    ToolTip = 'Specifies the Qty. per Unit of Measure.';
                    ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                    ToolTip = 'Specifies the Document Date.';
                    ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ToolTip = 'Specifies the External Document No..';
                    ApplicationArea = All;
                }
                field(directCost; Rec."Direct Cost")
                {
                    Caption = 'Direct Cost';
                    ToolTip = 'Specifies the direct cost in LCY of the quantity posting.';
                    ApplicationArea = All;
                }
                field(overheadCost; Rec."Overhead Cost")
                {
                    Caption = 'Overhead Cost';
                    ToolTip = 'Specifies the overhead cost in LCY of the quantity posting.';
                    ApplicationArea = All;
                }
                field(directCostAcy; Rec."Direct Cost (ACY)")
                {
                    Caption = 'Direct Cost (ACY)';
                    ToolTip = 'Specifies the direct cost in the additional reporting currency.';
                    ApplicationArea = All;
                }
                field(overheadCostAcy; Rec."Overhead Cost (ACY)")
                {
                    Caption = 'Overhead Cost (ACY)';
                    ToolTip = 'Specifies the overhead cost in the additional reporting currency.';
                    ApplicationArea = All;
                }
                field(subcontracting; Rec."Subcontracting")
                {
                    Caption = 'Subcontracting';
                    ToolTip = 'Specifies the Subcontracting.';
                    ApplicationArea = All;
                }
                field(reversed; Rec."Reversed")
                {
                    Caption = 'Reversed';
                    ToolTip = 'Specifies if the entry has been part of a reverse transaction.';
                    ApplicationArea = All;
                }
                field(reversedByEntryNo; Rec."Reversed by Entry No.")
                {
                    Caption = 'Reversed by Entry No.';
                    ToolTip = 'Specifies the number of the correcting entry that replaced the original entry in the reverse transaction.';
                    ApplicationArea = All;
                }
                field(reversedEntryNo; Rec."Reversed Entry No.")
                {
                    Caption = 'Reversed Entry No.';
                    ToolTip = 'Specifies the number of the original entry that was undone by the reverse transaction.';
                    ApplicationArea = All;
                }
                field(orderType; Rec."Order Type")
                {
                    Caption = 'Order Type';
                    ToolTip = 'Specifies which type of order the entry was created in.';
                    ApplicationArea = All;
                }
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    ToolTip = 'Specifies the number of the order that created the entry.';
                    ApplicationArea = All;
                }
                field(orderLineNo; Rec."Order Line No.")
                {
                    Caption = 'Order Line No.';
                    ToolTip = 'Specifies the line number of the order that created the entry.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies a reference to a combination of dimension values. The actual values are stored in the Dimension Set Entry table.';
                    ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 3, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 4, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Shortcut Dimension 5 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 5, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Shortcut Dimension 6 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 6, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 7 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 7, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                {
                    Caption = 'Shortcut Dimension 8 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 8, which is one of dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
