trigger AccountDuplicateTrigger on Account (before insert,before update) {
    if(Trigger.isInsert){
    for(Account a : Trigger.New){
        List<Account> acc = [Select id from Account where Name=:a.Name];
        if(acc.size()>0){
            a.Name.addError('You can not create a dublicate account');
        }
        
    }
    }
    else if(Trigger.isUpdate){
        for(Account a : Trigger.New){
            List<Account> acc = [Select id from Account where Name=:a.Name];
        	if(acc.size()>1){
                if (Trigger.isAfter) {
            a.Name.addError('You can not update account with duplicate name');
            
                }}
    }

    }}