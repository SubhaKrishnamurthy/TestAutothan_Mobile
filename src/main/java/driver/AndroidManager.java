package driver;

import base.Test;
import constants.Keys;
import helper.Device;
import helper.PropertyReader;
import io.appium.java_client.android.AndroidDriver;

import java.net.URL;
import java.util.concurrent.TimeUnit;

@SuppressWarnings("ALL")
public class AndroidManager extends DriverManager {

    @Override
    public void createDriver() throws Exception {
        capabilities.setCapability("platformName", "Android");
        capabilities.setCapability("automationName", "UIAutomator2");
        capabilities.setCapability("resetKeyboard", "true");
        capabilities.setCapability("unicodeKeyboard", "true");
        capabilities.setCapability("noReset", "true");
        capabilities.setCapability("fullReset", "false");
        setAppCapabilities();
        if(Device.isNONSME()) {
            Test.attributes.put(Keys.ObjectRepository, "src/test/resources/object-repository/Locators-Android.properties");
            Test.attributes.put(Keys.ObjectRepository1, "src/test/resources/object-repository/Locators-Web.properties");
        }
        else if(Device.isSME())
        {
            Test.attributes.put(Keys.ObjectRepository, "src/test/resources/object-repository/Locators-Android-SME.properties");
            Test.attributes.put(Keys.ObjectRepository1, "src/test/resources/object-repository/Locators-Web.properties");
        }
        // driver = new AndroidDriver(new URL(PropertyReader.valueOf("Driver.ServerAddress").trim()), capabilities);
        System.setProperty("webdriver.http.factory", "apache");
        driver = new AndroidDriver(new URL(Test.attributes.get(Keys.AppiumServer)), capabilities);
    }

    private void setAppCapabilities() {
        if(Device.isNONSME()) {
            if (PropertyReader.valueOf("Driver.InstallMobileAppForEveryRun").trim().equalsIgnoreCase("yes")) {
                capabilities.setCapability("app", "src/test/resources/apps/" + PropertyReader.valueOf("Application.Name").trim() + ".apk");
            } else {
                capabilities.setCapability("appPackage", PropertyReader.valueOf("Application.Android.Package").trim());
                capabilities.setCapability("appActivity", PropertyReader.valueOf("Application.Android.LaunchActivity").trim());
            }
        }
        else if(Device.isSME())
        {
            if (PropertyReader.valueOf("Driver.InstallMobileAppForEveryRun").trim().equalsIgnoreCase("yes")) {
                capabilities.setCapability("app", "src/test/resources/apps/" + PropertyReader.valueOf("Application.Name").trim() + ".apk");
            } else {
                capabilities.setCapability("appPackage", PropertyReader.valueOf("Application.Android.Package-SME").trim());
                capabilities.setCapability("appActivity", PropertyReader.valueOf("Application.Android.LaunchActivity-SME").trim());
            }
        }
    }
}