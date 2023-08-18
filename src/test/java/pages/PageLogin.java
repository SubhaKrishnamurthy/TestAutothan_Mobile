package pages;

import base.Keywords;
import base.Test;
import constants.Keys;
import constants.OS;
import exceptions.ApplicationException;
import helper.Device;
import helper.PropertyReader;
import io.appium.java_client.MobileBy;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import xpath.Matching;

public class PageLogin extends Keywords {


    private String keyIMGLogo = "AutoBahn.Login.IMGLogo";
    private String keyTxtEmailAddress = "AutoBahn.Login.TxtEmailAddress";
    private String keyTxtPassword = "AutoBahn.Login.TxtPassword";
    private String keyBtnToogleVisibiliyTool = "AutoBahn.Login.BtnToogleVisibiliyTool";
    private String keyBtnLogin = "AutoBahn.Login.BtnLogin";
    private String keyLinkForgotPassword = "AutoBahn.Login.LinkForgotPassword";
    private String keyBtnLearnMore = "AutoBahn.Login.BtnLearnMore";

    private String keyLblWelcomeBackVerbiage = "AutoBahn.Login.LblWelcomeBackVerbiage";
    private String keyLblUserName = "AutoBahn.Login.LblUserName";
    private String keyBtnusePassword = "AutoBahn.Login.BtnusePassword";
    private String keyBtnTestShoutout_Woohoo = "AutoBahn.Welcome.BtnTestShoutout_Woohoo";
    private String keyLblLoginPrivacyAlertMessage="AutoBahn.Login.LblLoginPrivacyAlertMessage";
    private String keyBtnLoginPrivacyAlertNotNow="AutoBahn.Login.BtnLoginPrivacyAlertNotNow";

    private String keyLblCyberSecure="AutoBahn.Welcome.LblCyberSecure";
    private String keyLblPhishing="AutoBahn.Welcome.LblPhishing";
    private String keyBLblWrap="AutoBahn.Welcome.LblWrap";
    private String keyBtnCyberSecureLetsBegin="AutoBahn.Welcome.btnCyberSecureLetsBegin";
    private String keyLblTellPhishing="AutoBahn.Welcome.LblTellPhishing";
    private String keyLblPhishing_ProtectYourSelf="AutoBahn.Welcome.LblPhishing_ProtectYourSelf";
    private String keyLblPhishing_SecurityFeature="AutoBahn.Welcome.LblPhishing_SecurityFeature";
    private String keyLblPhishing_EnableYourBiometrics="AutoBahn.Welcome.LblPhishing_EnableYourBiometrics";
    private String keyLblPhishing_EnableYourNotifications="AutoBahn.Welcome.LblPhishing_EnableYourNotifications";
    private String keyLblPhishing_ThatsAWrap="AutoBahn.Welcome.LblPhishing_ThatsAWrap";
    private String keyLblPhishing_YesIUnderStand="AutoBahn.Welcome.LblPhishing_YesIUnderStand";
    private String keyBtnPhishing_Nex="AutoBahn.Welcome.BtnPhishing_Next";



    public void verifyLoginPageContents() throws ApplicationException {
        verify.elementIsPresent(keyIMGLogo);
        verify.elementIsPresent(keyTxtEmailAddress);
        verify.elementIsPresent(keyTxtPassword);
        verify.elementIsPresent(keyBtnToogleVisibiliyTool);
        verify.elementIsPresent(keyBtnLogin);
        // verify.elementAttributeMatching(keyLinkForgotPassword,"text","Forgot Password");
        verify.elementAttributeMatching(keyBtnLearnMore, "text", "Learn More");

    }

    public void enterEmailAddress(String iemail) throws ApplicationException {
        //type.data(keyTxtEmailAddress, iemail, true);
        type.ClickAndEnterdata(keyTxtEmailAddress, iemail);

    }

    public void enterPassword(String ipassword) throws ApplicationException {
        //type.data(keyTxtPassword, ipassword, true);
        type.ClickAndEnterdata(keyTxtPassword, ipassword);

    }


    public void clickLogin() throws ApplicationException {
        click.elementBy(keyBtnLogin);
        WAIT.forSeconds(8);

    }
    public void clickSecureMessages() throws ApplicationException {
        if (verify.elementIsPresentReturn(keyBtnCyberSecureLetsBegin) == true) {
           // click.elementBy(keyLblCyberSecure);
           // WAIT.forSeconds(2);
           // click.elementBy(keyLblPhishing);
           // WAIT.forSeconds(2);
           // click.elementBy(keyBLblWrap);
            click.elementBy(keyBtnCyberSecureLetsBegin);
            //verify.elementIsPresent(keyLblCyberSecure);
            click.elementBy(keyBtnPhishing_Nex);
            verify.elementIsPresent(keyLblTellPhishing);
            click.elementBy(keyBtnPhishing_Nex);
            verify.elementIsPresent(keyLblPhishing_ProtectYourSelf);
            click.elementBy(keyBtnPhishing_Nex);
            verify.elementIsPresent(keyLblPhishing_SecurityFeature);
            click.elementBy(keyBtnPhishing_Nex);
            verify.elementIsPresent(keyLblPhishing_EnableYourBiometrics);
            click.elementBy(keyBtnPhishing_Nex);
            verify.elementIsPresent(keyLblPhishing_EnableYourNotifications);
            click.elementBy(keyBtnPhishing_Nex);
            verify.elementIsPresent(keyLblPhishing_ThatsAWrap);
           // click.elementBy(keyBtnPhishing_Nex);
            //verify.elementIsPresent(keyLblPhishing_YesIUnderStand);
            click.elementBy(keyLblPhishing_YesIUnderStand);
        }
    }

    public void logincachelogic(String username, String password) throws ApplicationException {
        if (Device.isAndroid()) {
            WAIT.forSeconds(3);
            //if (verify.elementIsPresentReturn(keyBtnTestShoutout_Woohoo) == true) {
               // click.elementBy(keyBtnTestShoutout_Woohoo);
           // }
            WAIT.forSeconds(2);
            try {
                String Cacheduserid = get.elementBy(keyLblUserName).getText().trim();
                if (get.elementBy(keyLblUserName).isDisplayed() && Cacheduserid.toLowerCase().contentEquals(PropertyReader.testDataOf(username + "_name").toLowerCase().trim())) {

                    click.elementBy(keyBtnusePassword);
                    enterPassword(password);

                } else {
                    click.elementBy(keyLblUserName);
                    enterEmailAddress(username);
                    enterPassword(password);

                }
            } catch (Exception ex) {
                enterEmailAddress(username);
                enterPassword(password);
            }
        }
    else if(Device.isIOS())


        {
           // if (verify.elementIsPresentReturn(keyBtnTestShoutout_Woohoo)==true) {
             //   click.elementBy(keyBtnTestShoutout_Woohoo);
           // }

            String uname=PropertyReader.testDataOf(username+"_name");
            try {
               // String Cacheduserid = get.elementBy(xpathOf.button(Matching.youDecide(uname))).getText().trim();
               // String Cacheduserid = get.elementBy(By.xpath("(//XCUIElementTypeButton)[1]")).getText().trim();
                String Cacheduserid = get.elementBy(keyLblUserName).getText().trim();
                if (get.elementBy(keyLblUserName).isDisplayed() && Cacheduserid.toLowerCase().contentEquals(uname.toLowerCase().trim())) {

                    click.elementBy(keyBtnusePassword);
                    enterPassword(password);

                } else {
                    click.elementBy(keyLblUserName);
                    enterEmailAddress(username);
                    enterPassword(password);

                }
            } catch (Exception ex) {
                click.elementBy(By.xpath("(//XCUIElementTypeButton)[1]"));
                WAIT.forSeconds(2);
                enterEmailAddress(username);
                enterPassword(password);
            }


        }
    }
    public void clickLearnMoreOption() throws ApplicationException {
        click.elementBy(keyBtnLearnMore);
        WAIT.forSeconds(1);
    }
    public void clickForgotPassword() throws ApplicationException {
        click.elementBy(keyLinkForgotPassword);
        WAIT.forSeconds(1);
    }
    public void closePrivacyOptionwhileLogin() {
        try {
            WAIT.forSeconds(8);
            if (get.elementBy(keyLblLoginPrivacyAlertMessage).isDisplayed()) {
                click.elementBy(keyBtnLoginPrivacyAlertNotNow);
                WAIT.forSeconds(2);

            }
        }catch(Exception e){

        }
    }
    public void logincachelogicNoHideKeybordLogic(String username, String password) throws ApplicationException {
        if (Device.isAndroid()) {
            try {
                String Cacheduserid = get.elementBy(keyLblUserName).getText().trim();
                if (get.elementBy(keyLblUserName).isDisplayed() && Cacheduserid.toLowerCase().contentEquals(PropertyReader.testDataOf(username+"_name").toLowerCase().trim())) {

                    click.elementBy(keyBtnusePassword);
                    type.Enterdata(keyTxtPassword, password);

                } else {
                    click.elementBy(keyLblUserName);
                    enterEmailAddress(username);
                    type.Enterdata(keyTxtPassword, password);
                }
            } catch (Exception ex) {
                enterEmailAddress(username);
                type.Enterdata(keyTxtPassword, password);
            }
        }
        else if(Device.isIOS())
        {
            String uname=PropertyReader.testDataOf(username+"_name");
            try {
                // String Cacheduserid = get.elementBy(xpathOf.button(Matching.youDecide(uname))).getText().trim();
                // String Cacheduserid = get.elementBy(By.xpath("(//XCUIElementTypeButton)[1]")).getText().trim();
                String Cacheduserid = get.elementBy(keyLblUserName).getText().trim();
                if (get.elementBy(keyLblUserName).isDisplayed() && Cacheduserid.toLowerCase().contentEquals(uname.toLowerCase().trim())) {

                    click.elementBy(keyBtnusePassword);
                    //type.Enterdata(keyTxtPassword, password);
                } else {
                    click.elementBy(keyLblUserName);
                    enterEmailAddress(username);
                   // type.Enterdata(keyTxtPassword, password);
                }
            } catch (Exception ex) {
                click.elementBy(By.xpath("(//XCUIElementTypeButton)[1]"));
                enterEmailAddress(username);
                //type.Enterdata(keyTxtPassword, password);
            }
        }
    }


}
