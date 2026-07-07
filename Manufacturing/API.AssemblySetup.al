namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Assembly.Setup;

page 90967 "ocpfAssemblySetup"
{
    PageType = API;
    Caption = 'Assembly Setup — company-wide settings and number series for assembly management.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_manufacturing';
    APIVersion = 'v3.1';
    EntityName = 'ocpfAssemblySetup';
    EntitySetName = 'ocpfAssemblySetup';
    SourceTable = "Assembly Setup";
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
                field(primaryKey; Rec."Primary Key")
                {
                    Caption = 'Primary Key';
                    ToolTip = 'Specifies the Primary Key.';
                    ApplicationArea = All;
                }
                field(stockoutWarning; Rec."Stockout Warning")
                {
                    Caption = 'Stockout Warning';
                    ToolTip = 'Specifies whether the assembly availability warning appears during sales order entry.';
                    ApplicationArea = All;
                }
                field(assemblyOrderNos; Rec."Assembly Order Nos.")
                {
                    Caption = 'Assembly Order Nos.';
                    ToolTip = 'Specifies the number series code used to assign numbers to assembly orders when they are created.';
                    ApplicationArea = All;
                }
                field(assemblyQuoteNos; Rec."Assembly Quote Nos.")
                {
                    Caption = 'Assembly Quote Nos.';
                    ToolTip = 'Specifies the number series code used to assign numbers to assembly quotes when they are created.';
                    ApplicationArea = All;
                }
                field(blanketAssemblyOrderNos; Rec."Blanket Assembly Order Nos.")
                {
                    Caption = 'Blanket Assembly Order Nos.';
                    ToolTip = 'Specifies the number series code used to assign numbers to assembly blanket orders when they are created.';
                    ApplicationArea = All;
                }
                field(postedAssemblyOrderNos; Rec."Posted Assembly Order Nos.")
                {
                    Caption = 'Posted Assembly Order Nos.';
                    ToolTip = 'Specifies the number series code used to assign numbers to assembly orders when they are posted.';
                    ApplicationArea = All;
                }
                field(copyComponentDimensionsFrom; Rec."Copy Component Dimensions from")
                {
                    Caption = 'Copy Component Dimensions from';
                    ToolTip = 'Specifies how dimension codes are distributed to assembly components when they are consumed in assembly order posting.';
                    ApplicationArea = All;
                }
                field(defaultLocationForOrders; Rec."Default Location for Orders")
                {
                    Caption = 'Default Location for Orders';
                    ToolTip = 'Specifies at which location assembly orders are created by default.';
                    ApplicationArea = All;
                }
                field(copyCommentsWhenPosting; Rec."Copy Comments when Posting")
                {
                    Caption = 'Copy Comments when Posting';
                    ToolTip = 'Specifies that comments on assembly order lines are copied to the resulting posted documents.';
                    ApplicationArea = All;
                }
                field(createMovementsAutomatically; Rec."Create Movements Automatically")
                {
                    Caption = 'Create Movements Automatically';
                    ToolTip = 'Specifies that an inventory movement for the required components is created automatically when you create an inventory pick.';
                    ApplicationArea = All;
                }
                field(defaultGenBusPostGroup; Rec."Default Gen. Bus. Post. Group")
                {
                    Caption = 'Default General Business Posting Group';
                    ToolTip = 'Specifies the general business posting group that is used by default for assembly orders.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
