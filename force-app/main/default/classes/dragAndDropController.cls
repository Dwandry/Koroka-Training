public with sharing class dragAndDropController {    

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        List<Account> accList = [SELECT Id, Name, ShortName__c
                                  FROM Account
                                  LIMIT 10];
        return accList;
    }
}
