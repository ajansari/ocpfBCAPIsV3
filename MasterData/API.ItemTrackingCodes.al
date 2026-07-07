namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Tracking;

page 90852 "ocpfItemTrackingCodes"
{
    PageType = API;
    Caption = 'Item Tracking Codes — configuration records defining whether and how an item is tracked by serial number or lot number through the supply chain.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfItemTrackingCode';
    EntitySetName = 'ocpfItemTrackingCodes';
    SourceTable = "Item Tracking Code";
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
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(warrantyDateFormula; Rec."Warranty Date Formula")
                {
                    Caption = 'Warranty Date Formula';
                    ToolTip = 'Specifies the warranty date formula for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(manWarrantyDateEntryReqd; Rec."Man. Warranty Date Entry Reqd.")
                {
                    Caption = 'Man. Warranty Date Entry Reqd.';
                    ToolTip = 'Specifies the man. warranty date entry reqd. for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(manExpirDateEntryReqd; Rec."Man. Expir. Date Entry Reqd.")
                {
                    Caption = 'Man. Expir. Date Entry Reqd.';
                    ToolTip = 'Specifies the man. expir. date entry reqd. for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(strictExpirationPosting; Rec."Strict Expiration Posting")
                {
                    Caption = 'Strict Expiration Posting';
                    ToolTip = 'Specifies the strict expiration posting for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(useExpirationDates; Rec."Use Expiration Dates")
                {
                    Caption = 'Use Expiration Dates';
                    ToolTip = 'Specifies the use expiration dates for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNSpecificTracking; Rec."SN Specific Tracking")
                {
                    Caption = 'SN Specific Tracking';
                    ToolTip = 'Specifies the sn specific tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNInfoInboundMustExist; Rec."SN Info. Inbound Must Exist")
                {
                    Caption = 'SN Info. Inbound Must Exist';
                    ToolTip = 'Specifies the sn info. inbound must exist for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNInfoOutboundMustExist; Rec."SN Info. Outbound Must Exist")
                {
                    Caption = 'SN Info. Outbound Must Exist';
                    ToolTip = 'Specifies the sn info. outbound must exist for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNWarehouseTracking; Rec."SN Warehouse Tracking")
                {
                    Caption = 'SN Warehouse Tracking';
                    ToolTip = 'Specifies the sn warehouse tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNPurchaseInboundTracking; Rec."SN Purchase Inbound Tracking")
                {
                    Caption = 'SN Purchase Inbound Tracking';
                    ToolTip = 'Specifies the sn purchase inbound tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNPurchaseOutboundTracking; Rec."SN Purchase Outbound Tracking")
                {
                    Caption = 'SN Purchase Outbound Tracking';
                    ToolTip = 'Specifies the sn purchase outbound tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNSalesInboundTracking; Rec."SN Sales Inbound Tracking")
                {
                    Caption = 'SN Sales Inbound Tracking';
                    ToolTip = 'Specifies the sn sales inbound tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNSalesOutboundTracking; Rec."SN Sales Outbound Tracking")
                {
                    Caption = 'SN Sales Outbound Tracking';
                    ToolTip = 'Specifies the sn sales outbound tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNPosAdjmtInbTracking; Rec."SN Pos. Adjmt. Inb. Tracking")
                {
                    Caption = 'SN Pos. Adjmt. Inb. Tracking';
                    ToolTip = 'Specifies the sn pos. adjmt. inb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNPosAdjmtOutbTracking; Rec."SN Pos. Adjmt. Outb. Tracking")
                {
                    Caption = 'SN Pos. Adjmt. Outb. Tracking';
                    ToolTip = 'Specifies the sn pos. adjmt. outb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNNegAdjmtInbTracking; Rec."SN Neg. Adjmt. Inb. Tracking")
                {
                    Caption = 'SN Neg. Adjmt. Inb. Tracking';
                    ToolTip = 'Specifies the sn neg. adjmt. inb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNNegAdjmtOutbTracking; Rec."SN Neg. Adjmt. Outb. Tracking")
                {
                    Caption = 'SN Neg. Adjmt. Outb. Tracking';
                    ToolTip = 'Specifies the sn neg. adjmt. outb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(sNTransferTracking; Rec."SN Transfer Tracking")
                {
                    Caption = 'SN Transfer Tracking';
                    ToolTip = 'Specifies the sn transfer tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(createSnInfoOnPosting; Rec."Create SN Info on Posting")
                {
                    Caption = 'Create SN Info. on posting';
                    ToolTip = 'Specifies the create sn info on posting for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotSpecificTracking; Rec."Lot Specific Tracking")
                {
                    Caption = 'Lot Specific Tracking';
                    ToolTip = 'Specifies the lot specific tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotInfoInboundMustExist; Rec."Lot Info. Inbound Must Exist")
                {
                    Caption = 'Lot Info. Inbound Must Exist';
                    ToolTip = 'Specifies the lot info. inbound must exist for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotInfoOutboundMustExist; Rec."Lot Info. Outbound Must Exist")
                {
                    Caption = 'Lot Info. Outbound Must Exist';
                    ToolTip = 'Specifies the lot info. outbound must exist for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotWarehouseTracking; Rec."Lot Warehouse Tracking")
                {
                    Caption = 'Lot Warehouse Tracking';
                    ToolTip = 'Specifies the lot warehouse tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotPurchaseInboundTracking; Rec."Lot Purchase Inbound Tracking")
                {
                    Caption = 'Lot Purchase Inbound Tracking';
                    ToolTip = 'Specifies the lot purchase inbound tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotPurchaseOutboundTracking; Rec."Lot Purchase Outbound Tracking")
                {
                    Caption = 'Lot Purchase Outbound Tracking';
                    ToolTip = 'Specifies the lot purchase outbound tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotSalesInboundTracking; Rec."Lot Sales Inbound Tracking")
                {
                    Caption = 'Lot Sales Inbound Tracking';
                    ToolTip = 'Specifies the lot sales inbound tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotSalesOutboundTracking; Rec."Lot Sales Outbound Tracking")
                {
                    Caption = 'Lot Sales Outbound Tracking';
                    ToolTip = 'Specifies the lot sales outbound tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotPosAdjmtInbTracking; Rec."Lot Pos. Adjmt. Inb. Tracking")
                {
                    Caption = 'Lot Pos. Adjmt. Inb. Tracking';
                    ToolTip = 'Specifies the lot pos. adjmt. inb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotPosAdjmtOutbTracking; Rec."Lot Pos. Adjmt. Outb. Tracking")
                {
                    Caption = 'Lot Pos. Adjmt. Outb. Tracking';
                    ToolTip = 'Specifies the lot pos. adjmt. outb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotNegAdjmtInbTracking; Rec."Lot Neg. Adjmt. Inb. Tracking")
                {
                    Caption = 'Lot Neg. Adjmt. Inb. Tracking';
                    ToolTip = 'Specifies the lot neg. adjmt. inb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotNegAdjmtOutbTracking; Rec."Lot Neg. Adjmt. Outb. Tracking")
                {
                    Caption = 'Lot Neg. Adjmt. Outb. Tracking';
                    ToolTip = 'Specifies the lot neg. adjmt. outb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(lotTransferTracking; Rec."Lot Transfer Tracking")
                {
                    Caption = 'Lot Transfer Tracking';
                    ToolTip = 'Specifies the lot transfer tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(createLotNoInfoOnPosting; Rec."Create Lot No. Info on posting")
                {
                    Caption = 'Create Lot No. Info. on posting';
                    ToolTip = 'Specifies the create lot no. info on posting for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packageSpecificTracking; Rec."Package Specific Tracking")
                {
                    Caption = 'Package Specific Tracking';
                    ToolTip = 'Specifies the package specific tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packageWarehouseTracking; Rec."Package Warehouse Tracking")
                {
                    Caption = 'Package Warehouse Tracking';
                    ToolTip = 'Specifies the package warehouse tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packageInfoInbMustExist; Rec."Package Info. Inb. Must Exist")
                {
                    Caption = 'Package Info. Inb. Must Exist';
                    ToolTip = 'Specifies the package info. inb. must exist for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packageInfoOutbMustExist; Rec."Package Info. Outb. Must Exist")
                {
                    Caption = 'Lot Info. Outb. Must Exist';
                    ToolTip = 'Specifies the package info. outb. must exist for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packagePurchaseInbTracking; Rec."Package Purchase Inb. Tracking")
                {
                    Caption = 'Package Purchase Inb. Tracking';
                    ToolTip = 'Specifies the package purchase inb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packagePurchOutbTracking; Rec."Package Purch. Outb. Tracking")
                {
                    Caption = 'Package Purch. Outb. Tracking';
                    ToolTip = 'Specifies the package purch. outb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packageSalesInboundTracking; Rec."Package Sales Inbound Tracking")
                {
                    Caption = 'Package Sales Inbound Tracking';
                    ToolTip = 'Specifies the package sales inbound tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packageSalesOutbTracking; Rec."Package Sales Outb. Tracking")
                {
                    Caption = 'Package Sales Outb. Tracking';
                    ToolTip = 'Specifies the package sales outb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packagePosInbTracking; Rec."Package Pos. Inb. Tracking")
                {
                    Caption = 'Package Pos. Inb. Tracking';
                    ToolTip = 'Specifies the package pos. inb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packagePosOutbTracking; Rec."Package Pos. Outb. Tracking")
                {
                    Caption = 'Package Pos. Outb. Tracking';
                    ToolTip = 'Specifies the package pos. outb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packageNegInbTracking; Rec."Package Neg. Inb. Tracking")
                {
                    Caption = 'Package Neg. Inb. Tracking';
                    ToolTip = 'Specifies the package neg. inb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packageNegOutbTracking; Rec."Package Neg. Outb. Tracking")
                {
                    Caption = 'Package Neg. Outb. Tracking';
                    ToolTip = 'Specifies the package neg. outb. tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
                field(packageTransferTracking; Rec."Package Transfer Tracking")
                {
                    Caption = 'Package Transfer Tracking';
                    ToolTip = 'Specifies the package transfer tracking for this item tracking code record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}