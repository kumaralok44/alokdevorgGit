//Trigger to create contact whenever Account is created

trigger CreateContact on Account (after insert) {
    if(Trigger.isInsert){
        List<Contact> ConToUpdate = New List<Contact>();
        for(Account acc : Trigger.new){
            Contact c =new Contact (LastName=acc.Name,AccountID=acc.Id);
            ConToUpdate.add(c);
        }
         insert ConToUpdate;      
    }

}