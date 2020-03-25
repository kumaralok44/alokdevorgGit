trigger ProductCount on Product__c (after insert, after delete,after undelete) {
    List<Id> CompanyIdset = New List<Id>();
    List<Company__C> ProdToUpdate = New List<Company__C>();
    if(Trigger.IsInsert || Trigger.IsUndelete){
        for(Product__c p : Trigger.New){
            if(p.Company__C!=Null){
                CompanyIdset.add(p.Company__C);
            }
        }
    }
    if(Trigger.IsDelete){
        for(Product__c p : Trigger.old){
            if(p.Company__C!=Null){
                 CompanyIdset.add(p.Company__C);
            }
        }
    }
    List<Company__c> CompList = New List<Company__C>([Select id,name,No_of_Products__c,Total_Value_of_Product__c,
                                                      (Select id, name, Value__c from Products__r) from Company__c 
                                                      where ID in : CompanyIdset]);
    for(Company__c c : CompList){
        c.No_of_Products__c=c.Products__r.size();
       // c.Total_Value_of_Product__c=c.Value__c
        ProdToUpdate.add(c);
    }
    Update ProdToUpdate;

}