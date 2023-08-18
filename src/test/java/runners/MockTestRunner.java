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
        plugin = {"com.cucumber.listener.ExtentCucumberFormatter:","pretty","json:target/json-output/Automation-Summary.json"},
      //tags={"@Settings"},
       tags={"@Test123"},
        monochrome=true
)

public class MockTestRunner extends Test {


}