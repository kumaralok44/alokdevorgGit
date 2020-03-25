trigger DescFieldOnInsertUpdate on Account (before Insert, before Update) {
for (Account a : Trigger.New){
        if (Trigger.IsInsert){
        a.description='Record is inserted';
        }
        else if (Trigger.IsUpdate){
        a.description='Record is updated';
        }
}}