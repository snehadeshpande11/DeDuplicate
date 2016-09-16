trigger OpportunityTrigger on Opportunity (before insert,after insert )
{
    if(trigger.isAfter)
	{
    	if(trigger.isInsert)
        {
            HandlerOfOpportunityNotificationAlert.OpportunityNotification(Trigger.newMap);
        }
       if(Trigger.isUpdate)
       {
            
       }  
   }

}