package pages;

import base.Keywords;
import exceptions.ApplicationException;
import helper.Device;
import io.appium.java_client.MobileBy;
import org.openqa.selenium.By;

public class Page extends Keywords {

    private String keyLblOrganizationName = "AutoBahn.FTUnionBankAccount.LblOrganizationName";
    private String keyLblPageTitle = "AutoBahn.FTUnionBankAccount.LblPageTitle";
    private String keyLblTransferFrom = "AutoBahn.FTUnionBankAccount.LblTransferFrom";
    private String keyLblTransferTo = "AutoBahn.FTUnionBankAccount.LblTransferTo";
    private String keyLblAmount = "AutoBahn.FTUnionBankAccount.LblAmount";
    private String keyLblTransferDate = "AutoBahn.FTUnionBankAccount.LblTransferDate";
    private String keyLblRemarks = "AutoBahn.FTUnionBankAccount.LblRemarks";
    private String keyTxtTransferFrom = "AutoBahn.FTUnionBankAccount.TxtTransferFrom";
    private String keyTxtTransferTo = "AutoBahn.FTUnionBankAccount.TxtTransferTo";
    private String keyBtnSelectBeneficiary = "AutoBahn.FTUnionBankAccount.BtnSelectBeneficiary";
    private String keyTxtAmount = "AutoBahn.FTUnionBankAccount.TxtAmount";
    private String keyTxtTransferDate = "AutoBahn.FTUnionBankAccount.TxtTransferDate";
    private String keyBtnSelectTransferDate = "AutoBahn.FTUnionBankAccount.BtnSelectTransferDate";
    private String keyTxtRemarks = "AutoBahn.FTUnionBankAccount.TxtRemarks";
    private String keyBtnNext = "AutoBahn.FTUnionBankAccount.BtnNext";

    private String keyTxtBeneficiaryName = "AutoBahn.FTPESONetAccount.TxtBeneficiaryName";
    private String keyTxtBeneficiaryAccountNumber = "AutoBahn.FTPESONetAccount.TxtBeneficiaryAccountNumber";
    private String keyTxtSelectReceivingBank = "AutoBahn.FTPESONetAccount.TxtSelectReceivingBank";
    private String keyTxtSelectPurpose = "AutoBahn.FTPESONetAccount.TxtSelectPurpose";
    private String keyLblSelectPurpose = "AutoBahn.FTPESONetAccount.LblSelectPurpose";
    private String keySWIFTTxtBeneficiaryAddress = "AutoBahn.FTSWIFTAccount.TxtBeneficiaryAddress";
    private String keySWIFTTxtSelectRecevingBank = "AutoBahn.FTSWIFTAccount.TxtSelectRecevingBank";


    private String keyLblStartDate = "AutoBahn.FTUnionBankAccount.LblStartDate";
    private String keyLblReviewStartDate = " AutoBahn.FTUnionBankAccount.LblReviewStartDate";
    private String keyLblFrequency = "AutoBahn.FTUnionBankAccount.LblFrequency";
    private String keyLblReviewFrequency = "AutoBahn.FTUnionBankAccount.LblReviewFrequency";
    private String keyLblEndDate = "AutoBahn.FTUnionBankAccount.LblEndDate";
    private String keyLblReviewEndDate = "AutoBahn.FTUnionBankAccount.LblReviewEndDate";

    private String keyBtnEditSelectTransferDate = "AutoBahn.FTUnionBankAccount.BtnEditSelectTransferDate";


    public void verifyPageTitle(String ititle) throws ApplicationException {
        verify.elementTextMatching(keyLblPageTitle, ititle);
    }

    public void verifyPageContents(String iorg) throws ApplicationException {
        if (Device.isAndroid()) {
            verify.elementTextMatching(keyLblOrganizationName, iorg);
            verify.elementTextMatching(keyLblTransferFrom, "Transfer from");
            verify.elementTextMatching(keyLblTransferTo, "Transfer to");
            verify.elementTextMatching(keyLblAmount, "Amount");
            verify.elementTextMatching(keyLblTransferDate, "Proposed Transfer Date");
            verify.elementTextMatching(keyLblRemarks, "Remarks");
            verify.elementAttributeMatching(keyTxtTransferFrom, "text", "UnionBank Source Account");
            verify.elementAttributeMatching(keyTxtTransferTo, "text", "UnionBank Account Number");
            verify.elementAttributeMatching(keyTxtAmount, "text", "0.00");
            verify.elementAttributeMatching(keyTxtTransferDate, "text", "Immediately");
            verify.elementAttributeMatching(keyTxtRemarks, "text", "Optional");

            verify.elementIsPresent(keyBtnSelectBeneficiary);
            verify.elementIsPresent(keyBtnSelectTransferDate);
            verify.elementIsPresent(keyBtnNext);
        } else {
            verify.elementTextMatching(keyLblOrganizationName, iorg);
            verify.elementTextMatching(keyLblTransferFrom, "Transfer from");
            verify.elementTextMatching(keyLblTransferTo, "Transfer to");
            verify.elementTextMatching(keyLblAmount, "Amount");
            verify.elementTextMatching(keyLblTransferDate, "Proposed Transfer Date");
            verify.elementTextMatching(keyLblRemarks, "Remarks");
            // verify.elementAttributeMatching(keyTxtTransferFrom, "value", "Select one of your UnionBank accounts.");
            // verify.elementAttributeMatching(keyTxtTransferTo, "value", "Enter a 12-digit UnionBank account.");
            // verify.elementAttributeMatching(keyTxtAmount, "value", "0.00");
            // verify.elementAttributeMatching(keyTxtTransferDate, "value", "Immediately");
            //verify.elementAttributeMatching(keyTxtRemarks, "text", "Optional");

            verify.elementIsPresent(keyBtnSelectBeneficiary);
            verify.elementIsPresent(keyBtnSelectTransferDate);
            verify.elementIsPresent(keyBtnNext);
        }
    }

    public void clickTransferfrom() throws ApplicationException {
        click.elementBy(keyTxtTransferFrom);
    }

    public void clickTransferToBeneficiary() throws ApplicationException {
        try {
            click.elementBy(keyBtnSelectBeneficiary);
        } catch (Exception ex) {
            click.elementBy(MobileBy.AccessibilityId("beneficiary-name-field-accessory-button"));
        }
        WAIT.forSeconds(1);
    }

    public void clickNext() throws ApplicationException {
        if (Device.isAndroid()) {
            swipe.vertical(2, 0.8, 0.5, 5);
            click.elementBy(keyBtnNext);
        } else {
            click.elementBy(keyBtnNext);

        }
        WAIT.forSeconds(3);
    }

    public void enterTransferAmount(String iAmount) throws ApplicationException {
        if (Device.isAndroid()) {
            type.ClickAndEnterdata(keyTxtAmount, iAmount);
        } else {
            type.data(keyTxtAmount, iAmount);
            // click.elementBy(keyLblAmount);
        }
        // type.EnterdataUsingJavaScript(keyTxtAmount,iAmount);

    }

    public void enterRemarks(String iRemarks) throws ApplicationException {
        type.data(keyTxtRemarks, iRemarks);
    }

    public void IOSeditRemarks(String iRemarks) throws ApplicationException {
    type.data(keyTxtRemarks,"EditFT");

    }

    public void clickBtnTransferDate() throws ApplicationException {
        click.elementBy(keyBtnSelectTransferDate);
    }

    public void clickEditBtnTransferDate() throws ApplicationException {
        click.elementBy(keyBtnEditSelectTransferDate);
    }

    public void enterToAccountNumber(String iAccount) throws ApplicationException {
        type.data(keyTxtTransferTo, iAccount);
    }

    public void verifyPESONetPageContents(String iorg) throws ApplicationException {
        if (Device.isAndroid()) {
            verify.elementTextMatching(keyLblOrganizationName, iorg);
            verify.elementTextMatching(keyLblTransferFrom, "Transfer from");
            verify.elementTextMatching(keyLblTransferTo, "Transfer to");
            verify.elementTextMatching(keyLblAmount, "Amount");
            verify.elementTextMatching(keyLblTransferDate, "Proposed Transfer Date");
            verify.elementTextMatching(keyLblSelectPurpose, "Purpose");
            verify.elementAttributeMatching(keyTxtTransferFrom, "text", "UnionBank Source Account");
            verify.elementAttributeMatching(keyTxtBeneficiaryName, "text", "Beneficiary Name");
            verify.elementAttributeMatching(keyTxtBeneficiaryAccountNumber, "text", "Beneficiary Account Number");
            verify.elementAttributeMatching(keyTxtSelectReceivingBank, "text", "Receiving Bank");
            verify.elementAttributeMatching(keyTxtAmount, "text", "0.00");
            verify.elementIsPresent(keyBtnSelectBeneficiary);
            swipe.vertical(2, 0.8, 0.5, 5);
            verify.elementIsPresent(keyBtnSelectTransferDate);
            verify.elementAttributeMatching(keyTxtTransferDate, "text", "Immediately");
            verify.elementAttributeMatching(keyTxtSelectPurpose, "text", "Purpose");
            verify.elementTextMatching(keyLblRemarks, "Remarks");
            verify.elementAttributeMatching(keyTxtRemarks, "text", "Optional");
            verify.elementIsPresent(keyBtnNext);
            swipe.vertical(2, 0.5, 0.8, 5);
        } else {
            verify.elementTextMatching(keyLblOrganizationName, iorg);
            verify.elementTextMatching(keyLblTransferFrom, "Transfer from");
            verify.elementTextMatching(MobileBy.AccessibilityId("beneficiary-name-field-title-view"), "Transfer to");
            verify.elementTextMatching(keyLblAmount, "Amount");
            verify.elementTextMatching(keyLblTransferDate, "Proposed Transfer Date");
            verify.elementTextMatching(keyLblSelectPurpose, "Purpose");
            // verify.elementAttributeMatching(keyTxtTransferFrom, "text", "UnionBank Source Account");
            // verify.elementAttributeMatching(keyTxtBeneficiaryName, "text", "Beneficiary Name");
            // verify.elementAttributeMatching(keyTxtBeneficiaryAccountNumber, "text", "Beneficiary Account Number");
            // verify.elementAttributeMatching(keyTxtSelectReceivingBank, "text", "Receiving Bank");
            // verify.elementAttributeMatching(keyTxtAmount, "text", "0.00");
            // verify.elementAttributeMatching(keyTxtTransferDate, "text", "Immediately");
            // verify.elementAttributeMatching(keyTxtSelectPurpose, "text", "Purpose");
            verify.elementIsPresent(MobileBy.AccessibilityId("beneficiary-name-field-accessory-button"));
            verify.elementIsPresent(keyBtnSelectTransferDate);
            swipe.vertical(2, 0.8, 0.5, 5);
            verify.elementTextMatching(keyLblRemarks, "Remarks");
            // verify.elementAttributeMatching(keyTxtRemarks, "text", "Optional");
            verify.elementIsPresent(keyBtnNext);
            swipe.vertical(2, 0.5, 0.8, 5);
        }

    }

    public void verifySWIFTPageContents(String iorg) throws ApplicationException {
        if (Device.isAndroid()) {
            verify.elementTextMatching(keyLblOrganizationName, iorg);
            verify.elementTextMatching(keyLblTransferFrom, "Transfer from");
            verify.elementTextMatching(keyLblTransferTo, "Transfer to");
            verify.elementTextMatching(keyLblAmount, "Amount");
            verify.elementAttributeMatching(keyTxtTransferFrom, "text", "UnionBank Source Account");
            verify.elementAttributeMatching(keyTxtBeneficiaryName, "text", "Beneficiary Name");
            verify.elementAttributeMatching(keyTxtBeneficiaryAccountNumber, "text", "Beneficiary Account Number");
            verify.elementAttributeMatching(keySWIFTTxtBeneficiaryAddress, "text", "Beneficiary Address");
            verify.elementAttributeMatching(keySWIFTTxtSelectRecevingBank, "text", "Receiving Bank");
            verify.elementAttributeMatching(keyTxtAmount, "text", "0.00");
            verify.elementIsPresent(keyBtnSelectBeneficiary);
            swipe.vertical(2, 0.8, 0.5, 5);
            verify.elementAttributeMatching(keyTxtTransferDate, "text", "Immediately");
            verify.elementTextMatching(keyLblTransferDate, "Proposed Transfer Date");
            verify.elementIsPresent(keyBtnSelectTransferDate);
            verify.elementTextMatching(keyLblSelectPurpose, "Purpose");
            verify.elementAttributeMatching(keyTxtSelectPurpose, "text", "Purpose");
            verify.elementTextMatching(keyLblRemarks, "Remarks");
            verify.elementAttributeMatching(keyTxtRemarks, "text", "Optional");
            verify.elementIsPresent(keyBtnNext);
            swipe.vertical(2, 0.5, 0.8, 5);
        } else {
            verify.elementTextMatching(keyLblOrganizationName, iorg);
            verify.elementTextMatching(keyLblTransferFrom, "Transfer from");
            //  verify.elementTextMatching(keyLblTransferTo, "Transfer to");
            verify.elementTextMatching(MobileBy.AccessibilityId("beneficiary-name-field-title-view"), "Transfer to");
            verify.elementTextMatching(keyLblAmount, "Amount");
            verify.elementTextMatching(keyLblTransferDate, "Proposed Transfer Date");
            verify.elementTextMatching(keyLblSelectPurpose, "Purpose");
            // verify.elementAttributeMatching(keyTxtTransferFrom, "text", "UnionBank Source Account");
            // verify.elementAttributeMatching(keyTxtBeneficiaryName, "text", "Beneficiary Name");
            // verify.elementAttributeMatching(keyTxtBeneficiaryAccountNumber, "text", "Beneficiary Account Number");
            // verify.elementAttributeMatching(keySWIFTTxtBeneficiaryAddress, "text", "Beneficiary Address");
            // verify.elementAttributeMatching(keySWIFTTxtSelectRecevingBank, "text", "Receiving Bank");
            // verify.elementAttributeMatching(keyTxtAmount, "text", "0.00");
            // verify.elementAttributeMatching(keyTxtTransferDate, "text", "Immediately");
            // verify.elementIsPresent(keyBtnSelectBeneficiary);
            verify.elementIsPresent(MobileBy.AccessibilityId("beneficiary-name-field-accessory-button"));
            verify.elementIsPresent(keyBtnSelectTransferDate);
            swipe.vertical(2, 0.8, 0.5, 5);
            // verify.elementAttributeMatching(keyTxtSelectPurpose, "text", "Purpose");
            verify.elementTextMatching(keyLblRemarks, "Remarks");
            //  verify.elementAttributeMatching(keyTxtRemarks, "text", "Optional");
            verify.elementIsPresent(keyBtnNext);
            swipe.vertical(2, 0.5, 0.8, 5);
        }

    }

    public void ClickAndChoosePurposeDetails(String iPurpose) throws ApplicationException {
        if (Device.isAndroid()) {
            click.elementBy(keyTxtSelectPurpose);
            WAIT.forSeconds(1);
            swipe.scrollDownToTextandClick(iPurpose);
            WAIT.forSeconds(1);
            verify.elementAttributeMatching(keyTxtSelectPurpose, "text", iPurpose);

        } else {
            click.elementBy(keyTxtSelectPurpose);
            WAIT.forSeconds(1);
            try {
                click.elementBy(By.xpath("//XCUIElementTypeStaticText[@label='" + iPurpose + "']/parent::*"));
            } catch (Exception ex) {
                click.elementBy(MobileBy.AccessibilityId(iPurpose));
            }

        }
    }

    public void enterBeneficiaryNameNumberBankDetails(String iBenefName, String iBenefNumber, String iDetails) throws ApplicationException {
        if (Device.isAndroid()) {
            type.data(keyTxtBeneficiaryName, iBenefName);
            type.data(keyTxtBeneficiaryAccountNumber, iBenefNumber);
            click.elementBy(keyTxtSelectReceivingBank);
            WAIT.forSeconds(1);
            swipe.scrollDownToTextandClick(iDetails);
        } else {
            type.data(keyTxtBeneficiaryName, iBenefName);
            type.data(keyTxtBeneficiaryAccountNumber, iBenefNumber);
            click.elementBy(keyTxtSelectReceivingBank);
            WAIT.forSeconds(1);
            type.sensitiveData(MobileBy.AccessibilityId("Search"),iDetails);
            WAIT.forSeconds(2);
            click.elementBy(By.xpath("//XCUIElementTypeStaticText[@label='" + iDetails + "']/parent::*"));
        }
    }

    public void enterSWIFTBeneficiaryDetails(String iBeneficiaryName, String iBeneficiaryNumber, String iBeneficiaryAddress, String iDetails) throws ApplicationException {
        if (Device.isAndroid()) {
            type.data(keyTxtBeneficiaryName, iBeneficiaryName);
            type.data(keyTxtBeneficiaryAccountNumber, iBeneficiaryNumber);
            type.data(keySWIFTTxtBeneficiaryAddress, iBeneficiaryAddress);
            click.elementBy(keySWIFTTxtSelectRecevingBank);
            WAIT.forSeconds(1);
            swipe.scrollDownToTextandClick(iDetails);
        } else {
            type.setValueWithoutClearing(keyTxtBeneficiaryName, iBeneficiaryName);
            type.setValueWithoutClearing(keyTxtBeneficiaryAccountNumber, iBeneficiaryNumber);
            type.setValueWithoutClearing(keySWIFTTxtBeneficiaryAddress, iBeneficiaryAddress);
            click.elementBy(keySWIFTTxtSelectRecevingBank);
            WAIT.forSeconds(1);
            type.sensitiveData(MobileBy.AccessibilityId("Search"),iDetails);
            WAIT.forSeconds(2);
            click.elementBy(By.xpath("//XCUIElementTypeStaticText[@label='" + iDetails + "']/parent::*"));
        }
    }

    public void swipedown() throws ApplicationException {
        swipe.vertical(2, 0.8, 0.5, 5);

    }

    public String getStartDate() throws ApplicationException {
        return get.elementText(keyLblReviewStartDate);
    }

    public String getEndDate() throws ApplicationException {
        return get.elementText(keyLblReviewEndDate);
    }

    public String getFrequency() throws ApplicationException {
        return get.elementText(keyLblReviewFrequency);
    }

    public void verifyTransactionDateDetails(String startdate, String frequency, String endDate) throws ApplicationException {
        if(Device.isAndroid()) {
            verify.elementTextMatching(keyLblReviewStartDate, startdate);
            verify.elementTextMatching(keyLblReviewFrequency, frequency);
            verify.elementTextMatching(keyLblReviewEndDate, endDate);
        }
    }

    public void verifyOneTimeTransactionDateDetails(String startdate, String frequency) throws ApplicationException {
        if(Device.isAndroid()) {
            verify.elementTextMatching(keyLblReviewStartDate, startdate);
            verify.elementTextMatching(keyLblReviewFrequency, frequency);
        }

    }

}
