trigger ClosedOpportunityTrigger on Opportunity (after insert, after update)
{
    List<Task> taskListToInsert = new List<Task>();
    for(Opportunity o:Trigger.New)
    {
        If(o.StageName=='Closed Won')
        {
            Task t=new Task();
            t.Subject='Follow Up Test Task';
            t.WhatId=o.Id;
            taskListToInsert.add(t);
        }
        
    }
	 if(taskListToInsert.size() > 0)
     {
        insert taskListToInsert ;
     }
}