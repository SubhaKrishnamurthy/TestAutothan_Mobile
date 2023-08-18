# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate User, I want to perform the Fund Transfer in the Autobahn Application
# ===============================================================================================================================

@FundTransfer
Feature: Corporate Banking Fund Transfer

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page


  Scenario: Validation of Union Bank Account Fund Transfer scenario with target account as own union bank account
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
 # Given I'm on Autobahn Corporate user login page with "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "UnionBank Accounts" channel
    And Enter the transfer details with "SourceAccount" & "DestinationAccount"
    And Review the transfer details with "DestinationAccount" details
    And click Submit
    Then Transaction should be successful


 # Scenario: Validation of Union Bank Account Fund Transfer scenario with selecting a beneficiary



  #Scenario: Validation of Union Bank Account Fund Transfer scenario with entering the recipient account number


  #Scenario: Validation of PESONet Pay Fund Transfer scenario by choosing beneficiary from the list


  #Scenario: Validation of PESONet Pay Fund Transfer scenario by entering beneficiary details directly

  @FundTransfer21Jul
  Scenario Outline: Validation of Fund Transfer scenario with different payment channels Approval Hierarchy Flow
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option after noting down the "<From>" Account balance details
 #   When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Enter the transfer details with "<From>","<To>" &"<transferAmount>"
    And Review the transfer details with "<To>" details for approval
    And click Submit
    Then Transaction should be successful and sent for Approval
    When I logout and login with the "<Approver_user>" and "<Approver_pwd>" details
    And I approve the above transaction details
    Then The Transaction should be successfully approved
    When I logout and login with "<Approver_user_2>" and "<Approver_pwd_2>" details
    And I approve the above transaction details
    Then The Transaction should be successfully approved
    And Verify it by logging with the "<Maker_user>" and "<Maker_pwd>" details
    Examples:
      | Maker_user                      | Maker_pwd                       | Approver_user                      | Approver_pwd                       | Approver_user_2                        | Approver_pwd_2                         | organization                           | channel            | From                              | To                         | transferAmount |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PESONet            | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails    | 120.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PESONet            | AccountValidationPHPSourceAccount | Beneficiary                | 131.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | 12DigitUnionBankAccount    | 151.01         |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | DestinationAccount         | 161.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | Beneficiary                | 171.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PDDTS              | AccountValidationUSDSourceAccount | Beneficiary                | 181.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PDDTS              | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails    | 191.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | SWIFT              | AccountValidationUSDSourceAccount | Beneficiary                | 201.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | SWIFT              | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails    | 211.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | instaPay           | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails    | 221.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | instaPay           | AccountValidationPHPSourceAccount | Beneficiary                | 221.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationUSDSourceAccount | USD12DigitUnionBankAccount | 231.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationUSDSourceAccount | USDDestinationAccount      | 241.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationUSDSourceAccount | USDBeneficiary             | 251.01         |


#need to add PDDTS and SWIFT into approval hierarchy


  Scenario Outline: Validation of PDDTS Fund Transfer scenario by choosing beneficiary from the list and Entering beneficiary details
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "PDDTS" channel
    And Enter the transfer details with "<From>" & "<To>"
    And Review the transfer details with "<To>" details
    And click Submit
    Then Transaction should be successful
    Examples:

      | Maker_user     | Maker_pwd      | organization          | From                | To                      |
      | Maker_username | Maker_password | Approval_Organization | PDDTS_SourceAccount | Beneficiary             |
      | Maker_username | Maker_password | Approval_Organization | PDDTS_SourceAccount | EnterBeneficiaryDetails |



  Scenario Outline: Validation of SWIFT Fund Transfer scenario by choosing beneficiary from the list and Entering beneficiary details
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "SWIFT" channel
    And Enter the transfer details with "<From>" & "<To>"
    And Review the transfer details with "<To>" details
    And click Submit
    Then Transaction should be successful
    Examples:

      | Maker_user     | Maker_pwd      | organization          | From                | To                      |
      | Maker_username | Maker_password | Approval_Organization | SWIFT_SourceAccount | Beneficiary             |
      | Maker_username | Maker_password | Approval_Organization | SWIFT_SourceAccount | EnterBeneficiaryDetails |


  Scenario Outline: Validation of Transaction Not allowed scenario for Fund Transfer flow
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Enter the transfer details with "<From>","<To>" &"<transferAmount>"
    And click Submit button
    Then Transaction should be unsuccessful by displaying an pop up error message

    Examples:
      | Maker_user                      | Maker_pwd                       | organization                           | channel            | From                              | To                      | transferAmount |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | 12DigitUnionBankAccount | 11011.01       |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | DestinationAccount      | 11022.01       |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | Beneficiary             | 11032.01       |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | PESONet            | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | 11042.01       |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | PESONet            | AccountValidationPHPSourceAccount | Beneficiary             | 12052.01       |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | PDDTS              | AccountValidationUSDSourceAccount | Beneficiary             | 12063.01       |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | PDDTS              | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails | 10171.01       |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | SWIFT              | AccountValidationUSDSourceAccount | Beneficiary             | 10181.01       |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | SWIFT              | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails | 10191.01       |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | instaPay           | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | 22041.01       |


  Scenario Outline: Validation of Fund Transfer scenario with different payment channel Rejection during Hierarchy Flow
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Enter the transfer details with "<From>","<To>" &"<transferAmount>"
    And Review the transfer details with "<To>" details for approval
    And click Submit
    Then Transaction should be successful and sent for Approval
    When I logout and login with the "<Approver_user>" and "<Approver_pwd>" details
    And I approve the above transaction details
    Then The Transaction should be successfully approved
    When I logout and login with "<Approver_user_2>" and "<Approver_pwd_2>" details
    And I reject the above transaction details
    Then The Transaction should be rejected
    And Verify the rejected transaction by logging with the "<Maker_user>" and "<Maker_pwd>" details

    Examples:
      | Maker_user                      | Maker_pwd                       | Approver_user                      | Approver_pwd                       | Approver_user_2                        | Approver_pwd_2                         | organization                           | channel            | From                              | To                      | transferAmount |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PESONet            | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | 120.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PESONet            | AccountValidationPHPSourceAccount | Beneficiary             | 130.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | 12DigitUnionBankAccount | 150.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | DestinationAccount      | 160.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | Beneficiary             | 170.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PDDTS              | AccountValidationUSDSourceAccount | Beneficiary             | 180.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PDDTS              | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails | 190.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | SWIFT              | AccountValidationUSDSourceAccount | Beneficiary             | 200.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | SWIFT              | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails | 210.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | instaPay           | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | 220.01         |


  Scenario Outline: Validation of scheduled fund transfer scenario for various payment channel
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Enter the transfer details with "<From>","<To>" ,"<transferAmount>","<frequency>" & "<date>"
    And Review the scheduled transfer details with "<To>" details for approval
    And click Submit
    Then Transaction should be successfully scheduled
    Examples:
      | Maker_user     | Maker_pwd      | organization          | channel            | From                | To                      | transferAmount | frequency | date             |
      | Maker_username | Maker_password | Approval_Organization | UnionBank Accounts | SourceAccount       | 12DigitUnionBankAccount | 11.01          | Daily     | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | UnionBank Accounts | SourceAccount       | DestinationAccount      | 22.01          | ONE-TIME  | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | UnionBank Accounts | SourceAccount       | Beneficiary             | 33.01          | Weekly    | 2022-November-22 |
      | Maker_username | Maker_password | Approval_Organization | PESONet            | SourceAccount       | EnterBeneficiaryDetails | 44.01          | ONE-TIME  | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | PESONet            | SourceAccount       | Beneficiary             | 55.01          | Daily     | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | PDDTS              | PDDTS_SourceAccount | Beneficiary             | 65.01          | ONE-TIME  | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | PDDTS              | PDDTS_SourceAccount | EnterBeneficiaryDetails | 75.01          | Daily     | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | SWIFT              | SWIFT_SourceAccount | Beneficiary             | 85.01          | ONE-TIME  | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | SWIFT              | SWIFT_SourceAccount | EnterBeneficiaryDetails | 95.01          | Daily     | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | instaPay           | SourceAccount       | EnterBeneficiaryDetails | 41.01          | ONE-TIME  | 2022-December-22 |


  Scenario Outline: Validation of transaction not allowed scenario for scheduled fund transfer with various payment channel
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Enter the transfer details with "<From>","<To>" ,"<transferAmount>","<frequency>" & "<date>"
    And Review the scheduled transfer details with "<To>" details for approval
    And click Submit button
    Then Transaction should be unsuccessful by displaying an pop up error message
    Examples:
      | Maker_user     | Maker_pwd      | organization          | channel            | From                | To                      | transferAmount | frequency | date             |
     # | Maker_username | Maker_password | Approval_Organization | UnionBank Accounts | SourceAccount       | 12DigitUnionBankAccount | 1110.01        | Daily     | 2022-December-22 |
      #| Maker_username | Maker_password | Approval_Organization | UnionBank Accounts | SourceAccount       | DestinationAccount      | 1110.01        | ONE-TIME  | 2022-December-22 |
      #| Maker_username | Maker_password | Approval_Organization | UnionBank Accounts | SourceAccount       | Beneficiary             | 1130.01        | Weekly    | 2022-November-22 |
     # | Maker_username | Maker_password | Approval_Organization | PESONet            | SourceAccount       | EnterBeneficiaryDetails | 1140.01        | ONE-TIME  | 2022-November-22 |
     # | Maker_username | Maker_password | Approval_Organization | PESONet            | SourceAccount       | Beneficiary             | 1150.01        | Daily     | 2022-November-22 |
      | Maker_username | Maker_password | Approval_Organization | PDDTS              | PDDTS_SourceAccount | Beneficiary             | 1160.01        | ONE-TIME  | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | PDDTS              | PDDTS_SourceAccount | EnterBeneficiaryDetails | 1170.01        | Daily     | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | SWIFT              | SWIFT_SourceAccount | Beneficiary             | 1180.01        | ONE-TIME  | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | SWIFT              | SWIFT_SourceAccount | EnterBeneficiaryDetails | 1190.01        | Daily     | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | instaPay           | SourceAccount       | EnterBeneficiaryDetails | 1140.01        | ONE-TIME  | 2022-December-22 |


  Scenario Outline: Validation of Edit button functionality in fund transfer scenario
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Enter the transfer details with "<From>","<To>" ,"<transferAmount>","<frequency>" & "<date>"
    And Review the scheduled transfer details with "<To>" details for approval
    And Click on Edit button and edit the required detail
    And click Submit
    Then Transaction should be successfully posted with edited details
    Examples:
      | Maker_user     | Maker_pwd      | organization          | channel            | From                | To                      | transferAmount | frequency | date             |
      | Maker_username | Maker_password | Approval_Organization | UnionBank Accounts | SourceAccount       | 12DigitUnionBankAccount | 1110.01        | Daily     | 2022-December-22 |
     # | Maker_username | Maker_password | Approval_Organization | PESONet            | SourceAccount       | EnterBeneficiaryDetails | 1140.01        | ONE-TIME  | 2022-December-22 |
     # | Maker_username | Maker_password | Approval_Organization | PDDTS              | PDDTS_SourceAccount | Beneficiary             | 1160.01        | ONE-TIME  | 2022-December-22 |
    #  | Maker_username | Maker_password | Approval_Organization | SWIFT              | SWIFT_SourceAccount | Beneficiary             | 1180.01        | ONE-TIME  | 2022-December-22 |
     # | Maker_username | Maker_password | Approval_Organization | instaPay           | SourceAccount       | EnterBeneficiaryDetails | 1190.01        | ONE-TIME  | 2022-December-22 |


  Scenario: Validation of Make Another Transfer button in the Fund Transfer
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "PESONet" channel
    And Enter the transfer details with "SourceAccount" & "EnterBeneficiaryDetails"
    And Review the transfer details with "EnterBeneficiaryDetails" details
    And click Submit
    Then Transaction should be successful
    And Click on Make Another Transfer button
    And I click on the "Make a Transfer" and Choose "PDDTS" channel
    And Enter the transfer details with "PDDTS_SourceAccount" & "EnterBeneficiaryDetails"
    And Review the transfer details with "EnterBeneficiaryDetails" details
    And click Submit
    Then Transaction should be successful


  Scenario: Validation of View Organization Transfers button in the Fund Transfer
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "PESONet" channel
    And Enter the transfer details with "SourceAccount" & "EnterBeneficiaryDetails"
    And Review the transfer details with "EnterBeneficiaryDetails" details
    And click Submit
    Then Transaction should be successful
    And Click on View Organization Transfers button
    Then Organization Transfers page should be displayed

  #scrolll issue ther for ios for above scenario and it s been comment out


  Scenario Outline: Validation of Fund Transfer with remarks field more than 30 characters
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel
    And Enter the transfer details with "<From>" , "<To>" & remarks with more than "<40_characters>"
    And Review the transfer details with "<To>" & remarks details
    And click Submit
    Then Transaction should be successful with remarks not more than 40 characters

    Examples:
      | Maker_user                      | Maker_pwd                       | organization                           | channel            | From                              | To                      | 40_characters                            |
      | valid_username                  | valid_password                  | user_Organization                      | UnionBank Accounts | SourceAccount                     | 12DigitUnionBankAccount | abcdefghij0123456789abcdefghij0123456789 |
      | valid_username                  | valid_password                  | user_Organization                      | UnionBank Accounts | SourceAccount                     | DestinationAccount      | abcdefghij0123456789abcdefghij0123456789 |
      | valid_username                  | valid_password                  | user_Organization                      | UnionBank Accounts | SourceAccount                     | Beneficiary             | abcdefghij0123456789abcdefghij0123456789 |
      | valid_username                  | valid_password                  | user_Organization                      | PESONet            | SourceAccount                     | EnterBeneficiaryDetails | abcdefghij0123456789abcdefghij0123456789 |
      | valid_username                  | valid_password                  | user_Organization                      | PESONet            | SourceAccount                     | Beneficiary             | abcdefghij0123456789abcdefghij0123456789 |
      | valid_username                  | valid_password                  | user_Organization                      | PDDTS              | PDDTS_SourceAccount               | Beneficiary             | abcdefghij0123456789abcdefghij0123456789 |
      | valid_username                  | valid_password                  | user_Organization                      | PDDTS              | PDDTS_SourceAccount               | EnterBeneficiaryDetails | abcdefghij0123456789abcdefghij0123456789 |
      | Maker_username                  | Maker_password                  | Approval_Organization                  | SWIFT              | SWIFT_SourceAccount               | Beneficiary             | abcdefghij0123456789abcdefghij0123456789 |
      | valid_username                  | valid_password                  | user_Organization                      | SWIFT              | SWIFT_SourceAccount               | EnterBeneficiaryDetails | abcdefghij0123456789abcdefghij0123456789 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | instaPay           | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | abcdefghij0123456789abcdefghij0123456789 |


  Scenario Outline: Validation of fund transfer scenario with account balance calculation
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option after noting down the "<From>" Account balance details
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel
    And Enter the transfer details with "<From>" & "<To>" for account validation
    And Review the transfer details with "<To>" details for the account validation
    And click Submit
    Then Transaction should be successful and account balance should be debited correctly
    Examples:

      | Maker_user                      | Maker_pwd                       | organization                           | From                              | To                         | channel            |
     | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationPHPSourceAccount | 12DigitUnionBankAccount    | UnionBank Accounts |
     | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails    | PESONet            |
     | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails    | PDDTS              |
     | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails    | SWIFT              |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails    | instaPay           |
     | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationUSDSourceAccount | USD12DigitUnionBankAccount | UnionBank Accounts |
     | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationUSDSourceAccount | USDDestinationAccount      | UnionBank Accounts |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationUSDSourceAccount | USDBeneficiary             | UnionBank Accounts |

  @FundTransfer25Jul.4
  Scenario Outline: Validation of fund transfer scenario with Modified Service Fee(Pricing feature) - No Approval
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option after noting down the "<From>" Account balance details
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel
    And Enter the transaction details with "<From>","<To>" & "<amount>"
    And Review the transaction details with "<To>" details for the account validation
    And click Submit
    Then Transaction should be successfully posted with modified Fee and account balance should be debited correctly
    Examples:

      | Maker_user                      | Maker_pwd                       | organization                          | From                              | To                      | channel            | amount   |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationPHPSourceAccount | 12DigitUnionBankAccount | UnionBank Accounts | 10000.01 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | PESONet            | 20000.01 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails | PDDTS              | 30000.01 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails | SWIFT              | 40000.01 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | instaPay           | 40000.01 |


  Scenario Outline: Validation of Cancel Transaction popup in the fund transfer screen across different channels
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option after noting down the "<From>" Account balance details
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel
    And Enter the transaction with "<From>","<To>" & "<amount>" details
    And click back button
    Then Cancel Transaction Popup should be displayed
    Examples:

      | Maker_user                      | Maker_pwd                       | organization                          | From                              | To                      | channel            | amount   |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationPHPSourceAccount | 12DigitUnionBankAccount | UnionBank Accounts | 10000.01 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | PESONet            | 20000.01 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails | PDDTS              | 30000.01 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails | SWIFT              | 40000.01 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationPricing_Organization | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | instaPay           | 50000.01 |



  Scenario Outline: Validation of deleting a scheduled fund transfer scenario
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Enter the transfer details with "<From>","<To>" ,"<transferAmount>","<frequency>" & "<date>"
    And click Submit
    And Transaction should be scheduled successfully
    And I click on the Delete Transaction button & delete it
    Then The above scheduled transfer should be deleted
    Examples:
      | Maker_user     | Maker_pwd      | organization          | channel            | From                | To                      | transferAmount | frequency | date             |
      | Maker_username | Maker_password | Approval_Organization | UnionBank Accounts | SourceAccount       | 12DigitUnionBankAccount | 10.01          | Daily     | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | PESONet            | SourceAccount       | EnterBeneficiaryDetails | 40.01          | ONE-TIME  | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | PDDTS              | PDDTS_SourceAccount | Beneficiary             | 60.01          | ONE-TIME  | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | SWIFT              | SWIFT_SourceAccount | Beneficiary             | 80.01          | ONE-TIME  | 2022-December-22 |
      | Maker_username | Maker_password | Approval_Organization | instaPay           | SourceAccount       | EnterBeneficiaryDetails | 40.01          | ONE-TIME  | 2022-December-22 |


  Scenario Outline: Validation of Fund Transfer with INVALID OTP Details across different channels
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel
    And Enter the transfer details with "<From>" , "<To>" & remarks with more than "<40_characters>"
    And click Submit button and Enter invalid OTP
    Then "Error" Message should be displayed with the message "Incorrect OTP"

    Examples:
      | Maker_user                      | Maker_pwd                       | organization                           | channel            | From                              | To                      | 40_characters                            |
      | valid_username                  | valid_password                  | user_Organization                      | UnionBank Accounts | SourceAccount                     | 12DigitUnionBankAccount | abcdefghij0123456789abcdefghij0123456789 |
   #  | valid_username                  | valid_password                  | user_Organization                      | UnionBank Accounts | SourceAccount                     | DestinationAccount      | abcdefghij0123456789abcdefghij0123456789 |
     # | valid_username                  | valid_password                  | user_Organization                      | UnionBank Accounts | SourceAccount                     | Beneficiary             | abcdefghij0123456789abcdefghij0123456789 |
      | valid_username                  | valid_password                  | user_Organization                      | PESONet            | SourceAccount                     | EnterBeneficiaryDetails | abcdefghij0123456789abcdefghij0123456789 |
    #  | valid_username                  | valid_password                  | user_Organization                      | PESONet            | SourceAccount                     | Beneficiary             | abcdefghij0123456789abcdefghij0123456789 |
    # | valid_username                  | valid_password                  | user_Organization                      | PDDTS              | PDDTS_SourceAccount               | Beneficiary             | abcdefghij0123456789abcdefghij0123456789 |
      | valid_username                  | valid_password                  | user_Organization                      | PDDTS              | PDDTS_SourceAccount               | EnterBeneficiaryDetails | abcdefghij0123456789abcdefghij0123456789 |
     # | Maker_username                  | Maker_password                  | Approval_Organization                  | SWIFT              | SWIFT_SourceAccount               | Beneficiary             | abcdefghij0123456789abcdefghij0123456789 |
      | valid_username                  | valid_password                  | user_Organization                      | SWIFT              | SWIFT_SourceAccount               | EnterBeneficiaryDetails | abcdefghij0123456789abcdefghij0123456789 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | instaPay           | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | abcdefghij0123456789abcdefghij0123456789 |

  @FundTransfer21Jul
  Scenario Outline: Validation of Deleting the Transaction created by the Corporate user (Maker) across different Fund Transfer channels - Approval Hierarchy Flow
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Create a transaction with "<From>","<To>" &"<transferAmount>" details that falls under Approval Hierarchy
    And Click Cancel Transaction button in the Transfer Details screen
    Then Transaction should be Cancelled in the Maker user login
    And  Also in the next "<Approver_user>" and "<Approver_pwd>" user login
    And  Also in the Final "<Approver_user_2>" and "<Approver_pwd_2>" user login


    Examples:
      | Maker_user                      | Maker_pwd                       | Approver_user                      | Approver_pwd                       | Approver_user_2                        | Approver_pwd_2                         | organization                           | channel            | From                              | To                      | transferAmount |
      | Maker_username                  | Maker_password                  | Approval_username                  | Approval_password                  | Approval_username_two                  | Approval_password_two                  | Approval_Organization                  | PESONet            | SourceAccount                     | EnterBeneficiaryDetails | 120.01         |
    #  | Maker_username                  | Maker_password                  | Approval_username                  | Approval_password                  | Approval_username_two                  | Approval_password_two                  | Approval_Organization                  | UnionBank Accounts | SourceAccount                     | 12DigitUnionBankAccount | 150.01         |
      | Maker_username                  | Maker_password                  | Approval_username                  | Approval_password                  | Approval_username_two                  | Approval_password_two                  | Approval_Organization                  | PDDTS              | PDDTS_SourceAccount               | EnterBeneficiaryDetails | 190.01         |
    #| Maker_username                  | Maker_password                  | Approval_username                  | Approval_password                  | Approval_username_two                  | Approval_password_two                  | Approval_Organization                  | SWIFT              | SWIFT_SourceAccount               | EnterBeneficiaryDetails | 210.01         |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | instaPay           | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | 220.01         |


  Scenario Outline: Validation of Deleting the Transaction created by the Corporate user (Maker) across different scheduled Fund Transfer Transaction falls under Approval Hierarchy Flow
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Create a scheduled transfer with "<From>","<To>" ,"<transferAmount>","<frequency>" & "<date>" details
    And Click Cancel Transaction button in the Transfer Details screen
    Then Transaction should be Cancelled in the Maker user login
    And  Also in the next "<Approver_user>" and "<Approver_pwd>" user login
    And  Also in the Final "<Approver_user_2>" and "<Approver_pwd_2>" user login

    Examples:
      | Maker_user                      | Maker_pwd                       | organization                           | channel            | From                              | To                      | transferAmount | frequency | date             | Approver_user                      | Approver_pwd                       | Approver_user_2                        | Approver_pwd_2                         |
      | Maker_username                  | Maker_password                  | Approval_Organization                  | UnionBank Accounts | SourceAccount                     | Beneficiary             | 130.01         | Weekly    | 2022-November-22 | Approval_username                  | Approval_password                  | Approval_username_two                  | Approval_password_two                  |
      | Maker_username                  | Maker_password                  | Approval_Organization                  | PESONet            | SourceAccount                     | Beneficiary             | 150.01         | Daily     | 2022-December-22 | Approval_username                  | Approval_password                  | Approval_username_two                  | Approval_password_two                  |
      | Maker_username                  | Maker_password                  | Approval_Organization                  | PDDTS              | PDDTS_SourceAccount               | Beneficiary             | 160.01         | ONE-TIME  | 2022-December-22 | Approval_username                  | Approval_password                  | Approval_username_two                  | Approval_password_two                  |
      | Maker_username                  | Maker_password                  | Approval_Organization                  | SWIFT              | SWIFT_SourceAccount               | Beneficiary             | 180.01         | ONE-TIME  | 2022-December-22 | Approval_username                  | Approval_password                  | Approval_username_two                  | Approval_password_two                  |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | instaPay           | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | 140.01         | ONE-TIME  | 2022-December-22 | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two |

  @FundTransfer25Jul.3
  Scenario Outline: Validation of fund transfer scenario with account balance calculation for Business Line account
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option after noting down the "<From>" Business Account balance details
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel
    And Enter the transfer details with "<From>" & "<To>" for business account validation
    And Review the transfer details with "<To>" details for the business account validation
    And click Submit
    Then Transaction should be successful and business account balance should be debited correctly
    Examples:

      | Maker_user                              | Maker_pwd                               | organization                                   | From                                      | To                      | channel            |
      | BusinessAccountValidationMaker_username | BusinessAccountValidationMaker_password | BusinessAccountValidationApproval_Organization | BusinessAccountValidationPHPSourceAccount | 12DigitUnionBankAccount | UnionBank Accounts |
    #  | BusinessAccountValidationMaker_username | BusinessAccountValidationMaker_password | BusinessAccountValidationApproval_Organization | BusinessAccountValidationPHPSourceAccount | EnterBeneficiaryDetails | PESONet            |
    #  | BusinessAccountValidationMaker_username | BusinessAccountValidationMaker_password | BusinessAccountValidationApproval_Organization | BusinessAccountValidationPHPSourceAccount | EnterBeneficiaryDetails | instaPay           |


  Scenario Outline: Validation of scheduled fund transfer scenario with approval flow for various payment channel

    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Enter the transfer details with "<From>","<To>" ,"<transferAmount>","<frequency>" & "<date>"
    And Review the scheduled transfer with "<To>" details for approval
    And click Submit
    And Transaction should be successfully sent for Approval
    When I logout and login with the "<Approver_user>" and "<Approver_pwd>" details
    And I approve the above transaction details
    Then The Transaction should be successfully approved
    When I logout and login with "<Approver_user_2>" and "<Approver_pwd_2>" details
    And I approve the above transaction details
    Then Transaction should be successfully scheduled for the above approval hierarchy
    And Verify it by logging with the "<Maker_user>" and "<Maker_pwd>"
    Examples:
      | Maker_user                      | Maker_pwd                       | Approver_user                      | Approver_pwd                       | Approver_user_2                        | Approver_pwd_2                         | organization                           | channel            | From                              | To                      | transferAmount | frequency | date             |
      #| AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PESONet            | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | 120.01         | ONE-TIME  | 2022-November-22 |
      #| AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | 12DigitUnionBankAccount | 150.01         | Weekly    | 2022-November-22 |
    # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PDDTS              | AccountValidationUSDSourceAccount | Beneficiary             | 180.01         | ONE-TIME  | 2022-November-22 |
     # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | SWIFT              | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails | 210.01         | Weekly    | 2022-November-22 |
    # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | instaPay           | AccountValidationPHPSourceAccount | Beneficiary             | 220.01         | Daily     | 2022-November-22 |
     | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationUSDSourceAccount | USDBeneficiary          | 250.01         | Daily     | 2022-November-22 |

  @FundTransfer25Jul.3
  Scenario Outline: Validation of scheduled fund transfer scenario with rejection during approval hierarchy flow for various payment channel
    Given I'm on Autobahn Corporate user login page with "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Fund Transfer" option
    Then "Fund Transfer" page should be displayed with "Make a Transfer", "Manage Beneficiaries" & "View All Organization Transfers"
    When I click on "Make a Transfer" and Choose "<channel>" channel for the "<organization>"
    And Enter the transfer details with "<From>","<To>" ,"<transferAmount>","<frequency>" & "<date>"
    And Review the scheduled transfer with "<To>" details for approval
    And Review the scheduled transfer with "<To>" details for approval
    And click Submit
    And Transaction should be successfully sent for Approval
    When I logout and login with the "<Approver_user>" and "<Approver_pwd>" details
    And I approve the above transaction details
    Then The Transaction should be successfully approved
    When I logout and login with "<Approver_user_2>" and "<Approver_pwd_2>" details
    And I reject the above transaction details
    Then The Transaction should be rejected
    And Verify the rejected scheduled transaction by logging with the "<Maker_user>" and "<Maker_pwd>" details

    Examples:
      | Maker_user                      | Maker_pwd                       | Approver_user                      | Approver_pwd                       | Approver_user_2                        | Approver_pwd_2                         | organization                           | channel            | From                              | To                      | transferAmount | frequency | date             |
      #| AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PESONet            | AccountValidationPHPSourceAccount | EnterBeneficiaryDetails | 120.01         | ONE-TIME  | 2022-November-22 |
     | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationPHPSourceAccount | 12DigitUnionBankAccount | 150.01         | Weekly    | 2022-November-22 |
    # | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | PDDTS              | AccountValidationUSDSourceAccount | Beneficiary             | 180.01         | ONE-TIME  | 2022-November-22 |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | SWIFT              | AccountValidationUSDSourceAccount | EnterBeneficiaryDetails | 210.01         | Weekly    | 2022-November-22 |
      #| AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | instaPay           | AccountValidationPHPSourceAccount | Beneficiary             | 220.01         | Daily     | 2022-November-22 |
    #| AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | UnionBank Accounts | AccountValidationUSDSourceAccount | USDBeneficiary          | 250.01         | Daily     | 2022-November-22 |


