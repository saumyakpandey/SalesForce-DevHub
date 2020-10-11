public class AccountHandler {
    public static Account insertNewAccount(string accName){
        try{
            Account acc = new Account();
            acc.Name = accName;
            insert acc;
            return acc;
        }catch(Exception e){
            return null;
        }
    }
}