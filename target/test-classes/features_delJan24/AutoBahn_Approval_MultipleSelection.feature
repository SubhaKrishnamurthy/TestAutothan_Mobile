# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate User, I want to approve the transaction by selecting multiple entries in the Approval screen
# ===============================================================================================================================

@MultipleApproval @Regression @RegressionDebug1
Feature: Corporate Banking Approving/Rejecting multiple transaction entries in the Approval screen

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page
  @RegressionJan22IOS1
  Scenario Outline: Validation of approving multiple transaction entries in the Approval screen
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option after noting down the "<Source>" Account balance details
    And Create a "UBP" transaction with the "<Source>" account that fall under approval Hierarchy
    And Create a "PESONET" transaction with the "<Source>" account that fall under approval Hierarchy
    And Create a "BillsPay" payment with the "<Source>" account that fall under approval Hierarchy
    And I logout and login with "<Approver_user>" and "<Approver_pwd>" details and approve the above transaction entries
    And I logout and login with "<Approver_user_2>" and "<Approver_pwd_2>" details and approve the above transaction entries
    Then Transaction should be successfully posted and account balance should be debited correctly
    Examples:

      | Maker_user                      | Maker_pwd                       | organization                           | Source                            | Approver_user                      | Approver_pwd                       | Approver_user_2                        | Approver_pwd_2                         |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationPHPSourceAccount | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two |
  @RegressionJan22IOS1
  Scenario Outline: Validation of Rejecting multiple transaction entries in the Approval screen
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option after noting down the "<Source>" Account balance details
    And Create a "UBP" transaction with the "<Source>" account that fall under approval Hierarchy
    And Create a "PESONET" transaction with the "<Source>" account that fall under approval Hierarchy
    And Create a "BillsPay" payment with the "<Source>" account that fall under approval Hierarchy
    And I logout and login with "<Approver_user>" and "<Approver_pwd>" details and approve the above transaction entries
    And I logout and login with "<Approver_user_2>" and "<Approver_pwd_2>" details and reject the above transaction entries
    Then Transaction should be rejected and account balance should not be debited
    Examples:

      | Maker_user                      | Maker_pwd                       | organization                           | Source                            | Approver_user                      | Approver_pwd                       | Approver_user_2                        | Approver_pwd_2                         |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationPHPSourceAccount | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two |
  @Pass
  Scenario: Verify user is able to see tutorial after clicking on Help button and User can be able to skip the tutorial in Settings Tab
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "APPROVALS" menu option
    Then Verify Skip Tutorial Functionality