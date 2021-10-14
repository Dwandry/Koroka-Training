public with sharing class AccountTriggerHandler implements ITrigger {
    
    public static Boolean isTriggerDisabled = false;
    TriggerSettings__c settings = TriggerSettings__c.getOrgDefaults();
    public Boolean isDisabled(){
        
        if (settings.AccountTriggerDisabled__c) {
            return true;
        }
        else {
            return isTriggerDisabled;
        }
    }
    public void beforeInsert(List<SObject> newAccounts){        
        
    }    

    public void beforeUpdate(List<SObject> newAccounts, List<SObject> oldAccounts, Map<Id,SObject> newAccountsMap, Map<Id,SObject> oldAccountsMap){
        
    }

    public void beforeDelete(List<SObject> oldAccounts, Map<Id,SObject> oldAccountsMap){
        
    }

    public void afterInsert(List<SObject> newAccounts, Map<Id,SObject> newAccountsMap){
        system.debug('AI');
        checkAnnualRevenue((List<Account>)newAccounts, null);
    }

    public void afterUpdate(List<SObject> newAccounts, List<SObject> oldAccounts, Map<Id,SObject> newAccountsMap, Map<Id,SObject> oldAccountsMap){
        system.debug('AU');
        checkAnnualRevenue((List<Account>)newAccounts, (Map<Id,Account>)oldAccountsMap);
    }

    public void afterDelete(List<SObject> oldAccounts, Map<Id,SObject> oldAccountsMap){

    }

    public void afterUndelete(List<SObject> newAccounts, Map<Id,SObject> newAccountsMap){

    }

    void checkAnnualRevenue(List<Account> newAccounts, Map<Id,Account> oldAccountsMap){
        system.debug('In Method');
        List<Account> accountsToProceed = [SELECT Id, Name, AnnualRevenue 
                                           FROM Account
                                           WHERE Id IN :  newAccounts];
                                           system.debug(accountsToProceed);
        for (Account account_i : accountsToProceed) {
            if (account_i.AnnualRevenue > 100000000) {
                system.debug('In IF');
                account_i.Name = account_i.Name + ' ✓';
            }
        }
        
    }

    public void andFinally(){
        System.debug('ANDFINALLY');
    }
    
}