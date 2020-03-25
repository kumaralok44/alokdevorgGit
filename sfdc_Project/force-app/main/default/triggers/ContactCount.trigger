//Trigger to count the number of contact accociated to account and populate the field'No_of_Contacts__c'

trigger ContactCount on Contact (after insert, after delete, after undelete) {
    List<Id> Parentidset = New List<Id>();
    List<Account> AccountListtoupdate = New List<Account>();
    If(Trigger.isinsert || Trigger.isundelete){
        for(Contact c : Trigger.new){
            if(c.AccountId!=Null){
                Parentidset.add(c.AccountId);
            }
        }
    }
    if(Trigger.isdelete){
        for(Contact c : Trigger.old){
            if(c.AccountId!=Null){
                Parentidset.add(c.AccountId);
            }
        }
    }
    System.debug('List of Account id: '+Parentidset);
    List<Account> AccList= New List<Account>([select id, name, no_of_Contacts__c,(select id,name from contacts) 
                                       from Account where Id in : Parentidset]);
    for(Account acc : AccList){
        //List<Contact> contList = acc.contacts;
        acc.No_of_Contacts__c = acc.contacts.size();
        //System.debug('acc.No_of_Contacts__c '+acc.No_of_Contacts__c);
        //List<Account> updatefield = AccList;
        //update updatefield;
        //System.debug('updatefield : '+ updatefield);
        //System.debug('No_of_Contacts__c: '+ contList.size());
        accountListToUpdate.add(acc);
        update accountListToUpdate;
        System.debug('account list to update : '+ accountListToUpdate);
        
    }

}