package actions;

import base.Keywords;
import com.google.common.collect.ImmutableMap;
import exceptions.ApplicationException;
import helper.Device;
import helper.PropertyReader;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.TouchAction;
import io.appium.java_client.android.AndroidDriver;
//import io.appium.java_client.android.AndroidKeyCode;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import org.apache.log4j.Logger;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;

public class Type extends Keywords {

    private static Logger log = Logger.getLogger(Type.class);

    public void data(String locatorKey, String value) throws ApplicationException {
        log.info("Type the value [" + value + "] into element [" + locatorKey + "]");
        try {
            get.elementBy(locatorKey).clear();

            if(Device.isAndroid()) {
                get.elementBy(locatorKey).sendKeys(value);
            }
            else
            {
                driver.findElement(PropertyReader.locatorOf(locatorKey)).setValue(value);
            }
        } catch (StaleElementReferenceException ex) {
            get.elementBy(locatorKey).sendKeys(value);
        }
        if (Device.isAndroid()) {
            keyboard.hideAndroid();
        } else if (Device.isIOS()) {
            keyboard.hideAutoBahnIOS();
        }
        log.info("Type Successful!");
    }

    public void dataSendKeys(String locatorKey, String argValue) throws ApplicationException {
        //log.info("Type the value [" + argValue + "] into element [" + locatorKey + "]");
        try {
            driver.executeScript("mobile: performEditorAction", ImmutableMap.of("action", "Go"));
           /* if(Device.isAndroid()) {
                get.elementBy(locatorKey).sendKeys(argValue,Keys.ENTER);
            }
            else
            {
                driver.findElement(PropertyReader.locatorOf(locatorKey)).setValue(argValue);
            }*/
        } catch (StaleElementReferenceException ex) {
            get.elementBy(locatorKey).sendKeys(argValue);
        }
        if (Device.isAndroid()) {
            keyboard.hideAndroid();
        } else if (Device.isIOS()) {
            keyboard.hideAutoBahnIOS();
        }
        log.info("keys Sent Successful!");
    }
    public void sensitiveData(String locatorKey, String value) throws ApplicationException {
        log.info("Type the value [" + value.substring(0, 2) + "*****] into element [" + locatorKey + "]");
        try {
            if(Device.isAndroid()) {
                get.elementBy(locatorKey).sendKeys(value);
            }
            else
            {
                driver.findElement(PropertyReader.locatorOf(locatorKey)).setValue(value);
            }
        } catch (StaleElementReferenceException ex) {
            get.elementBy(locatorKey).sendKeys(value);
        }
        keyboard.hideAutoBahnIOS();
        log.info("Type Successful!");
    }

    public void data(By locator, String value) throws ApplicationException {
        log.info("Type the value [" + value + "] into element [" + locator + "]");
        get.elementBy(locator).clear();
        get.elementBy(locator).sendKeys(value);
        keyboard.hideIfIOS();
        log.info("Type Successful!");
    }

    public void emptydataIOS(String locator) throws ApplicationException {
        click.elementBy(PropertyReader.locatorOf(locator));
        click.elementBy(MobileBy.AccessibilityId("Clear text"));
        keyboard.hideIfIOS();
        log.info("Type Successful!");
    }

    public void OTPdata(String locator, String value) throws ApplicationException {
        log.info("Type the value [" + value + "] into element [" + locator + "]");
        get.elementBy(locator).sendKeys(value);
        log.info("Type Successful!");
    }

    public void sensitiveData(By locator, String value) throws ApplicationException {
        log.info("Type the value [" + value.substring(0, 2) + "*****] into element [" + locator + "]");
        get.elementBy(locator).sendKeys(value);
        keyboard.hideIfIOS();
        log.info("Type Successful!");
    }

    public void data(String locatorKey, String value, boolean hideKeyboard) throws ApplicationException {
        log.info("Type the value [" + value + "] into element [" + locatorKey + "]");
        //  click.elementBy(locatorKey);
        get.elementBy(locatorKey).clear();
        get.elementBy(locatorKey).sendKeys(value);
        if (hideKeyboard) {
            if (Device.isAndroid()) {
                keyboard.hideAndroid();
            } else if (Device.isIOS()) {
                keyboard.hideAutoBahnIOS();
            }
        }

        log.info("Type Successful!");
    }

    public void sensitiveData(String locatorKey, String value, boolean hideKeyboard) throws ApplicationException {
        log.info("Type the value [" + value.substring(0, 2) + "*****] into element [" + locatorKey + "]");
        get.elementBy(locatorKey).sendKeys(value);
        if (hideKeyboard) {
            if (Device.isAndroid()) {
                keyboard.hideAndroid();
            } else if (Device.isIOS()) {
                keyboard.hideAutoBahnIOS();
            }
        }
        log.info("Type Successful!");
    }

    public void data(By locator, String value, boolean hideKeyboard) throws ApplicationException {
        log.info("Type the value [" + value + "] into element [" + locator + "]");
        get.elementBy(locator).sendKeys(value);
        if (hideKeyboard) {
            keyboard.hideAndroid();
        }
        log.info("Type Successful!");
    }

    public void sensitiveData(By locator, String value, boolean hideKeyboard) throws ApplicationException {
        log.info("Type the value [" + value.substring(0, 2) + "*****] into element [" + locator + "]");
        get.elementBy(locator).sendKeys(value);
        if (hideKeyboard) {
            keyboard.hideAndroid();
        }
        log.info("Type Successful!");
    }

    public void sensitiveDataNoclear(String locatorKey, String value) throws ApplicationException {
        try {
            get.elementBy(locatorKey).sendKeys(value);
        } catch (StaleElementReferenceException ex) {
            get.elementBy(locatorKey).sendKeys(value);
        }
        keyboard.hideIfIOS();
        log.info("Type Successful!");
    }
    public void ClickAndEnterdata(String locatorKey, String value) throws ApplicationException {
        log.info("Type the value [" + value + "] into element [" + locatorKey + "]");
        try {
            driver.findElement(PropertyReader.locatorOf(locatorKey)).clear();
            driver.findElement(PropertyReader.locatorOf(locatorKey)).setValue(value);
            //  get.elementBy(locatorKey).click();
           // get.elementBy(locatorKey).clear();
           // get.elementBy(locatorKey).sendKeys(value);
        } catch (StaleElementReferenceException ex) {
            get.elementBy(locatorKey).click();
           get.elementBy(locatorKey).clear();
            get.elementBy(locatorKey).sendKeys(value);
        }
        if (Device.isAndroid()) {
            keyboard.hideAndroid();
        } else if (Device.isIOS()) {
            keyboard.hideAutoBahnIOS();
        }
        log.info("Type Successful!");
    }


    public void SetValueWithClick(String locatorKey, String value) throws ApplicationException {
        log.info("Type the value [" + value + "] into element [" + locatorKey + "]");
        try {
            driver.findElement(PropertyReader.locatorOf(locatorKey)).click();
            driver.findElement(PropertyReader.locatorOf(locatorKey)).clear();
            driver.findElement(PropertyReader.locatorOf(locatorKey)).setValue(value);
        } catch (StaleElementReferenceException ex) {
            driver.findElement(PropertyReader.locatorOf(locatorKey)).click();
            driver.findElement(PropertyReader.locatorOf(locatorKey)).clear();
            get.elementBy(locatorKey).sendKeys(value);
        }
        log.info("Type Successful!");
    }

    public void setValueWithoutClearing(String locatorKey, String value) throws ApplicationException {
        log.info("Type the value [" + value + "] into element [" + locatorKey + "]");
        try {
            driver.findElement(MobileBy.AccessibilityId("remarks-field")).setValue(value);

        } catch (StaleElementReferenceException ex) {
            get.elementBy(locatorKey).sendKeys(value);
        }
        if (Device.isAndroid()) {
            keyboard.hideAndroid();
        } else if (Device.isIOS()) {
            keyboard.hideAutoBahnIOS();
        }
        log.info("Type Successful!");
    }

    public void dataByJavaScriptexecutor(String locatorKey, String value) throws ApplicationException {
        JavascriptExecutor jst= (JavascriptExecutor) driver;
        jst.executeScript("arguments[1].value = arguments[0]; ", value, driver.findElement(PropertyReader.locatorOf(locatorKey)));

    }
    public void EnterdataWithActionClass(String locatorKey, String value) throws ApplicationException {
       log.info("EnterdataWithActionClass the value [" + value + "] into element [" + locatorKey + "]");
        try {
         Actions act1=new Actions(driver);
        act1.moveToElement( get.elementBy(locatorKey)).sendKeys(value).build().perform();

        } catch (StaleElementReferenceException ex) {

        }

        log.info("Type Successful!");
    }
    public void Enterdata(String locatorKey, String value) throws ApplicationException {
        log.info("Type the value [" + value + "] into element [" + locatorKey + "]");
        try {
            driver.findElement(PropertyReader.locatorOf(locatorKey)).clear();
            driver.findElement(PropertyReader.locatorOf(locatorKey)).setValue(value);
            //  get.elementBy(locatorKey).click();
            // get.elementBy(locatorKey).clear();
            // get.elementBy(locatorKey).sendKeys(value);
        } catch (StaleElementReferenceException ex) {
            get.elementBy(locatorKey).click();
            get.elementBy(locatorKey).clear();
            get.elementBy(locatorKey).sendKeys(value);
        }

        log.info("Type Successful!");
    }


    public void dataForAndroidSearch(String locatorKey, String value) throws ApplicationException {
        log.info("Type the value [" + value + "] into element [" + locatorKey + "]");
        try {
            //get.elementBy(locatorKey).clear();
            get.elementBy(locatorKey).click();
            get.elementBy(locatorKey).sendKeys(value);

        } catch (StaleElementReferenceException ex) {
            get.elementBy(locatorKey).sendKeys(value);
        }

            keyboard.hideAndroid();

        log.info("Type Successful!");
    }


}