@isTest
public class AddPrimaryContactTest {
	@testSetup
    static void setup(){
        List<Account> insertAcc = new List<Account>();
        
        for(integer i=0; i<50; i++){
            insertAcc.add(new Account(Name = 'Test '+i,
                                     BillingState = 'NY'));
        }
        
        for(integer i=0; i<50; i++){
            insertAcc.add(new Account(Name = 'Test '+i,
                                     BillingState = 'CA'));
        }
        
        insert insertAcc;
    }
    
    @isTest
    static void primaryConTest(){
        List<Account> accCA = [SELECT Name FROM Account WHERE billingState=:'CA' LIMIT 50];
        Contact con = new Contact(LastName = 'Test Contact');
        insert con;
        
        AddPrimaryContact apc = new AddPrimaryContact(con, 'CA');
        
        Test.startTest();
        system.enqueueJob(apc);
        Test.stopTest();
        
        system.assertEquals(50, [select count() from Contact 
                                 where accountID IN (SELECT id FROM Account WHERE BillingState = 'CA')]); 
    }
}