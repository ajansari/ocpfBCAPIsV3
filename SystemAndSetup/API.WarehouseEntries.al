namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Warehouse.Ledger;

page 90932 "ocpfWarehouseEntries"
{
    PageType = API;
    Caption = 'Warehouse entries — posted inventory movements through warehouse locations.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_systemAndSetup';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfWarehouseEntry';
    EntitySetName = 'ocpfWarehouseEntries';
    SourceTable = "Warehouse Entry";
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
                        ToolTip = 'Specifies the Entry No..';
                        ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                    {
                        Caption = 'Journal Batch Name';
                        ToolTip = 'Specifies the Journal Batch Name.';
                        ApplicationArea = All;
                }
                field(lineNo; Rec."Line No.")
                    {
                        Caption = 'Line No.';
                        ToolTip = 'Specifies the Line No..';
                        ApplicationArea = All;
                }
                field(registeringDate; Rec."Registering Date")
                    {
                        Caption = 'Registering Date';
                        ToolTip = 'Specifies the Registering Date.';
                        ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                    {
                        Caption = 'Location Code';
                        ToolTip = 'Specifies the Location Code.';
                        ApplicationArea = All;
                }
                field(zoneCode; Rec."Zone Code")
                    {
                        Caption = 'Zone Code';
                        ToolTip = 'Specifies the Zone Code.';
                        ApplicationArea = All;
                }
                field(binCode; Rec."Bin Code")
                    {
                        Caption = 'Bin Code';
                        ToolTip = 'Specifies the Bin Code.';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                    {
                        Caption = 'Item No.';
                        ToolTip = 'Specifies the Item No..';
                        ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                    {
                        Caption = 'Quantity';
                        ToolTip = 'Specifies the Quantity.';
                        ApplicationArea = All;
                }
                field(qtyBase; Rec."Qty. (Base)")
                    {
                        Caption = 'Qty. (Base)';
                        ToolTip = 'Specifies the Qty. (Base).';
                        ApplicationArea = All;
                }
                field(warehouseRegisterNo; Rec."Warehouse Register No.")
                    {
                        Caption = 'Warehouse Register No.';
                        ToolTip = 'Specifies the Warehouse Register No..';
                        ApplicationArea = All;
                }
                field(siftBucketNo; Rec."SIFT Bucket No.")
                    {
                        Caption = 'SIFT Bucket No.';
                        ToolTip = 'Specifies an automatically generated number that is used by the system to enable better concurrency.';
                        ApplicationArea = All;
                }
                field(sourceType; Rec."Source Type")
                    {
                        Caption = 'Source Type';
                        ToolTip = 'Specifies the Source Type.';
                        ApplicationArea = All;
                }
                field(sourceSubtype; Rec."Source Subtype")
                    {
                        Caption = 'Source Subtype';
                        ToolTip = 'Specifies the Source Subtype.';
                        ApplicationArea = All;
                }
                field(sourceNo; Rec."Source No.")
                    {
                        Caption = 'Source No.';
                        ToolTip = 'Specifies the Source No..';
                        ApplicationArea = All;
                }
                field(sourceLineNo; Rec."Source Line No.")
                    {
                        Caption = 'Source Line No.';
                        ToolTip = 'Specifies the Source Line No..';
                        ApplicationArea = All;
                }
                field(sourceSublineNo; Rec."Source Subline No.")
                    {
                        Caption = 'Source Subline No.';
                        ToolTip = 'Specifies the Source Subline No..';
                        ApplicationArea = All;
                }
                field(sourceDocument; Rec."Source Document")
                    {
                        Caption = 'Source Document';
                        ToolTip = 'Specifies the Source Document.';
                        ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                    {
                        Caption = 'Source Code';
                        ToolTip = 'Specifies the Source Code.';
                        ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                    {
                        Caption = 'Reason Code';
                        ToolTip = 'Specifies the Reason Code.';
                        ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                    {
                        Caption = 'No. Series';
                        ToolTip = 'Specifies the No. Series.';
                        ApplicationArea = All;
                }
                field(binTypeCode; Rec."Bin Type Code")
                    {
                        Caption = 'Bin Type Code';
                        ToolTip = 'Specifies the Bin Type Code.';
                        ApplicationArea = All;
                }
                field(cubage; Rec.Cubage)
                    {
                        Caption = 'Cubage';
                        ToolTip = 'Specifies the Cubage.';
                        ApplicationArea = All;
                }
                field(weight; Rec.Weight)
                    {
                        Caption = 'Weight';
                        ToolTip = 'Specifies the Weight.';
                        ApplicationArea = All;
                }
                field(journalTemplateName; Rec."Journal Template Name")
                    {
                        Caption = 'Journal Template Name';
                        ToolTip = 'Specifies the Journal Template Name.';
                        ApplicationArea = All;
                }
                field(whseDocumentNo; Rec."Whse. Document No.")
                    {
                        Caption = 'Whse. Document No.';
                        ToolTip = 'Specifies the Whse. Document No..';
                        ApplicationArea = All;
                }
                field(whseDocumentType; Rec."Whse. Document Type")
                    {
                        Caption = 'Whse. Document Type';
                        ToolTip = 'Specifies the Whse. Document Type.';
                        ApplicationArea = All;
                }
                field(whseDocumentLineNo; Rec."Whse. Document Line No.")
                    {
                        Caption = 'Whse. Document Line No.';
                        ToolTip = 'Specifies the Whse. Document Line No..';
                        ApplicationArea = All;
                }
                field(entryType; Rec."Entry Type")
                    {
                        Caption = 'Entry Type';
                        ToolTip = 'Specifies the Entry Type.';
                        ApplicationArea = All;
                }
                field(referenceDocument; Rec."Reference Document")
                    {
                        Caption = 'Reference Document';
                        ToolTip = 'Specifies the Reference Document.';
                        ApplicationArea = All;
                }
                field(referenceNo; Rec."Reference No.")
                    {
                        Caption = 'Reference No.';
                        ToolTip = 'Specifies the Reference No..';
                        ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                    {
                        Caption = 'User ID';
                        ToolTip = 'Specifies the User ID.';
                        ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                    {
                        Caption = 'Variant Code';
                        ToolTip = 'Specifies the Variant Code.';
                        ApplicationArea = All;
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                    {
                        Caption = 'Qty. per Unit of Measure';
                        ToolTip = 'Specifies the Qty. per Unit of Measure.';
                        ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                    {
                        Caption = 'Unit of Measure Code';
                        ToolTip = 'Specifies the Unit of Measure Code.';
                        ApplicationArea = All;
                }
                field(serialNo; Rec."Serial No.")
                    {
                        Caption = 'Serial No.';
                        ToolTip = 'Specifies the Serial No..';
                        ApplicationArea = All;
                }
                field(lotNo; Rec."Lot No.")
                    {
                        Caption = 'Lot No.';
                        ToolTip = 'Specifies the Lot No..';
                        ApplicationArea = All;
                }
                field(warrantyDate; Rec."Warranty Date")
                    {
                        Caption = 'Warranty Date';
                        ToolTip = 'Specifies the Warranty Date.';
                        ApplicationArea = All;
                }
                field(expirationDate; Rec."Expiration Date")
                    {
                        Caption = 'Expiration Date';
                        ToolTip = 'Specifies the Expiration Date.';
                        ApplicationArea = All;
                }
                field(packageNo; Rec."Package No.")
                    {
                        Caption = 'Package No.';
                        ToolTip = 'Specifies the Package No..';
                        ApplicationArea = All;
                }
                field(physInvtCountingPeriodCode; Rec."Phys Invt Counting Period Code")
                    {
                        Caption = 'Phys Invt Counting Period Code';
                        ToolTip = 'Specifies the Phys Invt Counting Period Code.';
                        ApplicationArea = All;
                }
                field(physInvtCountingPeriodType; Rec."Phys Invt Counting Period Type")
                    {
                        Caption = 'Phys Invt Counting Period Type';
                        ToolTip = 'Specifies the Phys Invt Counting Period Type.';
                        ApplicationArea = All;
                }
                field(dedicated; Rec.Dedicated)
                    {
                        Caption = 'Dedicated';
                        ToolTip = 'Specifies the Dedicated.';
                        ApplicationArea = All;
                }
            }
        }
    }
}
