trigger OpportunityTrigger on Opportunity (before insert,after insert,before update, after update )
{
    if(trigger.isAfter)
	{
    	if(trigger.isInsert)
        {
            HandlerOfOpportunityNotificationAlert.OpportunityNotification(Trigger.newMap);
        }
       if(Trigger.isUpdate)
       {
            HandlerOfOpportunityNotificationAlert.updateOpportunityNotification(Trigger.newMap,Trigger.oldMap,Trigger.New); 
       }  
   }

}