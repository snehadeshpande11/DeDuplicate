public class ContactAndLeadSearch {
    public static List<List< SObject>>searchContactsAndLeads(String ln)
    {
        List<List< SObject>> sobjects=[find:ln IN ALL FIELDS Returning lead(FirstName,LastName), contact(FirstName, LastName)];
        System.debug(sobjects);
        return sobjects;
    }

}