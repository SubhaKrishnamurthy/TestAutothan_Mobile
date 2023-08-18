package helper;

import base.Test;
import constants.Keys;
import constants.OS;

public class Device {

    public static boolean isAndroid(){
        return Test.attributes.get(Keys.OS).equalsIgnoreCase(OS.ANDROID);

    }

    public static boolean isIOS(){
        return Test.attributes.get(Keys.OS).equalsIgnoreCase(OS.iOS);
    }

    public static boolean isNONSME(){
        return Test.attributes.get(Keys.ApplicationType).toLowerCase().contentEquals("non-sme");

    }

    public static boolean isSME(){
        return Test.attributes.get(Keys.ApplicationType).toLowerCase().contentEquals("sme");
    }

}
