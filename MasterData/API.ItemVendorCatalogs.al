namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Item.Catalog;

page 90850 "ocpfItemVendorCatalogs"
{
    PageType = API;
    Caption = 'Item Vendor Catalog — per-vendor item data including the vendor''s own item number, lead time, and minimum order quantity for each item.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfItemVendorCatalog';
    EntitySetName = 'ocpfItemVendorCatalogs';
    SourceTable = "Item Vendor";
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
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the item no. for this item vendor record.';
                    ApplicationArea = All;
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the vendor no. for this item vendor record.';
                    ApplicationArea = All;
                }
                field(leadTimeCalculation; Rec."Lead Time Calculation")
                {
                    Caption = 'Lead Time Calculation';
                    ToolTip = 'Specifies the lead time calculation for this item vendor record.';
                    ApplicationArea = All;
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    ToolTip = 'Specifies the vendor item no. for this item vendor record.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant code for this item vendor record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}