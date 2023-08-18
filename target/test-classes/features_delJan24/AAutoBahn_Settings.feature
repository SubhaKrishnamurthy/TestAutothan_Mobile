# ===============================================================================================================================
# Author: Gopinath Rajaram
# Functionality : As a Corporate user, I want to perform the settings operation in the Autobahn Application
# ===============================================================================================================================

@Settings @Regression @release7
Feature: Corporate Banking Settings option

  Background: Open Autobahn mobile application
    Given I'm on Autobahn landing page

@pass
  Scenario Outline: Validation of updating mobile number details for a corporate user
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>" details
    When I click on "SETTINGS" menu option
    And click on "Profile" option
    Then "Profile" page should be displayed
    When I click on edit option for the mobile number
    And update with new mobile number
    Then The corporate user mobile number should be updated

    Examples:
      | Maker_user            | Maker_pwd             | organization         |
      | Profilevalid_username | Profilevalid_password | Profile_Organization |

@pass
  Scenario Outline: Validation of updating email address for a corporate user
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>" details
    When I click on "SETTINGS" menu option
    And click on "Profile" option
    Then "Profile" page should be displayed
    When I click on edit option for the email address
    And update with new email
    Then The corporate user should receive an email for verification

    Examples:
      | Maker_user            | Maker_pwd             | organization         |
      | Profilevalid_username | Profilevalid_password | Profile_Organization |

@pass
  Scenario Outline: Validation of Learn More option in the settings page
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>" details
    When I click on "SETTINGS" menu option
    And click on "Learn More" option
    Then "Learn More" should be displayed with "Contact Us" and "Terms and Conditions"
    When I click on "key features" option
    Then "key features" details should be displayed
    When I click on "Terms & Conditions" option
    Then "Terms & Conditions" details should be displayed

    Examples:
      | Maker_user            | Maker_pwd             | organization         |
      | Profilevalid_username | Profilevalid_password | Profile_Organization |

  @fail
  Scenario Outline: Validation of Managing the OTP flow for Login scenario in the settings page
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>" details
    When I click on "SETTINGS" menu option
    And click on "Security" option
    Then Page "Security" should be displayed with its details
    And Choose Enable/Disable OTP option
    And Turn off the OTP for Login flow
    And Logout from the application
    Then Verfiy whether user is able to Log into the application without OTP
    Examples:
      | Maker_user            | Maker_pwd             | organization         |
      | Profilevalid_username | Profilevalid_password | Profile_Organization |

  @Fail
  Scenario Outline: Validation of Managing the OTP flow for Transaction scenario in the settings page
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>" details
    When I click on "SETTINGS" menu option
    And click on "Security" option
    Then Page "Security" should be displayed with its details
    And Choose Enable/Disable OTP option
    And Turn off the OTP during Transaction flow
    And Logout from the application
    Then Verfiy whether user is able to perform "<transaction>" without OTP flow
    Examples:
      | Maker_user            | Maker_pwd             | organization         | transaction   |
      | Profilevalid_username | Profilevalid_password | Profile_Organization | Fund Transfer |
      | Profilevalid_username | Profilevalid_password | Profile_Organization | Bill Payment  |

  @Pass
  Scenario Outline: Validation of Notification option under security menu
    Given I'm on Autobahn Corporate user login page with the "<Maker_user>","<Maker_pwd>" & "<organization>" details
    When I click on "SETTINGS" menu option
    And click on "Notification" option
    And click on push Email notification "<option>"
    Then Push Email notification "<option>" page should be displayed with its details

    Examples:
      | Maker_user            | Maker_pwd             | organization         | option             |
     # | Profilevalid_username | Profilevalid_password | Profile_Organization | create_Transaction |
      | Profilevalid_username | Profilevalid_password | Profile_Organization | change_status      |
      | Profilevalid_username | Profilevalid_password | Profile_Organization | pending_approval   |
    #  | Profilevalid_username | Profilevalid_password | Profile_Organization | approved           |
  @Pass
  Scenario: Verify user is able to see tutorial after clicking on Help button and User can be able to skip the tutorial in Settings Tab
    Given I'm on Autobahn Corporate user login page with "valid_username","valid_password" & "user_Organization"
    When I click on "SETTINGS" menu option
    Then Verify Skip Tutorial Functionality