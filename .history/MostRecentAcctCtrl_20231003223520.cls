public with sharing class MostRecentAcctCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [Select Id, Name, Phone, AnnualRevenue, Rating FROM Account ORDER BY CreatedDate DESC LIMIT 10];
    }
}