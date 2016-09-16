public class DEDUPLICATEHANDLER {
    public Static void checkDuplicateLeads(List<Lead> newList )
    {
        Map<String,Lead> oldRecord = new Map <String,Lead>();
        for(Lead record:[Select id, email, phone from Lead where email!=Null and phone!=null])
        {
            oldRecord.put(record.Email, record);
            oldRecord.put(record.Phone, record);
            System.debug(oldRecord);
        } 
        
        for(Lead leads: newList)
        {
            if((leads.Email !=null && leads.Phone !=null) && oldRecord.containsKey(leads.Email) && oldRecord.containsKey(leads.Phone)) 
            {
                Leads.addError('Record exists');
            }
        }
            
    }
    
}