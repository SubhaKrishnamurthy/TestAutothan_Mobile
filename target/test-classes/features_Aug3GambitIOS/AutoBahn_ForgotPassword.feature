# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate user, I want to recover the forgot password details using Forgot Password scenario
# ===============================================================================================================================

@ForgotPassword @Regression
Feature: Corporate Banking Forgot Password

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page

  Scenario: Validation of Forgot password scenario with vaid email id
    Given I'm on Autobahn Corporate user login page
    And I enter "valid_username" and "valid_password" details
    When I click on Forgot password link
    And Enter the email id for the password reset & enter valid OTP details
    Then Password reset link mail should be generated and sent to the respective email id
