/*Write a new trigger on lead which will check for ‘Open-Not Contacted’ leads and then creates a duplicate entry of the same lead but with status as ‘Working – Contacted’, rest all information will be the same except for Name, Email and Phone (append a character at the beginining and at the end to avoid a duplicate check)*/		

public class CloningALeadHandler 
{
    public Static void cloneLead(List<Lead> valLead)
    {
       
        System.debug('valLead='+valLead);
        List<Lead> cloneleads = new List<Lead>();
        
        for(Lead l : valLead)
        {
            Lead newLead = new Lead();
            if(l.Status=='Open - Not Contacted')
            {
                System.debug('Data Cloned');
                newLead.LastName ='A'+ l.LastName;
                newLead.Email ='a'+ l.Email;
                newLead.Phone ='91'+ l.Phone;
                newLead.status = 'Working – Contacted';
                cloneleads.add(newLead);
                
            }
        }
        
        System.debug('cloneleads='+cloneleads);
        
    }
}