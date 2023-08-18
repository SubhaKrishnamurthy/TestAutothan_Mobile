package base;

import actions.*;
import driver.DriverManager;
import driver.DriverManagerFactory;
import exceptions.EnvironmentException;
import helper.PdfVerification;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.WebDriverWait;
import xpath.XPathManager;

public class Keywords {

    private static Logger log=Logger.getLogger(Keywords.class);

    public static AppiumDriver<MobileElement> driver;
    public static WebDriverWait wait;
    public static WebDriver driverweb ;
    public static WebDriverWait waitWeb;
    public static XPathManager xpathOf=new XPathManager();
    public static Get get=new Get();
    public static Click click=new Click();
    public static Keyboard keyboard=new Keyboard();
    public static Verify verify=new Verify();
    public static Wait WAIT=new Wait();
    public static Type type=new Type();
    public static Screenshot screenshot=new Screenshot();
    public static Swipe swipe=new Swipe();
    public static iOS ios=new iOS();
    public static CommonReuseMethodsWeb commonreusemethodsWeb=new CommonReuseMethodsWeb();
    public static PdfVerification pdfverification=new PdfVerification();

    public static CurrencyLocator currencylocator=new CurrencyLocator();

    public static void launchApplication() throws EnvironmentException {

        if(driver !=null){
            driver.launchApp();
        }else{
            DriverManager driverManager= DriverManagerFactory.getManager();
            try{
                driver=driverManager.getDriver();
                wait=driverManager.getWait();
            }catch (Throwable ex){
                throw new EnvironmentException("Driver failed to launch \n"+ex);
            }
        }
        log.info("Application launched");
    }

    public static void closeApplication(){

        if(driver!=null){
            driver.closeApp();
        }
        log.info("Application closed");
    }

    public static void quitDriver(){
        driver.closeApp();
        driver.quit();
    }
}