package helper;
import actions.Click;
import base.Keywords;
import base.Test;

import constants.Keys;
import cucumber.api.DataTable;
import exceptions.ApplicationException;
import exceptions.EnvironmentException;
import io.appium.java_client.MobileBy;
import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.apache.pdfbox.io.RandomAccessBufferedFileInputStream;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class PdfVerification extends Keywords {
    private static Logger log = Logger.getLogger(PdfVerification.class);

    private List<String> pdfContents = new ArrayList<String>();


    public List<String> getPdfTextsInList(String pdfFileName) throws ApplicationException {
        // public  void getPdfTextsInList() {
        File file = new File(pdfFileName);
        try {


            log.info("Loading pdf document ");

            PDDocument doc = PDDocument.load(file);
            try {
                Scanner s = new Scanner(new PDFTextStripper().getText(doc));

                while (s.hasNextLine()) {
                    pdfContents.add(s.nextLine());
                }
            } finally {
                doc.close();
            }
        }
        catch (IOException e) {
                log.error("IO Error occured while reading texts from pdf : " + pdfFileName + "error is : " + e.getMessage());
            throw new ApplicationException("IO Error occured while reading texts from pdf : " + pdfFileName + "error is : " + e.getMessage());
            } catch (Exception e) {
                log.error("Error occured while reading texts from pdf : " + pdfFileName + "error is : " + e.getMessage());

            }
            return pdfContents;
        }





        public  void verify_PdfValues(List<List<String>> ExpectedData,List<String> pdfContents) throws ApplicationException{
              String lastMatchedValue=null;
            boolean comeOutOfVerification = false;
            String reportingFlag=null;
                try {

                    log.info("Accessing recent report file");

                    log.info("Report verification Started : ");
                                List<String> cellDataHolder ;
                                List<String> tempDataHolder = new ArrayList<>();

                                for (int i =0; i < ExpectedData.size()&& !comeOutOfVerification; i++) { // looping

                                        cellDataHolder=getExpectedTableRowData(ExpectedData.get(i));
                                    int a=0;

                                        for (int p = 0; p < cellDataHolder.size(); p++) {
                                                for (int q = 0; q < pdfContents.size(); q++) {
                                                        if (pdfContents.get(0).contains(cellDataHolder.get(p))) {
                                                                tempDataHolder.add(cellDataHolder.get(p));
                                                                break;
                                                        }
                                                          pdfContents.remove(0);
                                                    if (pdfContents.size() == 1)
                                                        q = -1;
                                                    else
                                                        q = 0;
                                                          if (tempDataHolder.size() > 0) {
                                                                if (a<p){
                                                                   a=p;
                                                                    lastMatchedValue = cellDataHolder.get(a);
                                                                }
                                                                p = 0;
                                                                tempDataHolder.removeAll(tempDataHolder);
                                                          }
                                                 }

                                            // To notify user where pdf verification failed ~
                                                if (p < cellDataHolder.size() && pdfContents.size() == 0) {
                                                    reportingFlag="Report Verification failed !!! " + lastMatchedValue
                                                            + "  from below Expected Row Values did not match in entire file: \n" + Arrays.toString(cellDataHolder.toArray());
                                                    log.error(reportingFlag );

                                                    //log.error(Arrays.toString(cellDataHolder.toArray()));
                                                        cellDataHolder.removeAll(cellDataHolder);
                                                        tempDataHolder.removeAll(tempDataHolder);
                                                        comeOutOfVerification = true;
                                                       // break;
                                                    throw new ApplicationException(reportingFlag);
                                                }

                                                if (tempDataHolder.size() == cellDataHolder.size()) {
                                                    log.info(Arrays.toString(cellDataHolder.toArray()) + " has been matched with : ");
                                                    log.info(pdfContents.get(0));
                                                    log.info(Arrays.toString(cellDataHolder.toArray()) + " has been matched with : "
                                                                + pdfContents.get(0));
                                                        cellDataHolder.removeAll(cellDataHolder);
                                                        tempDataHolder.removeAll(tempDataHolder);

                                                }
                                        }
                                }



                } catch (Exception e){


                    if (comeOutOfVerification== true){
                    throw new ApplicationException(reportingFlag);
                   }
                    log.error("Exception occured while verifying the report:  "+e.getMessage() );
                    throw new ApplicationException("Exception occured while verifying the report:  "+e.getMessage());
                }
        }

        public  List<String> getExpectedTableRowData(List<String> ExpectedRowData ) throws ApplicationException {
                List<String> cellTempDataHolder=new ArrayList<>();
                String cellValue;
                for (int j = 0; j <= ExpectedRowData.size()-1; j++) { // looping

                        cellValue = ExpectedRowData.get(j);

                        if (cellValue == null) {
                                cellTempDataHolder.add("");


                        } else {
                                cellTempDataHolder.add(cellValue.toString()); // storing
                        }

                }
                return cellTempDataHolder;
        }

    public  Boolean verifyDownloadComplete(String filePath, String fileTimeBeforeDnld, String fileType)
            throws InterruptedException, ParseException, ApplicationException {
        SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        String newFileTime = getLastModifiedFileTime(filePath,fileType);
        Date d1 = df.parse(newFileTime);
        Date d2 = df.parse(fileTimeBeforeDnld);
        int counter = 1;
        Boolean isComplete = true;
        try {

            while (d1.after(d2) == false
                    || getTheNewestFile(filePath, fileType) == null) {
                counter++;
                Thread.sleep(3000);
                newFileTime = getLastModifiedFileTime(filePath,fileType);
                d1 = df.parse(newFileTime);
                if (counter == 60) {
                    isComplete = false;
                    break;
                }
            }

        } catch (Exception e) {
            log.error("Not able to Download PDF file ---  Message is " + e.getMessage());
            throw new ApplicationException("Not able to Download PDF file ---  Message is " + e.getMessage());
        }
        return isComplete;

    }

    public String getLastModifiedFileTime(String filePath, String fileType) throws ParseException, ApplicationException {

        File fileFolderCreateFlag = new File(filePath);
        {
        if (!fileFolderCreateFlag.exists())
            fileFolderCreateFlag.mkdirs(); // or file.mkdir()
    }
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        String str = null;
        File lastfileBeforeDownload;
        try {

            lastfileBeforeDownload = getTheNewestFile(filePath,fileType);
            if (lastfileBeforeDownload != null) {
                str = sdf.format(lastfileBeforeDownload.lastModified());
            } else {
                str = sdf.format(System.currentTimeMillis());
            }
        }

        catch (Exception e1) {
            log.error(
                    "Not able get the last modified time Message is " + e1.getMessage());
            throw new ApplicationException("Not able get the last modified time Message is " + e1.getMessage());
        }
        return str;

    }

    public File getTheNewestFile(String filePath, String fileType) {
        File dir = new File(filePath);
        File[] files = dir.listFiles();
        File latestfile = null;
        if (files.length > 0) {
            List<File> fileNames = new ArrayList<>();
            System.out.println(dir.lastModified());
            for (int i = 0; i < files.length; i++) {

                if(fileType.equals("")){
                    fileNames.add(files[i]);
                }else{
                    if (files[i].getName().endsWith(fileType)) {
                        fileNames.add(files[i]);
                    }
                }
            }
            if (fileNames.size() > 0) {
                long lastModified = fileNames.get(0).lastModified();
                latestfile = fileNames.get(0);
                for (int j = 1; j < fileNames.size(); j++) {
                    if (lastModified < fileNames.get(j).lastModified()) {
                        lastModified = fileNames.get(j).lastModified();
                        latestfile = fileNames.get(j);
                    }
                }

            } else {
                log.warn("No file found of type " + fileType);
            }

        } else {
            log.warn("No files found");
        }
        return latestfile;
    }


        }

