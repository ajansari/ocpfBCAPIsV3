namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Inventory.Ledger;

page 90849 "ocpfItemApplicationEntries"
{
    PageType = API;
    Caption = 'Item Application Entries — records showing how item ledger entries are applied to each other for cost forwarding and inventory valuation.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_masterData';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfItemApplicationEntry';
    EntitySetName = 'ocpfItemApplicationEntries';
    SourceTable = "Item Application Entry";
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
                    ToolTip = 'Specifies the entry no. for this item application entry record.';
                    ApplicationArea = All;
                }
                field(itemLedgerEntryNo; Rec."Item Ledger Entry No.")
                {
                    Caption = 'Item Ledger Entry No.';
                    ToolTip = 'Specifies the item ledger entry no. for this item application entry record.';
                    ApplicationArea = All;
                }
                field(inboundItemEntryNo; Rec."Inbound Item Entry No.")
                {
                    Caption = 'Inbound Item Entry No.';
                    ToolTip = 'Specifies the inbound item entry no. for this item application entry record.';
                    ApplicationArea = All;
                }
                field(outboundItemEntryNo; Rec."Outbound Item Entry No.")
                {
                    Caption = 'Outbound Item Entry No.';
                    ToolTip = 'Specifies the outbound item entry no. for this item application entry record.';
                    ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the quantity for this item application entry record.';
                    ApplicationArea = All;
                }
                field(itemRegisterNo; Rec."Item Register No.")
                {
                    Caption = 'Item Register No.';
                    ToolTip = 'Specifies the item register no. for this item application entry record.';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the posting date for this item application entry record.';
                    ApplicationArea = All;
                }
                field(transferredFromEntryNo; Rec."Transferred-from Entry No.")
                {
                    Caption = 'Transferred-from Entry No.';
                    ToolTip = 'Specifies the transferred-from entry no. for this item application entry record.';
                    ApplicationArea = All;
                }
                field(creationDate; Rec."Creation Date")
                {
                    Caption = 'Creation Date';
                    ToolTip = 'Specifies the creation date for this item application entry record.';
                    ApplicationArea = All;
                }
                field(createdByUser; Rec."Created By User")
                {
                    Caption = 'Created By User';
                    ToolTip = 'Specifies the created by user for this item application entry record.';
                    ApplicationArea = All;
                }
                field(lastModifiedDate; Rec."Last Modified Date")
                {
                    Caption = 'Last Modified Date';
                    ToolTip = 'Specifies the last modified date for this item application entry record.';
                    ApplicationArea = All;
                }
                field(lastModifiedByUser; Rec."Last Modified By User")
                {
                    Caption = 'Last Modified By User';
                    ToolTip = 'Specifies the last modified by user for this item application entry record.';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the item no. for this item application entry record.';
                    ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location code for this item application entry record.';
                    ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                    ToolTip = 'Specifies the variant code for this item application entry record.';
                    ApplicationArea = All;
                }
                field(latestValuationDate; Rec."Latest Valuation Date")
                {
                    Caption = 'Latest Valuation Date';
                    ToolTip = 'Specifies the latest valuation date for this item application entry record.';
                    ApplicationArea = All;
                }
                field(costApplication; Rec."Cost Application")
                {
                    Caption = 'Cost Application';
                    ToolTip = 'Specifies the cost application for this item application entry record.';
                    ApplicationArea = All;
                }
                field(outputCompletelyInvdDate; Rec."Output Completely Invd. Date")
                {
                    Caption = 'Output Completely Invd. Date';
                    ToolTip = 'Specifies the output completely invd. date for this item application entry record.';
                    ApplicationArea = All;
                }
                field(outboundEntryIsUpdated; Rec."Outbound Entry is Updated")
                {
                    Caption = 'Outbound Entry is Updated';
                    ToolTip = 'Specifies the outbound entry is updated for this item application entry record.';
                    ApplicationArea = All;
                }
            }
        }
    }
}