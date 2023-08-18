package pages;
import actions.Wait;
import base.Keywords;
import base.Test;
import exceptions.ApplicationException;
import helper.PropertyReader;
import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;


public class PageGeneralWebMethods {
    public static Wait WAIT=new Wait();



    private Logger weblog=Logger.getLogger(Keywords.class);
    public WebDriver driverweb;
    public WebDriverWait waitWeb;
    private WebElement WebsingleTestObj=null;

   public void initiateChromeDriver(String argstrURL) throws ApplicationException {
        System.setProperty("webdriver.chrome.driver","/Users/ubp/Downloads/chromedriver");
        driverweb=new ChromeDriver();
        driverweb.get(argstrURL);
        waitWeb=new WebDriverWait(driverweb,Integer.parseInt(PropertyReader.valueOf("WebDriver.Timeout").trim()));

    }


    public void switchtoFrame(String argstrFrame) throws ApplicationException {
        WebElement webElement1=driverweb.findElement(By.xpath("//iframe[@title='reCAPTCHA']"));
        driverweb.switchTo().frame(webElement1);
    }
    public void switchBackFromFrame() throws ApplicationException {

        driverweb.switchTo().defaultContent();
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
}catch(Exception e){

}

}

    public WebElement webElementBy(String locatorKey) throws ApplicationException {
        try{

            WebsingleTestObj=waitWeb.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
            //waitWeb.until(ExpectedConditions.elementToBeClickable(PropertyReader.locatorOf(locatorKey)));
        }
        catch(TimeoutException ex) {
            weblog.error("Element ["+locatorKey+"] not found!");
            throw new ApplicationException("Element ["+locatorKey+"] not found!");
        }catch(WebDriverException ex){
            WebsingleTestObj=waitWeb.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
        }
        return WebsingleTestObj;
    }
    public WebElement webElementByClickable(String locatorKey) throws ApplicationException {
        try{

            WebsingleTestObj=waitWeb.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
            waitWeb.until(ExpectedConditions.elementToBeClickable(PropertyReader.locatorOf(locatorKey)));
        }
        catch(TimeoutException ex) {
            weblog.error("Element ["+locatorKey+"] not found!");
            throw new ApplicationException("Element ["+locatorKey+"] not found!");
        }catch(WebDriverException ex){
            WebsingleTestObj=waitWeb.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
        }
        return WebsingleTestObj;
    }

    public String webElementText(String locatorKey) throws ApplicationException {
        weblog.info("Retrived the value of text property from the element ["+locatorKey+"]");
        String txt=null;
        try{
            txt=webElementBy(locatorKey).getText();
        }catch (WebDriverException ex){
            txt=webElementBy(locatorKey).getText();
        }
        weblog.info("Text ["+txt+"] retrieved successfully!");
        return txt.trim();
    }

    public void webElementIsPresent(String locatorKey) throws ApplicationException {
        weblog.info("Verify element ["+locatorKey+"] is present");
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
    public void webElementTextMatching(String locatorKey,String expectedValue) throws ApplicationException {

        weblog.info("Verify element ["+locatorKey+"] text is matching with ["+expectedValue+"]");
        String actualValue= Test.tools.REMOVE_MULTIPLE_SPACES_AND_NEW_LINES(webElementBy(locatorKey).getText().trim());
        try{
            try{
                Assert.assertEquals(expectedValue.trim().toLowerCase(),Test.tools.nbspRemove(actualValue).toLowerCase());
            }catch (AssertionError ex){
                weblog.info(ex);
                throw new ApplicationException(ex.getMessage());
            }
        }catch (Exception ex){
            weblog.error(ex.getMessage());
            throw new ApplicationException(ex.getMessage());
        }
        weblog.info("Condition verified!");
    }
    public void verifyTextFieldMatching(String locatorKey,String expectedValue) throws ApplicationException {

        weblog.info("Verify element ["+locatorKey+"] text is matching with ["+expectedValue+"]");
        String actualValue= Test.tools.REMOVE_MULTIPLE_SPACES_AND_NEW_LINES(webElementBy(locatorKey).getAttribute("value"));
        try{
            try{
                Assert.assertEquals(expectedValue.trim().toLowerCase(),Test.tools.nbspRemove(actualValue).toLowerCase());
            }catch (AssertionError ex){
                weblog.info(ex);
                throw new ApplicationException(ex.getMessage());
            }
        }catch (Exception ex){
            weblog.error(ex.getMessage());
            throw new ApplicationException(ex.getMessage());
        }
        weblog.info("Condition verified!");
    }
    public void webVerifyAttribute(String locatorKey,String Attribute,String ExpectedValue) throws ApplicationException {

        weblog.info("Verify element ["+locatorKey+"] Attribute" );
        try{
        String actualValue= Test.tools.REMOVE_MULTIPLE_SPACES_AND_NEW_LINES(webElementBy(locatorKey).getAttribute(Attribute).trim());

            try{
                Assert.assertEquals(ExpectedValue.trim().toLowerCase(),Test.tools.nbspRemove(actualValue).toLowerCase());
            }catch (AssertionError ex){
                weblog.info(ex);
                throw new ApplicationException(ex.getMessage());
            }
        }catch (Exception ex){
            weblog.error(ex.getMessage());
            throw new ApplicationException(ex.getMessage());
        }
        weblog.info("Condition verified!");
    }
    public void elementAttributeMatchingWeb(String locatorKey, String whichAttribute,String expectedValue) throws ApplicationException {
        weblog.info("Verify if the element ["+locatorKey+"] attribute ["+whichAttribute+"] is matching with the value ["+expectedValue+"]");
        try{
            String txt=webElementBy(locatorKey).getAttribute(whichAttribute.trim());
            Assert.assertEquals(expectedValue.trim(),txt);
        }catch (AssertionError ex){
            weblog.error(ex);
            throw new ApplicationException(ex.getMessage());
        }
    }

    public void webClick(String argLocator) throws ApplicationException {
        webElementByClickable(argLocator).click();
    }
    public void webVerifyElementPresent(String argLocator) throws ApplicationException {
        webElementBy(argLocator);
    }

    public void RefreshBrowser() throws ApplicationException {
        WAIT.forSeconds(10);
        driverweb.navigate().refresh();
        WAIT.forSeconds(5);
    }
    public void VerifyBrowserNotificationAndClose() throws ApplicationException {
        try {
            Alert promptAlert = waitWeb.until(ExpectedConditions.alertIsPresent());
            //promptAlert = driverweb.switchTo().alert();
            String text = promptAlert.getText();
            promptAlert.accept();
        }catch (Exception ex){
            throw new ApplicationException("Failed while waiting for the alert to display"+ex.getMessage());
        }

    }
















}
