package stepdefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import helper.Device;
import helper.PropertyReader;
import pages.*;

public class AutoBahn_LoginPage {

    private static PageWelcome welcome=new PageWelcome();
    private static PageLogin login=new PageLogin();
    private static PageOTP otp=new PageOTP();
    private static PageFingerPrint fingerprint=new PageFingerPrint();
    private static PagePrivacyPolicy privacypolicy=new PagePrivacyPolicy();
    private static PageDashboard dashboard=new PageDashboard();
    private static PagePopUp popup = new PagePopUp();
    private static PageLearnMore learnMore = new PageLearnMore();
    private static PageContactUs contactus = new PageContactUs();
    private static PageTermsAndConditions termsAndConditions = new PageTermsAndConditions();


    @Given("^I'm on Autobahn landing page$")
    public void i_m_on_Autobahn_landing_page() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        welcome.launchAutoBahn();
    }

    @Given("^I'm on Autobahn Corporate user login page$")
    public void i_m_on_Autobahn_Corporate_user_login_page() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        try {
            welcome.VerifyandSwipeWelcomePageOne();
            welcome.VerifyandSwipeWelcomePageTwo();
            welcome.VerifyandSwipeWelcomePageThree();
            welcome.VerifyandSwipeWelcomePageFour();
            welcome.VerifyandSwipeWelcomePageFive();
            welcome.VerifyandSwipeWelcomePageSix();
            welcome.clickLoginBtninWelcomeSixithPage();
        }

       catch(Exception ex) {

       }
    }

    @When("^I enter \"([^\"]*)\" and \"([^\"]*)\"$")
    public void i_enter_and(String arg1, String arg2) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
//        login.verifyLoginPageContents();
        //login.enterEmailAddress(PropertyReader.testDataOf(arg1));
       // login.enterPassword(PropertyReader.testDataOf(arg2));

        login.logincachelogic(PropertyReader.testDataOf(arg1),PropertyReader.testDataOf(arg2));

    }

    @When("^Click Login & Enter OTP details$")
    public void click_Login_Enter_OTP_details() throws Throwable {
        // Write code here that turns the phrase above into concrete actions

            login.clickLogin();
            otp.enterOTP();
//        fingerprint.clickNotNow();
            if(privacypolicy.checkifPrivacyPolicyIsDisplayed()) {
                privacypolicy.verifyPageContents();
                privacypolicy.clickAcceptPrivacyPolicy();

            }


    }

    @Then("^I should see the Dashboard page$")
    public void i_should_see_the_Dashboard_page() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
            if(dashboard.IsSkipTutorialPresent())
            {
                dashboard.skipTutorial();
            }
            dashboard.verifyDashboardPageDetails();

    }


    @When("^Click Login$")
    public void click_Login() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        login.clickLogin();
    }

    @Then("^I should see an error message as \"([^\"]*)\"$")
    public void i_should_see_an_error_message_as(String arg1) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        if(Device.isAndroid()) {
            popup.verifyPageTitle(arg1);
            popup.clickYes();
        }
        else
        {
            popup.verifyIOSLoginErrorPopUp("Error", arg1);
            popup.CloseIOSLoginErrorPopUp();
        }
    }

    @When("^I Click on \"([^\"]*)\" option in the bottom of the application$")
    public void i_Click_on_option_in_the_bottom_of_the_application(String arg1) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        login.clickLearnMoreOption();
    }

    @Then("^\"([^\"]*)\" should be displayed with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void should_be_displayed_with_and(String arg1, String arg2, String arg3) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        learnMore.verifyPageTitleAndContents(arg1);
    }

    @When("^I click on \"([^\"]*)\" option$")
    public void i_click_on_option(String arg1) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        switch (arg1)
        {
            case "Contact Us":
            learnMore.clickContactUs();
            break;
            case "Terms & Conditions":
            learnMore.clickTermsAndConditions();
            break;

            case "key features":
                learnMore.clickmobileappFeatures();
                break;
        }
    }

    @Then("^\"([^\"]*)\" details should be displayed$")
    public void details_should_be_displayed(String arg1) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        switch (arg1)
        {
            case "Contact Us":
                contactus.verifyPageTitleAndContents(arg1);
                contactus.clickBack();
                break;
            case "Terms & Conditions":
                termsAndConditions.verifyPageTitleAndContents(arg1);
                termsAndConditions.SwitchToPRIVACYPOLICY();
                termsAndConditions.SwitchToTermsAndConditions();
                break;

            case "key features":

                welcome.VerifyandSwipeWelcomePageOne();
                welcome.VerifyandSwipeWelcomePageTwo();
                welcome.VerifyandSwipeWelcomePageThree();
                welcome.VerifyandSwipeWelcomePageFour();
                welcome.VerifyandSwipeWelcomePageFive();
                //welcome.VerifyandSwipeWelcomePageSix();
                if(Device.isAndroid())
                {
                    welcome.swipeHorizontal();
                    welcome.swipeHorizontal();
                    welcome.swipeHorizontal();
                    welcome.swipeHorizontal();
                    welcome.swipeHorizontal();
                }
                welcome.clickBackButton();
                learnMore.verifyPageTitleAndContents("Learn More");


               /* if(Device.isAndroid()) {
                    welcome.VerifyandSwipeWelcomePageOne();
                    welcome.VerifyandSwipeWelcomePageTwo();
                    welcome.VerifyandSwipeWelcomePageThree();
                    welcome.VerifyandSwipeWelcomePageFour();
                    welcome.VerifyandSwipeWelcomePageFive();
                    //welcome.VerifyandSwipeWelcomePageSix();
                    //welcome.clickLoginBtninWelcomeSixithPage();
                    welcome.clickBackButton();
                    learnMore.verifyPageTitleAndContents("Learn More");
                    //login.clickLearnMoreOption();
                }

                else
                {
                    welcome.VerifyandSwipeWelcomePageOne();
                    welcome.VerifyandSwipeWelcomePageTwo();
                    welcome.VerifyandSwipeWelcomePageThree();
                    welcome.VerifyandSwipeWelcomePageFour();
                    welcome.VerifyandSwipeWelcomePageFive();
                    //welcome.VerifyandSwipeWelcomePageSix();
                    welcome.clickBackButton();
                    learnMore.verifyPageTitleAndContents("Learn More");

                }
                */
                break;
        }
    }

    @Given("^I'm on Autobahn Corporate user login page with the \"([^\"]*)\",\"([^\"]*)\"$")
    public void i_m_on_Autobahn_Corporate_user_login_page_with_the(String arg1, String arg2) throws Throwable {

        try {
            login.logincachelogic(PropertyReader.testDataOf(arg1), PropertyReader.testDataOf(arg2));
            login.clickLogin();
            otp.enterOTP();
        } catch (Exception ex) {

            login.logincachelogic(PropertyReader.testDataOf(arg1), PropertyReader.testDataOf(arg2));
            login.clickLogin();
            otp.enterOTP();
        }
           login.closePrivacyOptionwhileLogin();

    }


}
