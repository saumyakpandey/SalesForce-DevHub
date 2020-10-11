global class LeadProcessor implements Database.Batchable<sObject> {
	global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            [SELECT ID, LeadSource FROM Lead]
        );
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> updLead = new List<Lead>();
        for(Lead lead: scope){
            lead.LeadSource = 'Dreamforce';
            updLead.add(lead);
        }
        update updLead;
    }    
    global void finish(Database.BatchableContext bc){}
}