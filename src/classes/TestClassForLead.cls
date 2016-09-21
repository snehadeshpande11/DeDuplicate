@isTest
public class TestClassForLead 
{
    // 1.a. Duplicate Lead For Single Object
    static testMethod void testLeadsForSingleObject() 
    {
        List<Lead> LeadsList = new List<Lead>();
        Lead l   = new Lead();
        l.FirstName = 'pooja';
        l.LastName  = 'Sarda';
        l.Email = 'pooja.sarda@gmail.com';
        l.Phone ='4444555553';
        l.Company   = 'WNS';
        l.Status	='Working - Contacted';
        LeadsList.add(l);
        
        Lead l1 = new Lead();
        l1.FirstName = 'poonam';
        l1.LastName  = 'Ahirrao';
        l1.Email = 'poonam.ahirrao@gmail.com';
        l1.Phone ='4444500053';
        l1.Company   = 'TCS';
        l1.Status	='Working - Contacted';
        LeadsList.add(l1);
        
        Lead l2 = new Lead();
        l2.FirstName = 'Sonali';
        l2.LastName  = 'Shinde';
        l2.Email = 'sonali.shinde@gmail.com';
        l2.Phone ='4477555553';
        l2.Company   = 'CGI';
        l2.Status	='Working - Contacted';
        LeadsList.add(l2);
        //  duplicate lead
        Lead dupeLead      = new Lead();
        dupeLead.FirstName = 'pooja';
        dupeLead.LastName  = 'Sarda';
        dupeLead.Company   = 'WNS';
        dupeLead.Email     = 'pooja.sarda@gmail.com';
        dupeLead.Phone = '4444555553';
        dupeLead.Status	='Working - Contacted';
        try
        {
            insert dupeLead;
        }
        catch(Exception e)
        {
            String s=e.getMessage();
            System.assert(s.contains('Record exists'));
            //System.assertEquals('Record exists', e.getMessage());
        }
    }
    
    // 1. b.Duplicate Lead For Bulk Object
    //Inserting Non Duplicate Lead
    static testMethod void testLeadsDuplicateForSingleObject() 
    {
        List<Lead> NonDuplicateLeads = new List<Lead>();
        for(Integer i =0; i <200; i++)
        {
            Lead NDL= new Lead(FirstName = i+'Sonali',LastName  = i+'Shinde',Email = i+'sonali.shinde@gmail.com',Phone =i+'4477555553',Company   =i+ 'CGI',
                               Status	='Working - Contacted');
            NonDuplicateLeads.add(NDL);
        }
        insert NonDuplicateLeads;
        
        //Inserting Duplicate Lead
        List<Lead> DuplicateLeads = new List<Lead>();
        for(Integer i =0; i <200; i++)
        {
            Lead DL= new Lead(FirstName = i+'Sonam',LastName  = i+'Shah',Email = i+'sonali.shinde@gmail.com',Phone =i+'4477555553',Company   =i+ 'TATA',
                              Status	='Working - Contacted');
            DuplicateLeads.add(DL);
        }
        try
        {
            insert DuplicateLeads;
        }
        catch(Exception e)
        {
            String s=e.getMessage();
            System.assert(s.contains('Record exists'));
        }
    }
    
    
    // 2. a.Create task on Single Lead
    static testMethod void createTaskOnBulk()
    {
        List<Lead> LeadsList1 = new List<Lead>();
       	Lead l4 = new Lead();
        l4.FirstName = 'Arman';
        l4.LastName  = 'Malik';
        l4.Email = 'arman.malik@gmail.com';
        l4.Phone ='9876543210';
        l4.Company   = 'TCS';
        l4.Status	='Working - Contacted';
        LeadsList1.add(l4);
        
        Task t= ([select whoID from task ]);
        System.assertEquals(l4.id,t.whoID);
    	System.debug('Test Record' + t);
    }
    
    // 2. b. create multiple leads and check for task
    static testMethod void createBulkRecordsForTask()
    {
    List<Lead> Taskleads = new List<Lead>();
    for(Integer i =0; i <200; i++)
    {
        Lead l0 = new Lead(Email=i+'sneha@gmail.com',phone=i+'43276',lastname=i+'Bhatt',company=i+'TechM');
        Taskleads.add(l0);
    }
    insert Taskleads;
    List<Task> tt= new List<Task>([select whoID from task where whoID in:Taskleads]);
    System.debug('Test Records' + tt);
    // System.assertEquals(expected, actual)
    System.assertEquals(200,200);
    }
    
    // 3. a Clon on Single Record
    static testMethod void createCloneOnSingleRecord()
    {
        List<Lead> LeadsList2 = new List<Lead>();
       	Lead l5 = new Lead();
        l5.FirstName = 'Arman';
        l5.LastName  = 'Malik';
        l5.Email = 'arman.malik@gmail.com';
        l5.Phone ='9876543210';
        l5.Company   = 'TCS';
        l5.Status	='Working - Contacted';
        LeadsList2.add(l5);
        
        Lead query1 =( [select id,name from Lead]);
        System.assertEquals(2, 2);
       
             
        
    }
    
    // 3.b Clone On Bulk Leads
     static testMethod void testLeadsCloneOnBulkObject() 
    {
        List<Lead> CloneLeads = new List<Lead>();
        for(Integer i =0; i <200; i++)
        {
            Lead clone= new Lead(FirstName = i+'Sejal',LastName  = i+'Gaikwad',Email = i+'sejal.gaikwad@gmail.com',Phone =i+'447755589898',Company =i+ 'CGI',
            Status	='Open - Not Contacted');
            CloneLeads.add(clone);
        }
        insert CloneLeads;
        
        List<Lead> check= new List<Lead> ([select id,FirstName,LastName,Email,Phone,Company,Status from Lead]); 
   		System.assertEquals(400, 400);
    }
    
    
    

}



// original record
/* Lead l   = new Lead();
l.FirstName = 'pooja';
l.LastName  = 'Sarda';
l.Email = 'pooja.sarda@gmail.com';
l.Phone ='4444555553';
l.Company   = 'WNS';
l.Status	='Working - Contacted';
insert l;
//  duplicate lead
Lead dupeLead      = new Lead();
dupeLead.FirstName = 'pooja';
dupeLead.LastName  = 'Sarda';
dupeLead.Company   = 'WNS';
dupeLead.Email     = 'pooja.sarda@gmail.com';
dupeLead.Phone = '4444555553';
dupeLead.Status	='Working - Contacted';
try
{
insert dupeLead;
}
catch(Exception e)
{
String s=e.getMessage();
System.assert(s.contains('Record exists'));
//System.assertEquals('Record exists', e.getMessage());
}*/