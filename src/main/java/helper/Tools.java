package helper;

import base.RunManager;
import base.Test;
import constants.Keys;
import exceptions.ApplicationException;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.text.*;
import java.time.LocalDateTime;
import java.util.*;

public class Tools {

    private Random random = new Random(System.currentTimeMillis());

    public String REMOVE_MULTIPLE_SPACES_AND_NEW_LINES(String text) {
        String i = text.replace("\n", " ").replaceAll("\\s{2,}", " ").replaceAll("\\u00A0", "").trim();
        return i;
    }

    public String nbspRemove(String text) {
        return text.trim().replaceAll("\\u00A0", "");
    }

    public String convertToLetterCase(String text) {
        String firstLetter = text.substring(0, 1);
        String exceptFirstLetter = text.substring(1, text.length());
        return firstLetter.toUpperCase() + exceptFirstLetter.toLowerCase();
    }

    public ArrayList<String> getDate(String date) {
        ArrayList<String> i = new ArrayList<>(3);
        LocalDateTime now = LocalDateTime.now();
        String day = date.trim().replace("today", "");
        if (day.equalsIgnoreCase("")) {
            i.add(Integer.toString(now.getDayOfMonth()));
            i.add(Integer.toString(now.getMonthValue()));
            i.add(Integer.toString(now.getYear()));
        } else {
            long d = Integer.parseInt(day.replace("+", ""));
            i.add(Integer.toString(now.plusDays(d).getDayOfMonth()));
            i.add(Integer.toString(now.plusDays(d).getMonthValue()));
            i.add(Integer.toString(now.plusDays(d).getYear()));
        }
        return i;
    }

    public String fixAmountIssue(String amount) {
        String[] amtSplit = amount.split(" ");
        String amt = amtSplit[0] + " " + amtSplit[amtSplit.length - 1];
        return amt;
    }

    public double getNumericalValue(String amount) {
        String[] beforetransaction = amount.split(" ");

        double beforetran = Double.parseDouble(beforetransaction[1].replaceAll(",", "").trim());
        return beforetran;
    }

    public double getNumericalValueforServiceFee(String amount) {

        if(amount.toLowerCase().contains("free"))
        {
            amount="+ PHP 0.00";
        }
        String[] beforetransaction = amount.split(" ");
        double beforetran = Double.parseDouble(beforetransaction[2].replaceAll(",", "").trim());
        return beforetran;
    }

    public String pesoAmount(double amount) {
        NumberFormat n = NumberFormat.getCurrencyInstance(Locale.CHINA);
        String s = n.format(amount / 1);
        return s.replaceAll("￥", "PHP ");
    }

    public String USDAmount(double amount) {
        NumberFormat n = NumberFormat.getCurrencyInstance(Locale.CHINA);
        String s = n.format(amount / 1);
        return s.replaceAll("￥", "USD ");
    }

    public String getDateInFormat(String day, String month, String year, String format) throws ParseException {
        String inputPattern = "yyyy-M-dd";
        if (month.trim().length() > 1) {
            inputPattern = "yyyy-MM-dd";
        }
        SimpleDateFormat inputFormat = new SimpleDateFormat(inputPattern); // or "YYYY-MM-DDThh:mm:ss±0000"
        String dateInString = year + "-" + month + "-" + day;
        Date date = inputFormat.parse(dateInString);
        SimpleDateFormat outputFormat = new SimpleDateFormat(format);
        return outputFormat.format(date);
    }

    public String currencyFormatter(double amount) {
        NumberFormat nf = NumberFormat.getCurrencyInstance();
        DecimalFormatSymbols decimalFormatSymbols = ((DecimalFormat) nf).getDecimalFormatSymbols();
        decimalFormatSymbols.setCurrencySymbol("");
        ((DecimalFormat) nf).setDecimalFormatSymbols(decimalFormatSymbols);
        return nf.format(amount).trim();
    }

    public String upto2Decimals(Object amount) {
        return new DecimalFormat("#0.00").format(amount);
    }


    public String cardgenerator(String bin, int length) {

        int randomNumberLength = length - (bin.length() + 1);

        StringBuilder builder = new StringBuilder(bin);
        for (int i = 0; i < randomNumberLength; i++) {
            int digit = this.random.nextInt(10);
            builder.append(digit);
        }

        // Do the Luhn algorithm to generate the check digit.
        int checkDigit = this.getCheckDigit(builder.toString());
        builder.append(checkDigit);

        return builder.toString();
    }


    private int getCheckDigit(String number) {


        int sum = 0;
        for (int i = 0; i < number.length(); i++) {

            // Get the digit at the current position.
            int digit = Integer.parseInt(number.substring(i, (i + 1)));

            if ((i % 2) == 0) {
                digit = digit * 2;
                if (digit > 9) {
                    digit = (digit / 10) + (digit % 10);
                }
            }
            sum += digit;
        }

        // The check digit is the number required to make the sum a multiple of
        // 10.
        int mod = sum % 10;
        return ((mod == 0) ? 0 : 10 - mod);
    }


    public String DisplayMonthFully(String idata) {


        String selectdata[] = idata.split(" ");
        String month = selectdata[0];
        String date = selectdata[1];
        String year = selectdata[2];

        HashMap<String, String> map = new LinkedHashMap<String, String>();
        map.put("Jan", "January");
        map.put("Feb", "February");
        map.put("Mar", "March");
        map.put("Apr", "April");
        map.put("May", "May");
        map.put("Jun", "June");
        map.put("Jul", "July");
        map.put("Aug", "August");
        map.put("Sep", "September");
        map.put("Oct", "October");
        map.put("Nov", "November");
        map.put("Dec", "December");

        return map.get(month) + " " + date + " " + year;


    }

    public String GetMonthNameFully(String idata) {


        HashMap<String, String> map = new LinkedHashMap<String, String>();
        map.put("Jan", "January");
        map.put("Feb", "February");
        map.put("Mar", "March");
        map.put("Apr", "April");
        map.put("May", "May");
        map.put("Jun", "June");
        map.put("Jul", "July");
        map.put("Aug", "August");
        map.put("Sep", "September");
        map.put("Oct", "October");
        map.put("Nov", "November");
        map.put("Dec", "December");

        return map.get(idata);


    }

    public void mailnotification() {
        // Create object of Property file
        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {

                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("webtestapprover1@gmail.com", "Testing@123");

                    }

                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("naturefury@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("naturefury@gmail.com"));
            message.setSubject("Automation Report Run " + RunManager.runID);
            BodyPart messageBodyPart1 = new MimeBodyPart();
            messageBodyPart1.setText("Please find atatched automation report for the RUN " + RunManager.runID);
            MimeBodyPart messageBodyPart2 = new MimeBodyPart();
            //String file="/Users/ubp/Documents/GetGo_Mobile/CucumberJava/emailable-results/Run-2797/Automation-Dashboard_iOS.html";
            String file = System.getProperty("user.dir") + "/" + Test.attributes.get(Keys.RunFolder) + "Automation-Dashboard_" + Test.attributes.get(Keys.OS) + ".html";
            DataSource source = new FileDataSource(file.trim());
            messageBodyPart2.setDataHandler(new DataHandler(source));
            messageBodyPart2.setFileName(file.trim());
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart2);
            multipart.addBodyPart(messageBodyPart1);
            message.setContent(multipart);
            Transport.send(message);
            System.out.println("=====Email Sent=====");

        } catch (MessagingException e) {

            throw new RuntimeException(e);

        }

    }

    public static String getDateinGivenFormat(String format) throws ApplicationException {
        try {
            DateFormat df = new SimpleDateFormat(format);
            Date date = new Date(System.currentTimeMillis());
            return df.format(date);
        } catch (Exception ex) {
            throw new ApplicationException("Please Check the Date Format Pattern details and it might be invalid");
        }

    }
    public static int getCurrentDate() throws ApplicationException {
        try {
            DateFormat df = new SimpleDateFormat("dd");
            Date date = new Date(System.currentTimeMillis());
            return Integer.parseInt(df.format(date));
        } catch (Exception ex) {
            throw new ApplicationException("Please Check the Date Format Pattern details and it might be invalid");
        }

    }

}