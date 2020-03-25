public class AccountProcessor {
    @future
    public static void countContacts(List<Id> AccountIdsReceived){
        List<Account> parentId = New List<Account>();
           List <Account> accts = new List <Account>([Select id, name, Number_of_Contacts__c, 
                                                       (Select id, name from contacts) from Account 
                                                      where id in : AccountIdsReceived]);
        	for(Account a : accts){
            a.Number_of_Contacts__c = a.contacts.size(); 
            parentId.add(a);
        }
        update parentId;
    }}