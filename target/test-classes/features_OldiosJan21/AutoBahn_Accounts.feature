# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate User, I want to verify the Accounts option in the Autobahn Application
# ===============================================================================================================================

@Accounts @Regression
Feature: Corporate Banking Accounts Screen

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page

  @pass
  Scenario Outline: Validation of Account Details & Transaction History Details - PHP
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "ACCOUNTS" menu option and choose the "<account>"
    And The Accounts Details Page should be displayed
    And Click on VIEW ALL button
    Then Transaction History Details Page should be displayed

    Examples:

      | Maker_user                      | Maker_pwd                       | organization                          | account                           |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationPHPSourceAccount |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationUSDSourceAccount |
@pass
  Scenario: Verify user is able to see tutorial after clicking on Help button and User can be able to skip the tutorial in Dashboard Tab
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    Then Verify Skip Tutorial Functionality