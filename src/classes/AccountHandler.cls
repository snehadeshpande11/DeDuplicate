public class AccountHandler {
    public static Account insertNewAccount (String name){
        try{
            Account acct = new Account(Name=name);
            insert acct;
            System.debug('acct = ' + acct);
            return acct;
        }
        catch (DmlException e){
            System.debug('The String is empty: ' + e.getMessage());
            return null;
            
            
        }
    }

}