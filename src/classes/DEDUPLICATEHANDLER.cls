public class DEDUPLICATEHANDLER
{
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
                Leads.addError ('Record exists');
            }
        }
        
    }
    
    public Static void UpdatecheckDuplicateLeads(Map<id, Lead> newMap,Map<id, Lead> oldMap, List<Lead> newList)
    {  
      
        for(Lead l: newList)
            
            if(oldMap.get(l.id).phone != newMap.get(l.id).phone && oldMap.get(l.id).email != newMap.get(l.id).email )
        {
            List<Lead>compareList = new List<Lead>();
            id  idOfLead=newMap.get(l.id).id;
            for(Lead compare :[select id,email,phone from Lead where (id !=: idOfLead)])
            {
                if(compare.email == newMap.get(l.id).email )
                {
                    compare .addError ('Record exists in DUPLICATE');  
                }
                if(compare.phone == newMap.get(l.id).phone )
                {
                    compare .addError ('Record exists in DUPLICATE');  
                }
            }
        }
    }
}
/* }
}*/



//l.addError ('Record exists in DUPLICATE'); 
//for(Lead L1:leadMap)
//{
//


// Map<String,Lead> oldRecord = new Map <String,Lead>();
// integer i;
// sum = i+j;

/* for(Lead l  : [select id,email , phone from Lead where email != null AND Phone != null]) 
{
System.debug(l);
//(key ,value)
Key1=l.email+ l.phone;
oldRecord.put(Key1, l);
System.debug(key1);
System.debug('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');

}*/
//(Lead compare : [select id, email, phone from Lead where id not IN oldMap])
// System.debug('welcomeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
//String key2=L1.email+L1.phone;
//if(oldMap.containsKey(ids))
//{
//
// //System.debug(ids);

// if(newMap.get(ids).email == oldMap.get(ids).email && newMap.get(ids).phone==oldMap.get(ids).phone)
//{
// System.debug('Record exists in DUPLICATE');
// oldMap.get(ids).addError ('Record exists in DUPLICATE');
//System.debug('welcome');