package runners;


import base.Test;
import constants.Device;
import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;


@RunWith(Cucumber.class)

@CucumberOptions(
        features = {"src/test/resources/features"},
        glue = {"stepdefinitions"},
        plugin = {"com.cucumber.listener.ExtentCucumberFormatter:",
                "pretty", "json:target/json-output/Automation-Summary2.json",
                "rerun:target/json-output/rerunAndroid.txt"},

       //tags = {"@LoginPreReq"},
        tags = {"@FundTransferMar1"},
       // tags = {"@FundTransfer"},
       //tags = {"@RegressionFeb8"},
     // tags = {"@Regression"},
        // tags = {"@RegressionJan4Android.1"},
        monochrome = true
)

public class AutoBhanTestRunner extends Test {
    @BeforeClass
    public static void initialize() {
        String deviceName = System.getProperty("Device");
        if (deviceName == null) {
          deviceName=Device.ANDROID;
        //deviceName=Device.IOS;
        }
        setup(deviceName);

    }

    @AfterClass
    public static void flush() {
        teardown();
    }


}