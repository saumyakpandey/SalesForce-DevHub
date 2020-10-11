public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> newAccList){
       
        for(Account acc : newAccList){
            acc.ShippingState = acc.BillingState;
           
        }
        
    }
}