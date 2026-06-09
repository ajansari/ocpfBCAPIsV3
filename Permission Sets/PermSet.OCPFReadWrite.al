namespace OnlyCopilotFans.OCPFAPIsv3;

permissionset 90951 "OCPF - READ/WRITE"
{
    Assignable = true;
    Caption = 'OCPFAPIs v3.0 - Read/Write Access';
    // Grants access to all OCPFAPIs v3.0 pages with write capability
    // on the 62 editable API pages (master data, setup, open documents,
    // and general journal lines).
    // NOTE: Consumers also require insert/modify/delete permissions on the
    // underlying BC base application tables. Assign alongside the relevant
    // BC base permission sets (e.g. D365 BUS FULL ACCESS or equivalent).
    // READ-ONLY pages from OCPF - READ are included automatically.

    IncludedPermissionSets = "OCPF - READ";

    Permissions =
        page "ocpfChartOfAccounts" = X,
        page "ocpfGeneralLedgerSetup" = X,
        page "ocpfAccountingPeriods" = X,
        page "ocpfGLBudgetEntries" = X,
        page "ocpfGenBusPostingGroups" = X,
        page "ocpfGenProdPostingGroups" = X,
        page "ocpfGeneralPostingSetup" = X,
        page "ocpfCustomerPostingGroups" = X,
        page "ocpfVendorPostingGroups" = X,
        page "ocpfInventoryPostingGroups" = X,
        page "ocpfVatBusinessPostingGroups" = X,
        page "ocpfVatProductPostingGroups" = X,
        page "ocpfVatPostingSetup" = X,
        page "ocpfDimensions" = X,
        page "ocpfDimensionValues" = X,
        page "ocpfDefaultDimensions" = X,
        page "ocpfInventoryPostingSetup" = X,
        page "ocpfBankAccounts" = X,
        page "ocpfBankAccountPostingGroups" = X,
        page "ocpfPaymentTerms" = X,
        page "ocpfPaymentMethods" = X,
        page "ocpfCurrencies" = X,
        page "ocpfCountriesRegions" = X,
        page "ocpfUnitsOfMeasure" = X,
        page "ocpfItemUnitsOfMeasure" = X,
        page "ocpfLocations" = X,
        page "ocpfItemCategories" = X,
        page "ocpfShipmentMethods" = X,
        page "ocpfCustomers" = X,
        page "ocpfVendors" = X,
        page "ocpfContacts" = X,
        page "ocpfContactBusinessRelations" = X,
        page "ocpfItems" = X,
        page "ocpfItemVendorCatalogs" = X,
        page "ocpfStockkeepingUnits" = X,
        page "ocpfItemTrackingCodes" = X,
        page "ocpfItemCharges" = X,
        page "ocpfResources" = X,
        page "ocpfResourceGroups" = X,
        page "ocpfEmployees" = X,
        page "ocpfSalespeople" = X,
        page "ocpfSalesQuotes" = X,
        page "ocpfSalesQuoteLines" = X,
        page "ocpfSalesOrders" = X,
        page "ocpfSalesOrderLines" = X,
        page "ocpfSalesInvoices" = X,
        page "ocpfSalesInvoiceLines" = X,
        page "ocpfSalesCreditMemos" = X,
        page "ocpfSalesCreditMemoLines" = X,
        page "ocpfSalesBlanketOrders" = X,
        page "ocpfSalesBlanketOrderLines" = X,
        page "ocpfPurchaseOrders" = X,
        page "ocpfPurchaseOrderLines" = X,
        page "ocpfPurchaseInvoices" = X,
        page "ocpfPurchaseInvoiceLines" = X,
        page "ocpfPurchaseCreditMemos" = X,
        page "ocpfPurchaseCreditMemoLines" = X,
        page "ocpfPurchaseQuotes" = X,
        page "ocpfPurchaseQuoteLines" = X,
        page "ocpfPurchaseBlanketOrders" = X,
        page "ocpfPurchaseBlanketOrderLines" = X,
        page "ocpfGeneralJournalLines" = X;
}
