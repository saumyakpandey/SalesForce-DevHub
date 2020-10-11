public class AccountProcessor {
	@future
    public static void countContacts(List<Id> idList){
        List<Account> updateAcc = new List<Account>();
        for (Id ids : idList){
            List<Contact> contactList =[Select Name from Contact where AccountId =: ids];
            Account acc = [select Name, Number_of_Contacts__c from Account where id=: ids limit 1];
            integer contactNumber = contactList.size();
            
            acc.Number_of_Contacts__c = contactNumber;
            updateAcc.add(acc);            
        }
        update updateAcc;
    }
}