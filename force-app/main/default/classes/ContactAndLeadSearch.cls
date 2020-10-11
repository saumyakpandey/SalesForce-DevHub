public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(string searchParam){
        List<List<SObject>> searchList = [FIND :searchParam IN NAME FIELDS 
                                      RETURNING Contact(Name), Lead(FirstName,LastName)];
        return searchList;
    }
}