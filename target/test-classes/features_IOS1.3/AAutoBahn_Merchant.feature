# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate User, I want to perform the Fund Transfer in the Autobahn Application
# ===============================================================================================================================

@PaymentTransfer
Feature: Request Payment Screen Merchant creation

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page


  Scenario: Validation of Activate Request Payment - "Unique Business name" field
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Verify Page title should display as "Set-up Checkout Page"
    And Verify Default text on Unique Business Name field "abcandleco"
    Then Verify Unique Business Name field Description should display as "Personalize your payment link by nominating a unique handle for your business."
    And Verify Unique Business Name Field should Accept "50" characters "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnop"
    And Verify Unique Business Name Field should not Accept more then "50" characters "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnop"


  Scenario: Validation of Union Bank Account Merchant Creation Page "Website Or Social Media Page" field GUI Validation
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Verify Default text on Website Or Social Media Page field "facebook.com/abcandleco"
   ## Then Verify Website Or Social Media Page field Description should display as "For multiple URLs, separate them with a comma \",\""
    And Verify Website Or Social Media Page Field should Accept "1000" characters "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefgh"
    And Verify Website Or Social Media Page Field should not Accept more then "1000" characters "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnop"


  Scenario: Validation of Union Bank Account Merchant Creation Page "Products Or Service Offered" field GUI Validation
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    When Click on Cancel button
    Then User should navigate back to "Transact" menu Page
    And Click on "Request Payment" option
    Then Verify Default text on Products Or Service Offered field "product 1, product 2, product 3"
    Then Verify Products Or Service Offered field Description should display as "What products or services are you offering and what kind of customers are you targeting?"
    And Verify Products Or Service Offered Field should Accept "1000" characters "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefgh"
    And Verify Products Or Service Offered Field should not Accept more then "1000" characters "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnop"


  Scenario: Activate Request Payment -  Nominate settlement account
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Verify default text on Nominate settlement account display as "TAP TO SELECT ACCOUNT"
    When click on Nominate Settlement Account field
    And Check Accounts should match as per fundTransfer Accounts screen "000010055940","000590080118","000770008690","130590015426","000590080120"
    Then Verify List of settlement accounts displayed
    When click on Cross button on Nominate Settlement account list
    Then Nominate Settlement Account Popup should get close "TAP TO SELECT ACCOUNT"
    And click on Set-up Checkout Page Button


  Scenario: Activate Request Payment -  "Fees and Charges" and "Terms and conditions" link checkbox
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Verify Terms and Condition Checkbox
    And Verify Terms and Conditions && Fees and Charges Link

  @demoSME44567
  Scenario: Activate Request Payment -  "SET-UP BUSINESS LINK" button && Request Payment button/Menu
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Setup business Link


  Scenario: Validation of Generate Payment Link- Total Amount field
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Verify Total Amount Field




  Scenario: Validation of Generate Payment Link- "Payment for" field
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Verify PaymentFor Field

  @demoSME20
  Scenario: Validate the "Notify the Recipient"
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Verify Notes Field

  @demoSME
  Scenario: Validation of Generate Payment Link- Payment Link Expiry
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Verify Payment Link Expiry Field

  @demoS
  Scenario: Validate the "Notify the Recipient" field
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Verify Notify the Recipient Field

  @demoSME23
  Scenario: Validate Cancel button on Requent Payment screen
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "135.00","AutoTestPaymentFor","AutoTestNote","2 days","98765465768",""
    Then Validate whether user is able to cancel Or Navigate from the Request payment form "Cancel"



  @demoSME2345
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

  @demoSME2345inprogress
  Scenario: Validate Archieve status link screen
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "145.00","AutoTestPaymentForGenerateUnique","AutoTestNoteBackButtonGenerateUnique","2 days","98765465768","generateuniquelink"
    Then Search for the Generated payment Link
    And Change status to Archive

  @demoSME65434
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

  @demoSME85687
  Scenario: Verify whether the customer is not able to proceed payment using the expired link
    Then verify error message when customer perform payment for expired link "https://ubotpsentry-tst1.outsystemsenterprise.com/msmegateway/Neon/012133711586713"

  @Completed
  Scenario: Checkout using Unionbank Online Payment for Payment link generated by Android
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "167.00","AutoTestPaymentPaymentUnionBank","AutoTestNotePayment","3 days","95763265768","generateuniquelink"
    Then Perform payment via UnionBank "ajish check","PHP 167.00","AutoTestPaymentPaymentUnionBank"
  @demoSME85687456
  Scenario: Verify Paid Status Link screen after Checkout using Unionbank Online Payment for Payment link generated && Verify Archieved button is Not available for the link in Paid status.
    #Verify the payment details of paid transaction in Enhanced payment page
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "167.00","AutoTestPaymentPaymentUnionBank","AutoTestNotePayment","3 days","95763265768","generateuniquelink"
    Then Perform payment via UnionBank Functionality "ajish check","PHP 167.00","AutoTestPaymentPaymentUnionBank"
    Then Navigate Back From Page "linkdetails"
    Then Search for Reference Number "true"
    Then Verify Payment Details "AutoTestPaymentPaymentUnionBank","AutoTestNotePayment","PAID"
    Then verify Archive Button should not display for Paid link
    Then verify Payment Enhanced Screen Details "php 167.00","php 166.00","- 1.00","","AutoTestUser","MobileTestApprover1","04@gmail.com","PAID","PHP 167.00","AutoTestPaymentPaymentUnionBank","AutoTestNotePayment"

  @Completed
  Scenario: Validate Stay or Leave popup PopUp displayed
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "167.00","AutoTestPaymentPaymentUnionBank","AutoTestNotePayment","3 days","95763265768","generateuniquelink"
    Then Validate Stay or Leave popup PopUp displayed when refresh page

  @demoSME85687456
  Scenario: Payment Link Status Validation of payment link- Already paid
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "170.00","AutoTestPaymentPaymentUnionBank","AutoTestNotePayment","3 days","95763265768","generateuniquelink"
    Then Perform payment via UnionBank Functionality "ajish check","PHP 170.00","AutoTestPaymentPaymentUnionBank"
    Then verify error message when customer perform payment for already paid link

  @TestMerchant54
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
    Then Verify Payment Details "AutoTestPaymentUnpaidStatus","AutoTestNotePaymentUnPaidStatus","Unpaid"

  @TestPaymentMerchant29Dec
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


  Scenario: Verify Validation of payment link- invalid && check whether invalid link is shown when user change the store name in Payment link and change the reference no in Payment link
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "170.00","AutoTestPaymentUnpaidStatus","AutoTestNotePaymentUnPaidStatus","3 days","95763265768","generateuniquelink"
    Then Enter invalid Reference number url
    Then verify error message when customer perform payment for invalid link
    Then Enter invalid merchant url "Neon"
    Then verify error message when customer perform payment for invalid link

  Scenario: Verify whether Non Approver don’t have access to setup onboarding screen
    Given I'm on Autobahn Corporate user login page with "FeatureUnavailable_UserName","FeatureUnavailable_Password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Verify Non approver don't have access to create merchant

  Scenario: Verify Paid Status Link screen after Checkout using instaPay Online Payment for Payment link generated && Verify Archieved button is Not available for the link in Paid status.
    Given I'm on Autobahn Corporate user login page with "Setup_username","Setup_password" & "user_Organization"
    Then Verify Request Payment Button on Home Page DashBoard
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    And Click on Request Payment on Payments Link Screen
    Then Enter Payment Entry Page Details "169.00","AutoTestPaymentPaymentInstaPay","AutoTestNotePayment","2 days","9123456789","generateuniquelink"
    Then Perform payment via InstaPay "ajish check","PHP 169.00","AutoTestPaymentPaymentInstaPay"