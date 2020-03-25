// Trigger to populate error while deleting Account with Opportunity
//Authore : Alok

trigger AccountDeletion on Account(before delete){
    for (Account a : [select Id from Account where Id IN (select AccountId from Opportunity) AND
                      Id IN : Trigger.old]){
                          Trigger.oldmap.get(a.id).addError
                              ('Can not delete Account with releted opportunity');
                      }
}