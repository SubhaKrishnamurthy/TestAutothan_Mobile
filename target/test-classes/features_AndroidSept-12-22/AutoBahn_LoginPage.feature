# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate User, I want to Login into the Corporate Banking Mobile application with valid credentials
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


    Scenario: Corporate Banking user Login with valid user id and invalid password
      Given I'm on Autobahn Corporate user login page
      When I enter "valid_username" and "Invalid_password"
      And Click Login
      Then I should see an error message as "Please enter a valid user id or password"

    @FundTransfersept10.1
    Scenario: Validation of Learn more page in AutoBahn Corporate Banking
      Given I'm on Autobahn Corporate user login page
      When I Click on "LEARN MORE" option in the bottom of the application
      Then "Learn More" should be displayed with "Contact Us" and "Terms and Conditions"
      When I click on "key features" option
      Then "key features" details should be displayed
      When I click on "Terms & Conditions" option
      Then "Terms & Conditions" details should be displayed
      # there is an issue with invalid user id scenario and hence hold it off


