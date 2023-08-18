package pages;

import base.Test;
import com.sun.jndi.toolkit.url.Uri;
import constants.Device;
import constants.Keys;
import exceptions.ApplicationException;
import helper.PropertyReader;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileDriver;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.remote.MobileCapabilityType;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.BrowserType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

public class OutlookValidation extends Test {


    public static void main(String[] args) throws ApplicationException, MalformedURLException, InterruptedException {
       /* AppiumDriver browser;

        DesiredCapabilities capabilities = new DesiredCapabilities();

        capabilities.setCapability("platformName", "ios");
        capabilities.setCapability("platformVersion", "11.4");
        capabilities.setCapability("deviceName", "iPhone X");
        capabilities.setCapability("automationName", "XCUITest");
        capabilities.setCapability("udid", "45449e003b676357da0b5132ae580dea52fa590d");
       // capabilities.setCapability("bundleId", "com.apple.mobilemail");
       // capabilities.setCapability("bundleId", "com.unionbankph.getgopay-QAT");
       // capabilities.setCapability("bundleId", "com.unionbankph.getgopay-QAT");
        //capabilities.setCapability("app", "/Users/ubp/Documents/GetGopayCode/Mobile/src/test/resources/apps/Getgo.ipa");
        capabilities.setCapability(MobileCapabilityType.BROWSER_NAME, "safari");
        //capabilities.setCapability("autoWebview", "true");
        //capabilities.setCapability("safariInitialUrl", "https://www.google.com/");

        //capabilities.setCapability("useNewWDA", true);
        //capabilities.setCapability("realDeviceLogger", "idevicesyslog");
        //capabilities.setCapability("noReset", false);
        //capabilities.setCapability("clearSystemFiles", true);
        //capabilities.setCapability("newCommandTimeout", 150000);
        //capabilities.setCapability("webkitResponseTimeout", 150000);

        browser = new IOSDriver(new URL("http://0.0.0.0:4723/wd/hub"), capabilities);
        browser.get("https://tms-jira.unionbankph.com/login.jsp?os_destination=%2Fsecure%2FRapidBoard.jspa%3FrapidView%3D58");
        Thread.sleep(10000);
        browser.findElement(By.id("login-form-username")).sendKeys("balabharathi.jayaraman");
        Thread.sleep(10000);
        browser.findElement(By.id("login-form-password")).sendKeys("NoisyBoy@23");
        browser.findElement(By.id("login-form-submit")).click();
        Thread.sleep(10000);
        browser.quit();


/*PropertyReader.dynamicWriteTestDataOf("forgotpassword_confirmpassword","testforgot1234");

      System.out.println(PropertyReader.dynamicReadTestDataOf("forgotpassword_confirmpassword"));
       PageVerificationLink verifyAccount=new PageVerificationLink();
        String deviceName=System.getProperty("Device");
        if(deviceName==null){
            deviceName=Device.TGSMOB2132;
            //deviceName=Device.TGSMOB2128;
        }
        setup(deviceName);
        String outlookUsername = PropertyReader.testDataOf("RegistrationEmailAddress");
        String outlookPassword = PropertyReader.testDataOf("outlookpassword");
        verifyAccount.openOutlook(outlookUsername, outlookPassword);
        verifyAccount.openVerificationEmail("testtt");
        */
    }


}
