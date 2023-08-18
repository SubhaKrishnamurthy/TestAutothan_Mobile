package actions;

import base.Keywords;
import base.Test;
import constants.Keys;
import constants.OS;
import exceptions.ApplicationException;
import io.appium.java_client.MobileBy;
import io.appium.java_client.TouchAction;
import io.appium.java_client.touch.TapOptions;
import io.appium.java_client.touch.WaitOptions;
import io.appium.java_client.touch.offset.PointOption;
import org.apache.log4j.Logger;
import org.openqa.selenium.*;
import org.openqa.selenium.remote.RemoteWebElement;
import xpath.Matching;

import java.time.Duration;
import java.util.HashMap;
import java.util.Map;

public class Swipe extends Keywords {

    private static Logger log = Logger.getLogger(Swipe.class);

    public void scrollDownToText(String searchText) throws ApplicationException {
        searchText = searchText.trim();
        if (Test.attributes.get(Keys.OS).equalsIgnoreCase(OS.ANDROID)) {
            try {
                driver.findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                ));
            } catch (WebDriverException e) {
                WAIT.forSeconds(5);
                driver.findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                ));
            } catch (Throwable ex) {
                log.error(ex.getMessage());
                throw new ApplicationException("Element not found!" + ex.getMessage());
            }
            log.info("Scrolled to the element matching the text --> " + searchText);
        } else {
           /* try {
                boolean found = false;
                JavascriptExecutor js = driver;
                HashMap scrollObject = new HashMap<>();
                scrollObject.put("predicateString", "value == '" + searchText + "'");
                scrollObject.put("direction", "down");
                int toleranceTime = 50;
                int i = 0;
                js.executeScript("mobile: scroll", scrollObject);
                while (!( driver.findElement(MobileBy.AccessibilityId(searchText)).isDisplayed() )) {
                    i += 1;
                    js.executeScript("mobile: scroll", scrollObject);
                    if (i > toleranceTime) {
                        break;
                    }
                    if (driver.findElement(MobileBy.AccessibilityId(searchText)).isDisplayed()) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    log.error("Element matching the text " + searchText + " is not found");
                    throw new ApplicationException("Element matching the text " + searchText + " is not found");
                }
                log.info("Scrolled to the element matching the text --> " + searchText);
                //driver.findElement(MobileBy.AccessibilityId("Done")).click();

            } catch (Throwable ex) {
                log.error(ex.getMessage());
                ex.printStackTrace();

            }
            */


            {
                try {
                    boolean found = false;
                    JavascriptExecutor js = driver;
                    HashMap scrollObject = new HashMap<>();
                    scrollObject.put("predicateString", "name == '" + searchText + "'");
                    scrollObject.put("direction", "down");
                    int toleranceTime = 50;
                    int i = 0;
                    js.executeScript("mobile: scroll", scrollObject);
                    while (!(driver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='" + searchText + "']/parent::*")).isDisplayed())) {
                        i += 1;
                        js.executeScript("mobile: scroll", scrollObject);
                        if (i > toleranceTime) {
                            break;
                        }
                        if (driver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='" + searchText + "']/parent::*")).isDisplayed()) {
                            driver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='" + searchText + "']/parent::*")).click();
                            found = true;
                            break;
                        }
                        swipe.vertical(2, 0.8, 0.4, 5);
                    }
                    if (!found) {
                        log.error("Element matching the text " + searchText + " is not found");
                        throw new ApplicationException("Element matching the text " + searchText + " is not found");
                    }
                    log.info("Scrolled to the element matching the text --> " + searchText);
                    //driver.findElement(MobileBy.AccessibilityId("Done")).click();

                } catch (Throwable ex) {
                    log.error(ex.getMessage());
                    ex.printStackTrace();

                }
            }
        }
    }


    public void vertical(int divideScreenInto, double startPointPercentage, double endPointPercentage) throws ApplicationException {
        try {
            Dimension size = driver.manage().window().getSize();
            int x = size.width / divideScreenInto;
            int startPoint = (int) (size.height * startPointPercentage);
            int endPoint = (int) (size.height * endPointPercentage);
            log.info("Swipe vertically from {" + startPoint + "} to {" + endPoint + "}");
            new TouchAction(driver).press(PointOption.point(x, startPoint)).moveTo(PointOption.point(x, endPoint)).release().perform();
            log.info("Swiped!");
        } catch (Throwable e) {
            throw new ApplicationException(e.getMessage());
        }
    }

    public void vertical(int divideScreenInto, double startPointPercentage, double endPointPercentage, double slowDownDurationInSeconds) throws ApplicationException {
        WAIT.forSeconds(1);
        Dimension size = driver.manage().window().getSize();
        int x = size.width / divideScreenInto;
        int startPoint = (int) (size.height * startPointPercentage);
        int endPoint = (int) (size.height * endPointPercentage);
        log.info("Slowly swipe vertically from {" + startPoint + "} to {" + endPoint + "}");
        try {
            new TouchAction(driver).press(PointOption.point(x, startPoint)).waitAction(new WaitOptions().withDuration(Duration.ofSeconds((long) slowDownDurationInSeconds))).moveTo(PointOption.point(x, endPoint)).release().perform();
        } catch (WebDriverException e) {
            new TouchAction(driver).press(PointOption.point(x, startPoint)).waitAction(new WaitOptions().withDuration(Duration.ofSeconds((long) slowDownDurationInSeconds))).moveTo(PointOption.point(x, endPoint)).release().perform();
        } catch (Throwable e) {
            throw new ApplicationException(e.getMessage());
        }
        log.info("Swiped!");
        WAIT.forSeconds(2);
    }

    public void scrollDownToTextandClick(String searchText) throws ApplicationException {
        searchText = searchText.trim();
        int toleranceTime = 100;
        if (Test.attributes.get(Keys.OS).equalsIgnoreCase(OS.ANDROID)) {
            /*
            try {
                driver.findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                )).click();
            } catch (NoSuchElementException e) {
                //swipe.vertical(2,0.4,0.8,5);
                WAIT.forSeconds(10);
                driver.findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                )).click();
            } catch (WebDriverException e) {
                //swipe.vertical(2,0.4,0.8,5);
                WAIT.forSeconds(10);
                driver.findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                )).click();
            } catch (Throwable ex) {
                log.error(ex.getMessage());
                throw new ApplicationException("Element not found!" + ex.getMessage());
            }
            */

            for (int j = 0; j < toleranceTime; j++) {

                try {
                    driver.findElement(MobileBy.AndroidUIAutomator(
                            "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                    )).click();

                    log.info("Scrolled to the element matching the text --> " + searchText);
                    break;
                } catch (Exception e) {
                    log.info("Element Not present and hence scrolling to the element matching the text --> " + searchText);
                    WAIT.forSeconds(10);
                }
            }


        } else {
            {
                try {
                    boolean found = false;
                    JavascriptExecutor js = driver;
                    HashMap scrollObject = new HashMap<>();
                    scrollObject.put("predicateString", "label == '" + searchText + "'");
                    scrollObject.put("direction", "down");
                    //int toleranceTime = 50;
                    int i = 0;
                    if(!(driver.findElement(By.xpath("//XCUIElementTypeStaticText[@label='" + searchText + "']")).isDisplayed())) {
                        js.executeScript("mobile: scroll", scrollObject);
                    }else{
                        driver.findElement(By.xpath("//XCUIElementTypeStaticText[@label='" + searchText + "']/parent::*")).click();
                        found = true;
                    }
                    while (!(driver.findElement(By.xpath("//XCUIElementTypeStaticText[@label='" + searchText + "']/parent::*")).isDisplayed())) {
                        i += 1;
                        js.executeScript("mobile: scroll", scrollObject);
                        if (i > toleranceTime) {
                            break;
                        }
                        if (driver.findElement(By.xpath("//XCUIElementTypeStaticText[@label='" + searchText + "']/parent::*")).isDisplayed()) {
                            driver.findElement(By.xpath("//XCUIElementTypeStaticText[@label='" + searchText + "']/parent::*")).click();
                            found = true;
                            break;
                        }
                    }
                    if (!found) {
                        log.error("Element matching the text " + searchText + " is not found");
                        throw new ApplicationException("Element matching the text " + searchText + " is not found");
                    }
                    log.info("Scrolled to the element matching the text --> " + searchText);
                    //driver.findElement(MobileBy.AccessibilityId("Done")).click();

                } catch (Throwable ex) {
                    log.error(ex.getMessage());
                    ex.printStackTrace();

                }
            }
        }
    }

    public void Horizontal(int divideScreenInto, double startPointPercentage, double endPointPercentage,
                           double slowDownDurationInSeconds) throws ApplicationException {
        Dimension size = driver.manage().window().getSize();
        int y = size.width / divideScreenInto;
        int startPoint = (int) (size.height * startPointPercentage);
        int endPoint = (int) (size.height * endPointPercentage);
        log.info("Slowly swipe vertically from {" + startPoint + "} to {" + endPoint + "}");
        try {
            new TouchAction(driver).press(PointOption.point(startPoint, y)).waitAction(new WaitOptions().withDuration(Duration.ofSeconds((long) slowDownDurationInSeconds))).moveTo(PointOption.point(endPoint, y)).release().perform();
        } catch (WebDriverException e) {
            new TouchAction(driver).press(PointOption.point(startPoint, y)).waitAction(new WaitOptions().withDuration(Duration.ofSeconds((long) slowDownDurationInSeconds))).moveTo(PointOption.point(endPoint, y)).release().perform();
        } catch (Throwable e) {
            throw new ApplicationException(e.getMessage());
        }
        log.info("Swiped!");
    }

    public boolean scrollDownToTextAndVerifyElementIsPresent(String searchText) throws ApplicationException {
        searchText = searchText.trim();
        boolean found = false;
        if (Test.attributes.get(Keys.OS).equalsIgnoreCase(OS.ANDROID)) {
            try {
                found = driver.findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                )).isDisplayed();
                log.info("Scrolled to the element matching the text --> " + searchText + " and the element is present ");

            } catch (WebDriverException e) {
                found = false;
            } catch (Throwable ex) {
                log.error(ex.getMessage());
                //throw new ApplicationException("Element not found!" + ex.getMessage());
            }

            //return found;
        } else {

            try {
                JavascriptExecutor js = driver;
                HashMap scrollObject = new HashMap<>();
                scrollObject.put("predicateString", "value == '" + searchText + "'");
                scrollObject.put("direction", "down");
                int toleranceTime = 10;
                int i = 0;
                js.executeScript("mobile: scroll", scrollObject);
                //driver.findElement(MobileBy.AccessibilityId(searchText)
                WAIT.forSeconds(2);
                while (!(driver.findElement(By.xpath("//XCUIElementTypeStaticText[@label='" + searchText + "']/parent::*")).isDisplayed())) {
                    i += 1;
                    js.executeScript("mobile: scroll", scrollObject);
                    if (i > toleranceTime) {
                        break;
                    }
                    if (driver.findElement(By.xpath("//XCUIElementTypeStaticText[@label='" + searchText + "']/parent::*")).isDisplayed()) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    log.error("Element matching the text " + searchText + " is not found");
                    //  throw new ApplicationException("Element matching the text " + searchText + " is not found");
                }
                log.info("Scrolled to the element matching the text --> " + searchText + " and element is present");
                //driver.findElement(MobileBy.AccessibilityId("Done")).click();

            } catch (Throwable ex) {
                log.error(ex.getMessage());
                ex.printStackTrace();

            }

        }
        return found;
    }


    public static void IOSscrollDowntoXPath(String xPath) {

        boolean flag = true;
        int count = 1;
        while (flag) {
            try {
                driver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='" + xPath + "']/parent::*")).click();
                flag = false;
                break;
            } catch (Exception NoSuchElementException) {
                count = count + 1;
                Map<String, Object> params = new HashMap<>();
                params.put("start", "40%,90%");
                params.put("end", "40%,20%");
                params.put("duration", "2");
                Object res = driver.executeScript("mobile:touch:swipe", params);
                if (count == 10) {
                    break;
                }
            }

            driver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='" + xPath + "']/parent::*")).click();

        }

    }

    public void scrollDownToTextAfterLoadingDynamically(String searchText) throws ApplicationException {
        searchText = searchText.trim();
        int toleranceTime = 10;
        boolean found = false;

        if (Test.attributes.get(Keys.OS).equalsIgnoreCase(OS.ANDROID)) {

            try {
                driver.findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                ));
            } catch (WebDriverException e) {
                WAIT.forSeconds(1);
                swipe.vertical(2, 0.6, 0.3, 5);
                WAIT.forSeconds(4);
                driver.findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                ));
            } catch (Throwable ex) {
                log.error(ex.getMessage());
                throw new ApplicationException("Element not found!" + ex.getMessage());
            }
            log.info("Scrolled to the element matching the text --> " + searchText);
        } else {

            for (int j = 0; j < toleranceTime; j++) {

                try {
                    JavascriptExecutor js = driver;
                    HashMap scrollObject = new HashMap<>();
                    scrollObject.put("predicateString", "name == '" + searchText + "'");
                    scrollObject.put("direction", "down");

                    int i = 0;
                    js.executeScript("mobile: scroll", scrollObject);
                    while (!(driver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='" + searchText + "']/parent::*")).isDisplayed())) {
                        i += 1;
                        js.executeScript("mobile: scroll", scrollObject);
                        if (i > 1) {
                            break;
                        }
                        if (driver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='" + searchText + "']/parent::*")).isDisplayed()) {
                            // driver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='" + searchText + "']/parent::*")).click();
                            found = true;
                            log.info("Scrolled to the element matching the text --> " + searchText);
                            break;
                        }
                    }
                    if (!found) {
                        log.error("Element matching the text " + searchText + " is not found");
                        throw new ApplicationException("Element matching the text " + searchText + " is not found");
                    } else {
                        break;
                    }

                } catch (Throwable ex) {
                    swipe.vertical(2, 0.8, 0.2, 5);
                    WAIT.forSeconds(5);

                }
            }
        }
    }


    public void scrollDownToTextAfterLoadingDynamicallyTEST(String searchText) throws ApplicationException {
        searchText = searchText.trim();
        int toleranceTime = 10;
        boolean found = false;

        if (Test.attributes.get(Keys.OS).equalsIgnoreCase(OS.ANDROID)) {

            try {
                driver.findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                ));
            } catch (WebDriverException e) {
                WAIT.forSeconds(1);
                swipe.vertical(2, 0.6, 0.3, 5);
                WAIT.forSeconds(4);
                driver.findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector()).scrollIntoView(new UiSelector().textContains(\"" + searchText + "\"));"
                ));
            } catch (Throwable ex) {
                log.error(ex.getMessage());
                throw new ApplicationException("Element not found!" + ex.getMessage());
            }
            log.info("Scrolled to the element matching the text --> " + searchText);
        } else {

            for (int j = 0; j < toleranceTime; j++) {

                try {
                    JavascriptExecutor js = driver;
                    HashMap scrollObject = new HashMap<>();
                    scrollObject.put("predicateString", "name == '" + searchText + "'");
                    scrollObject.put("direction", "down");

                    int i = 0;
                    js.executeScript("mobile: scroll", scrollObject);
                        if (driver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='" + searchText + "']/parent::*")).isDisplayed()) {
                            // driver.findElement(By.xpath("//XCUIElementTypeStaticText[@name='" + searchText + "']/parent::*")).click();
                            found = true;
                            log.info("Scrolled to the element matching the text --> " + searchText);
                            break;
                        }



                } catch (Throwable ex) {
                    swipe.vertical(2, 0.8, 0.2, 5);
                    WAIT.forSeconds(5);

                }
            }
        }
    }

    public void touchPointTapUsingCordinate(int x, int y) throws ApplicationException {

        log.info("Tap using cordinate {" + x + "} to {" + y + "}");
        TouchAction touchAction = new TouchAction(driver);

        try {
            touchAction.tap(PointOption.point(x, y)).perform();

        } catch (WebDriverException e) {
            touchAction.tap(PointOption.point(x, y)).perform();
        } catch (Throwable e) {
            throw new ApplicationException(e.getMessage());
        }
        log.info("Tapped successfully using cordinate {\" + x + \"} to {\" + y + \"}!");
    }


}


