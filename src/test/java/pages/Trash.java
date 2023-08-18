package pages;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Trash {

    public static void main(String[] args) {

        String a="Your transaction was successfully posted to the indicated biller. UB751 serves as your UnionBank reference number.";
        String ireference[]=a.split("[.]");
        String iref[]=ireference[1].trim().split(" ");
        System.out.println(iref[0]);
    }
}
