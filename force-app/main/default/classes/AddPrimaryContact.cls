public class AddPrimaryContact implements Queueable { 
    private Contact contacts;
    private String state;
    
    public AddPrimaryContact(Contact con, String state){
        this.contacts = con;
        this.state = state;
    }
    public void execute(QueueableContext context) {
        List<Account> accList = [SELECT Name FROM Account WHERE BillingState=:state LIMIT 200];
        List<Contact> insertCon = new list<Contact>();
        for(Account acc: accList){
            Contact cont = contacts.clone();
            cont.AccountId = acc.Id;
            insertCon.add(cont);
        }
        if(!insertCon.isEmpty()) insert insertCon;
    }
}