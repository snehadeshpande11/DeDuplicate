trigger CheckForDuplicate on Lead(before insert,after insert){
    
    if(trigger.isBefore)
  	{
    	if(trigger.isInsert)
        {
            //DEDUPLICATEHANDLER.checkDuplicateLeads(Trigger.New);
            CloningALeadHandler.cloneLead(Trigger.New);
        }
        if(Trigger.isUpdate)
        {
            
        }  
    }
   if(trigger.isAfter)
	{
    	if(trigger.isInsert)
        {
            AddingATaskOnLeadHandler.addTaskOnLeads(Trigger.newMap);
        }
       if(Trigger.isUpdate)
       {
            
       }  
   }
    
 
}