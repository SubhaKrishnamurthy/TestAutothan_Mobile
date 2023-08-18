import exceptions.EnvironmentException;
import io.appium.java_client.MobileBy;
import org.openqa.selenium.By;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Properties;

public class NewLocatorStrategy {

    public static void main(String[] args) {
        System.out.println(NewLocatorStrategy.locatorOf("Getgo.Login.BtnBack"));
    }

    public static By locatorOf(String locatorKey) {
        By locatorBy;
        String locator=null;
        ArrayList<String> locatorType=new ArrayList<>();

        locatorType.add("ID");
        locatorType.add("AID");
        locatorType.add("CLASS");
        locatorType.add("XPATH");


        File file=new File("src/test/resources/object-repository/Locators-Android.properties");
        Properties prop=new Properties();
        InputStream input=null;
        try {
            input=new FileInputStream(file);
            prop.load(input);
        }catch (IOException ex) {
            ex.printStackTrace();
        }finally {
            if(input!=null) {
                try{
                    input.close();
                }catch (IOException ex){
                    ex.printStackTrace();
                }
            }

            for (String i:locatorType) {
                try{
                    locator=prop.getProperty(locatorKey.trim()+"."+i.toUpperCase()).trim();
                }catch (NullPointerException ex){
                    continue;
                }
                if(locator!=null){
                    locatorKey=locatorKey.trim()+"."+i.toUpperCase();
                    break;
                }
            }
            if(locator==null){
                try{
                    throw new EnvironmentException("Property value is null in file "+file.getName());
                }catch (EnvironmentException ex){
                    ex.printStackTrace();
                }
            }

            String[] locatorSplit = locatorKey.trim().split("[.]");
            switch (locatorSplit[locatorSplit.length-1].trim().toUpperCase()) {
                case "ID":
                    locatorBy=By.id(locator);
                    break;
                case "AID":
                    locatorBy=MobileBy.AccessibilityId(locator);
                    break;
                case "XPATH":
                    locatorBy=By.xpath(locator);
                    break;
                case "CLASS":
                    locatorBy=By.className(locator);
                    break;
                default:
                    locatorBy=By.xpath(locator);
            }
        }
        return locatorBy;
    }
}
