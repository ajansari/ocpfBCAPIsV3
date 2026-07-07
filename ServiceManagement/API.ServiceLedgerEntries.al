namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Ledger;

page 90988 "ocpfServiceLedgerEntries"
{
    PageType = API;
    Caption = 'Service Ledger Entries — posted usage, sales, and contract transactions from service management. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceLedgerEntry';
    EntitySetName = 'ocpfServiceLedgerEntries';
    SourceTable = "Service Ledger Entry";
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
                field(serviceContractNo; Rec."Service Contract No.")
                {
                    Caption = 'Service Contract No.';
                    ToolTip = 'Specifies the number of the service contract, if this entry is linked to a service contract.';
                    ApplicationArea = All;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Specifies the document type of the service ledger entry.';
                    ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the number of the document from which this entry was created.';
                    ApplicationArea = All;
                }
                field(servContractAccGrCode; Rec."Serv. Contract Acc. Gr. Code")
                {
                    Caption = 'Serv. Contract Acc. Gr. Code';
                    ToolTip = 'Specifies the service contract account group code the service contract is associated with, if this entry is included in a service contract.';
                    ApplicationArea = All;
                }
                field(documentLineNo; Rec."Document Line No.")
                {
                    Caption = 'Document Line No.';
                    ToolTip = 'Specifies the Document Line No..';
                    ApplicationArea = All;
                }
                field(movedFromPrepaidAcc; Rec."Moved from Prepaid Acc.")
                {
                    Caption = 'Moved from Prepaid Acc.';
                    ToolTip = 'Specifies that this entry is not a prepaid entry from a service contract.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the date when this entry was posted.';
                    ApplicationArea = All;
                }
                field(amountLcy; Rec."Amount (LCY)")
                {
                    Caption = 'Amount (LCY)';
                    ToolTip = 'Specifies the amount of the entry in LCY.';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the number of the customer related to this entry.';
                    ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    ApplicationArea = All;
                }
                field(itemNoServiced; Rec."Item No. (Serviced)")
                {
                    Caption = 'Item No. (Serviced)';
                    ToolTip = 'Specifies the number of the serviced item associated with this entry.';
                    ApplicationArea = All;
                }
                field(serialNoServiced; Rec."Serial No. (Serviced)")
                {
                    Caption = 'Serial No. (Serviced)';
                    ToolTip = 'Specifies the serial number of the serviced item associated with this entry.';
                    ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                    ApplicationArea = All;
                }
                field(contractInvoicePeriod; Rec."Contract Invoice Period")
                {
                    Caption = 'Contract Invoice Period';
                    ToolTip = 'Specifies the invoice period of that contract, if this entry originates from a service contract.';
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
                field(serviceItemNoServiced; Rec."Service Item No. (Serviced)")
                {
                    Caption = 'Service Item No. (Serviced)';
                    ToolTip = 'Specifies the number of the serviced item associated with this entry.';
                    ApplicationArea = All;
                }
                field(variantCodeServiced; Rec."Variant Code (Serviced)")
                {
                    Caption = 'Variant Code (Serviced)';
                    ToolTip = 'Specifies the Variant Code (Serviced).';
                    ApplicationArea = All;
                }
                field(contractGroupCode; Rec."Contract Group Code")
                {
                    Caption = 'Contract Group Code';
                    ToolTip = 'Specifies the contract group code of the service contract to which this entry is associated.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type of origin of this entry.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(costAmount; Rec."Cost Amount")
                {
                    Caption = 'Cost Amount';
                    ToolTip = 'Specifies the total cost on the line by multiplying the unit cost by the quantity.';
                    ApplicationArea = All;
                }
                field(discountAmount; Rec."Discount Amount")
                {
                    Caption = 'Discount Amount';
                    ToolTip = 'Specifies the total discount amount on this entry.';
                    ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the number of units in this entry.';
                    ApplicationArea = All;
                }
                field(chargedQty; Rec."Charged Qty.")
                {
                    Caption = 'Charged Qty.';
                    ToolTip = 'Specifies the number of units in this entry that should be invoiced.';
                    ApplicationArea = All;
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                    ApplicationArea = All;
                }
                field(discountPct; Rec."Discount %")
                {
                    Caption = 'Discount %';
                    ToolTip = 'Specifies the discount percentage of this entry.';
                    ApplicationArea = All;
                }
                field(contractDiscAmount; Rec."Contract Disc. Amount")
                {
                    Caption = 'Contract Disc. Amount';
                    ToolTip = 'Specifies the total contract discount amount of this entry.';
                    ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
                    ApplicationArea = All;
                }
                field(faultReasonCode; Rec."Fault Reason Code")
                {
                    Caption = 'Fault Reason Code';
                    ToolTip = 'Specifies the fault reason code for this entry.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the resource, item, cost, standard text, general ledger account, or service contract associated with this entry.';
                    ApplicationArea = All;
                }
                field(serviceOrderType; Rec."Service Order Type")
                {
                    Caption = 'Service Order Type';
                    ToolTip = 'Specifies the type of the service order if this entry was created for a service order.';
                    ApplicationArea = All;
                }
                field(serviceOrderNo; Rec."Service Order No.")
                {
                    Caption = 'Service Order No.';
                    ToolTip = 'Specifies the number of the service order, if this entry was created for a service order.';
                    ApplicationArea = All;
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Project No.';
                    ToolTip = 'Specifies the number of the related project.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the code for the location associated with this entry.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies the Unit of Measure Code.';
                    ApplicationArea = All;
                }
                field(workTypeCode; Rec."Work Type Code")
                {
                    Caption = 'Work Type Code';
                    ToolTip = 'Specifies the Work Type Code.';
                    ApplicationArea = All;
                }
                field(binCode; Rec."Bin Code")
                {
                    Caption = 'Bin Code';
                    ToolTip = 'Specifies the bin where the items are picked or put away.';
                    ApplicationArea = All;
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ToolTip = 'Specifies the Responsibility Center.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the Variant Code.';
                    ApplicationArea = All;
                }
                field(entryType; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                    ToolTip = 'Specifies the type for this entry.';
                    ApplicationArea = All;
                }
                field(open; Rec."Open")
                {
                    Caption = 'Open';
                    ToolTip = 'Specifies contract-related service ledger entries.';
                    ApplicationArea = All;
                }
                field(servPriceAdjmtGrCode; Rec."Serv. Price Adjmt. Gr. Code")
                {
                    Caption = 'Serv. Price Adjmt. Gr. Code';
                    ToolTip = 'Specifies the Serv. Price Adjmt. Gr. Code.';
                    ApplicationArea = All;
                }
                field(servicePriceGroupCode; Rec."Service Price Group Code")
                {
                    Caption = 'Service Price Group Code';
                    ToolTip = 'Specifies the Service Price Group Code.';
                    ApplicationArea = All;
                }
                field(prepaid; Rec."Prepaid")
                {
                    Caption = 'Prepaid';
                    ToolTip = 'Specifies whether the service contract or contract-related service order was prepaid.';
                    ApplicationArea = All;
                }
                field(applyUntilEntryNo; Rec."Apply Until Entry No.")
                {
                    Caption = 'Apply Until Entry No.';
                    ToolTip = 'Specifies the Apply Until Entry No..';
                    ApplicationArea = All;
                }
                field(appliesToEntryNo; Rec."Applies-to Entry No.")
                {
                    Caption = 'Applies-to Entry No.';
                    ToolTip = 'Specifies the number of the entry to which this entry is applied, if an entry is created for a service credit memo.';
                    ApplicationArea = All;
                }
                field(amount; Rec."Amount")
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the amount on this entry.';
                    ApplicationArea = All;
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Project Task No.';
                    ToolTip = 'Specifies the number of the related project task.';
                    ApplicationArea = All;
                }
                field(jobLineType; Rec."Job Line Type")
                {
                    Caption = 'Project Line Type';
                    ToolTip = 'Specifies the journal line type that is created in the Project Planning Line table and linked to this project ledger entry.';
                    ApplicationArea = All;
                }
                field(jobPosted; Rec."Job Posted")
                {
                    Caption = 'Project Posted';
                    ToolTip = 'Specifies the Project Posted.';
                    ApplicationArea = All;
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ToolTip = 'Specifies a document number that refers to the customer''s numbering system.';
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
