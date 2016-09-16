/* Create a Task upon successful creation of a new Lead record. After a new lead record has been inserted we want to create a new task associated with that Lead.*/

public class AddingATaskOnLeadHandler {
     public Static void addTaskOnLeads(Map<id,lead> newMapList )
     {
         List<Task> taskListToInsert = new List<Task>();
         for(id l: newMapList.keySet())
         {
             Task t=new Task();
             t.OwnerId=UserInfo.getUserId();
             t.Priority='Normal';
             t.Subject='New Task on Lead';
             t.Status='Completed';
             t.WhoId=l;
             taskListToInsert.add(t);
           
         }
         
         if(taskListToInsert.size() > 0)
     	{
        	insert taskListToInsert ;
     	}
     }
}