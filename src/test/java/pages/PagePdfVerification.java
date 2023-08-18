package pages;

import base.Keywords;
import cucumber.api.DataTable;
import exceptions.ApplicationException;
import helper.Device;

import java.text.ParseException;
import java.util.List;

public class PagePdfVerification extends Keywords {


    private String keyLblOrganisationName = "AutoBahn.BillPayment.LblOrganisationName";

    public List<String> getpdfverification(String argFileName) throws ApplicationException, ParseException, InterruptedException {
       // List<List<String>> data = usercredentials.raw();
       //  System.out.println("enter text "+data.get(1).get(1));

         List<String> pdfContentAsList = pdfverification.getPdfTextsInList(argFileName);

         return pdfContentAsList;
    }

    public void pdfverification(DataTable usercredentials,List<String> pdfContentAsList) throws ApplicationException, ParseException, InterruptedException {
        List<List<String>> data = usercredentials.raw();
        System.out.println("enter text "+data.get(1).get(1));
        pdfverification.verify_PdfValues(data,pdfContentAsList);

    }

    public String getLatestFileNameBeforeDowload(String FolderPath) throws ApplicationException, ParseException, InterruptedException {
        return pdfverification.getLastModifiedFileTime(FolderPath, "pdf");

    }

    public String getLatestDownloadedFileName(String FolderPath,String LastDownloadFileName, String fileExtension) throws ApplicationException, ParseException, InterruptedException {
         Boolean tempHolder=pdfverification.verifyDownloadComplete(FolderPath, LastDownloadFileName, fileExtension);
        return pdfverification.getTheNewestFile(FolderPath, "pdf").getName();

    }


 /*public void pdfverification(DataTable usercredentials,List<String>pdfContentAsList) throws ApplicationException, ParseException, InterruptedException {
        pdfverification.verify_PdfValues(usercredentials,pdfContentAsList);

    }*/


}
