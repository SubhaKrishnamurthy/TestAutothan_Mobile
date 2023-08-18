package actions;

import base.Keywords;
import exceptions.ApplicationException;
import helper.PropertyReader;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

public class Click extends Keywords{

    private static Logger log=Logger.getLogger(Click.class);
    
    private String keyBtnOkDatePicker="AutoBahn.FTTransferDate.BtnOkDatePicker";
    private String keyLblDatePickerGetMonths="AutoBahn.FTTransferDate.LblDatePickerGetMonths";
    private String keyLblDatePickerGetYear="AutoBahn.FTTransferDate.LblDatePickerGetYear";
    private String keyLblDatePickerScrollYear="AutoBahn.FTTransferDate.LblDatePickerScrollYear";


    public void elementBy(String locatorKey) throws ApplicationException {
        screenshot.attachScreenshot("Screenshot for the locator "+locatorKey.replaceAll(" ","").replaceAll("//","_").replaceAll("/","-"));
        log.info("Click element ["+locatorKey+"]");
        try{
            get.elementBy(locatorKey).click();
        }catch (StaleElementReferenceException ex){
            //get.elementBy(locatorKey).click();
        }
        log.info("Click Successful!");
    }

    public void elementBy(By locator) throws ApplicationException {
        screenshot.attachScreenshot("Screenshot for the locator "+locator.toString().replaceAll(" ","").replaceAll("//","_").replaceAll("/","-"));
        log.info("Click element ["+locator+"]");
        try{
            get.elementBy(locator).click();
        }catch (StaleElementReferenceException ex){
            get.elementBy(locator).click();
        }
        log.info("Click Successful!");
    }

    public void elementsValuesBy(String locatorKey,String ivalue) throws ApplicationException {
        boolean blogic=false;
        screenshot.attachScreenshot("Screenshot for the locator "+locatorKey.replaceAll(" ","").replaceAll("[//]","_").replaceAll("[/]","-"));
        log.info("Click elementsByValues ["+locatorKey+"]");
        try{
            //get.elementBy(locatorKey).click();
            List<MobileElement> a=driver.findElements(PropertyReader.locatorOf(locatorKey));

            for (int i = 0; i <a.size(); i++) {
                if((a.get(i).getText().trim()).contentEquals(ivalue.trim()))
                {
                    a.get(i).click();
                    log.info("Clicked on the element " + locatorKey);
                    blogic=true;
                    break;
                }

            }
            if(blogic==true)
            {
                log.info("Click is Successful!");
            }
            else
            {
                throw new ApplicationException("cannot able to click the element in the list.Kindly check the input value");
            }

        }catch (StaleElementReferenceException ex){
            get.elementBy(locatorKey).click();
        }

    }
    public void chooseDOB(String tyear,String tmonth,String tday) throws ApplicationException {
        screenshot.attachScreenshot("chooseDOB");
        int year=Integer.parseInt(tyear);
        String month=tmonth.substring(0,3).trim();
        //int date=Integer.parseInt(tday);
        String formatdate=tday+" "+tmonth+" "+tyear;
        String imonth;
        //for loop iteration
        int loopcount=10;
        String iyear;
        iyear=driver.findElement(By.id("android:id/date_picker_header_year")).getText();
        if(year==Integer.parseInt(iyear.trim()))
        {

        }
        else
        {
            click.elementBy(By.id("android:id/date_picker_header_year"));

            for(int i=0;i<loopcount;i++)
            {
                try
                {
                    List<MobileElement> el=driver.findElements(By.id("android:id/text1"));
                    for(int j=0;j<el.size();j++)
                    {
                        if(el.get(j).getText().toString().contentEquals(tyear.toLowerCase().trim()))
                        {
                            el.get(j).click();
                            break;
                        }
                        else
                        {
                            swipe.vertical(2,0.3,0.8,5);

                        }
                    }
                    click.elementBy(By.id("android:id/button1"));
                }
                catch(Exception ex)
                {
                    swipe.vertical(2,0.8,0.4,5);
                }

            }

        }
    }


//    public void chooseTransactionDate(String tyear,String tmonth,String tday) throws ApplicationException {
//        screenshot.attachScreenshot("chooseTransactionDate");
//        WAIT.forSeconds(5);
//        int year=Integer.parseInt(tyear);
//        String month=tmonth.substring(0,3).trim();
//        //int date=Integer.parseInt(tday);
//        String formatdate=tday+" "+tmonth+" "+tyear;
//        String iyear;
//        String imonth;
//        //for loop iteration
//        int loopcount=10;
//
//        HashMap<String,String> imap=new LinkedHashMap<>();
//
//        imap.put("Jan","01");
//        imap.put("Feb","02");
//        imap.put("Mar","03");
//        imap.put("Apr","04");
//        imap.put("May","05");
//        imap.put("Jun","06");
//        imap.put("Jul","07");
//        imap.put("Aug","08");
//        imap.put("Sep","09");
//        imap.put("Oct","10");
//        imap.put("Nov","11");
//        imap.put("Dec","12");
//
//       // iyear=driver.findElement(By.id("android:id/date_picker_header_year")).getText();
//        iyear=get.elementText(By.id("android:id/date_picker_header_year"));
//
//        if(year==Integer.parseInt(iyear.trim()))
//        {
//          //  imonth = driver.findElement(By.id("android:id/date_picker_header_date")).getText();
//
//            imonth = get.elementText(By.id("android:id/date_picker_header_date"));
//            imonth=imonth.substring(5,8);
//            int ivalue=Integer.parseInt(imap.get(imonth));
//            for(int i=ivalue;i<=12;i++) {
//                if (imonth.contentEquals(month)) {
//                    click.elementBy(By.xpath("//android.view.View[@text='" + tday + "']"));
//                    break;
//                } else {
//                    click.elementBy(By.id("android:id/next"));
//                    WAIT.forSeconds(1);
//                    click.elementBy(By.xpath("//android.view.View[@text='11']"));
//                    WAIT.forSeconds(1);
//                    //imonth = driver.findElement(By.id("android:id/date_picker_header_date")).getText();
//                    imonth = get.elementText(By.id("android:id/date_picker_header_date"));
//                    imonth=imonth.substring(5,8);
//                }
//
//            }
//
//           // driver.findElement(By.id("android:id/button1")).click();
//
//        }
//        else
//        {
//            click.elementBy(By.id("android:id/date_picker_header_year"));
//
//            for(int i=0;i<loopcount;i++)
//            {
//            try
//            {
////                List<MobileElement> el=driver.findElements(By.id("android:id/text1"));
//
//                List<MobileElement> el=get.elementTextUsingList(By.id("android:id/text1"));
//                for(int j=0;j<el.size();j++)
//                {
//                    if(el.get(j).getText().toString().contentEquals(tyear.toLowerCase().trim()))
//                    {
//                        el.get(j).click();
//                        break;
//                    }
//                    else
//                    {
//                        swipe.vertical(2,0.3,0.8,5);
//
//                    }
//                }
//                //click.elementBy(By.id("android:id/button1"));
//            }
//            catch(Exception ex)
//            {
//                swipe.vertical(2,0.8,0.4,5);
//            }
//
//        }
//
//            imonth = get.elementText(By.id("android:id/date_picker_header_date"));
//            imonth=imonth.substring(5,8);
//            int ivalue=Integer.parseInt(imap.get(imonth));
//            for(int i=ivalue;i<=12;i++) {
//                if (imonth.contentEquals(month)) {
//                    click.elementBy(By.xpath("//android.view.View[@text='" + tday + "']"));
//                    break;
//                } else {
//                    click.elementBy(By.id("android:id/next"));
//                    WAIT.forSeconds(1);
//                    click.elementBy(By.xpath("//android.view.View[@text='11']"));
//                    WAIT.forSeconds(1);
//                    //imonth = driver.findElement(By.id("android:id/date_picker_header_date")).getText();
//                    imonth = get.elementText(By.id("android:id/date_picker_header_date"));
//                    imonth=imonth.substring(5,8);
//                }
//
//            }
//
//
//
//        }
//
//        click.elementBy(By.id("android:id/button1"));
//    }


    public void elementMobileBy(String locatorKey) throws ApplicationException {

        click.elementBy(MobileBy.id(locatorKey));
    }


    public void chooseTransactionDate(String tyear,String tmonth,String tday) throws ApplicationException {
        screenshot.attachScreenshot("chooseTransactionDate");
        WAIT.forSeconds(1);
        int year=Integer.parseInt(tyear);
        String month=tmonth.substring(0,3).trim();
        //int date=Integer.parseInt(tday);
        String formatdate=tday+" "+tmonth+" "+tyear;
        String iyear;
        String imonth;
        //for loop iteration
        int loopcount=10;

        HashMap<String,String> imap=new LinkedHashMap<>();

        imap.put("JAN","01");
        imap.put("FEB","02");
        imap.put("MAR","03");
        imap.put("APR","04");
        imap.put("MAY","05");
        imap.put("JUN","06");
        imap.put("JUL","07");
        imap.put("AUG","08");
        imap.put("SEP","09");
        imap.put("OCT","10");
        imap.put("NOV","11");
        imap.put("DEC","12");

        //iyear=driver.findElement(By.id("com.unionbankph.corporate.sme.qat2:id/date_picker_year")).getText();
        iyear=driver.findElement(PropertyReader.locatorOf(keyLblDatePickerGetYear)).getText();

        if(year==Integer.parseInt(iyear.trim()))
        {
            imonth = driver.findElement(PropertyReader.locatorOf(keyLblDatePickerGetMonths)).getText().trim();
            //imonth=imonth.substring(5,8);
            int ivalue=Integer.parseInt(imap.get(imonth));
            for(int i=ivalue;i<=12;i++) {
                if (imonth.toLowerCase().contentEquals(month.toLowerCase())) {
                    driver.findElement(By.xpath("//android.view.View[@content-desc='"+tday+" "+tmonth+" "+tyear+"']")).click();
                    break;
                } else {
                    swipe.vertical(2,0.7,0.4,5);
                    driver.findElement(By.xpath("//android.view.View[@index='18']")).click();
                    WAIT.forSeconds(1);
                    imonth = driver.findElement(PropertyReader.locatorOf(keyLblDatePickerGetMonths)).getText().trim();
                    // imonth=imonth.substring(5,8);
                }

            }

            // driver.findElement(By.id("android:id/button1")).click();

        }
        else
        {
            click.elementBy(PropertyReader.locatorOf(keyLblDatePickerGetYear));

            for(int i=0;i<loopcount;i++)
            {
                try
                {
                    List<MobileElement> el=driver.findElements(PropertyReader.locatorOf(keyLblDatePickerScrollYear));

                    for(int j=0;j<el.size();j++)
                    {
                        if(el.get(j).getText().toString().contentEquals(tyear.toLowerCase().trim())) {
                            el.get(j).click();
                            break;
                        }
                    }
                    //click.elementBy(By.id("android:id/button1"));
                }
                catch(Exception ex)
                {
                    swipe.vertical(2,0.8,0.4,5);
                }

            }

            imonth = driver.findElement(PropertyReader.locatorOf(keyLblDatePickerGetMonths)).getText().trim();
            //imonth=imonth.substring(5,8);
            int ivalue=Integer.parseInt(imap.get(imonth));
            for(int i=ivalue;i<=12;i++) {
                if (imonth.toLowerCase().contentEquals(month.toLowerCase())) {
                    driver.findElement(By.xpath("//android.view.View[@content-desc='"+tday+" "+tmonth+" "+tyear+"']")).click();
                    break;
                } else {
                    swipe.vertical(2,0.7,0.4,5);
                    driver.findElement(By.xpath("//android.view.View[@index='18']")).click();
                    WAIT.forSeconds(1);
                    imonth = driver.findElement(PropertyReader.locatorOf(keyLblDatePickerGetMonths)).getText().trim();
                    // imonth=imonth.substring(5,8);
                }

            }



        }

        driver.findElement(PropertyReader.locatorOf(keyBtnOkDatePicker)).click();
    }

}
