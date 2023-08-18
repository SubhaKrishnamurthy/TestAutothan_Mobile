package actions;

import base.Keywords;
import base.Test;
import constants.Keys;
import exceptions.ApplicationException;
import helper.Device;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.AndroidKeyCode;
import org.apache.log4j.Logger;
import org.openqa.selenium.By;

import java.awt.event.KeyEvent;
import java.util.List;

public class Keyboard extends Keywords {
    private static Logger log = Logger.getLogger(Keyboard.class);

    public void hideAndroid(){
        try{
            driver.hideKeyboard();
            log.info("hide keyboard strategy used for closing the keyboard in android device");

        }catch (Throwable ex){
           // ((AndroidDriver) driver).pressKeyCode(AndroidKeyCode.ENTER);
           // log.info("Enter key strategy used for closing the keyboard in android device");

        }
    }

    public void hideIOS(){
        try {
            List<MobileElement> el=get.elementBy(By.className("XCUIElementTypeKeyboard")).findElements(By.className("XCUIElementTypeButton"));
            if(el.size() > 2) {
                el.get(0).click();
            }else if (el.size() == 0){
                get.elementBy(By.xpath("//XCUIElementTypeButton[@name='Toolbar Done Button']")).click();
            }else {
                el.get(el.size() - 1).click();
            }
        } catch (Throwable e) {

        }
    }

    public void hideIfAndroid(){
        if(Test.attributes.get(Keys.OS).equalsIgnoreCase("Android")){
            hideAndroid();
        }
    }

    public void hideIfIOS(){
        if(Test.attributes.get(Keys.OS).equalsIgnoreCase("IOS")){
            hideIOS();
        }
    }

    public void hide(){
        if(Test.attributes.get(Keys.OS).equalsIgnoreCase("Android")){
            hideAndroid();
        }else if(Test.attributes.get(Keys.OS).equalsIgnoreCase("IOS")){
            hideIOS();
        }
    }
    public void hideIOS1(){
        if(Device.isIOS()) {
            try {
                //WAIT.forSeconds(1);
                click.elementBy(By.xpath("//XCUIElementTypeButton[@name=\"Toolbar Done Button\"]"));
               // WAIT.forSeconds(1);

            } catch (Throwable e) {

            }
        }
    }

    public void hideAutoBahnIOS() throws ApplicationException {
        if(Test.attributes.get(Keys.OS).equalsIgnoreCase("IOS")) {
            try {
                click.elementBy(MobileBy.iOSClassChain("**/XCUIElementTypeButton[`label CONTAINS \"Done\"`]"));
            }
            catch(Exception ex)
            {
                    swipe.vertical(2,0.3,0.4,5);
            }
            WAIT.forSeconds(1);
        }

    }
}