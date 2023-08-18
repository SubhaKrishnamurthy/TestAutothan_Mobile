# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate User, I want to Login into the Corporate Banking Mobile application with valid credentials
# ===============================================================================================================================

@LoginPreReq
  Feature: Corporate Banking user Login Prerequesite

    Background: Open Autobahn mobile application
      Given I'm on Autobahn landing page



    Scenario Outline: Validation of Deleting the Frequent biller with biller as Aboitizland Locators
      Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>"

      Examples:
        | Maker_user     | Maker_pwd      |
        | Maker_username | Maker_password |
        | Approval_username | Approval_password |
        | Approval_username_two | Approval_password_two |
        | valid_username | valid_password |
        | Profilevalid_username | Profilevalid_password |
        | AccountValidationMaker_username | AccountValidationMaker_password |
        | AccountValidationApproval_username | AccountValidationApproval_password |
        | AccountValidationApproval_username_two | AccountValidationApproval_password_two |
        | BusinessAccountValidationMaker_username | BusinessAccountValidationMaker_password |
        | BusinessAccountValidationApproval_username | BusinessAccountValidationApproval_password |
        | BusinessAccountValidationApproval_username_two | BusinessAccountValidationApproval_password_two  |
