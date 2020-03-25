trigger ContactCount1 on Contact (after insert, after undelete, after delete) {
    List<Id> AccId = New List<Id>();
    List<Account> acctoupdate;// = New List<Account>();
    if(trigger.isInsert || trigger.isUndelete){
        for(contact c : trigger.new){
            if(c.AccountId!=Null){
                AccId.add(c.AccountId);
            }
        }
    }
    if(trigger.isDelete){
        for(contact c : Trigger.old){
            if(c.AccountId!=Null){
                AccId.add(c.AccountId);
            }
        }
    }

    List<Account> acclist;
    for(Account a : acclist =[Select id, name, No_of_Contacts__c, (select id, name from contacts) from Account where Id in : AccId]){
     a.No_of_Contacts__c=a.contacts.size();
        acctoupdate.add(a);
        }//close of for loop
        update acctoupdate;
    }