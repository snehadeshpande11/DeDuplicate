/*When an Opportunity greater than $25000 is created send a Notification Email to the Manager of the user who created it.  Please create an Email Template and attach it to the outgoing Email message.*/

public class HandlerOfOpportunityNotificationAlert 
{
    public Static void OpportunityNotification (Map<id,opportunity> newMapList )
    {
        for(Opportunity o: newMapList.values())
        {
            if(o.Amount > 25000)
            {
                user u=[select id, ManagerId, Manager.Name,Manager.Email  FROM User where id =: o.ownerid];
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.toAddresses = (new String[]{u.Manager.Email});
                message.optOutPolicy = 'FILTER';
                message.subject = 'Opportunity Amount Crossed 25000.';
                message.plainTextBody = 'Opportunity Amount Crossed 25000. Sent mail to the manager.';
                Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
                    Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                if (results[0].success) 
                {
                    System.debug('The email was sent successfully.');
                }
                else
                {
                    System.debug('The email failed to send ');
                }    
            }      
        }
        
    }
    //update
    public Static void updateOpportunityNotification (Map<id,opportunity> newMap, Map<id,opportunity>oldMap,List<Opportunity> newList )
    {
        for(Opportunity o1: newList)
            if(oldMap.get(o1.id).Amount != newMap.get(o1.id).Amount && o1.Amount>25000)
        {
            List<Opportunity>compareList = new List<Opportunity>();
            /* id  idOfOpportunity = newMap.get(o1.id).id;
for(Opportunity compare :[select id,Amount from Opportunity where (id =: idOfOpportunity)])
{
if(compare.Amount > newMap.get(o1.id).Amount )
{*/
            user u=[select id, ManagerId, Manager.Name,Manager.Email  FROM User where id =: o1.ownerid];
            //user u=[select id, ManagerId, Manager.Name,Manager.Email  FROM User where id not IN : newMapList.keySet()];
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.toAddresses = (new String[]{u.Manager.Email});
            message.optOutPolicy = 'FILTER';
            message.subject = 'Opportunity Amount Crossed 25000.';
            message.plainTextBody = 'Opportunity Amount Crossed 25000. Sent mail to the manager.';
            Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
                Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
            if (results[0].success) 
            {
                System.debug('The email was sent successfully.');
            }
            else
            {
                System.debug('The email failed to send ');
            }    
            
        }
    }
}
//}        
//}