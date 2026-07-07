namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Service.Setup;

page 90924 "ocpfServiceMgtSetup"
{
    PageType = API;
    Caption = 'Service Management Setup — company-wide settings, defaults, and number series for service management.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_serviceManagement';
    APIVersion = 'v3.1';
    EntityName = 'ocpfServiceMgtSetup';
    EntitySetName = 'ocpfServiceMgtSetup';
    SourceTable = "Service Mgt. Setup";
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
                field(faultReportingLevel; Rec."Fault Reporting Level")
                {
                    Caption = 'Fault Reporting Level';
                    ToolTip = 'Specifies the level of fault reporting that your company uses in service management.';
                    ApplicationArea = All;
                }
                field(linkServiceToServiceItem; Rec."Link Service to Service Item")
                {
                    Caption = 'Link Service to Service Item';
                    ToolTip = 'Specifies that service lines for resources and items must be linked to a service item line. The value that you specify is entered as the link when a service order is created, but you can change it on the order manually.';
                    ApplicationArea = All;
                }
                field(salespersonMandatory; Rec."Salesperson Mandatory")
                {
                    Caption = 'Salesperson Mandatory';
                    ToolTip = 'Specifies that you must fill in the Salesperson Code field on the headers of service orders, invoices, credit memos, and service contracts.';
                    ApplicationArea = All;
                }
                field(warrantyDiscPctParts; Rec."Warranty Disc. % (Parts)")
                {
                    Caption = 'Warranty Disc. % (Parts)';
                    ToolTip = 'Specifies the default warranty discount percentage on spare parts. The program uses this value to set warranty discounts on parts on service item lines.';
                    ApplicationArea = All;
                }
                field(warrantyDiscPctLabor; Rec."Warranty Disc. % (Labor)")
                {
                    Caption = 'Warranty Disc. % (Labor)';
                    ToolTip = 'Specifies the default warranty discount percentage on labor. The program uses this value to set warranty discounts on labor on service item lines.';
                    ApplicationArea = All;
                }
                field(contractRspTimeMandatory; Rec."Contract Rsp. Time Mandatory")
                {
                    Caption = 'Contract Rsp. Time Mandatory';
                    ToolTip = 'Specifies that the Response Time (Hours) field must be filled on service contract lines before you can convert a quote to a contract.';
                    ApplicationArea = All;
                }
                field(serviceOrderStartingFee; Rec."Service Order Starting Fee")
                {
                    Caption = 'Service Order Starting Fee';
                    ToolTip = 'Specifies the code for a service order starting fee.';
                    ApplicationArea = All;
                }
                field(registerContractChanges; Rec."Register Contract Changes")
                {
                    Caption = 'Register Contract Changes';
                    ToolTip = 'Specifies that you want the program to log changes to service contracts in the Contract Change Log table.';
                    ApplicationArea = All;
                }
                field(contractInvLineTextCode; Rec."Contract Inv. Line Text Code")
                {
                    Caption = 'Contract Inv. Line Text Code';
                    ToolTip = 'Specifies the code for the standard text entered in the Description field on the line in a contract invoice.';
                    ApplicationArea = All;
                }
                field(contractLineInvTextCode; Rec."Contract Line Inv. Text Code")
                {
                    Caption = 'Contract Line Inv. Text Code';
                    ToolTip = 'Specifies the code for the standard text entered in the Description field on the line in a contract invoice.';
                    ApplicationArea = All;
                }
                field(contractInvPeriodTextCode; Rec."Contract Inv. Period Text Code")
                {
                    Caption = 'Contract Inv. Period Text Code';
                    ToolTip = 'Specifies the code for the standard text entered in the Description field on the line in a contract invoice.';
                    ApplicationArea = All;
                }
                field(contractCreditLineTextCode; Rec."Contract Credit Line Text Code")
                {
                    Caption = 'Contract Credit Line Text Code';
                    ToolTip = 'Specifies the code for the standard text that entered in the Description field on the line in a contract credit memo.';
                    ApplicationArea = All;
                }
                field(sendFirstWarningTo; Rec."Send First Warning To")
                {
                    Caption = 'Send First Warning To';
                    ToolTip = 'Specifies the email address that will be used to send the first warning about the response time for a service order that is approaching.';
                    ApplicationArea = All;
                }
                field(sendSecondWarningTo; Rec."Send Second Warning To")
                {
                    Caption = 'Send Second Warning To';
                    ToolTip = 'Specifies the email address that will be used to send the second warning about the response time for a service order that is approaching.';
                    ApplicationArea = All;
                }
                field(sendThirdWarningTo; Rec."Send Third Warning To")
                {
                    Caption = 'Send Third Warning To';
                    ToolTip = 'Specifies the email address that will be used to send the third warning about the response time for a service order that is approaching.';
                    ApplicationArea = All;
                }
                field(firstWarningWithinHours; Rec."First Warning Within (Hours)")
                {
                    Caption = 'First Warning Within (Hours)';
                    ToolTip = 'Specifies the number of hours before the program sends the first warning about the response time approaching for a service order. The working calendar and the default service hours are used to calculate when to send the warnings within the general service hours of your company.';
                    ApplicationArea = All;
                }
                field(secondWarningWithinHours; Rec."Second Warning Within (Hours)")
                {
                    Caption = 'Second Warning Within (Hours)';
                    ToolTip = 'Specifies the number of hours before the program sends the second warning about the response time approaching for a service order.';
                    ApplicationArea = All;
                }
                field(thirdWarningWithinHours; Rec."Third Warning Within (Hours)")
                {
                    Caption = 'Third Warning Within (Hours)';
                    ToolTip = 'Specifies the number of hours before the program sends the third warning about the response time approaching for a service order.';
                    ApplicationArea = All;
                }
                field(nextServiceCalcMethod; Rec."Next Service Calc. Method")
                {
                    Caption = 'Next Service Calc. Method';
                    ToolTip = 'Specifies how you want the program to recalculate the next planned service date for service items in service contracts. Planned: The next planned service date is recalculated by adding the value in the Service Period field for the service item to the previous next planned service date. Also, when the last service actually took place is disregarded. Actual: The next planned service date is recalculated by adding the service period for the service item to the value in the Posting Date field of the last posted service order that belongs to the service contract and includes that service item.';
                    ApplicationArea = All;
                }
                field(serviceOrderTypeMandatory; Rec."Service Order Type Mandatory")
                {
                    Caption = 'Service Order Type Mandatory';
                    ToolTip = 'Specifies that a service order must have a service order type assigned before the order can be posted.';
                    ApplicationArea = All;
                }
                field(serviceZonesOption; Rec."Service Zones Option")
                {
                    Caption = 'Service Zones Option';
                    ToolTip = 'Specifies how to identify service zones in your company when you allocate resources to service items.';
                    ApplicationArea = All;
                }
                field(serviceOrderStartMandatory; Rec."Service Order Start Mandatory")
                {
                    Caption = 'Service Order Start Mandatory';
                    ToolTip = 'Specifies that the Starting Date and Starting Time fields on a service order must be filled in before you can post the service order.';
                    ApplicationArea = All;
                }
                field(serviceOrderFinishMandatory; Rec."Service Order Finish Mandatory")
                {
                    Caption = 'Service Order Finish Mandatory';
                    ToolTip = 'Specifies that the Finishing Date and Finishing Time fields on a service order must be filled in before you can post the service order.';
                    ApplicationArea = All;
                }
                field(resourceSkillsOption; Rec."Resource Skills Option")
                {
                    Caption = 'Resource Skills Option';
                    ToolTip = 'Specifies how to identify resource skills in your company when you allocate resources to service items.';
                    ApplicationArea = All;
                }
                field(oneServiceItemLineOrder; Rec."One Service Item Line/Order")
                {
                    Caption = 'One Service Item Line/Order';
                    ToolTip = 'Specifies that you can enter only one service item line for each service order.';
                    ApplicationArea = All;
                }
                field(unitOfMeasureMandatory; Rec."Unit of Measure Mandatory")
                {
                    Caption = 'Unit of Measure Mandatory';
                    ToolTip = 'Specifies if you must select a unit of measure for all operations that deal with service items.';
                    ApplicationArea = All;
                }
                field(faultReasonCodeMandatory; Rec."Fault Reason Code Mandatory")
                {
                    Caption = 'Fault Reason Code Mandatory';
                    ToolTip = 'Specifies that the Fault Reason Code field must be filled in before you can post the service order.';
                    ApplicationArea = All;
                }
                field(contractServOrdMaxDays; Rec."Contract Serv. Ord.  Max. Days")
                {
                    Caption = 'Contract Serv. Ord.  Max. Days';
                    ToolTip = 'Specifies the maximum number of days you can use as the date range each time you run the Create Contract Service Orders batch job.';
                    ApplicationArea = All;
                }
                field(lastContractServiceDate; Rec."Last Contract Service Date")
                {
                    Caption = 'Last Contract Service Date';
                    ToolTip = 'Specifies the Last Contract Service Date.';
                    ApplicationArea = All;
                }
                field(workTypeCodeMandatory; Rec."Work Type Code Mandatory")
                {
                    Caption = 'Work Type Code Mandatory';
                    ToolTip = 'Specifies that the Work Type Code field with type Resource must be filled in before you can post the service order.';
                    ApplicationArea = All;
                }
                field(logoPositionOnDocuments; Rec."Logo Position on Documents")
                {
                    Caption = 'Logo Position on Documents';
                    ToolTip = 'Specifies the position of your company logo on your business letters and documents, such as service invoices and service shipments.';
                    ApplicationArea = All;
                }
                field(useContractCancelReason; Rec."Use Contract Cancel Reason")
                {
                    Caption = 'Use Contract Cancel Reason';
                    ToolTip = 'Specifies that a reason code is entered when you cancel a service contract.';
                    ApplicationArea = All;
                }
                field(defaultResponseTimeHours; Rec."Default Response Time (Hours)")
                {
                    Caption = 'Default Response Time (Hours)';
                    ToolTip = 'Specifies the default response time, in hours, required to start service, either on a service order or on a service item line.';
                    ApplicationArea = All;
                }
                field(extDocNoMandatory; Rec."Ext. Doc. No. Mandatory")
                {
                    Caption = 'Ext. Doc. No. Mandatory';
                    ToolTip = 'Specifies if it is mandatory to enter an external document number in the External Document No. field on a service header.';
                    ApplicationArea = All;
                }
                field(defaultWarrantyDuration; Rec."Default Warranty Duration")
                {
                    Caption = 'Default Warranty Duration';
                    ToolTip = 'Specifies the default duration for warranty discounts on service items.';
                    ApplicationArea = All;
                }
                field(serviceInvoiceNos; Rec."Service Invoice Nos.")
                {
                    Caption = 'Service Invoice Nos.';
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to service invoices. To see the number series that have been set up in the No. Series table, click the field.';
                    ApplicationArea = All;
                }
                field(contractInvoiceNos; Rec."Contract Invoice Nos.")
                {
                    Caption = 'Contract Invoice Nos.';
                    ToolTip = 'Specifies the number series code that will be used to assign numbers to invoices created for service contracts.';
                    ApplicationArea = All;
                }
                field(serviceItemNos; Rec."Service Item Nos.")
                {
                    Caption = 'Service Item Nos.';
                    ToolTip = 'Specifies the number series code that will be used to assign numbers to service items.';
                    ApplicationArea = All;
                }
                field(serviceOrderNos; Rec."Service Order Nos.")
                {
                    Caption = 'Service Order Nos.';
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to service orders. To see the number series that have been set up in the No. Series table, click the field.';
                    ApplicationArea = All;
                }
                field(serviceContractNos; Rec."Service Contract Nos.")
                {
                    Caption = 'Service Contract Nos.';
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to service contracts. To see the number series that have been set up in the No. Series table, click the field.';
                    ApplicationArea = All;
                }
                field(contractTemplateNos; Rec."Contract Template Nos.")
                {
                    Caption = 'Contract Template Nos.';
                    ToolTip = 'Specifies the number series code that will be used to assign numbers to contract templates.';
                    ApplicationArea = All;
                }
                field(troubleshootingNos; Rec."Troubleshooting Nos.")
                {
                    Caption = 'Troubleshooting Nos.';
                    ToolTip = 'Specifies the number series code that will be used to assign numbers to troubleshooting guidelines.';
                    ApplicationArea = All;
                }
                field(prepaidPostingDocumentNos; Rec."Prepaid Posting Document Nos.")
                {
                    Caption = 'Prepaid Posting Document Nos.';
                    ToolTip = 'Specifies the number series code that will be used to assign a document number to the journal lines.';
                    ApplicationArea = All;
                }
                field(loanerNos; Rec."Loaner Nos.")
                {
                    Caption = 'Loaner Nos.';
                    ToolTip = 'Specifies the number series code that will be used to assign numbers to loaners.';
                    ApplicationArea = All;
                }
                field(servJobResponsibilityCode; Rec."Serv. Job Responsibility Code")
                {
                    Caption = 'Serv. Job Responsibility Code';
                    ToolTip = 'Specifies the code for job responsibilities that is set up for service management work. When you assign customers to service orders, the program selects the contact with this job responsibility from among the contacts assigned to the customer.';
                    ApplicationArea = All;
                }
                field(contractValueCalcMethod; Rec."Contract Value Calc. Method")
                {
                    Caption = 'Contract Value Calc. Method';
                    ToolTip = 'Specifies the method to use for calculating the default contract value of service items when they are created. None: A default value is not calculated. Based on Unit Price: Value = Sales Unit Price x Contract Value % divided by 100. Based on Unit Cost: Value = Sales Unit Cost x Contract Value % divided by 100.';
                    ApplicationArea = All;
                }
                field(contractValuePct; Rec."Contract Value %")
                {
                    Caption = 'Contract Value %';
                    ToolTip = 'Specifies the percentage used to calculate the default contract value of a service item when it is created.';
                    ApplicationArea = All;
                }
                field(serviceQuoteNos; Rec."Service Quote Nos.")
                {
                    Caption = 'Service Quote Nos.';
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to service quotes. To see the number series that have been set up in the No. Series table, click the field.';
                    ApplicationArea = All;
                }
                field(postedServiceInvoiceNos; Rec."Posted Service Invoice Nos.")
                {
                    Caption = 'Posted Service Invoice Nos.';
                    ToolTip = 'Specifies the number series code that will be used to assign numbers to service invoices when they are posted.';
                    ApplicationArea = All;
                }
                field(postedServCreditMemoNos; Rec."Posted Serv. Credit Memo Nos.")
                {
                    Caption = 'Posted Serv. Credit Memo Nos.';
                    ToolTip = 'Specifies the number series code that will be used to assign numbers to service credit memos when they are posted.';
                    ApplicationArea = All;
                }
                field(postedServiceShipmentNos; Rec."Posted Service Shipment Nos.")
                {
                    Caption = 'Posted Service Shipment Nos.';
                    ToolTip = 'Specifies the number series code that will be used to assign numbers to shipments when they are posted.';
                    ApplicationArea = All;
                }
                field(shipmentOnInvoice; Rec."Shipment on Invoice")
                {
                    Caption = 'Shipment on Invoice';
                    ToolTip = 'Specifies that if you post a manually created invoice, a posted shipment will be created in addition to a posted invoice.';
                    ApplicationArea = All;
                }
                field(skipManualReservation; Rec."Skip Manual Reservation")
                {
                    Caption = 'Skip Manual Reservation';
                    ToolTip = 'Specifies that the reservation confirmation message is not shown on service lines. This is useful to avoid noise when you are processing many lines.';
                    ApplicationArea = All;
                }
                field(copyCommentsOrderToInvoice; Rec."Copy Comments Order to Invoice")
                {
                    Caption = 'Copy Comments Order to Invoice';
                    ToolTip = 'Specifies whether to copy comments from service orders to service invoices.';
                    ApplicationArea = All;
                }
                field(copyCommentsOrderToShpt; Rec."Copy Comments Order to Shpt.")
                {
                    Caption = 'Copy Comments Order to Shpt.';
                    ToolTip = 'Specifies whether to copy comments from service orders to shipments.';
                    ApplicationArea = All;
                }
                field(serviceCreditMemoNos; Rec."Service Credit Memo Nos.")
                {
                    Caption = 'Service Credit Memo Nos.';
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to service credit memos. To see the number series that have been set up in the No. Series table, click the field.';
                    ApplicationArea = All;
                }
                field(allowMultiplePostingGroups; Rec."Allow Multiple Posting Groups")
                {
                    Caption = 'Allow Multiple Posting Groups';
                    ToolTip = 'Specifies if multiple posting groups can be used for the same customer in sales documents.';
                    ApplicationArea = All;
                }
                field(checkMultiplePostingGroups; Rec."Check Multiple Posting Groups")
                {
                    Caption = 'Check Multiple Posting Groups';
                    ToolTip = 'Specifies implementation method of checking which posting groups can be used for the customer.';
                    ApplicationArea = All;
                }
                field(archiveQuotes; Rec."Archive Quotes")
                {
                    Caption = 'Archive Quotes';
                    ToolTip = 'Specifies if you want to automatically archive service quotes when: deleted, processed or printed.';
                    ApplicationArea = All;
                }
                field(archiveOrders; Rec."Archive Orders")
                {
                    Caption = 'Archive Orders';
                    ToolTip = 'Specifies if you want to automatically archive service orders when: deleted, posted or printed.';
                    ApplicationArea = All;
                }
                field(delFiledContWMainCont; Rec."Del. Filed Cont. w. main Cont.")
                {
                    Caption = 'Delete Filed Contracts with related main Contract';
                    ToolTip = 'Specifies whether to automatically delete all Filed Contracts when related main Contract / Contract Quote is deleted.';
                    ApplicationArea = All;
                }
                field(servInvTemplateName; Rec."Serv. Inv. Template Name")
                {
                    Caption = 'Serv. Invoice Template Name';
                    ToolTip = 'Specifies the name of the journal template to use for posting service invoices.';
                    ApplicationArea = All;
                }
                field(servContrInvTemplName; Rec."Serv. Contr. Inv. Templ. Name")
                {
                    Caption = 'Serv. Contract Invoice Template Name';
                    ToolTip = 'Specifies the name of the journal template to use for posting service contract invoices.';
                    ApplicationArea = All;
                }
                field(servContrCrMTemplName; Rec."Serv. Contr. Cr.M. Templ. Name")
                {
                    Caption = 'Serv. Contract Cr. Memo Template Name';
                    ToolTip = 'Specifies the name of the journal template to use for posting service contract credit memos.';
                    ApplicationArea = All;
                }
                field(servCrMemoTemplName; Rec."Serv. Cr. Memo Templ. Name")
                {
                    Caption = 'Serv. Cr. Memo Template Name';
                    ToolTip = 'Specifies which general journal template to use for service credit memos.';
                    ApplicationArea = All;
                }
                field(copyLineDescrToGLEntry; Rec."Copy Line Descr. to G/L Entry")
                {
                    Caption = 'Copy Line Descr. to G/L Entry';
                    ToolTip = 'Specifies that the description on document lines of type G/L Account will be carried to the resulting general ledger entries.';
                    ApplicationArea = All;
                }
                field(copyTimeSheetToOrder; Rec."Copy Time Sheet to Order")
                {
                    Caption = 'Copy Time Sheet to Order';
                    ToolTip = 'Specifies if approved time sheet lines are copied to the related service order. Select this field to make sure that time usage registered on approved time sheet lines is posted with the related service order.';
                    ApplicationArea = All;
                }
                field(baseCalendarCode; Rec."Base Calendar Code")
                {
                    Caption = 'Base Calendar Code';
                    ToolTip = 'Specifies a customizable calendar for service planning that holds the service department''s working days and holidays. Choose the field to select another base calendars or to set up a customized calendar for your service department.';
                    ApplicationArea = All;
                }
                field(contractCreditMemoNos; Rec."Contract Credit Memo Nos.")
                {
                    Caption = 'Contract Credit Memo Nos.';
                    ToolTip = 'Specifies the number series code that will be used to assign numbers to credit memos for service contracts.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
