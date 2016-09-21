@isTest
public class TestClassForOpportunity {
    static testMethod void testOpportunityForSingleObject() {
        
        // original record
        Opportunity o   = new Opportunity();
        o.Name = 'Opportunity Amount Greater than 30000';
        o.CloseDate= System.today();
        o.StageName='Prospecting';
        o.Amount=decimal.valueOf('30000');
        insert o;
        
        System.debug(o);
        
        Opportunity o1   = new Opportunity();
        o1.Name = 'Opportunity Amount Less than 30000';
        o1.CloseDate=System.today();
        o1.StageName='Prospecting';
        o1.Amount=20000;//decimal.valueOf('20000');
        insert o1;
        
        
     
        o1 = [SELECT Amount FROM Opportunity 
         WHERE Name='Opportunity Amount Less than 30000' AND StageName='Prospecting'
         LIMIT 1];
   		o1.Amount = decimal.valueOf('50000');
 		update o1;
        System.debug(o1);
        
    }
    //Amount Greater than 25000
    static testMethod void testOpportunityForBulkObject()
    {
      List<Opportunity> BulkOpportunities=new List<Opportunity>();
      for(Integer i =0; i <200; i++)
    {
        Opportunity o2 = new Opportunity(Name=i+'Opportunity Amount Greater than 30000',CloseDate=System.today(),StageName=i+'Prospecting',Amount=i+30000);
        BulkOpportunities.add(o2);
    } 
      insert BulkOpportunities;  
    }
    
    //Amount Less than 25000
    static testMethod void testOpportunityForBulkObjectLessAmount()
    {
      List<Opportunity> BulkOpportunitiess=new List<Opportunity>();
      for(Integer i =0; i <200; i++)
    {
        Opportunity o3 = new Opportunity(Name=i+'Opportunity Amount Less than 30000',CloseDate= System.today(),StageName=i+'Prospecting',Amount=i+20000);
        BulkOpportunitiess.add(o3);
    } 
      insert BulkOpportunitiess;  
    }    
}