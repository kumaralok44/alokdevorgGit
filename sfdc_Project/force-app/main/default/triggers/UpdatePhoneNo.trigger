// Trigger to default phone number whenever phone number field is left empty while creating contacts 

trigger UpdatePhoneNo on Contact (before insert, before update){
    List<Contact> Cont = New List<Contact>();
    for(Contact c : Trigger.New){
        if(c.Phone==Null){
            c.Phone='0000';
        }
        Cont.add(c);
    }
}