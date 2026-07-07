namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Ledger;

page 90989 "ocpfWarrantyLedgerEntries"
{
    PageType = API;
    Caption = 'Warranty Ledger Entries — posted warranty coverage transactions for service items. Read-only.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfWarrantyLedgerEntry';
    EntitySetName = 'ocpfWarrantyLedgerEntries';
    SourceTable = "Warranty Ledger Entry";
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
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the document number of this entry.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date on the service line linked to this entry.';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the number of the customer on the service order linked to this entry.';
                    ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
                    ApplicationArea = All;
                }
                field(variantCodeServiced; Rec."Variant Code (Serviced)")
                {
                    Caption = 'Variant Code (Serviced)';
                    ToolTip = 'Specifies the Variant Code (Serviced).';
                    ApplicationArea = All;
                }
                field(serviceItemNoServiced; Rec."Service Item No. (Serviced)")
                {
                    Caption = 'Service Item No. (Serviced)';
                    ToolTip = 'Specifies the Service Item No. (Serviced).';
                    ApplicationArea = All;
                }
                field(itemNoServiced; Rec."Item No. (Serviced)")
                {
                    Caption = 'Item No. (Serviced)';
                    ToolTip = 'Specifies the number of the serviced item linked to this entry.';
                    ApplicationArea = All;
                }
                field(serialNoServiced; Rec."Serial No. (Serviced)")
                {
                    Caption = 'Serial No. (Serviced)';
                    ToolTip = 'Specifies the serial number of the serviced item linked to this entry.';
                    ApplicationArea = All;
                }
                field(serviceItemGroupServiced; Rec."Service Item Group (Serviced)")
                {
                    Caption = 'Service Item Group (Serviced)';
                    ToolTip = 'Specifies the service item group code of the serviced item linked to this entry.';
                    ApplicationArea = All;
                }
                field(serviceOrderNo; Rec."Service Order No.")
                {
                    Caption = 'Service Order No.';
                    ToolTip = 'Specifies the number of the service order linked to this entry.';
                    ApplicationArea = All;
                }
                field(serviceContractNo; Rec."Service Contract No.")
                {
                    Caption = 'Service Contract No.';
                    ToolTip = 'Specifies the number of the service contract linked to this entry.';
                    ApplicationArea = All;
                }
                field(faultReasonCode; Rec."Fault Reason Code")
                {
                    Caption = 'Fault Reason Code';
                    ToolTip = 'Specifies the fault reason code of the service line linked to this entry.';
                    ApplicationArea = All;
                }
                field(faultAreaCode; Rec."Fault Area Code")
                {
                    Caption = 'Fault Area Code';
                    ToolTip = 'Specifies the Fault Area Code.';
                    ApplicationArea = All;
                }
                field(faultCode; Rec."Fault Code")
                {
                    Caption = 'Fault Code';
                    ToolTip = 'Specifies the fault code of the service line linked to this entry.';
                    ApplicationArea = All;
                }
                field(symptomCode; Rec."Symptom Code")
                {
                    Caption = 'Symptom Code';
                    ToolTip = 'Specifies the symptom code of the service line linked to this entry.';
                    ApplicationArea = All;
                }
                field(resolutionCode; Rec."Resolution Code")
                {
                    Caption = 'Resolution Code';
                    ToolTip = 'Specifies the resolution code of the service line linked to this entry.';
                    ApplicationArea = All;
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                    ToolTip = 'Specifies the type of the service line linked to this entry.';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the number of item units, resource hours, or cost of the service line linked to this entry.';
                    ApplicationArea = All;
                }
                field(workTypeCode; Rec."Work Type Code")
                {
                    Caption = 'Work Type Code';
                    ToolTip = 'Specifies the work type code of the service line linked to this entry.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                    ApplicationArea = All;
                }
                field(amount; Rec."Amount")
                {
                    Caption = 'Amount';
                    ToolTip = 'Specifies the warranty discount amount of the service line linked to this entry.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description of the item on this line.';
                    ApplicationArea = All;
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Specifies the Gen. Bus. Posting Group.';
                    ApplicationArea = All;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Specifies the Gen. Prod. Posting Group.';
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
                field(open; Rec."Open")
                {
                    Caption = 'Open';
                    ToolTip = 'Specifies that the warranty ledger entry is open.';
                    ApplicationArea = All;
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the vendor number of the serviced item linked to this entry.';
                    ApplicationArea = All;
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    ToolTip = 'Specifies the number that the vendor uses for this item.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the Variant Code.';
                    ApplicationArea = All;
                }
                field(serviceOrderLineNo; Rec."Service Order Line No.")
                {
                    Caption = 'Service Order Line No.';
                    ToolTip = 'Specifies the Service Order Line No..';
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
