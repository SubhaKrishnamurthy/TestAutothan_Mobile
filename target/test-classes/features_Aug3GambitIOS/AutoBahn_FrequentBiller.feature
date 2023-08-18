# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate user, I want to perform the BillPayment in the Autobahn Application
# ===============================================================================================================================

@FrequentBiller @Regression
Feature: Corporate Banking Frequent Biller

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page

  @Accounts25
  Scenario Outline: Validation of Creation of Frequent biller with biller as Aboitizland Locators
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Manage Frequent Billers" pay bill option
    And Create a frequent biller with details as "<From>" & "<biller>"
    Then The frequent biller should be created successfully and verify the created biller in the manage frequent biller page

    Examples:
      | Maker_user     | Maker_pwd      | organization          | From          | biller               |
      | Maker_username | Maker_password | Approval_Organization | SourceAccount | paybiller_Forbestown |


  Scenario Outline: Validation of Editing the Frequent biller with biller as Aboitizland Locators
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Manage Frequent Billers" pay bill option
    And Editing the frequent biller with details as "<From>" & "<biller>"
    Then The frequent biller should be edited successfully and verify the edited biller in the manage frequent biller page

    Examples:
      | Maker_user     | Maker_pwd      | organization          | From          | biller               |
      | Maker_username | Maker_password | Approval_Organization | SourceAccount | paybiller_Forbestown |


  Scenario Outline: Validation of Deleting the Frequent biller with biller as Aboitizland Locators
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Manage Frequent Billers" pay bill option
    And Delete the frequent biller with details as "<From>" & "<biller>"
    Then The frequent biller should be deleted successfully and verify the deleted biller is not present in the manage frequent biller page

    Examples:
      | Maker_user     | Maker_pwd      | organization          | From          | biller               |
      | Maker_username | Maker_password | Approval_Organization | SourceAccount | paybiller_Forbestown |

  @Accounts25
  Scenario Outline: Validation to check whether the Biller - Meraclo cannot be created as a Frequent biller
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Manage Frequent Billers" pay bill option
    And Create a frequent biller with details as "<From>" & "<biller>" from the list
    Then "Biller Not Allowed" Modal Pop-up should be displayed
    Examples:
      | Maker_user     | Maker_pwd      | organization          | From          | biller  |
      | Maker_username | Maker_password | Approval_Organization | SourceAccount | Meralco |


#    @frequnettt only ios cancel pop up is present and andorid there is no leave pop up
#  Scenario: Validation of Cancel Transaction popup in the frequent biller
#    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
#    When I click on "TRANSACT" menu option
#    And Click on "Bills Payment" option
#    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
#    When I click on "Manage Frequent Billers" pay bill option
#    And Navigate to the Create Frequent Biller screen
#    And click back button
#    Then Cancel Create Freqent Biller Popup should be displayed
