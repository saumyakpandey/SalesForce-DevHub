public class ContactSearch {
    public static List<Contact> searchForContacts(string lastName, string mailPostalCode){
        List<Contact> contactList = [Select Id, Name From Contact Where LastName=:lastName AND MailingPostalCode =:mailPostalCode];
        return contactList;
    }
}