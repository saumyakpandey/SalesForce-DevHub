@isTest
public class DailyLeadProcessorTest {
	@testSetup
    static void setup(){
        List<Lead> insertLead = new List<Lead>();
        
        for(integer i=0; i<200; i++){
            insertLead.add(new Lead(LastName = 'Test '+i,
                                   Company = 'Comp'));
        }       
        insert insertLead;
    }
    
    @isTest
    static void testScheduleable(){
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor()); 
    }
}