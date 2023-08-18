package base;

import com.cucumber.listener.ExtentProperties;
import com.cucumber.listener.Reporter;
import com.github.javafaker.Faker;
import constants.Keys;
import helper.Device;
import helper.PropertyReader;
import helper.Tools;
import org.apache.log4j.Logger;

import java.io.File;
import java.util.HashMap;
import java.util.Locale;

public class Test {

    public static Logger log;
    public static Tools tools = new Tools();
    public static HashMap<String, String> attributes = new HashMap<>();
    public static Faker faker = new Faker(Locale.CANADA);

    static {
        new RunManager();
        log = Logger.getLogger(Test.class);
    }

    public static Object faker(String fakerdata) {
        Object returndata=null;
        switch (fakerdata.toLowerCase()) {
            case "number":
                returndata= faker.number().randomNumber(4,true);
            break;

            case "name":
                returndata= faker.name().firstName();
                break;
            case "amount":
                returndata= faker.number().randomNumber(1,false)+0.11;
                break;
        }

        return returndata;
    }


    public static void setup(String mobile) {
        attributes.put(Keys.Device, mobile.trim());
        attributes.put(Keys.OS, PropertyReader.valueOf("Device." + mobile.trim() + ".OS"));
        attributes.put(Keys.AppiumServer, PropertyReader.valueOf("Device." + mobile.trim() + ".Server"));
        attributes.put(Keys.ApplicationType, PropertyReader.valueOf("Device." + mobile.trim() + ".apptype"));
        ExtentProperties extentProperties = ExtentProperties.INSTANCE;
        try {
            extentProperties.setReportPath(Test.attributes.get(Keys.RunFolder) + "Automation-Dashboard_" + Test.attributes.get(Keys.OS) + ".html");
        } catch (Exception ex) {
            log.error("Failed to intialize report \n" + ex);

        }
    }

    public static void teardown() {
        try {
            Keywords.quitDriver();
            if(Device.isNONSME() && Device.isAndroid()) {
                Reporter.loadXMLConfig(new File("src/test/resources/settings/ReportSettingsAndroid.xml"));
            } else if (Device.isNONSME() && Device.isIOS()) {
                Reporter.loadXMLConfig(new File("src/test/resources/settings/ReportSettingsIOS.xml"));
            } else if(Device.isSME() && Device.isAndroid()) {
                Reporter.loadXMLConfig(new File("src/test/resources/settings/ReportSettingsAndroidSME.xml"));
            }else if (Device.isSME() && Device.isIOS()) {
                Reporter.loadXMLConfig(new File("src/test/resources/settings/ReportSettingsIOSSME.xml"));
            }
            Reporter.setSystemInfo("User Name", System.getProperty("user.name"));
            Reporter.setSystemInfo("Time Zone", System.getProperty("user.timezone"));
            //Reporter.setSystemInfo("Machine",System.getProperty("os.name"));
            Reporter.setSystemInfo("Machine", Test.attributes.get(Keys.OS) + "_" + PropertyReader.valueOf("Device." + Test.attributes.get(Keys.Device) + ".Name") + "_" + PropertyReader.valueOf("Device." + Test.attributes.get(Keys.Device) + ".Version"));
            Reporter.setSystemInfo("Appium Version", PropertyReader.valueOf("Tool.Appium.Version"));
            Reporter.setSystemInfo("Java Version", PropertyReader.valueOf("Tool.Java.Version"));
            Reporter.setSystemInfo("Selenium Version", PropertyReader.valueOf("Tool.Selenium.Version"));
            Reporter.setSystemInfo("Maven Version", PropertyReader.valueOf("Tool.Maven.Version"));
            log.info("Report is generates @ " + Test.attributes.get(Keys.RunFolder) + "Automation-Dashboard.html");
        } catch (Exception ex) {
            log.error("Failed to generate report \n" + ex);
        }
    }
}