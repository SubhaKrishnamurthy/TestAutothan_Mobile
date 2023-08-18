package actions;

import java.util.HashMap;

public class CurrencyLocator {

    HashMap<String,String> currencymap=new HashMap<>();

    public String locator(String cvalue){


        currencymap.put("PHP","//XCUIElementTypeStaticText[@value='PHP']");
        currencymap.put("AUD","//XCUIElementTypeStaticText[@value='AUD']");
        currencymap.put("HKD","//XCUIElementTypeStaticText[@value='HKD']");
        currencymap.put("SGD","//XCUIElementTypeStaticText[@value='SGD']");
        currencymap.put("EUR","//XCUIElementTypeStaticText[@value='EUR']");
        currencymap.put("GBP","//XCUIElementTypeStaticText[@value='GBP']");
        currencymap.put("JPY","//XCUIElementTypeStaticText[@value='JPY']");
        currencymap.put("USD","//XCUIElementTypeStaticText[@value='USD']");
        currencymap.put("CAD","//XCUIElementTypeStaticText[@value='CAD']");

    return currencymap.get(cvalue);

    }

    public String AmountLocator(String cvalue){

        currencymap.put("PHP","//XCUIElementTypeStaticText[@value='PHP']/following::XCUIElementTypeStaticText[@name='dashboard-wallets-amount'][1]");
        currencymap.put("AUD","//XCUIElementTypeStaticText[@value='AUD']/following::XCUIElementTypeStaticText[@name='dashboard-wallets-amount'][1]");
        currencymap.put("HKD","//XCUIElementTypeStaticText[@value='HKD']/following::XCUIElementTypeStaticText[@name='dashboard-wallets-amount'][1]");
        currencymap.put("SGD","//XCUIElementTypeStaticText[@value='SGD']/following::XCUIElementTypeStaticText[@name='dashboard-wallets-amount'][1]");
        currencymap.put("EUR","//XCUIElementTypeStaticText[@value='EUR']/following::XCUIElementTypeStaticText[@name='dashboard-wallets-amount'][1]");
        currencymap.put("GBP","//XCUIElementTypeStaticText[@value='GBP']/following::XCUIElementTypeStaticText[@name='dashboard-wallets-amount'][1]");
        currencymap.put("JPY","//XCUIElementTypeStaticText[@value='JPY']/following::XCUIElementTypeStaticText[@name='dashboard-wallets-amount'][1]");
        currencymap.put("USD","//XCUIElementTypeStaticText[@value='USD']/following::XCUIElementTypeStaticText[@name='dashboard-wallets-amount'][1]");
        currencymap.put("CAD","//XCUIElementTypeStaticText[@value='CAD']/following::XCUIElementTypeStaticText[@name='dashboard-wallets-amount'][1]");

        /*currencymap.put("PHP","(//XCUIElementTypeStaticText[@name='dashboard-wallets-amount'])[1]");
        currencymap.put("AUD","(//XCUIElementTypeStaticText[@name='dashboard-wallets-amount'])[2]");
        currencymap.put("HKD","(//XCUIElementTypeStaticText[@name='dashboard-wallets-amount'])[3]");
        currencymap.put("SGD","(//XCUIElementTypeStaticText[@name='dashboard-wallets-amount'])[4]");
        currencymap.put("EUR","(//XCUIElementTypeStaticText[@name='dashboard-wallets-amount'])[5]");
        currencymap.put("GBP","(//XCUIElementTypeStaticText[@name='dashboard-wallets-amount'])[6]");
        currencymap.put("JPY","(//XCUIElementTypeStaticText[@name='dashboard-wallets-amount'])[7]");
        currencymap.put("USD","(//XCUIElementTypeStaticText[@name='dashboard-wallets-amount'])[8]");
        currencymap.put("CAD","(//XCUIElementTypeStaticText[@name='dashboard-wallets-amount'])[9]");
*/
        System.out.println(currencymap.get(cvalue));
        return currencymap.get(cvalue);

    }
}
