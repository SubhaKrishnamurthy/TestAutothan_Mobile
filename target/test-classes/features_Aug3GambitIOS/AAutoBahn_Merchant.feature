# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate user, I want to perform the settings operation in the Autobahn Application
# ===============================================================================================================================

@PaymentTransfer  @release7
Feature: Corporate Banking Merchant Creation and Payments

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page

  @PaymentTransferJul28Pass
  Scenario: Validation of Generate Payment Link- Total Amount field
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Verify Total Amount Field

  @PaymentTransferJul28Pass
  Scenario: Validation of Generate Payment Link- "Payment for" field
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Verify PaymentFor Field

  @PaymentTransferJul28Pass
  Scenario: Validate the "Notify the Recipient"
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Verify Notes Field

  @PaymentTransferJul28Pass
  Scenario: Validation of Generate Payment Link- Payment Link Expiry
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Verify Payment Link Expiry Field

  @PaymentTransferJul28Pass
  Scenario: Validate the "Notify the Recipient" field
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Verify Notify the Recipient Field

  @PaymentTransferJul28Pass
  Scenario: Validate Cancel button on Requent Payment screen
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "135.00","AutoTestPaymentFor","AutoTestNote","2 days","98765465768",""
    Then Validate whether user is able to cancel Or Navigate from the Request payment form "Cancel"



  @PaymentTransferJul28Pass
  Scenario: Validate Generate Unique link button And Back icon at PageTop
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "125.00","AutoTestPaymentForBack","AutoTestNoteBackButton","2 days","98765465768",""
    Then Validate whether user is able to cancel Or Navigate from the Request payment form "NavigateBack"
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "145.00","AutoTestPaymentForGenerateUnique","AutoTestNoteBackButtonGenerateUnique","2 days","98765465768","generateuniquelink"


  ##Scenario: Validate Archieve status link screen
   ## Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
   ## Then Verify Request Payment Button on Home Page DashBoard
  ##  When I click on "TRANSACT" menu option
   ## And Click on "Request Payment" option
  ##  And Click on Request Payment on Payments Link Screen
  ##  Then Enter Payment Entry Page Details "145.00","AutoTestPaymentForGenerateUnique","AutoTestNoteBackButtonGenerateUnique","2 days","98765465768","generateuniquelink"
   ## Then Navigate Back From Page "linkdetails"
   ## Then Search for the Generated payment Link
   ## And Change status to Archive

  @PaymentTransferJul28Pass
  Scenario: Validation of Contact Information - Email,Full Name,Mobile Number,Terms and Condition Checkbox
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "155.00","AutoTestPaymentPayment","AutoTestNotePayment","2 days","98763265768","generateuniquelink"
    Then Validation of Email Id Field
    And Validation of Full Name field
    And Validation of Mobile Number field
    And Verify Terms and Conditions && Store Information for feature check box

  @PaymentTransferJul28Pass
  Scenario: Verify whether the customer is not able to proceed payment using the expired link
    Then verify error message when customer perform payment for expired link "https://ubotpsentry-tst1.outsystemsenterprise.com/msmegateway/test12345/012207906190506"

  @PaymentTransferJul28Pass
  Scenario: Checkout using Unionbank Online Payment for Payment link generated by Android
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "167.00","AutoTestPaymentPaymentUnionBank","AutoTestNotePayment","2 days","95763265768","generateuniquelink"
    Then Perform payment via UnionBank "AutoSME","PHP 167.00","AutoTestPaymentPaymentUnionBank"
  @PaymentTransferAug1Pass
  Scenario: Verify Paid Status Link screen after Checkout using Unionbank Online Payment for Payment link generated && Verify Archieved button is Not available for the link in Paid status.
    #Verify the payment details of paid transaction in Enhanced payment page
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "167.00","AutoTestPaymentPaymentUnionBank","AutoTestNotePayment","3 days","95763265768","generateuniquelink"
    Then Perform payment via UnionBank Functionality "AutoSME","PHP 167.00","AutoTestPaymentPaymentUnionBank"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoTestPaymentPaymentUnionBank","AutoTestNotePayment","PAID"
    Then verify Archive Button should not display for Paid link
    Then verify Payment Enhanced Screen Details "php 167.00","php 166.00","- 1.00","","TestAuto","TestUser@gmail.com","9485768594","PAID","PHP 167.00","AutoTestPaymentPaymentUnionBank","AutoTestNotePayment"

  @PaymentTransferJul28Pass
  Scenario: Validate Stay or Leave popup PopUp displayed
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "167.00","AutoTestPaymentPaymentUnionBank","AutoTestNotePayment","3 days","95763265768","generateuniquelink"
    Then Validate Stay or Leave popup PopUp displayed when refresh page

  @PaymentTransferAug1Pass
  Scenario: Payment Link Status Validation of payment link- Already paid
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "170.00","AutoTestPaymentPaymentUnionBank","AutoTestNotePayment","3 days","95763265768","generateuniquelink"
    Then Perform payment via UnionBank Functionality "AutoSME","PHP 170.00","AutoTestPaymentPaymentUnionBank"
    Then verify error message when customer perform payment for already paid link

  @PaymentTransferJul28Pass
  Scenario: Verify Unpaid status link screen && Archieve status link screen && user is able to Mark as Unpaid for the payment link in Archived status.
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "170.00","AutoTestPaymentUnpaidStatus","AutoTestNotePaymentUnPaidStatus","3 days","95763265768","generateuniquelink"
    Then Verify Payment Details BeforePay "AutoTestPaymentUnpaidStatus","170.00","AutoTestNotePaymentUnPaidStatus"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Archive the payment
    Then Search for Reference Number "false"
    Then Verify Payment Details "AutoTestPaymentUnpaidStatus","AutoTestNotePaymentUnPaidStatus","Archived"
    Then Update payhment from archive to unpaid
    Then Search for Reference Number "false"
    Then Verify Payment Details BeforePay "AutoTestPaymentUnpaidStatus","170.00","AutoTestNotePaymentUnPaidStatus"

  @PaymentTransferJul28Pass
  Scenario: Payment Link status && Validation of payment link- Archived
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "170.00","AutoTestPaymentUnpaidStatus","AutoTestNotePaymentUnPaidStatus","3 days","95763265768","generateuniquelink"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Archive the payment
    Then verify error message when customer perform payment for archived link

  @PaymentTransferJul28Pass
  Scenario: Verify Validation of payment link- invalid && check whether invalid link is shown when user change the store name in Payment link and change the reference no in Payment link
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "170.00","AutoTestPaymentUnpaidStatus","AutoTestNotePaymentUnPaidStatus","3 days","95763265768","generateuniquelink"
    Then Enter invalid Reference number url
    Then verify error message when customer perform payment for invalid link
    Then Enter invalid merchant url "test12345"
    Then verify error message when customer perform payment for invalid link
  @PaymentTransferJul28
  Scenario: Verify whether Non Approver don’t have access to setup onboarding screen
    Given I'm on Autobahn Corporate user login page with "FeatureUnavailable_UserName","FeatureUnavailable_Password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Verify Non approver don't have access to create merchant
  @PaymentTransferJul28Pass
  Scenario: Verify Paid Status Link screen after Checkout using instaPay Online Payment for Payment link generated && Verify Archieved button is Not available for the link in Paid status.
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "169.00","AutoTestPaymentPaymentInstaPay","AutoTestNotePayment","2 days","9123456789","generateuniquelink"
    Then Perform payment via InstaPay "AutoSME","PHP 169.00","AutoTestPaymentPaymentInstaPay"

  @PaymentTransferAug1Pass
  Scenario: Checkout using Unionbank Online Payment for Payment link generated by Android or IOS Via Generic Payment
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Perform payment via UnionBank Generic "AutoSME","159.00","AutoTestPaymentPaymentUnionBank","AutoRemarks"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    #Then Navigate Back From Page "linkdetails"
    Then Search for Payment Record with Remarks "AutoRemarks"
    Then Verify Payment Details GenericPayment "","","PAID"

  @PaymentTransferJul28Pass
  Scenario: Validation of Contact Information Generic - Email
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "156.00","AutoTestPaymentPaymentGeneric","AutoTestNotePaymentGeneric","2 days","98763265768","generateuniquelink"
    Then Validation of Email Id Field Generic

  Scenario: Validation of Contact Information - Full Name
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "157.00","AutoTestPaymentPayment","AutoTestNotePayment","2 days","98763265768","generateuniquelink"
    And Validation of Full Name field Generic
  @PaymentTransferJul28Pass
  Scenario: Validation of Contact Information - Mobile Number
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "155.00","AutoTestPaymentPayment","AutoTestNotePayment","2 days","98763265768","generateuniquelink"
    And Validation of Mobile Number field Generic
  @PaymentTransferJul28Pass
  Scenario: Generic Link - Validation of Contact Information -  Remarks
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "157.00","AutoTestPaymentPayment","AutoTestNotePayment","2 days","98763265768","generateuniquelink"
    And Validation of Remarks field Generic
  @PaymentTransferJul28Pass
  Scenario: Generic Link - Validation of Contact Information -  Terms and Condition Checkbox
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "157.00","AutoTestPaymentPayment","AutoTestNotePayment","2 days","98763265768","generateuniquelink"
    And Verify Terms and Conditions && Store Information for feature check box Generic
  @PaymentTransferAug1Pass
  Scenario: Checkout using GrabPay Online Payment for Payment link generated by Android And IOS
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "167.00","AutoTestPaymentGrabPay","AutoTestNotePayment","3 days","95763265768","generateuniquelink"
    Then Perform payment via GrabPay "AutoSME","167.00","AutoTestPaymentGrabPay"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoTestPaymentGrabPay","AutoTestNotePayment","PAID"


  @PaymentTransferAug1Pass
  Scenario: Checkout using GCash Online Payment for Payment link generated by Android And IOS
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "157.00","AutoTestPaymentGCash","AutoTestNotePaymentGcash","3 days","95763265768","generateuniquelink"
    Then Perform payment via GCash "AutoSME","157.00","AutoTestPaymentGCash"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoTestPaymentGCash","AutoTestNotePaymentGcash","PAID"
  @PaymentTransferAug1Pass
  Scenario: Checkout using GrabPay Online Payment for Payment link generated by Android or IOS Via Generic Payment
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then perform payment via GrabPay Generic "AutoSME","159.00","AutoTestPaymentGrabPay","AutoRemarksGpay"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    #Then Navigate Back From Page "linkdetails"
    Then Search for Payment Record with Remarks "AutoRemarks"
    Then Verify Payment Details GenericPayment "","","PAID"
  @PaymentTransferAug1Pass
  Scenario: Checkout using GCash Online Payment for Payment link generated by Android or IOS Via Generic Payment
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then perform payment via GCash Generic "AutoSME","160.00","AutoTestPaymentGcash","AutoRemarksGCash"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    #Then Navigate Back From Page "linkdetails"
    Then Search for Payment Record with Remarks "AutoRemarks"
    Then Verify Payment Details GenericPayment "","","PAID"
  @PaymentTransferJul28Pass
  Scenario: Unique Link payment using Credit Debit Payment Method for Visa
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "147.00","AutoTestPaymentCreditPayment","AutoTestNotePaymentCreditPay","3 days","95763261268","generateuniquelink"
    Then Perform payment via CreditDebit "AutoSME","147.00","AutoTestPaymentCreditPayment","4456530000001096","Test VisaCard","10","24","123"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoTestPaymentCreditPayment","AutoTestNotePaymentCreditPay","PAID"

  @PaymentTransferJul28Pass
  Scenario: Unique Link payment using Credit Debit Payment Method for Master
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "137.00","AutoTestPaymentCreditPaymentMaster","AutoTestNotePaymentCreditPayMaster","3 days","95763261268","generateuniquelink"
    Then Perform payment via CreditDebit "AutoSME","137.00","AutoTestPaymentCreditPaymentMaster","5200000000001096","Test VisaCard","12","24","123"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoTestPaymentCreditPaymentMaster","AutoTestNotePaymentCreditPayMaster","PAID"

  @PaymentTransferAugPass
  Scenario: Generic Link payment using Credit Debit Payment Method for Visa
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Perform payment via DebitCredit Generic "AutoSME","159.00","AutoTestPaymentPaymentUnionBank","AutoRemarks","4456530000001096","TestGeneric VisaCard","12","24","123"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Search for Payment Record with Remarks "AutoRemarks"
    Then Verify Payment Details GenericPayment "","","PAID"
  @PaymentTransferJul28Pass
  Scenario: Generic Link payment using Credit Debit Payment Method for Master
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Perform payment via DebitCredit Generic "AutoSME","159.00","AutoTestPaymentPaymentUnionBank","AutoRemarks","5200000000001096","TestGeneric MasterCard","09","25","123"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Search for Payment Record with Remarks "AutoRemarks"
    Then Verify Payment Details GenericPayment "","","PAID"
  @PaymentTransferJul28Pass
  Scenario: Generic Link payment using OTC eCash
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "130.00","AutoPaymentOTCeCash","AutoTestNotePaymentOTCeCash","3 days","95763261268","generateuniquelink"
    Then Perform payment via OTC "AutoSME","130.00","AutoPaymentOTCeCash","ecpay","AutoTestUserOTCecPay","MobileTestApprover1+04@gmail.com","9123456798"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoPaymentOTCeCash","AutoTestNotePaymentOTCeCash","PENDING"
  @PaymentTransferJul28Pass
  Scenario: Generic Link payment using OTC palawan
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "130.00","AutoPaymentOTCeCash","AutoTestNotePaymentOTCeCash","3 days","95763261268","generateuniquelink"
    Then Perform payment via OTC "AutoSME","130.00","AutoPaymentOTCeCash","palawan","AutoTestUserOTCecPay","MobileTestApprover1+04@gmail.com","9123456798"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoPaymentOTCeCash","AutoTestNotePaymentOTCeCash","PENDING"
  @PaymentTransferJul28Pass
  Scenario: Generic Link payment using OTC Cebuana
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "130.00","AutoPaymentOTCeCash","AutoTestNotePaymentOTCeCash","3 days","95763261268","generateuniquelink"
    Then Perform payment via OTC "AutoSME","130.00","AutoPaymentOTCeCash","cebuana","AutoTestUserOTCecPay","MobileTestApprover1+04@gmail.com","9123456798"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoPaymentOTCeCash","AutoTestNotePaymentOTCeCash","PENDING"
  @PaymentTransferJul28
  Scenario: Generic Link payment using OTC robinsons
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "130.00","AutoPaymentOTCrobinsons","AutoTestNotePaymentOTCrobinsons","3 days","95763261268","generateuniquelink"
    Then Perform payment via OTC "AutoSME","130.00","AutoPaymentOTCrobinsons","robinsons","AutoTestUserOTCrobinsons","MobileTestApprover1+04@gmail.com","9123456798"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoPaymentOTCrobinsons","AutoTestNotePaymentOTCrobinsons","PENDING"
  @PaymentTransferJul28
  Scenario: Generic Link payment using OTC SM
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "130.00","AutoPaymentOTCsm","AutoTestNotePaymentOTCsm","3 days","95763261268","generateuniquelink"
    Then Perform payment via OTC "AutoSME","130.00","AutoPaymentOTCsm","sm","AutoTestUserOTCsm","MobileTestApprover1+04@gmail.com","9123456798"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoPaymentOTCsm","AutoTestNotePaymentOTCsm","PENDING"
  @PaymentTransferJul2821
  Scenario: Validation for "Nature of Business" field
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Verify Nature of Business field

  @PaymentTransferJul28
  Scenario: Validation for "Product of Service Offred" Field
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Verify Product of service offered field

