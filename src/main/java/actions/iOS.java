package actions;

import base.Keywords;
import constants.ObjectClass;
import exceptions.ApplicationException;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import xpath.Matching;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class iOS extends Keywords {

    private static Logger log=Logger.getLogger(iOS.class);

    public void datePicker(String date,String month,String year) throws ApplicationException {
        log.info("Picking the specified day["+date+"] month["+month+"] year["+year+"] in the IOS calendar object");
        try
        {
            MobileElement ele;
            List<MobileElement> e=driver.findElementsByClassName(ObjectClass.iOSPickerWheel);
            ele = (MobileElement) e.get(0);
            ele.setValue(date.trim());
            ele = (MobileElement) e.get(1);
            ele.setValue(month.trim());
            ele = (MobileElement) e.get(2);
            ele.setValue(year.trim());
            get.elementBy(xpathOf.button(Matching.name("Done"))).click();
        }catch(Throwable e){
            log.error("Failed to pick the date!");
            throw new ApplicationException("Failed to pick the date!\n" + e.getMessage());
        }
    }

    public void selectPicker(String value) throws ApplicationException {
        log.info("Select the value {"+value+"} in IOS picker wheel");
        try{
            MobileElement ele = (MobileElement) driver.findElementsByClassName(ObjectClass.iOSPickerWheel).get(0);
            ele.setValue(value.trim());
            get.elementBy(MobileBy.AccessibilityId("Toolbar Done Button")).click();
            log.info("Value "+value+" is selected!");
        }catch(Throwable e){
            log.error("Failed to select the value "+value+" in IOS picker wheel");
            throw new ApplicationException(e.getMessage());
        }
    }

    public void selectPickerByIndex(String value,int indexoccurance) throws ApplicationException {
        log.info("Select the value {"+value+"} in IOS picker wheel");
        try{
            MobileElement ele = (MobileElement) driver.findElementsByClassName(ObjectClass.iOSPickerWheel).get(indexoccurance-1);
            ele.sendKeys(value.trim());
            //get.elementBy(xpathOf.button(Matching.name("Done"))).click();
            log.info("Value "+value+" is selected!");
        }catch(Throwable e){
            log.error("Failed to select the value "+value+" in IOS picker wheel");
            throw new ApplicationException(e.getMessage());
        }
    }

    public void selectPickerByIndexHASHMAP(int indexoccurance) throws ApplicationException {
        log.info("Select the value  in IOS picker wheel");
        try{
            MobileElement ele = (MobileElement) driver.findElementsByClassName(ObjectClass.iOSPickerWheel).get(indexoccurance-1);
            Map<String, Object> params = new HashMap<>();
            params.put("order", "next");
            params.put("offset", "0.15");
            params.put("element", (ele).getId());
            driver.executeScript("mobile: selectPickerWheelValue", params);
            log.info("Value "+driver.findElementsByClassName(ObjectClass.iOSPickerWheel).get(indexoccurance-1).getText()+" is selected!");
        }catch(Throwable e){
            log.error("Failed to select the value "+driver.findElementsByClassName(ObjectClass.iOSPickerWheel).get(indexoccurance-1).getText()+" in IOS picker wheel");
            throw new ApplicationException(e.getMessage());
        }
    }

    public void chooseDatePickerIOS14Version() throws ApplicationException {
        log.info("Choosing Date for the New Date Picker --- IOS 14");
        try{

            DateFormat df = new SimpleDateFormat("dd");
            Date date = new Date(System.currentTimeMillis());
            int currentDate= Integer.parseInt(df.format(date));

            driver.findElement(MobileBy.iOSClassChain("**/XCUIElementTypeOther[`label == 'Date and Time Picker'`]")).click();
            WAIT.forSeconds(1);

            if(currentDate<=27) {
                int futureDate=currentDate+1;
               driver.findElement(MobileBy.iOSClassChain("**/XCUIElementTypeButton[`label CONTAINS '"+futureDate+"'`]")).click();
                WAIT.forSeconds(1);
                driver.findElement(MobileBy.iOSClassChain("**/XCUIElementTypeButton[`label == 'AM'`]")).click();
                WAIT.forSeconds(1);
                swipe.touchPointTapUsingCordinate(300,600);

                log.info("Date "+futureDate+" is selected from the date picker!");
            }
            else
            {
                driver.findElement(MobileBy.iOSClassChain("**/XCUIElementTypeButton[`label == 'Next Month'`]")).click();
                WAIT.forSeconds(1);
                driver.findElement(By.xpath("//XCUIElementTypeButton[contains(@name,'10')]")).click();
                WAIT.forSeconds(1);
                driver.findElement(MobileBy.iOSClassChain("**/XCUIElementTypeButton[`label == 'AM'`]")).click();
                WAIT.forSeconds(1);

                swipe.touchPointTapUsingCordinate(300,600);
                log.info("Date 01 is selected from the date picker!");
            }

            driver.findElement(MobileBy.iOSClassChain("**/XCUIElementTypeButton[`label == 'Done'`]")).click();


        }catch(Throwable e){
            log.error("Failed to Choose the value from the in IOS 14 Date picker wheel");
            throw new ApplicationException(e.getMessage());
        }
    }
}
