Trigger PopError on Contact (before delete){
for (contact a : Trigger.old){
if (a.AccountId<>Null){   
a.addError ('You can not delete this contact as account is associated to this contact');
}
}
 
}