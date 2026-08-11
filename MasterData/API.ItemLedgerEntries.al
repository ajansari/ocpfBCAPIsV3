namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Ledger;

page 90847 "ocpfItemLedgerEntries"
{
    PageType = API;
    Caption = 'Item Ledger Entries — posted inventory transactions recording every inbound and outbound movement of items across all locations.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfItemLedgerEntry';
    EntitySetName = 'ocpfItemLedgerEntries';
    SourceTable = "Item Ledger Entry";
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
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    ToolTip = 'Specifies the entry no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the item no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(entryType; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                    ToolTip = 'Specifies the entry type for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                    ToolTip = 'Specifies the source no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the document no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the quantity for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(remainingQuantity; Rec."Remaining Quantity")
                {
                    Caption = 'Remaining Quantity';
                    ToolTip = 'Specifies the remaining quantity for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(invoicedQuantity; Rec."Invoiced Quantity")
                {
                    Caption = 'Invoiced Quantity';
                    ToolTip = 'Specifies the invoiced quantity for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(itemRegisterNo; Rec."Item Register No.")
                {
                    Caption = 'Item Register No.';
                    ToolTip = 'Specifies the item register no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(sIFTBucketNo; Rec."SIFT Bucket No.")
                {
                    Caption = 'SIFT Bucket No.';
                    ToolTip = 'Specifies an automatically generated number that is used by the system to enable better concurrency.';
                    ApplicationArea = All;
                }
                field(appliesToEntry; Rec."Applies-to Entry")
                {
                    Caption = 'Applies-to Entry';
                    ToolTip = 'Specifies the applies-to entry for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(open; Rec.Open)
                {
                    Caption = 'Open';
                    ToolTip = 'Specifies the open for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ToolTip = 'Specifies the global dimension 1 code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                    ToolTip = 'Specifies the global dimension 2 code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(positive; Rec.Positive)
                {
                    Caption = 'Positive';
                    ToolTip = 'Specifies the positive for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(shptMethodCode; Rec."Shpt. Method Code")
                {
                    Caption = 'Shpt. Method Code';
                    ToolTip = 'Specifies the shpt. method code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(sourceType; Rec."Source Type")
                {
                    Caption = 'Source Type';
                    ToolTip = 'Specifies the source type for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(dropShipment; Rec."Drop Shipment")
                {
                    Caption = 'Drop Shipment';
                    ToolTip = 'Specifies the drop shipment for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(transactionType; Rec."Transaction Type")
                {
                    Caption = 'Transaction Type';
                    ToolTip = 'Specifies the transaction type for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(transportMethod; Rec."Transport Method")
                {
                    Caption = 'Transport Method';
                    ToolTip = 'Specifies the transport method for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(entryExitPoint; Rec."Entry/Exit Point")
                {
                    Caption = 'Entry/Exit Point';
                    ToolTip = 'Specifies the entry/exit point for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                    ToolTip = 'Specifies the document date for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ToolTip = 'Specifies the external document no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(areaCode; Rec.Area)
                {
                    Caption = 'Area';
                    ToolTip = 'Specifies the area for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(transactionSpecification; Rec."Transaction Specification")
                {
                    Caption = 'Transaction Specification';
                    ToolTip = 'Specifies the transaction specification for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the no. series for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(reservedQuantity; Rec."Reserved Quantity")
                {
                    Caption = 'Reserved Quantity';
                    ToolTip = 'Specifies the reserved quantity for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies the document type for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(documentLineNo; Rec."Document Line No.")
                {
                    Caption = 'Document Line No.';
                    ToolTip = 'Specifies the document line no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(orderType; Rec."Order Type")
                {
                    Caption = 'Order Type';
                    ToolTip = 'Specifies the order type for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    ToolTip = 'Specifies the order no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(orderLineNo; Rec."Order Line No.")
                {
                    Caption = 'Order Line No.';
                    ToolTip = 'Specifies the order line no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the dimension set id for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                    ToolTip = 'Specifies the shortcut dimension 3 code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                    ToolTip = 'Specifies the shortcut dimension 4 code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Shortcut Dimension 5 Code';
                    ToolTip = 'Specifies the shortcut dimension 5 code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Shortcut Dimension 6 Code';
                    ToolTip = 'Specifies the shortcut dimension 6 code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 7 Code';
                    ToolTip = 'Specifies the shortcut dimension 7 code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                {
                    Caption = 'Shortcut Dimension 8 Code';
                    ToolTip = 'Specifies the shortcut dimension 8 code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(assembleToOrder; Rec."Assemble to Order")
                {
                    Caption = 'Assemble to Order';
                    ToolTip = 'Specifies the assemble to order for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Project No.';
                    ToolTip = 'Specifies the job no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Project Task No.';
                    ToolTip = 'Specifies the job task no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(jobPurchase; Rec."Job Purchase")
                {
                    Caption = 'Project Purchase';
                    ToolTip = 'Specifies the job purchase for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    ToolTip = 'Specifies the qty. per unit of measure for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies the unit of measure code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(derivedFromBlanketOrder; Rec."Derived from Blanket Order")
                {
                    Caption = 'Derived from Blanket Order';
                    ToolTip = 'Specifies the derived from blanket order for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(originallyOrderedNo; Rec."Originally Ordered No.")
                {
                    Caption = 'Originally Ordered No.';
                    ToolTip = 'Specifies the originally ordered no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(originallyOrderedVarCode; Rec."Originally Ordered Var. Code")
                {
                    Caption = 'Originally Ordered Var. Code';
                    ToolTip = 'Specifies the originally ordered var. code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(outOfStockSubstitution; Rec."Out-of-Stock Substitution")
                {
                    Caption = 'Out-of-Stock Substitution';
                    ToolTip = 'Specifies the out-of-stock substitution for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                    ToolTip = 'Specifies the item category code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(nonstock; Rec.Nonstock)
                {
                    Caption = 'Catalog';
                    ToolTip = 'Specifies the nonstock for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(purchasingCode; Rec."Purchasing Code")
                {
                    Caption = 'Purchasing Code';
                    ToolTip = 'Specifies the purchasing code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(itemReferenceNo; Rec."Item Reference No.")
                {
                    Caption = 'Item Reference No.';
                    ToolTip = 'Specifies the item reference no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(completelyInvoiced; Rec."Completely Invoiced")
                {
                    Caption = 'Completely Invoiced';
                    ToolTip = 'Specifies the completely invoiced for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(lastInvoiceDate; Rec."Last Invoice Date")
                {
                    Caption = 'Last Invoice Date';
                    ToolTip = 'Specifies the last invoice date for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(appliedEntryToAdjust; Rec."Applied Entry to Adjust")
                {
                    Caption = 'Applied Entry to Adjust';
                    ToolTip = 'Specifies the applied entry to adjust for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(correction; Rec.Correction)
                {
                    Caption = 'Correction';
                    ToolTip = 'Specifies the correction for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(shippedQtyNotReturned; Rec."Shipped Qty. Not Returned")
                {
                    Caption = 'Shipped Qty. Not Returned';
                    ToolTip = 'Specifies the shipped qty. not returned for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(itemLedgerEntryQuantity; Rec."Item Ledger Entry Quantity")
                {
                    Caption = 'Item Ledger Entry Quantity on Value Entry';
                    ToolTip = 'Specifies the item ledger entry quantity for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(remainingQtyByDate; Rec."Remaining Qty. by Date")
                {
                    Caption = 'Remaining Quantity by Date';
                    ToolTip = 'Specifies the remaining qty. by date for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the date filter for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(prodOrderCompLineNo; Rec."Prod. Order Comp. Line No.")
                {
                    Caption = 'Prod. Order Comp. Line No.';
                    ToolTip = 'Specifies the prod. order comp. line no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(serialNo; Rec."Serial No.")
                {
                    Caption = 'Serial No.';
                    ToolTip = 'Specifies the serial no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(lotNo; Rec."Lot No.")
                {
                    Caption = 'Lot No.';
                    ToolTip = 'Specifies the lot no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(warrantyDate; Rec."Warranty Date")
                {
                    Caption = 'Warranty Date';
                    ToolTip = 'Specifies the warranty date for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(expirationDate; Rec."Expiration Date")
                {
                    Caption = 'Expiration Date';
                    ToolTip = 'Specifies the expiration date for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(itemTracking; Rec."Item Tracking")
                {
                    Caption = 'Item Tracking';
                    ToolTip = 'Specifies the item tracking for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(packageNo; Rec."Package No.")
                {
                    Caption = 'Package No.';
                    ToolTip = 'Specifies the package no. for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(returnReasonCode; Rec."Return Reason Code")
                {
                    Caption = 'Return Reason Code';
                    ToolTip = 'Specifies the return reason code for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(itemDescription; Rec."Item Description")
                {
                    Caption = 'Item Description';
                    ToolTip = 'Specifies the item description for this item ledger entry record.';
                    ApplicationArea = All;
                }
                field(costAmountExpected; Rec."Cost Amount (Expected)")
                {
                    Caption = 'Cost Amount (Expected)';
                    ToolTip = 'Specifies the expected cost, in LCY, of the quantity posting.';
                    ApplicationArea = All;
                }
                field(costAmountActual; Rec."Cost Amount (Actual)")
                {
                    Caption = 'Cost Amount (Actual)';
                    ToolTip = 'Specifies the adjusted cost, in LCY, of the quantity posting.';
                    ApplicationArea = All;
                }
                field(costAmountNonInvtbl; Rec."Cost Amount (Non-Invtbl.)")
                {
                    Caption = 'Cost Amount (Non-Invtbl.)';
                    ToolTip = 'Specifies the adjusted non-inventoriable cost, that is an item charge assigned to an outbound entry.';
                    ApplicationArea = All;
                }
                field(costAmountExpectedAcy; Rec."Cost Amount (Expected) (ACY)")
                {
                    Caption = 'Cost Amount (Expected) (ACY)';
                    ToolTip = 'Specifies the expected cost, in ACY, of the quantity posting.';
                    ApplicationArea = All;
                }
                field(costAmountActualAcy; Rec."Cost Amount (Actual) (ACY)")
                {
                    Caption = 'Cost Amount (Actual) (ACY)';
                    ToolTip = 'Specifies the adjusted cost of the entry, in the additional reporting currency.';
                    ApplicationArea = All;
                }
                field(costAmountNonInvtblAcy; Rec."Cost Amount (Non-Invtbl.)(ACY)")
                {
                    Caption = 'Cost Amount (Non-Invtbl.)(ACY)';
                    ToolTip = 'Specifies the adjusted non-inventoriable cost, that is, an item charge assigned to an outbound entry in the additional reporting currency.';
                    ApplicationArea = All;
                }
                field(purchaseAmountExpected; Rec."Purchase Amount (Expected)")
                {
                    Caption = 'Purchase Amount (Expected)';
                    ToolTip = 'Specifies the Purchase Amount (Expected).';
                    ApplicationArea = All;
                }
                field(purchaseAmountActual; Rec."Purchase Amount (Actual)")
                {
                    Caption = 'Purchase Amount (Actual)';
                    ToolTip = 'Specifies the Purchase Amount (Actual).';
                    ApplicationArea = All;
                }
                field(salesAmountExpected; Rec."Sales Amount (Expected)")
                {
                    Caption = 'Sales Amount (Expected)';
                    ToolTip = 'Specifies the expected sales amount, in LCY.';
                    ApplicationArea = All;
                }
                field(salesAmountActual; Rec."Sales Amount (Actual)")
                {
                    Caption = 'Sales Amount (Actual)';
                    ToolTip = 'Specifies the sales amount, in LCY.';
                    ApplicationArea = All;
                }
            }
        }
    }
}