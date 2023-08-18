package driver;

import base.Test;
import constants.Keys;
import helper.Device;
import helper.PropertyReader;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.remote.MobileCapabilityType;
import org.openqa.selenium.JavascriptExecutor;

import java.net.URL;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;

@SuppressWarnings("ALL")
public class IOSManager extends DriverManager {

    @Override
    public void createDriver() throws Exception {
        capabilities.setCapability("platformName", "iOS");
        capabilities.setCapability("automationName","XCUITest");
        //capabilities.setCapability("autoDismissAlerts","true");
        //capabilities.setCapability(MobileCapabilityType.FULL_RESET, false);
        //capabilities.setCapability("noReset", true);
        capabilities.setCapability("unicodeKeyboard", true);
        capabilities.setCapability("waitForQuiescence",false);
        capabilities.setCapability("includeNonModalElements",true);
        capabilities.setCapability("useFirstMatch",true);
        //capabilities.setCapability("snapshotTimeout",5);
        capabilities.setCapability("customSnapshotTimeout",5);
        capabilities.setCapability("useJSONSource",true);
        System.setProperty("webdriver.http.factory", "apache");

        //capabilities.setCapability("useNewWDA",true);

        setAppCapabilities();
        if(Device.isNONSME()) {
            Test.attributes.put(Keys.ObjectRepository, "src/test/resources/object-repository/Locators-IOS.properties");
            Test.attributes.put(Keys.ObjectRepository1, "src/test/resources/object-repository/Locators-Web.properties");

        }
        else if(Device.isSME())
        {

            Test.attributes.put(Keys.ObjectRepository,"src/test/resources/object-repository/Locators-IOS-SME.properties");
            Test.attributes.put(Keys.ObjectRepository1, "src/test/resources/object-repository/Locators-Web.properties");
        }
        //   driver = new IOSDriver(new URL(PropertyReader.valueOf("Driver.ServerAddress").trim()), capabilities);

        driver = new IOSDriver(new URL(Test.attributes.get(Keys.AppiumServer)), capabilities);
         }

    private void setAppCapabilities()
    {
        if(Device.isNONSME()) {
            if (PropertyReader.valueOf("Driver.InstallMobileAppForEveryRun").trim().equalsIgnoreCase("yes")) {
                //capabilities.setCapability("app","src/test/resources/apps/"+PropertyReader.valueOf("Application.Name").trim()+".ipa");
                capabilities.setCapability("app", "/Users/ubp/Documents/GetGopayCode/Mobile/src/test/resources/apps/Getgo.ipa");

            } else {
                capabilities.setCapability("bundleId", PropertyReader.valueOf("Application.IOS.BundleID").trim());
            }
        }
        else if(Device.isSME())
        {
            if (PropertyReader.valueOf("Driver.InstallMobileAppForEveryRun").trim().equalsIgnoreCase("yes")) {
                //capabilities.setCapability("app","src/test/resources/apps/"+PropertyReader.valueOf("Application.Name").trim()+".ipa");
                capabilities.setCapability("app", "/Users/ubp/Documents/GetGopayCode/Mobile/src/test/resources/apps/Getgo.ipa");

            } else {
                System.out.println(PropertyReader.valueOf("Application.IOS.BundleID-SME").trim());
                capabilities.setCapability("bundleId", PropertyReader.valueOf("Application.IOS.BundleID-SME").trim());
            }
        }
    }
}