package actions;

import base.Keywords;
import helper.PropertyReader;
import io.appium.java_client.AppiumDriver;
import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.concurrent.TimeUnit;

public class Wait extends Keywords {

    private static Logger log=Logger.getLogger(Wait.class);

    public void forSeconds(int seconds) {
        try{
            Thread.sleep(seconds*400);
            log.info("Waited for "+seconds+" seconds");
        }catch (InterruptedException e){
            log.warn("Failed to execute thread.sleep()");
        }
    }

    public void forSecondsUsingFluentWAIT(int seconds,String elementType) {
        try{
            FluentWait<AppiumDriver> fluentwait = new FluentWait<AppiumDriver>(driver)
                    .withTimeout(Duration.ofSeconds(seconds))
                    .pollingEvery(Duration.ofSeconds(3))
                    .ignoring(NoSuchElementException.class);
            fluentwait.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(elementType)));
            log.info("Waited for "+seconds+" seconds");
        }catch (Exception e){
            log.warn("Failed to execute fluent wait");
        }
    }

    public void forSecondsUsingFluentWAITClickable(int seconds,String elementType) {
        try{
            FluentWait<AppiumDriver> fluentwait = new FluentWait<AppiumDriver>(driver)
                    .withTimeout(Duration.ofSeconds(seconds))
                    .pollingEvery(Duration.ofSeconds(3))
                    .ignoring(NoSuchElementException.class);
            fluentwait.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(elementType)));
            fluentwait.until(ExpectedConditions.elementToBeClickable(PropertyReader.locatorOf(elementType)));
            log.info("Waited for "+seconds+" seconds");
        }catch (Exception e){
            log.warn("Failed to execute fluent wait");
        }
    }

    public void waituntillElementVisibleMob(String locatorKey, int waitSeconds)  {
        try {
            WebDriverWait wait1 = new WebDriverWait(driver, waitSeconds);
            wait1.until(ExpectedConditions.presenceOfElementLocated(PropertyReader.locatorOf(locatorKey)));
            log.info("Waited for "+waitSeconds+" seconds");
        }catch(Exception e){
            log.warn("Failed to execute WaitUntill Element Visible Method.");
        }
    }

}
