# ===============================================================================================================================
# Author: Manoj
# Functionality : As a Corporate User, Verify the Alerts tab functionality
# ===============================================================================================================================

@Login @Regression
  Feature: Corporate Banking user Alerts

    Background: Open Autobahn mobile application
      Given I'm on Autobahn landing page

    @Pass
    Scenario: Verify  User is  able to get popup as "Mark All as Read" with No and Yes buttons when User clicks  Mark all icon at upper right in Alerts tab
      Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
      Then I'm on Autobahn Corporate user login page
      When I click on Alerts tab
      Then Click on Mark All Button
      And verify Mark all as read Alert Popup
@pass
    Scenario: Verify user is able to see tutorial after clicking on Help button and User can be able to skip the tutorial in Alerts Tab
      Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
      When I click on "ALERTS" menu option
      Then Verify Skip Tutorial Functionality


