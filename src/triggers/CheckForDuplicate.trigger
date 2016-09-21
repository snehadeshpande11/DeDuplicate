trigger CheckForDuplicate on Lead(before insert,after insert,before update, after update){
    
    if(trigger.isBefore)
  	{
    	if(trigger.isInsert)
        {
           DEDUPLICATEHANDLER.checkDuplicateLeads(Trigger.New);
        }
        if(Trigger.isUpdate)
        {
          DEDUPLICATEHANDLER.UpdatecheckDuplicateLeads(Trigger.NewMap,Trigger.oldMap,Trigger.New); 
        }  
    }
   if(trigger.isAfter)
	{
    	if(trigger.isInsert)
        {
           AddingATaskOnLeadHandler.addTaskOnLeads(Trigger.newMap);
           CloningALeadHandler.cloneLead(Trigger.New);

        }
       if(Trigger.isUpdate)
       {
         	//DEDUPLICATEHANDLER.UpdatecheckDuplicateLeads(Trigger.NewMap);  
       }  
   }
    
 
}