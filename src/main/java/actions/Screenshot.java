package actions;

import base.Keywords;
import base.Test;
import com.cucumber.listener.Reporter;
import constants.Keys;
import helper.PropertyReader;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Screenshot extends Keywords {
    //CommonReuseMethods test=new CommonReuseMethods();
    private static Logger log = Logger.getLogger(Screenshot.class);

    private String takeScreenshot(String filename) {
        String imgName = null;
        if (PropertyReader.valueOf("Application.Capture.Screenshot").toLowerCase().contentEquals("yes")) {
            log.info("Capture screenshot");
            imgName = filename + "_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".jpg";
            try {
                File img = driver.getScreenshotAs(OutputType.FILE);
                FileUtils.copyFile(img, new File(Test.attributes.get(Keys.RunFolder) + "images/" + imgName));
                log.info("Captured!");
            } catch (Throwable e) {
                log.warn("Problem while capturing the screenshot by takeScreenshot method\n" + e.getMessage());
            }

        }
        return imgName;

    }

    public void attachScreenshot(String filename) {
        if (PropertyReader.valueOf("Application.Capture.Screenshot").toLowerCase().contentEquals("yes")) {
            try {
                String currentDir = System.getProperty("user.dir");
                System.setProperty("user.dir", Test.attributes.get(Keys.RunFolder));
                Reporter.addScreenCaptureFromPath("images/" + takeScreenshot(filename));
                System.setProperty("user.dir", currentDir);
            } catch (Throwable e) {
                log.warn("Problem while attaching the screenshot to extent report\n" + e.getMessage());
            }
        }
    }
    private String takeScreenshotWeb(String filename) {
        String imgName = null;
        if (PropertyReader.valueOf("Application.Capture.Screenshot").toLowerCase().contentEquals("yes")) {
            log.info("Capture screenshot");
            imgName = filename + "_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".jpg";
            try {
                File img = ((TakesScreenshot) driverweb).getScreenshotAs(OutputType.FILE);
                //File img = driverweb.getScreenshotAs(OutputType.FILE);
                FileUtils.copyFile(img, new File(Test.attributes.get(Keys.RunFolder) + "images/" + imgName));
                log.info("Captured!");
            } catch (Throwable e) {
                log.warn("Problem while capturing the screenshot by takeScreenshot method\n" + e.getMessage());
            }

        }
        return imgName;

    }

    public void attachScreenshotWeb(String filename) {
        if (PropertyReader.valueOf("Application.Capture.Screenshot").toLowerCase().contentEquals("yes")) {
            try {
                String currentDir = System.getProperty("user.dir");
                System.setProperty("user.dir", Test.attributes.get(Keys.RunFolder));
                Reporter.addScreenCaptureFromPath("images/" + takeScreenshotWeb(filename));
                System.setProperty("user.dir", currentDir);
            } catch (Throwable e) {
                log.warn("Problem while attaching the screenshot to extent report\n" + e.getMessage());
            }
        }
    }
    private String takeScreenshotFailed(String filename) {
        String imgName = null;
            log.info("Capture screenshot");
            imgName = filename + "_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".jpg";
            try {
                File img = driver.getScreenshotAs(OutputType.FILE);
                FileUtils.copyFile(img, new File(Test.attributes.get(Keys.RunFolder) + "images/" + imgName));
                log.info("Captured!");
            } catch (Throwable e) {
                log.warn("Problem while capturing the screenshot by takeScreenshotFailed method\n" + e.getMessage());
            }

        return imgName;

    }
    private String takeScreenshotFailedWeb(String filename) {
        String imgName = null;
        log.info("Capture screenshot");
        imgName = filename + "_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "_Web.png";
        try {
            File img = ((TakesScreenshot) driverweb).getScreenshotAs(OutputType.FILE);
            FileUtils.copyFile(img, new File(Test.attributes.get(Keys.RunFolder) + "images/" + imgName));
            log.info("Captured!");
        } catch (Throwable e) {
            System.out.println("error message"+e.getMessage());
            log.warn("Problem while capturing the screenshot by takeScreenshotFailed method for Browser\n" + e.getMessage());
        }

        return imgName;

    }
    public void attachScreenshotFailed(String filename) {
            try {
                String currentDir = System.getProperty("user.dir");
                System.setProperty("user.dir", Test.attributes.get(Keys.RunFolder));
                Reporter.addScreenCaptureFromPath("images/" + takeScreenshotFailed(filename));
                System.setProperty("user.dir", currentDir);
            } catch (Throwable e) {
                log.warn("Problem while attaching the screenshot to extent report\n" + e.getMessage());
            }
        }



    public void attachScreenshotFailedWeb(String filename) {
        try {
            String currentDir = System.getProperty("user.dir");
            System.setProperty("user.dir", Test.attributes.get(Keys.RunFolder));
            Reporter.addScreenCaptureFromPath("images/" + takeScreenshotFailedWeb(filename));
            System.setProperty("user.dir", currentDir);
        } catch (Throwable e) {
            log.warn("Problem while attaching the screenshot to extent report\n" + e.getMessage());
        }
    }

}
