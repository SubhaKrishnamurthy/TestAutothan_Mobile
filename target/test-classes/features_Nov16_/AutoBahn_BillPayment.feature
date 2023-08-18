# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate user, I want to perform the BillPayment in the Autobahn Application
# ===============================================================================================================================

@BillPayment @Regression @release7 @FundTransferNov13
Feature: Corporate Banking BillPayment

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page

  Scenario: Validation of Bill Payment scenario with biller as Aboitizland Locators
    Given I'm on Autobahn Corporate user login page with the "AccountValidationMaker_username","AccountValidationMaker_password" & "AccountValidationApproval_Organization"
  #  When I click on "TRANSACT" menu option
    When I click on "TRANSACT" menu option after noting down the "AccountValidationPHPSourceAccount" Account balance detail
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "AccountValidationPHPSourceAccount" & "paybiller_Forbestown"
    And Review the transfer details with the "paybiller_Forbestown" biller details & click submit
    Then Payment should be successful with the account balance deduction

  Scenario Outline: Validation of Bill Payment scenario with biller as Aboitizland Locators with Approval Hierarchy Flow
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
   # When I click on "TRANSACT" menu option
    When I click on "TRANSACT" menu option after noting down the "<From>" Account balance detail
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "<From>","<biller>","<Amount>" & "<Frequency>"
    And Review the Payment details with the "<biller>" biller details & click submit
    Then The Payment should be successful and sent for Approval
    When I logout and login with the "<Approver_user>","<Approver_pwd>" and "<organization>" details
    And I approve the above Payment details
    Then The Payment should be successfully approved
    When I logout and login with "<Approver_user_2>","<Approver_pwd_2>" and "<organization>" details
    And I approve the above Payment details
    Then The Payment should be successfully approved
    And Verify it by logging with the "<Maker_user>" and "<Maker_pwd>" Payment details with correct account balance deduction

    Examples:
      | Maker_user                      | Maker_pwd                       | Approver_user                      | Approver_pwd                       | Approver_user_2                        | Approver_pwd_2                         | organization                           | From                              | biller               | Amount | Frequency |
     #| Maker_username | Maker_password | Approval_username | Approval_password | Approval_username_two | Approval_password_two | Approval_Organization | SourceAccount | paybiller_Forbestown | 120.00 | Immediate |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | AccountValidationPHPSourceAccount | paybiller_Forbestown | 120.01 | Immediate |


  Scenario Outline: Validation of Bill Payment scenario with biller as Aboitizland Locators with Rejection during Hierarchy Flow
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "<From>","<biller>","<Amount>" & "<Frequency>"
    And Review the Payment details with "<biller>" biller details & click submit
    Then Payment should be successful and sent for Approval
    When I logout and login with the "<Approver_user>","<Approver_pwd>" and "<organization>" details
    And I approve the above Payment details
    Then The Payment should be successfully approved
    When I logout and login with "<Approver_user_2>","<Approver_pwd_2>" and "<organization>" details
    And I reject the above Payment details
    Then The Payment should be rejected
    And Verify the rejected payment by logging with the "<Maker_user>" and "<Maker_pwd>" Payment details

    Examples:
      | Maker_user     | Maker_pwd      | Approver_user     | Approver_pwd      | Approver_user_2       | Approver_pwd_2        | organization          | From          | biller               | Amount | Frequency |
      | Maker_username | Maker_password | Approval_username | Approval_password | Approval_username_two | Approval_password_two | Approval_Organization | SourceAccount | paybiller_Forbestown | 120.01 | Immediate |


  Scenario Outline:Validation of Bill Payment scenario with biller as Aboitizland Locators for transaction not allowed scenario
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "<From>","<biller>","<Amount>" & "<Frequency>"
    And Review the Payment details with "<biller>" biller details & click submit
    And click Submit button in the bill payment review page
    Then Payment should be unsuccessful by displaying an pop up error message

    Examples:
      | Maker_user     | Maker_pwd      | organization          | From          | biller               | Amount  | Frequency |
      | Maker_username | Maker_password | Approval_Organization | SourceAccount | paybiller_Forbestown | 1090.01 | Immediate |


  Scenario: Validation of Bill Payment scenario with Frequent biller details as Aboitizland Locators for No Approval hierarchy flow
    Given I'm on the Autobahn Corporate user login page with "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "SourceAccount" & "Frequent_Biller"
    And Review the transfer details with "Frequent_Biller" biller details & click submit
    Then Payment should be successful


  Scenario Outline: Validation of Bill Payment scenario with Frequent biller details as Aboitizland Locators with Approval hierarchy flow
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "<From>","<biller>","<Amount>" & "<Frequency>"
    And Review the transfer details with "<biller>" biller details & click submit
    Then Payment should be successful and sent for the Approval
    When I logout and login with the "<Approver_user>","<Approver_pwd>" and "<organization>" details
    And I approve the above Payment details
    Then The Payment should be successfully approved
    When I logout and login with "<Approver_user_2>","<Approver_pwd_2>" and "<organization>" details
    And I approve the above Payment details
    Then The Payment should be successfully approved
    And Verify it by logging with the "<Maker_user>" and "<Maker_pwd>" Payment details

    Examples:
      | Maker_user     | Maker_pwd      | Approver_user     | Approver_pwd      | Approver_user_2       | Approver_pwd_2        | organization          | From          | biller          | Amount | Frequency |
      | Maker_username | Maker_password | Approval_username | Approval_password | Approval_username_two | Approval_password_two | Approval_Organization | SourceAccount | Frequent_Biller | 120.01 | Immediate |


  Scenario Outline: Validation of Bill Payment scenario with Frequent biller details as Aboitizland Locators with Rejection during Hierarchy Flow
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "<From>","<biller>","<Amount>" & "<Frequency>"
    And Review the Payment details with "<biller>" biller details & click submit
    Then Payment should be successful and sent for Approval
    When I logout and login with the "<Approver_user>","<Approver_pwd>" and "<organization>" details
    And I approve the above Payment details
    Then The Payment should be successfully approved
    When I logout and login with "<Approver_user_2>","<Approver_pwd_2>" and "<organization>" details
    And I reject the above Payment details
    Then The Payment should be rejected
    And Verify the rejected payment by logging with the "<Maker_user>" and "<Maker_pwd>" Payment details

    Examples:
      | Maker_user     | Maker_pwd      | Approver_user     | Approver_pwd      | Approver_user_2       | Approver_pwd_2        | organization          | From          | biller          | Amount | Frequency |
      | Maker_username | Maker_password | Approval_username | Approval_password | Approval_username_two | Approval_password_two | Approval_Organization | SourceAccount | Frequent_Biller | 120.01 | Immediate |


  Scenario Outline: Validation of Bill Payment scenario with Frequent biller as Aboitizland Locators for transaction not allowed scenario
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "<From>","<biller>","<Amount>" & "<Frequency>"
    And Review the Payment details with "<biller>" biller details & click submit
    And click Submit button in the bill payment review page
    Then Payment should be unsuccessful by displaying an pop up error message

    Examples:
      | Maker_user     | Maker_pwd      | organization          | From          | biller          | Amount  | Frequency |
      | Maker_username | Maker_password | Approval_Organization | SourceAccount | Frequent_Biller | 1090.01 | Immediate |


  Scenario Outline: Validation of Edit button functionality in Bill Payment scenario
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "<From>","<biller>","<Amount>" & "<Frequency>"
    And Review the Payment details with "<biller>" biller details & click submit
    And Edit the details by clicking Edit button
    And Review the edited details & click submit
    Then Payment should be successful with edited details

    Examples:
      | Maker_user     | Maker_pwd      | organization          | From          | biller               | Amount | Frequency |
      | Maker_username | Maker_password | Approval_Organization | SourceAccount | paybiller_Forbestown | 10.01  | Immediate |


  Scenario: Validation of Make Another Payment button in the Bill Payment scenario
    Given I'm on the Autobahn Corporate user login page with "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "SourceAccount" & "Frequent_Biller"
    And Review the transfer details with "Frequent_Biller" biller details & click submit
    Then Payment should be successful and click on Make Another Payment button
    And verify that user is able to perform another billpayment


  Scenario: Validation of View Organization Payment button in the Bill Payment scenario
    Given I'm on the Autobahn Corporate user login page with "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "SourceAccount" & "Frequent_Biller"
    And Review the transfer details with "Frequent_Biller" biller details & click submit
    Then Payment should be successful and click on View Organization Payment button
    And choose the above posted bill payment from the manage Organization Payment page


  Scenario: Validation of Bill Payment scenario with more than 30 characters in Remarks field
    Given I'm on the Autobahn Corporate user login page with "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "SourceAccount", "Frequent_Biller" & remarks with more than "abcdefghij0123456789abcdefghij0123456789"
    And Review the transfer details with "Frequent_Biller" biller, remark details as "abcdefghij0123456789abcdefghij0123456789" & click submit
    Then Payment should be successful


  Scenario: Validation of Cancel Transaction popup in the bills payment screen
    Given I'm on the Autobahn Corporate user login page with "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment detail with "SourceAccount" & "paybiller_Forbestown"
    And click back button
    Then Cancel Payment Popup should be displayed

  Scenario Outline:  Validation of Bill Payment scenario with biller HSBCMaster card & Cignal TV
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
  #  When I click on "TRANSACT" menu option
    When I click on "TRANSACT" menu option after noting down the "<From>" Account balance detail
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "<From>","<biller>","<Amount>" & "<Frequency>"
    And Review the transfer details with the "<biller>" biller details & click submit
    Then Payment should be successful with the account balance deduction
    Examples:
      | Maker_user                      | Maker_pwd                       | organization                           | From                              | biller                   | Amount | Frequency |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationPHPSourceAccount | paybiller_HSBCMASTERCARD | 9.99   | Immediate |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_Organization | AccountValidationPHPSourceAccount | paybiller_CignalTV       | 8.99   | Immediate |


  Scenario Outline: Validation of Bill Payment scenario with biller as HSBCMaster card & Cignal TV
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option after noting down the "<From>" Account balance detail
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "<From>","<biller>","<Amount>" & "<Frequency>"
#    And Review the Payment details with "<biller>" biller details & click submit
#    Then Payment should be successful and sent for Approval
#    When I logout and login with the "<Approver_user>","<Approver_pwd>" and "<organization>" details
#    And I approve the above Payment details
#    Then The Payment should be successfully approved
#    When I logout and login with "<Approver_user_2>","<Approver_pwd_2>" and "<organization>" details
#    And I approve the above Payment details
#    Then The Payment should be successfully approved
#    And Verify it by logging with the "<Maker_user>" and "<Maker_pwd>" Payment details
    And Review the Payment details with the "<biller>" biller details & click submit
    Then The Payment should be successful and sent for Approval
    When I logout and login with the "<Approver_user>","<Approver_pwd>" and "<organization>" details
    And I approve the above Payment details
    Then The Payment should be successfully approved
    When I logout and login with "<Approver_user_2>","<Approver_pwd_2>" and "<organization>" details
    And I approve the above Payment details
    Then The Payment should be successfully approved
    And Verify it by logging with the "<Maker_user>" and "<Maker_pwd>" Payment details with correct account balance deduction

    Examples:
      | Maker_user                      | Maker_pwd                       | Approver_user                      | Approver_pwd                       | Approver_user_2                        | Approver_pwd_2                         | organization                           | From                              | biller                   | Amount | Frequency |
#      | Maker_username | Maker_password | Approval_username | Approval_password | Approval_username_two | Approval_password_two | Approval_Organization | SourceAccount | paybiller_HSBCMASTERCARD | 120.01 | Immediate |
#      | Maker_username | Maker_password | Approval_username | Approval_password | Approval_username_two | Approval_password_two | Approval_Organization | SourceAccount | paybiller_CignalTV       | 120.01 | Immediate |
     | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | AccountValidationPHPSourceAccount | paybiller_HSBCMASTERCARD | 120.01 | Immediate |
      | AccountValidationMaker_username | AccountValidationMaker_password | AccountValidationApproval_username | AccountValidationApproval_password | AccountValidationApproval_username_two | AccountValidationApproval_password_two | AccountValidationApproval_Organization | AccountValidationPHPSourceAccount | paybiller_CignalTV       | 120.01 | Immediate |


  Scenario: Validation of Bill Payment scenario with INVALID OTP during payment
    Given I'm on the Autobahn Corporate user login page with "valid_username" and "valid_password"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "SourceAccount" & "paybiller_Forbestown"
    And click submit & enter INVALID OTP
    Then "Error" Message should be displayed with the message "Incorrect OTP"


  Scenario Outline: Validation of Deleting the Payment created by the Corporate user (Maker) across Bills Payment - Approval Hierarchy Flow
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And create a bill payments with "<From>","<biller>","<Amount>" & "<Frequency>" details that falls under Approval Hierarchy
    And Click Cancel Transaction button in the Payment Details screen
    Then Payment should be Cancelled in the Maker user login
    And  Also in the next approver login "<Approver_user>" and "<Approver_pwd>"
    And  Also in the Final approver login "<Approver_user_2>" and "<Approver_pwd_2>"

    Examples:
      | Maker_user     | Maker_pwd      | Approver_user     | Approver_pwd      | Approver_user_2       | Approver_pwd_2        | organization          | From          | biller               | Amount | Frequency |
      | Maker_username | Maker_password | Approval_username | Approval_password | Approval_username_two | Approval_password_two | Approval_Organization | SourceAccount | paybiller_Forbestown | 120.01 | Immediate |


  Scenario Outline: Validation of 24hours Pop up when the corporate user performs Bills payment to the same biller with same amount within the period of 24 hours
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Initate two bill payments with "<From>","<biller>","<Amount>" & "<Frequency>" details
    And Upon clicking Next button in the second bill pay with same details
    Then Modal pop up should be displayed for each "<biller>" with the title as "You have made a similar payment in the last 24 hours"

    Examples:
      | Maker_user     | Maker_pwd      | organization          | From          | biller                   | Amount | Frequency   |
     | Maker_username | Maker_password | Approval_Organization | SourceAccount | paybiller_Forbestown     | 43.01  | Immediately |
      | Maker_username | Maker_password | Approval_Organization | SourceAccount | Frequent_Biller          | 44.01  | Immediately |
      | Maker_username | Maker_password | Approval_Organization | SourceAccount | paybiller_HSBCMASTERCARD | 45.01  | Immediately |
      | Maker_username | Maker_password | Approval_Organization | SourceAccount | paybiller_CignalTV       | 46.01  | Immediately |


  Scenario Outline:  Validation of Bill Payment scenario for the Business Line Account
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
    When I click on "TRANSACT" menu option after noting down the "<From>" Business Account balance detail
    And Click on "Bills Payment" option
    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
    When I click on "Make a Payment" pay bill option
    And Enter the payment details with "<From>","<biller>","<Amount>" & "<Frequency>"
    And Review the transfer details for Business Line Account with "<biller>" biller details & click submit
    Then Payment should be successful and business account balance should be debited correctly
    Examples:
      | Maker_user                              | Maker_pwd                               | organization                                   | From                                      | biller                   | Amount | Frequency |
      | BusinessAccountValidationMaker_username | BusinessAccountValidationMaker_password | BusinessAccountValidationApproval_Organization | BusinessAccountValidationPHPSourceAccount | paybiller_Forbestown     | 3.99   | Immediate |
      | BusinessAccountValidationMaker_username | BusinessAccountValidationMaker_password | BusinessAccountValidationApproval_Organization | BusinessAccountValidationPHPSourceAccount | paybiller_HSBCMASTERCARD | 4.99   | Immediate |
      | BusinessAccountValidationMaker_username | BusinessAccountValidationMaker_password | BusinessAccountValidationApproval_Organization | BusinessAccountValidationPHPSourceAccount | paybiller_CignalTV       | 5.99   | Immediate |



#@bir
#  Scenario: Validation of Bill Payment scenario with biller as 8 Forbestown Road Condominium Association Inc
#    Given I'm on the Autobahn Corporate user login page with "valid_username" and "valid_password"
#    When I click on "TRANSACT" menu option
#    And Click on "Bills Payment" option
#    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
#    When I click on "Make a Payment" pay bill option for "BIR"
#    And Enter the government payment details with "SourceAccount" & "BIR"
#    And Review the government pyment details with "BIR" biller details & click submit
#    Then Government Payment should be successful


#  @deletepay
#  Scenario Outline: Validation of Deleting the Payment created by the Corporate user (Maker) across BIR Payment - Approval Hierarchy Flow
#    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>"
#    When I click on "TRANSACT" menu option
#    And Click on "Bills Payment" option
#    Then "Bills Payment" page should be displayed with "Make a Payment" & "View All Organization Payments" options
#    When I click on "Make a Payment" pay bill option
#    And create a bill payments with "<From>","<biller>","<Amount>" & "<Frequency>" details that falls under Approval Hierarchy
#    And Click Cancel Transaction button in the Payment Details screen
#    Then Payment should be Cancelled in the Maker user login
#    And  Also in the next approver login "<Approver_user>" and "<Approver_pwd>"
#    And  Also in the Final approver login "<Approver_user_2>" and "<Approver_pwd_2>"
#
#    Examples:
#      | Maker_user     | Maker_pwd      | Approver_user     | Approver_pwd      | Approver_user_2       | Approver_pwd_2        | organization          | From          | biller               | Amount | Frequency |
#      | Maker_username | Maker_password | Approval_username | Approval_password | Approval_username_two | Approval_password_two | Approval_Organization | SourceAccount | paybiller_Forbestown | 120.00 | Immediate |
