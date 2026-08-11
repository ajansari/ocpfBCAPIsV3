namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Projects.Project.Ledger;

page 90914 "ocpfProjectLedgerEntries"
{
    PageType = API;
    Caption = 'Project ledger entries — posted usage and billing transactions for projects.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_projectsAndAssets';
    APIVersion = 'v3.0', 'v3.1';
    EntityName = 'ocpfProjectLedgerEntry';
    EntitySetName = 'ocpfProjectLedgerEntries';
    SourceTable = "Job Ledger Entry";
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
                field(jobNo; Rec."Job No.")
                    {
                        Caption = 'Project No.';
                        ToolTip = 'Specifies the Job No..';
                        ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                    {
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the Posting Date.';
                        ApplicationArea = All;
                }
                field(documentNo; Rec."Document No.")
                    {
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the Document No..';
                        ApplicationArea = All;
                }
                field(type; Rec.Type)
                    {
                        Caption = 'Type';
                        ToolTip = 'Specifies the Type.';
                        ApplicationArea = All;
                }
                field(no; Rec."No.")
                    {
                        Caption = 'No.';
                        ToolTip = 'Specifies the No..';
                        ApplicationArea = All;
                }
                field(description; Rec.Description)
                    {
                        Caption = 'Description';
                        ToolTip = 'Specifies the Description.';
                        ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                    {
                        Caption = 'Quantity';
                        ToolTip = 'Specifies the Quantity.';
                        ApplicationArea = All;
                }
                field(directUnitCostLcy; Rec."Direct Unit Cost (LCY)")
                    {
                        Caption = 'Direct Unit Cost (LCY)';
                        ToolTip = 'Specifies the Direct Unit Cost (LCY).';
                        ApplicationArea = All;
                }
                field(unitCostLcy; Rec."Unit Cost (LCY)")
                    {
                        Caption = 'Unit Cost (LCY)';
                        ToolTip = 'Specifies the Unit Cost (LCY).';
                        ApplicationArea = All;
                }
                field(totalCostLcy; Rec."Total Cost (LCY)")
                    {
                        Caption = 'Total Cost (LCY)';
                        ToolTip = 'Specifies the Total Cost (LCY).';
                        ApplicationArea = All;
                }
                field(unitPriceLcy; Rec."Unit Price (LCY)")
                    {
                        Caption = 'Unit Price (LCY)';
                        ToolTip = 'Specifies the Unit Price (LCY).';
                        ApplicationArea = All;
                }
                field(totalPriceLcy; Rec."Total Price (LCY)")
                    {
                        Caption = 'Total Price (LCY)';
                        ToolTip = 'Specifies the Total Price (LCY).';
                        ApplicationArea = All;
                }
                field(resourceGroupNo; Rec."Resource Group No.")
                    {
                        Caption = 'Resource Group No.';
                        ToolTip = 'Specifies the Resource Group No..';
                        ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                    {
                        Caption = 'Unit of Measure Code';
                        ToolTip = 'Specifies the Unit of Measure Code.';
                        ApplicationArea = All;
                }
                field(jobRegisterNo; Rec."Job Register No.")
                    {
                        Caption = 'Job Register No.';
                        ToolTip = 'Specifies the Job Register No..';
                        ApplicationArea = All;
                }
                field(locationCode; Rec."Location Code")
                    {
                        Caption = 'Location Code';
                        ToolTip = 'Specifies the Location Code.';
                        ApplicationArea = All;
                }
                field(jobPostingGroup; Rec."Job Posting Group")
                    {
                        Caption = 'Posting Group';
                        ToolTip = 'Specifies the Job Posting Group.';
                        ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                    {
                        Caption = 'Global Dimension 1 Code';
                        ToolTip = 'Specifies the Global Dimension 1 Code.';
                        ApplicationArea = All;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                    {
                        Caption = 'Global Dimension 2 Code';
                        ToolTip = 'Specifies the Global Dimension 2 Code.';
                        ApplicationArea = All;
                }
                field(workTypeCode; Rec."Work Type Code")
                    {
                        Caption = 'Work Type Code';
                        ToolTip = 'Specifies the Work Type Code.';
                        ApplicationArea = All;
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                    {
                        Caption = 'Customer Price Group';
                        ToolTip = 'Specifies the Customer Price Group.';
                        ApplicationArea = All;
                }
                field(userId; Rec."User ID")
                    {
                        Caption = 'User ID';
                        ToolTip = 'Specifies the User ID.';
                        ApplicationArea = All;
                }
                field(sourceCode; Rec."Source Code")
                    {
                        Caption = 'Source Code';
                        ToolTip = 'Specifies the Source Code.';
                        ApplicationArea = All;
                }
                field(shptMethodCode; Rec."Shpt. Method Code")
                    {
                        Caption = 'Shpt. Method Code';
                        ToolTip = 'Specifies the Shpt. Method Code.';
                        ApplicationArea = All;
                }
                field(amtToPostToGL; Rec."Amt. to Post to G/L")
                    {
                        Caption = 'Amt. to Post to G/L';
                        ToolTip = 'Specifies the Amt. to Post to G/L.';
                        ApplicationArea = All;
                }
                field(amtPostedToGL; Rec."Amt. Posted to G/L")
                    {
                        Caption = 'Amt. Posted to G/L';
                        ToolTip = 'Specifies the Amt. Posted to G/L.';
                        ApplicationArea = All;
                }
                field(entryType; Rec."Entry Type")
                    {
                        Caption = 'Entry Type';
                        ToolTip = 'Specifies the Entry Type.';
                        ApplicationArea = All;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                    {
                        Caption = 'Journal Batch Name';
                        ToolTip = 'Specifies the Journal Batch Name.';
                        ApplicationArea = All;
                }
                field(reasonCode; Rec."Reason Code")
                    {
                        Caption = 'Reason Code';
                        ToolTip = 'Specifies the Reason Code.';
                        ApplicationArea = All;
                }
                field(transactionType; Rec."Transaction Type")
                    {
                        Caption = 'Transaction Type';
                        ToolTip = 'Specifies the Transaction Type.';
                        ApplicationArea = All;
                }
                field(transportMethod; Rec."Transport Method")
                    {
                        Caption = 'Transport Method';
                        ToolTip = 'Specifies the Transport Method.';
                        ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                    {
                        Caption = 'Country/Region Code';
                        ToolTip = 'Specifies the Country/Region Code.';
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
                field(entryExitPoint; Rec."Entry/Exit Point")
                    {
                        Caption = 'Entry/Exit Point';
                        ToolTip = 'Specifies the Entry/Exit Point.';
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
                field(areaCode; Rec.Area)
                    {
                        Caption = 'Area';
                        ToolTip = 'Specifies the Area.';
                        ApplicationArea = All;
                }
                field(transactionSpecification; Rec."Transaction Specification")
                    {
                        Caption = 'Transaction Specification';
                        ToolTip = 'Specifies the Transaction Specification.';
                        ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                    {
                        Caption = 'No. Series';
                        ToolTip = 'Specifies the No. Series.';
                        ApplicationArea = All;
                }
                field(additionalCurrencyTotalCost; Rec."Additional-Currency Total Cost")
                    {
                        Caption = 'Additional-Currency Total Cost';
                        ToolTip = 'Specifies the Additional-Currency Total Cost.';
                        ApplicationArea = All;
                }
                field(addCurrencyTotalPrice; Rec."Add.-Currency Total Price")
                    {
                        Caption = 'Add.-Currency Total Price';
                        ToolTip = 'Specifies the Add.-Currency Total Price.';
                        ApplicationArea = All;
                }
                field(addCurrencyLineAmount; Rec."Add.-Currency Line Amount")
                    {
                        Caption = 'Add.-Currency Line Amount';
                        ToolTip = 'Specifies the Add.-Currency Line Amount.';
                        ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                    {
                        Caption = 'Dimension Set ID';
                        ToolTip = 'Specifies the Dimension Set ID.';
                        ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                    {
                        Caption = 'Shortcut Dimension 3 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 3 Code.';
                        ApplicationArea = All;
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                    {
                        Caption = 'Shortcut Dimension 4 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 4 Code.';
                        ApplicationArea = All;
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                    {
                        Caption = 'Shortcut Dimension 5 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 5 Code.';
                        ApplicationArea = All;
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                    {
                        Caption = 'Shortcut Dimension 6 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 6 Code.';
                        ApplicationArea = All;
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                    {
                        Caption = 'Shortcut Dimension 7 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 7 Code.';
                        ApplicationArea = All;
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                    {
                        Caption = 'Shortcut Dimension 8 Code';
                        ToolTip = 'Specifies the Shortcut Dimension 8 Code.';
                        ApplicationArea = All;
                }
                field(jobTaskNo; Rec."Job Task No.")
                    {
                        Caption = 'Project Task No.';
                        ToolTip = 'Specifies the Job Task No..';
                        ApplicationArea = All;
                }
                field(lineAmountLcy; Rec."Line Amount (LCY)")
                    {
                        Caption = 'Line Amount (LCY)';
                        ToolTip = 'Specifies the Line Amount (LCY).';
                        ApplicationArea = All;
                }
                field(unitCost; Rec."Unit Cost")
                    {
                        Caption = 'Unit Cost';
                        ToolTip = 'Specifies the Unit Cost.';
                        ApplicationArea = All;
                }
                field(totalCost; Rec."Total Cost")
                    {
                        Caption = 'Total Cost';
                        ToolTip = 'Specifies the Total Cost.';
                        ApplicationArea = All;
                }
                field(unitPrice; Rec."Unit Price")
                    {
                        Caption = 'Unit Price';
                        ToolTip = 'Specifies the Unit Price.';
                        ApplicationArea = All;
                }
                field(totalPrice; Rec."Total Price")
                    {
                        Caption = 'Total Price';
                        ToolTip = 'Specifies the Total Price.';
                        ApplicationArea = All;
                }
                field(lineAmount; Rec."Line Amount")
                    {
                        Caption = 'Line Amount';
                        ToolTip = 'Specifies the Line Amount.';
                        ApplicationArea = All;
                }
                field(lineDiscountAmount; Rec."Line Discount Amount")
                    {
                        Caption = 'Line Discount Amount';
                        ToolTip = 'Specifies the Line Discount Amount.';
                        ApplicationArea = All;
                }
                field(lineDiscountAmountLcy; Rec."Line Discount Amount (LCY)")
                    {
                        Caption = 'Line Discount Amount (LCY)';
                        ToolTip = 'Specifies the Line Discount Amount (LCY).';
                        ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                    {
                        Caption = 'Currency Code';
                        ToolTip = 'Specifies the Currency Code.';
                        ApplicationArea = All;
                }
                field(currencyFactor; Rec."Currency Factor")
                    {
                        Caption = 'Currency Factor';
                        ToolTip = 'Specifies the Currency Factor.';
                        ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                    {
                        Caption = 'Description 2';
                        ToolTip = 'Specifies the Description 2.';
                        ApplicationArea = All;
                }
                field(ledgerEntryType; Rec."Ledger Entry Type")
                    {
                        Caption = 'Ledger Entry Type';
                        ToolTip = 'Specifies the Ledger Entry Type.';
                        ApplicationArea = All;
                }
                field(ledgerEntryNo; Rec."Ledger Entry No.")
                    {
                        Caption = 'Ledger Entry No.';
                        ToolTip = 'Specifies the Ledger Entry No..';
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
                field(lineDiscountPct; Rec."Line Discount %")
                    {
                        Caption = 'Line Discount %';
                        ToolTip = 'Specifies the Line Discount %.';
                        ApplicationArea = All;
                }
                field(lineType; Rec."Line Type")
                    {
                        Caption = 'Line Type';
                        ToolTip = 'Specifies the Line Type.';
                        ApplicationArea = All;
                }
                field(originalUnitCostLcy; Rec."Original Unit Cost (LCY)")
                    {
                        Caption = 'Original Unit Cost (LCY)';
                        ToolTip = 'Specifies the Original Unit Cost (LCY).';
                        ApplicationArea = All;
                }
                field(originalTotalCostLcy; Rec."Original Total Cost (LCY)")
                    {
                        Caption = 'Original Total Cost (LCY)';
                        ToolTip = 'Specifies the Original Total Cost (LCY).';
                        ApplicationArea = All;
                }
                field(originalUnitCost; Rec."Original Unit Cost")
                    {
                        Caption = 'Original Unit Cost';
                        ToolTip = 'Specifies the Original Unit Cost.';
                        ApplicationArea = All;
                }
                field(originalTotalCost; Rec."Original Total Cost")
                    {
                        Caption = 'Original Total Cost';
                        ToolTip = 'Specifies the Original Total Cost.';
                        ApplicationArea = All;
                }
                field(originalTotalCostAcy; Rec."Original Total Cost (ACY)")
                    {
                        Caption = 'Original Total Cost (ACY)';
                        ToolTip = 'Specifies the Original Total Cost (ACY).';
                        ApplicationArea = All;
                }
                field(adjusted; Rec.Adjusted)
                    {
                        Caption = 'Adjusted';
                        ToolTip = 'Specifies the Adjusted.';
                        ApplicationArea = All;
                }
                field(datetimeAdjusted; Rec."DateTime Adjusted")
                    {
                        Caption = 'DateTime Adjusted';
                        ToolTip = 'Specifies the DateTime Adjusted.';
                        ApplicationArea = All;
                }
                field(variantCode; Rec."Variant Code")
                    {
                        Caption = 'Variant Code';
                        ToolTip = 'Specifies the Variant Code.';
                        ApplicationArea = All;
                }
                field(binCode; Rec."Bin Code")
                    {
                        Caption = 'Bin Code';
                        ToolTip = 'Specifies the Bin Code.';
                        ApplicationArea = All;
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                    {
                        Caption = 'Qty. per Unit of Measure';
                        ToolTip = 'Specifies the Qty. per Unit of Measure.';
                        ApplicationArea = All;
                }
                field(quantityBase; Rec."Quantity (Base)")
                    {
                        Caption = 'Quantity (Base)';
                        ToolTip = 'Specifies the Quantity (Base).';
                        ApplicationArea = All;
                }
                field(packageNo; Rec."Package No.")
                    {
                        Caption = 'Package No.';
                        ToolTip = 'Specifies the Package No..';
                        ApplicationArea = All;
                }
            }
        }
    }
}
