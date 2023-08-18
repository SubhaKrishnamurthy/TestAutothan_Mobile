# ===============================================================================================================================
# Author: Manoj
# Functionality : As a Corporate User, want to validate the Alerts tab feature
# ===============================================================================================================================

@Login @Regression
  Feature: Corporate Banking user Login

    Background: Open Autobahn mobile application
      Given I'm on Autobahn landing page


    Scenario: Corporate Banking user Login with valid credentials
      Given I'm on Autobahn Corporate user login page
      When I enter "valid_username" and "valid_password"
      And Click Login & Enter OTP details
      Then I should see the Dashboard page


