namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Contract;

page 90991 "ocpfServiceContractHeaders"
{
    PageType = API;
    Caption = 'Service Contracts — contract and quote headers covering service items, with invoicing, response, and renewal terms.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceContractHeader';
    EntitySetName = 'ocpfServiceContractHeaders';
    SourceTable = "Service Contract Header";
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
                field(contractNo; Rec."Contract No.")
                {
                    Caption = 'Contract No.';
                    ToolTip = 'Specifies the number of the service contract or service contract quote.';
                    ApplicationArea = All;
                }
                field(contractType; Rec."Contract Type")
                {
                    Caption = 'Contract Type';
                    ToolTip = 'Specifies the type of the contract.';
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies a description of the service contract.';
                    ApplicationArea = All;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    ToolTip = 'Specifies the Description 2.';
                    ApplicationArea = All;
                }
                field(status; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the status of the service contract or contract quote.';
                    ApplicationArea = All;
                }
                field(changeStatus; Rec."Change Status")
                {
                    Caption = 'Change Status';
                    ToolTip = 'Specifies if a service contract or contract quote is locked or open for changes.';
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the number of the customer who owns the service items in the service contract/contract quote.';
                    ApplicationArea = All;
                }
                field(name; Rec."Name")
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name of the customer in the service contract.';
                    ApplicationArea = All;
                }
                field(address; Rec."Address")
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the customer''s address.';
                    ApplicationArea = All;
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies additional address information.';
                    ApplicationArea = All;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the postal code.';
                    ApplicationArea = All;
                }
                field(city; Rec."City")
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the name of the city in where the customer is located.';
                    ApplicationArea = All;
                }
                field(contactName; Rec."Contact Name")
                {
                    Caption = 'Contact Name';
                    ToolTip = 'Specifies the name of the person you regularly contact when you do business with the customer in this service contract.';
                    ApplicationArea = All;
                }
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'Your Reference';
                    ToolTip = 'Specifies the customer''s reference number.';
                    ApplicationArea = All;
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                    ToolTip = 'Specifies the code of the salesperson assigned to this service contract.';
                    ApplicationArea = All;
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
                    ApplicationArea = All;
                }
                field(billToName; Rec."Bill-to Name")
                {
                    Caption = 'Bill-to Name';
                    ToolTip = 'Specifies the name of the customer that you send or sent the invoice or credit memo to.';
                    ApplicationArea = All;
                }
                field(billToAddress; Rec."Bill-to Address")
                {
                    Caption = 'Bill-to Address';
                    ToolTip = 'Specifies the address of the customer to whom you will send the invoice.';
                    ApplicationArea = All;
                }
                field(billToAddress2; Rec."Bill-to Address 2")
                {
                    Caption = 'Bill-to Address 2';
                    ToolTip = 'Specifies an additional line of the address.';
                    ApplicationArea = All;
                }
                field(billToPostCode; Rec."Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code';
                    ToolTip = 'Specifies the postal code of the customer''s billing address.';
                    ApplicationArea = All;
                }
                field(billToCity; Rec."Bill-to City")
                {
                    Caption = 'Bill-to City';
                    ToolTip = 'Specifies the city of the address.';
                    ApplicationArea = All;
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                    ApplicationArea = All;
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                    ToolTip = 'Specifies the name of the customer at the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToAddress; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address';
                    ToolTip = 'Specifies the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToAddress2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address 2';
                    ToolTip = 'Specifies an additional part of the ship-to address, in case it is a long address.';
                    ApplicationArea = All;
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                    ToolTip = 'Specifies the postal code of the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(shipToCity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';
                    ToolTip = 'Specifies the city of the address that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(servContractAccGrCode; Rec."Serv. Contract Acc. Gr. Code")
                {
                    Caption = 'Serv. Contract Acc. Gr. Code';
                    ToolTip = 'Specifies the code associated with the service contract account group.';
                    ApplicationArea = All;
                }
                field(invoicePeriod; Rec."Invoice Period")
                {
                    Caption = 'Invoice Period';
                    ToolTip = 'Specifies the invoice period for the service contract.';
                    ApplicationArea = All;
                }
                field(lastInvoiceDate; Rec."Last Invoice Date")
                {
                    Caption = 'Last Invoice Date';
                    ToolTip = 'Specifies the date when this service contract was last invoiced.';
                    ApplicationArea = All;
                }
                field(nextInvoiceDate; Rec."Next Invoice Date")
                {
                    Caption = 'Next Invoice Date';
                    ToolTip = 'Specifies the date of the next invoice for this service contract.';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ToolTip = 'Specifies the starting date of the service contract.';
                    ApplicationArea = All;
                }
                field(expirationDate; Rec."Expiration Date")
                {
                    Caption = 'Expiration Date';
                    ToolTip = 'Specifies the date when the service contract expires.';
                    ApplicationArea = All;
                }
                field(firstServiceDate; Rec."First Service Date")
                {
                    Caption = 'First Service Date';
                    ToolTip = 'Specifies the date of the first expected service for the service items in the contract.';
                    ApplicationArea = All;
                }
                field(maxLaborUnitPrice; Rec."Max. Labor Unit Price")
                {
                    Caption = 'Max. Labor Unit Price';
                    ToolTip = 'Specifies the maximum unit price that can be set for a resource on all service orders and lines for the service contract.';
                    ApplicationArea = All;
                }
                field(calcdAnnualAmount; Rec."Calcd. Annual Amount")
                {
                    Caption = 'Calcd. Annual Amount';
                    ToolTip = 'Specifies the sum of the Line Amount field values on all contract lines associated with the service contract or contract quote.';
                    ApplicationArea = All;
                }
                field(annualAmount; Rec."Annual Amount")
                {
                    Caption = 'Annual Amount';
                    ToolTip = 'Specifies the amount that will be invoiced annually for the service contract or contract quote.';
                    ApplicationArea = All;
                }
                field(amountPerPeriod; Rec."Amount per Period")
                {
                    Caption = 'Amount per Period';
                    ToolTip = 'Specifies the amount that will be invoiced for each invoice period for the service contract.';
                    ApplicationArea = All;
                }
                field(combineInvoices; Rec."Combine Invoices")
                {
                    Caption = 'Combine Invoices';
                    ToolTip = 'Specifies you want to combine invoices for this service contract with invoices for other service contracts with the same bill-to customer.';
                    ApplicationArea = All;
                }
                field(prepaid; Rec."Prepaid")
                {
                    Caption = 'Prepaid';
                    ToolTip = 'Specifies that this service contract is prepaid.';
                    ApplicationArea = All;
                }
                field(nextInvoicePeriod; Rec."Next Invoice Period")
                {
                    Caption = 'Next Invoice Period';
                    ToolTip = 'Specifies the Next Invoice Period.';
                    ApplicationArea = All;
                }
                field(serviceZoneCode; Rec."Service Zone Code")
                {
                    Caption = 'Service Zone Code';
                    ToolTip = 'Specifies the code of the service zone of the customer ship-to address.';
                    ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                    ToolTip = 'Specifies the Language Code.';
                    ApplicationArea = All;
                }
                field(formatRegion; Rec."Format Region")
                {
                    Caption = 'Format Region';
                    ToolTip = 'Specifies the Format Region.';
                    ApplicationArea = All;
                }
                field(cancelReasonCode; Rec."Cancel Reason Code")
                {
                    Caption = 'Cancel Reason Code';
                    ToolTip = 'Specifies a reason code for canceling the service contract.';
                    ApplicationArea = All;
                }
                field(lastPriceUpdateDate; Rec."Last Price Update Date")
                {
                    Caption = 'Last Price Update Date';
                    ToolTip = 'Specifies the date you last updated the contract prices.';
                    ApplicationArea = All;
                }
                field(nextPriceUpdateDate; Rec."Next Price Update Date")
                {
                    Caption = 'Next Price Update Date';
                    ToolTip = 'Specifies the next date you want contract prices to be updated.';
                    ApplicationArea = All;
                }
                field(lastPriceUpdatePct; Rec."Last Price Update %")
                {
                    Caption = 'Last Price Update %';
                    ToolTip = 'Specifies the price update percentage you used the last time you updated the contract prices.';
                    ApplicationArea = All;
                }
                field(responseTimeHours; Rec."Response Time (Hours)")
                {
                    Caption = 'Response Time (Hours)';
                    ToolTip = 'Specifies the response time for the service contract.';
                    ApplicationArea = All;
                }
                field(contractLinesOnInvoice; Rec."Contract Lines on Invoice")
                {
                    Caption = 'Contract Lines on Invoice';
                    ToolTip = 'Specifies that you want the lines for this contract to appear as text on the invoice.';
                    ApplicationArea = All;
                }
                field(noOfPostedInvoices; Rec."No. of Posted Invoices")
                {
                    Caption = 'No. of Posted Invoices';
                    ToolTip = 'Specifies the number of posted service invoices linked to the service contract.';
                    ApplicationArea = All;
                }
                field(noOfUnpostedInvoices; Rec."No. of Unposted Invoices")
                {
                    Caption = 'No. of Unposted Invoices';
                    ToolTip = 'Specifies the number of unposted service invoices linked to the service contract.';
                    ApplicationArea = All;
                }
                field(servicePeriod; Rec."Service Period")
                {
                    Caption = 'Service Period';
                    ToolTip = 'Specifies a default service period for the items in the contract.';
                    ApplicationArea = All;
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                    ApplicationArea = All;
                }
                field(invoiceAfterService; Rec."Invoice after Service")
                {
                    Caption = 'Invoice after Service';
                    ToolTip = 'Specifies that you can only invoice the contract if you have posted a service order since last time you invoiced the contract.';
                    ApplicationArea = All;
                }
                field(quoteType; Rec."Quote Type")
                {
                    Caption = 'Quote Type';
                    ToolTip = 'Specifies the type of the service contract quote.';
                    ApplicationArea = All;
                }
                field(allowUnbalancedAmounts; Rec."Allow Unbalanced Amounts")
                {
                    Caption = 'Allow Unbalanced Amounts';
                    ToolTip = 'Specifies if the contents of the Calcd. Annual Amount field are copied into the Annual Amount field in the service contract or contract quote.';
                    ApplicationArea = All;
                }
                field(contractGroupCode; Rec."Contract Group Code")
                {
                    Caption = 'Contract Group Code';
                    ToolTip = 'Specifies the contract group code assigned to the service contract.';
                    ApplicationArea = All;
                }
                field(serviceOrderType; Rec."Service Order Type")
                {
                    Caption = 'Service Order Type';
                    ToolTip = 'Specifies the service order type assigned to service orders linked to this contract.';
                    ApplicationArea = All;
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    ApplicationArea = All;
                }
                field(acceptBefore; Rec."Accept Before")
                {
                    Caption = 'Accept Before';
                    ToolTip = 'Specifies the date before which the customer must accept this contract quote.';
                    ApplicationArea = All;
                }
                field(automaticCreditMemos; Rec."Automatic Credit Memos")
                {
                    Caption = 'Automatic Credit Memos';
                    ToolTip = 'Specifies that a credit memo is created when you remove a contract line.';
                    ApplicationArea = All;
                }
                field(templateNo; Rec."Template No.")
                {
                    Caption = 'Template No.';
                    ToolTip = 'Specifies the Template No..';
                    ApplicationArea = All;
                }
                field(priceUpdatePeriod; Rec."Price Update Period")
                {
                    Caption = 'Price Update Period';
                    ToolTip = 'Specifies the price update period for this service contract.';
                    ApplicationArea = All;
                }
                field(priceInvIncreaseCode; Rec."Price Inv. Increase Code")
                {
                    Caption = 'Price Inv. Increase Code';
                    ToolTip = 'Specifies the standard text code printed on service invoices, informing the customer which prices have been updated since the last invoice.';
                    ApplicationArea = All;
                }
                field(printIncreaseText; Rec."Print Increase Text")
                {
                    Caption = 'Print Increase Text';
                    ToolTip = 'Specifies the standard text code printed on service invoices, informing the customer which prices have been updated since the last invoice.';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Specifies the currency used to calculate the amounts in the documents related to this contract.';
                    ApplicationArea = All;
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                    ToolTip = 'Specifies the No. Series.';
                    ApplicationArea = All;
                }
                field(probability; Rec."Probability")
                {
                    Caption = 'Probability';
                    ToolTip = 'Specifies the probability of the customer approving the service contract quote.';
                    ApplicationArea = All;
                }
                field(comment; Rec."Comment")
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the Comment.';
                    ApplicationArea = All;
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                    ApplicationArea = All;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the customer telephone number.';
                    ApplicationArea = All;
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the Fax No..';
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the customer''s email address.';
                    ApplicationArea = All;
                }
                field(billToCounty; Rec."Bill-to County")
                {
                    Caption = 'Bill-to County';
                    ToolTip = 'Specifies the county code of the customer''s billing address.';
                    ApplicationArea = All;
                }
                field(county; Rec."County")
                {
                    Caption = 'County';
                    ToolTip = 'Specifies the County.';
                    ApplicationArea = All;
                }
                field(shipToCounty; Rec."Ship-to County")
                {
                    Caption = 'Ship-to County';
                    ToolTip = 'Specifies the county of the address.';
                    ApplicationArea = All;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country/region of the address.';
                    ApplicationArea = All;
                }
                field(billToCountryRegionCode; Rec."Bill-to Country/Region Code")
                {
                    Caption = 'Bill-to Country/Region Code';
                    ToolTip = 'Specifies the country/region code of the customer''s billing address.';
                    ApplicationArea = All;
                }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';
                    ToolTip = 'Specifies the country/region code of the address.';
                    ApplicationArea = All;
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ToolTip = 'Specifies the Name 2.';
                    ApplicationArea = All;
                }
                field(billToName2; Rec."Bill-to Name 2")
                {
                    Caption = 'Bill-to Name 2';
                    ToolTip = 'Specifies the Bill-to Name 2.';
                    ApplicationArea = All;
                }
                field(shipToName2; Rec."Ship-to Name 2")
                {
                    Caption = 'Ship-to Name 2';
                    ToolTip = 'Specifies an additional part of the name of the customer that the items are shipped to.';
                    ApplicationArea = All;
                }
                field(nextInvoicePeriodStart; Rec."Next Invoice Period Start")
                {
                    Caption = 'Next Invoice Period Start';
                    ToolTip = 'Specifies the Next Invoice Period Start.';
                    ApplicationArea = All;
                }
                field(nextInvoicePeriodEnd; Rec."Next Invoice Period End")
                {
                    Caption = 'Next Invoice Period End';
                    ToolTip = 'Specifies the Next Invoice Period End.';
                    ApplicationArea = All;
                }
                field(contractInvoiceAmount; Rec."Contract Invoice Amount")
                {
                    Caption = 'Contract Invoice Amount';
                    ToolTip = 'Specifies the Contract Invoice Amount.';
                    ApplicationArea = All;
                }
                field(contractPrepaidAmount; Rec."Contract Prepaid Amount")
                {
                    Caption = 'Contract Prepaid Amount';
                    ToolTip = 'Specifies the Contract Prepaid Amount.';
                    ApplicationArea = All;
                }
                field(contractDiscountAmount; Rec."Contract Discount Amount")
                {
                    Caption = 'Contract Discount Amount';
                    ToolTip = 'Specifies the Contract Discount Amount.';
                    ApplicationArea = All;
                }
                field(contractCostAmount; Rec."Contract Cost Amount")
                {
                    Caption = 'Contract Cost Amount';
                    ToolTip = 'Specifies the Contract Cost Amount.';
                    ApplicationArea = All;
                }
                field(contractGainLossAmount; Rec."Contract Gain/Loss Amount")
                {
                    Caption = 'Contract Gain/Loss Amount';
                    ToolTip = 'Specifies the Contract Gain/Loss Amount.';
                    ApplicationArea = All;
                }
                field(noOfPostedCreditMemos; Rec."No. of Posted Credit Memos")
                {
                    Caption = 'No. of Posted Credit Memos';
                    ToolTip = 'Specifies the number of posted credit memos linked to this service contract.';
                    ApplicationArea = All;
                }
                field(noOfUnpostedCreditMemos; Rec."No. of Unposted Credit Memos")
                {
                    Caption = 'No. of Unposted Credit Memos';
                    ToolTip = 'Specifies the number of unposted credit memos linked to the service contract.';
                    ApplicationArea = All;
                }
                field(typeFilter; Rec."Type Filter")
                {
                    Caption = 'Type Filter';
                    ToolTip = 'Specifies the Type Filter.';
                    ApplicationArea = All;
                }
                field(reasonCodeFilter; Rec."Reason Code Filter")
                {
                    Caption = 'Reason Code Filter';
                    ToolTip = 'Specifies the Reason Code Filter.';
                    ApplicationArea = All;
                }
                field(postedServiceOrderFilter; Rec."Posted Service Order Filter")
                {
                    Caption = 'Posted Service Order Filter';
                    ToolTip = 'Specifies the Posted Service Order Filter.';
                    ApplicationArea = All;
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                    ToolTip = 'Specifies the Date Filter.';
                    ApplicationArea = All;
                }
                field(itemFilter; Rec."Item Filter")
                {
                    Caption = 'Item Filter';
                    ToolTip = 'Specifies the Item Filter.';
                    ApplicationArea = All;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                    ApplicationArea = All;
                }
                field(shipToPhoneNo; Rec."Ship-to Phone No.")
                {
                    Caption = 'Ship-to Phone No.';
                    ToolTip = 'Specifies the telephone number of the company''s shipping address.';
                    ApplicationArea = All;
                }
                field(dimensionSetId; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                    ToolTip = 'Specifies the Dimension Set ID.';
                    ApplicationArea = All;
                }
                field(directDebitMandateId; Rec."Direct Debit Mandate ID")
                {
                    Caption = 'Direct Debit Mandate ID';
                    ToolTip = 'Specifies the direct-debit mandate that the customer has signed to allow direct-debit collection of payments.';
                    ApplicationArea = All;
                }
                field(contactNo; Rec."Contact No.")
                {
                    Caption = 'Contact No.';
                    ToolTip = 'Specifies the number of the contact who will receive the service delivery.';
                    ApplicationArea = All;
                }
                field(billToContactNo; Rec."Bill-to Contact No.")
                {
                    Caption = 'Bill-to Contact No.';
                    ToolTip = 'Specifies the number of the contact person at the customer''s billing address.';
                    ApplicationArea = All;
                }
                field(billToContact; Rec."Bill-to Contact")
                {
                    Caption = 'Bill-to Contact';
                    ToolTip = 'Specifies the name of the contact person at the customer''s billing address.';
                    ApplicationArea = All;
                }
                field(lastInvoicePeriodEnd; Rec."Last Invoice Period End")
                {
                    Caption = 'Last Invoice Period End';
                    ToolTip = 'Specifies the Last Invoice Period End.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
