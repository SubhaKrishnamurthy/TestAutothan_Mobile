import base.Keywords;
import base.Test;
import constants.Keys;
import exceptions.ApplicationException;
import helper.PropertyReader;
import io.appium.java_client.AppiumDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.BrowserType;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.net.URL;
import java.util.concurrent.TimeUnit;

public class testCase3 extends Keywords {

    public static void main(String[] args) throws ApplicationException {

        Test.attributes.put(Keys.Device,"TGSMOB2131");
        openOutlook("balabharathi.jayaraman@unionbankph.com","May@2018");
        openVerificationEmail("Shanon Kreiger");
    }

    static AppiumDriver<WebElement> browser;

    public static void openOutlook(String username, String password) throws ApplicationException{
       //driver.quit();
        DesiredCapabilities cap=new DesiredCapabilities();
        cap.setCapability("platformName","Android");
        cap.setCapability("platformVersion",PropertyReader.valueOf("Device."+Test.attributes.get(Keys.Device)+".Version"));
        cap.setCapability("deviceName", PropertyReader.valueOf("Device."+ Test.attributes.get(Keys.Device)+".Name"));
        cap.setCapability("udid", PropertyReader.valueOf("Device."+ Test.attributes.get(Keys.Device)+".ID"));
        cap.setCapability("newCommandTimeout",Integer.parseInt(PropertyReader.valueOf("Driver.Appium.CommandTimeout")));
        cap.setCapability("browserName",BrowserType.CHROME);
        try{
            browser=new AppiumDriver<>(new URL(PropertyReader.valueOf("Driver.ServerAddress")),cap);
        }catch (Throwable ex){
            throw new ApplicationException("Failed to open chrome browser on the device");
        }
        browser.get("https://outlook.office.com");
        browser.manage().timeouts().implicitlyWait(20,TimeUnit.SECONDS);
        browser.findElement(By.name("loginfmt")).sendKeys(username);
        browser.findElement(By.id("idSIButton9")).click();
        WAIT.forSeconds(2);
        browser.findElement(By.id("i0118")).sendKeys(password);
        browser.findElement(By.id("idSIButton9")).click();
        WAIT.forSeconds(2);
        browser.findElement(By.id("idBtn_Back")).click();
        WAIT.forSeconds(2);
    }

    public static void openVerificationEmail(String fullName){
        browser.findElement(By.xpath("//span[contains(text(),'"+fullName+"')]")).click();
        WAIT.forSeconds(5);
        String verificationLink= browser.findElement(By.xpath("//a[contains(text(),'https://')]")).getText();
        browser.get(verificationLink);
    }

}
