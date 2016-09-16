public class ContactSearch {
    public static List<Contact> searchForContacts(String ln)
    {
        List<Contact> cont=[select id,Name from Contact where LastName=:ln];
        
        System.debug('cont='+cont);
        return cont;
        
    }
}