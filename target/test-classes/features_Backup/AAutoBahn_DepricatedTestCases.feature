# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate user, I want to perform the settings operation in the Autobahn Application
# ===============================================================================================================================

 @release7
Feature: Corporate Banking Merchant Creation and Payments

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page

  @demoSME1
  Scenario: Validation of Activate Request Payment - "Unique Business name" field
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Verify Page title should display as "Set-up Checkout Page"
    And Verify Default text on Unique Business Name field "abcandleco"
    Then Verify Unique Business Name field Description should display as "Personalize your payment link by nominating a unique handle for your business."
    And Verify Unique Business Name Field should Accept "50" characters "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnop"
    And Verify Unique Business Name Field should not Accept more then "50" characters "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnop"

  @demoSME2
  Scenario: Validation of Union Bank Account Merchant Creation Page "Website Or Social Media Page" field GUI Validation
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Request Payment" option
    Then Verify Default text on Website Or Social Media Page field "facebook.com/abcandleco"
    ##Then Verify Website Or Social Media Page field Description should display as "For multiple URLs, separate them with a comma \",\""
    And Verify Website Or Social Media Page Field should Accept "1000" characters "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefgh"
    And Verify Website Or Social Media Page Field should not Accept more then "1000" characters "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopabcdefghijklmnopqrstuvwxyzabcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnop"

  @demoSME3
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

  @demoSME12345
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

  @demoSME1234
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

