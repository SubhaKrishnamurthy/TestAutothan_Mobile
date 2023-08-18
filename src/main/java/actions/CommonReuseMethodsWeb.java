package actions;

import base.Keywords;
import base.Test;
import exceptions.ApplicationException;
import helper.PropertyReader;
import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.HashMap;

public class CommonReuseMethodsWeb extends Keywords{
    //public static Wait WAIT = new Wait();


    public Logger weblog = Logger.getLogger(Keywords.class);

    private WebElement WebsingleTestObj = null;


   /* public void initiateChromeDriver(String argstrURL) throws ApplicationException {
        System.setProperty("webdriver.chrome.driver", "/Users/apple/Downloads/chromedriver");
        driverweb =new ChromeDriver();
        driverweb.get(argstrURL);
        waitWeb = new WebDriverWait(driverweb, Integer.parseInt(PropertyReader.valueOf("WebDriver.Timeout").trim()));

    }*/
    public void initiateChromeDriver(String argstrURL) throws ApplicationException {
        System.setProperty("webdriver.chrome.driver", "/Users/apple/Downloads/chromedriver");
        driverweb =new ChromeDriver(loadChromeProfile("/Users/apple/Documents/PORTALSME/src/test/resources/pdfDownloads"));
        driverweb.get(argstrURL);
        waitWeb = new WebDriverWait(driverweb, Integer.parseInt(PropertyReader.valueOf("WebDriver.Timeout").trim()));


    }
    public DesiredCapabilities loadChromeProfile(String downloadFilepath) {
        weblog.info("Loading profiles for Chrome driver");
        HashMap<String, Object> pref = new HashMap<String, Object>();
        pref.put("profile.default_content_settings.popups", 0);
        pref.put("download.default_directory", downloadFilepath);
        pref.put("plugins.always_open_pdf_externally", true);
        ChromeOptions options = new ChromeOptions();
        // To Run on Headless Mode

        options.addArguments("--disable-extensions");
        HashMap<String, Object> chromeOptionsMap = new HashMap<String, Object>();
        options.setExperimentalOption("prefs", pref);
        DesiredCapabilities cap = DesiredCapabilities.chrome();
        cap.setCapability(ChromeOptions.CAPABILITY, chromeOptionsMap);
        cap.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
        cap.setCapability(ChromeOptions.CAPABILITY, options);

        return cap;
    }

    public void waituntillElementVisible(String locatorKey, int waitSeconds)  {
        try {
            WebDriverWait webwait1 = new WebDriverWait(driverweb, waitSeconds);
            webwait1.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
        }catch(Exception e){

        }
    }

    public String getGenericURL(String argstrURL) throws ApplicationException {
        //argstrURL= argstrURL.substring(0, ()) + argstrURL.substring(11, argstrURL.length());
        argstrURL = argstrURL.substring(0, (argstrURL.length() - 15));
        return argstrURL;
    }

    public void enterTextJavaScript(String argstrURL) throws ApplicationException{

    WebElement userNameTxt = driverweb.findElement(By.xpath("//input[@name='challengeDataEntry']"));
    JavascriptExecutor jsExecutor = (JavascriptExecutor) driverweb;
// set the text

    jsExecutor.executeScript("arguments[0].value='1234'",userNameTxt);


    }

    public void switchFrame(String argstrURL) throws ApplicationException{

        driverweb.switchTo().frame(argstrURL);

        //driverweb.findElement(By.xpath("//input[@name='challengeDataEntry']")).sendKeys("1234");
    }
    public void switchBackFromFrame() throws ApplicationException{

        driverweb.switchTo().defaultContent();

        //driverweb.findElement(By.xpath("//input[@name='challengeDataEntry']")).sendKeys("1234");
    }


    /* public void initiateChromeDriver(String argstrURL) throws ApplicationException, InterruptedException {
         System.setProperty("webdriver.chrome.driver","/Users/ubp/Downloads/chromedriver");
         ChromeOptions options = new ChromeOptions();

         options.addArguments("--disable-popup-blocking");
         driverweb=new ChromeDriver(options);
         driverweb.get("https://ubotpsentry-tst1.outsystemsenterprise.com/msmegateway/Neon/012134918186651");

         waitWeb=new WebDriverWait(driverweb,Integer.parseInt(PropertyReader.valueOf("WebDriver.Timeout").trim()));

         Alert alert = driverweb.switchTo().alert();
         Thread.sleep(4000);
        // alert.dismiss();
                String text= alert.getText();
         alert.accept();

         Thread.sleep(3000);
         alert.sendKeys("ENTER");

     }*/
    public void switchtoFrame(String argstrFrame) throws ApplicationException {
        WebElement webElement1 = driverweb.findElement(By.xpath("//iframe[@title='reCAPTCHA']"));
        driverweb.switchTo().frame(webElement1);
    }



    public void CloseChromeDriver() throws ApplicationException {
        driverweb.close();
        driverweb.quit();
    }

    public void scrollToelement(String locatorKey) throws ApplicationException {
        try {
            WebElement element = driverweb.findElement(PropertyReader.locatorOf(locatorKey));
            ((JavascriptExecutor) driverweb).executeScript("arguments[0].scrollIntoView(true);", element);
            Thread.sleep(2000);
        } catch (Exception e) {

        }

    }

    public WebElement webElementBy(String locatorKey) throws ApplicationException {
        try {

            WebsingleTestObj = waitWeb.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
            //waitWeb.until(ExpectedConditions.elementToBeClickable(PropertyReader.locatorOf(locatorKey)));
        } catch (TimeoutException ex) {
            weblog.error("Element [" + locatorKey + "] not found!");
            throw new ApplicationException("Element [" + locatorKey + "] not found!");
        } catch (WebDriverException ex) {
            WebsingleTestObj = waitWeb.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
        }
        return WebsingleTestObj;
    }

    public WebElement webElementByClickable(String locatorKey) throws ApplicationException {
        try {

            WebsingleTestObj = waitWeb.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
            //waitWeb.until(ExpectedConditions.elementToBeClickable(PropertyReader.locatorOf(locatorKey)));
        } catch (TimeoutException ex) {
            weblog.error("Element [" + locatorKey + "] not found!");
            throw new ApplicationException("Element [" + locatorKey + "] not found!");
        } catch (WebDriverException ex) {
            WebsingleTestObj = waitWeb.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
        }
        return WebsingleTestObj;
    }

    public WebElement webisElementDisplayed(String locatorKey)  {
        try {

            WebsingleTestObj = waitWeb.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
            waitWeb.until(ExpectedConditions.elementToBeClickable(PropertyReader.locatorOf(locatorKey)));
        } catch (TimeoutException ex) {
            weblog.info("Element [" + locatorKey + "] not found!");
            //throw new ApplicationException("Element [" + locatorKey + "] not found!");
            return null;
        } catch (WebDriverException ex) {

            return null;
        }
        return WebsingleTestObj;
    }

    public String webElementText(String locatorKey) throws ApplicationException {
        weblog.info("Retrived the value of text property from the element [" + locatorKey + "]");
        String txt = null;
        try {
            txt = webElementBy(locatorKey).getText();
        } catch (WebDriverException ex) {
            txt = webElementBy(locatorKey).getText();
        }
        weblog.info("Text [" + txt + "] retrieved successfully!");
        return txt.trim();
    }

    public void webElementIsPresent(String locatorKey) throws ApplicationException {
        weblog.info("Verify element [" + locatorKey + "] is present");
        webElementBy(locatorKey);
        weblog.info("Element is present!");
    }

    public void webData(String locatorKey, String value) throws ApplicationException {
        weblog.info("Type the value [" + value + "] into element [" + locatorKey + "]");
        try {
            webElementByClickable(locatorKey).clear();
            webElementByClickable(locatorKey).sendKeys(value);
        } catch (StaleElementReferenceException ex) {
            webElementBy(locatorKey).sendKeys(value);
        }

    }

    public void webElementTextMatching(String locatorKey, String expectedValue) throws ApplicationException {

        weblog.info("Verify element [" + locatorKey + "] text is matching with [" + expectedValue + "]");
        String actualValue = Test.tools.REMOVE_MULTIPLE_SPACES_AND_NEW_LINES(webElementBy(locatorKey).getText().trim());
        try {
            try {
                Assert.assertEquals(expectedValue.trim().toLowerCase(), Test.tools.nbspRemove(actualValue).toLowerCase());
            } catch (AssertionError ex) {
                weblog.info(ex);
                throw new ApplicationException(ex.getMessage());
            }
        } catch (Exception ex) {
            weblog.error(ex.getMessage());
            throw new ApplicationException(ex.getMessage());
        }
        weblog.info("Condition verified!");
    }

    public void verifyTextFieldMatching(String locatorKey, String expectedValue) throws ApplicationException {

        weblog.info("Verify element [" + locatorKey + "] text is matching with [" + expectedValue + "]");
        String actualValue = Test.tools.REMOVE_MULTIPLE_SPACES_AND_NEW_LINES(webElementBy(locatorKey).getAttribute("value"));
        try {
            try {
                Assert.assertEquals(expectedValue.trim().toLowerCase(), Test.tools.nbspRemove(actualValue).toLowerCase());
            } catch (AssertionError ex) {
                weblog.info(ex);
                throw new ApplicationException(ex.getMessage());
            }
        } catch (Exception ex) {
            weblog.error(ex.getMessage());
            throw new ApplicationException(ex.getMessage());
        }
        weblog.info("Condition verified!");
    }

    public void webVerifyAttribute(String locatorKey, String Attribute, String ExpectedValue) throws ApplicationException {

        weblog.info("Verify element [" + locatorKey + "] Attribute");
        try {
            String actualValue = Test.tools.REMOVE_MULTIPLE_SPACES_AND_NEW_LINES(webElementBy(locatorKey).getAttribute(Attribute).trim());

            try {
                Assert.assertEquals(ExpectedValue.trim().toLowerCase(), Test.tools.nbspRemove(actualValue).toLowerCase());
            } catch (AssertionError ex) {
                weblog.info(ex);
                throw new ApplicationException(ex.getMessage());
            }
        } catch (Exception ex) {
            weblog.error(ex.getMessage());
            throw new ApplicationException(ex.getMessage());
        }
        weblog.info("Condition verified!");
    }
    public void clickVerifyException(String locatorKey, String Exception) throws ApplicationException {

        weblog.info("Click and verifyException [" + locatorKey + "] Object for  ElementClickInterceptedException");
        try {
            waitWeb.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey))).click();
        } catch  (ElementClickInterceptedException e){
            System.out.println("Checking clickable status");
        } catch (AssertionError ex) {
            weblog.error(ex);
            throw new ApplicationException(ex.getMessage());
        }
    }
    public void elementAttributeMatchingWeb(String locatorKey, String whichAttribute, String expectedValue) throws ApplicationException {
        weblog.info("Verify if the element [" + locatorKey + "] attribute [" + whichAttribute + "] is matching with the value [" + expectedValue + "]");
        try {
            String txt = webElementBy(locatorKey).getAttribute(whichAttribute.trim());
            Assert.assertEquals(expectedValue.trim(), txt);
        } catch (AssertionError ex) {
            weblog.error(ex);
            throw new ApplicationException(ex.getMessage());
        }
    }
    public void BooleanWebElementNotPresent(String locatorKey) throws ApplicationException {

        boolean ireturn=false;
        weblog.info("Verify element ["+locatorKey+"] Not Present on Page");
        try{
            String actualValue=Test.tools.REMOVE_MULTIPLE_SPACES_AND_NEW_LINES(webElementText(locatorKey));
            ireturn=true;
            throw new ApplicationException("Application exist on page which is not expected");
        }catch (Exception ex){
            weblog.info(ex.getMessage());
            weblog.info("Object is not present on Page as expected.");
            //ireturn=false;
            //throw new ApplicationException(ex.getMessage());
        }
        weblog.info("Condition verified!");
        //return ireturn;
    }

    public void webClick(String argLocator) throws ApplicationException {

        webElementByClickable(argLocator).click();
    }


    public void webVerifyElementPresent(String argLocator) throws ApplicationException {
        waituntillElementVisible(argLocator,5);
        webElementBy(argLocator);
    }

    public void maximizeChrome() throws ApplicationException {
        driverweb.manage().window().maximize();
    }
    public void selectDropdown(String argLocator, String selectValue) throws ApplicationException, InterruptedException {
        driverweb.findElement(By.tagName("body")).sendKeys(Keys.HOME);
        String DropdownID = webElementByClickable(argLocator).getAttribute("id");
        driverweb.findElement(By.id(DropdownID)).click();
        Actions A = new Actions(driverweb);
        A.sendKeys(selectValue).perform();
        A.sendKeys(Keys.ENTER).perform();
        Thread.sleep(5000);
    }

    public void PortalNavigation() throws ApplicationException, InterruptedException {
        Thread.sleep(20000);
        driverweb.findElement(By.xpath("//input[@id='Input_UsernameVal']")).sendKeys("mkattamanchi@unionbankph.com");
        driverweb.findElement(By.xpath("//input[@id='Input_PasswordVal']")).sendKeys("P@ssw0rd");
        driverweb.findElement(By.xpath("//button[@class='btn btn-primary OSFillParent']")).click();
        Thread.sleep(10000);
        driverweb.findElement(By.xpath("//input[@class='form-control OSFillParent']")).sendKeys("111111");
        driverweb.findElement(By.xpath("//button[@type='submit']")).click();
        Thread.sleep(35000);
        driverweb.findElement(By.xpath("//span[text()='Fund Transfer']")).click();
        Thread.sleep(5000);
        driverweb.findElement(By.xpath("(//div[@class='card rounded w-100 cursor-pointer'])[1]")).click();
       }

    }

