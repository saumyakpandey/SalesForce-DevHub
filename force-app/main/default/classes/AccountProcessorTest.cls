@isTest
public class AccountProcessorTest {
@isTest
    static void countContactsTest(){
        List<Contact> conListInsert = new List<Contact>();
        List<Id> idList = new List<Id>();
        Account acc = new Account(Name='test property');
        insert acc;
        idList.add(acc.Id);
        
        Contact con1 = new Contact(LastName='Name 1',AccountId = acc.Id);
        Contact con2 = new Contact(LastName='Name 2',AccountId = acc.Id);
        Contact con3 = new Contact(LastName='Name 3',AccountId = acc.Id);
        Contact con4 = new Contact(LastName='Name 4',AccountId = acc.Id);
        
        insert con1;
        insert con2;
        insert con3;
        insert con4;
        
        Test.startTest();
        AccountProcessor.countContacts(idList);
        Test.stopTest();
        
    }
}