public class AccountUtils {
    public static List<Account> accountsByState (String stateCode){
        List<Account> accList = [Select Id, Name from Account where BillingState =: stateCode];
        return accList;
    }
}