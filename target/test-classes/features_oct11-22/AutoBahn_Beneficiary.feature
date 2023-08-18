# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate User, I want to perform the beneficiary scenario - Add, Edit & Delete in the Autobahn Application
# ===============================================================================================================================

@Beneficiary @Regression @release7 @Sept30FundTransfer
Feature: Corporate Banking Beneficiary Scenario

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page


  Scenario: Validation of Adding a beneficiary scenario with source account for own union bank account
    Given I'm on Autobahn Corporate user login page with the "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on Manage Beneficiaries and Choose "UnionBank Accounts" channel
    And Enter the beneficiary details with "SourceAccount" & "Union_Beneficiary"
    And click save button
    Then Beneficiary should be added successfully


  Scenario: Validation of Adding a beneficiary scenario with source account for PESONet transaction
    Given I'm on Autobahn Corporate user login page with the "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on Manage Beneficiaries and Choose "PESONet" channel
    And Enter the beneficiary details with "SourceAccount" & "PESONet_Beneficiary"
    And click save button
    Then Beneficiary should be added successfully

  Scenario: Validation of Adding a beneficiary scenario with source account for PDDTS transaction
    Given I'm on Autobahn Corporate user login page with the "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on Manage Beneficiaries and Choose "PDDTS" channel
    And Enter the beneficiary details with "SourceAccount" & "PDDTS_Beneficiary"
    And click save button
    Then Beneficiary should be added successfully


  Scenario: Validation of Adding a beneficiary scenario with source account for SWIFT transaction
    Given I'm on Autobahn Corporate user login page with the "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on Manage Beneficiaries and Choose "SWIFT" channel
    And Enter the beneficiary details with "USD_SourceAccount" & "SWIFT_Beneficiary"
    And click save button
    Then Beneficiary should be added successfully


  Scenario: Validation of Adding a beneficiary scenario with source account for InstaPay transaction
    Given I'm on Autobahn Corporate user login page with the "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on Manage Beneficiaries and Choose "instaPay" channel
    And Enter the beneficiary details with "SourceAccount" & "instaPay_Beneficiary"
    And click save button
    Then Beneficiary should be added successfully


  Scenario Outline: Validation of Editing a beneficiary scenario with source account for different transaction channel
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>" details
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on Manage Beneficiaries and Choose a beneficiary "<channel>"
    And Edit the beneficiary details
    And click save button
    Then Beneficiary should be updated successfully

    Examples:
      | Maker_user     | Maker_pwd      | organization          | channel  |
      | Maker_username | Maker_password | Approval_Organization | Union    |
      | Maker_username | Maker_password | Approval_Organization | PESONet  |
      | Maker_username | Maker_password | Approval_Organization | PDDTS    |
      | Maker_username | Maker_password | Approval_Organization | SWIFT    |
      | Maker_username | Maker_password | Approval_Organization | instaPay |


  Scenario Outline: Validation of Deleting a beneficiary scenario with source account for different transaction channel
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>" details
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on Manage Beneficiaries and Choose a beneficiary "<channel>"
    And Delete the beneficiary details
    Then Beneficiary should be deleted from the manage beneficiaries list

    Examples:
      | Maker_user     | Maker_pwd      | organization          | channel  |
      | Maker_username | Maker_password | Approval_Organization | Union    |
      | Maker_username | Maker_password | Approval_Organization | PESONet  |
      | Maker_username | Maker_password | Approval_Organization | PDDTS    |
      | Maker_username | Maker_password | Approval_Organization | SWIFT    |
      | Maker_username | Maker_password | Approval_Organization | instaPay |


  Scenario Outline: Validation of Adding a beneficiary scenario with source account for different channels without bene code
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>" details
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on Manage Beneficiaries and create beneficiary for "<channel>" with benecode as blank
    And click save button
    Then Beneficiary should be added successfully without benecode

    Examples:
      | Maker_user     | Maker_pwd      | organization          | channel  |
      | Maker_username | Maker_password | Approval_Organization | Union    |
      | Maker_username | Maker_password | Approval_Organization | PESONet  |
      | Maker_username | Maker_password | Approval_Organization | PDDTS    |
      | Maker_username | Maker_password | Approval_Organization | SWIFT    |
      | Maker_username | Maker_password | Approval_Organization | instaPay |
