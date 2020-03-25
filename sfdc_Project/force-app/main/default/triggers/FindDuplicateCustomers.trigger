trigger FindDuplicateCustomers on Customer__c (before insert, before update) {
   Map<String, Customer__c> mapOfPhoneToCustomers = New Map<String, Customer__c>();
    //create a map of phone numbers to customers in Salesforce
    for(Customer__c custmr : [Select id, Phone__c, name from Customer__c]){
        mapOfPhoneToCustomers.put(custmr.Phone__c, custmr);
    }
    if(!mapOfPhoneToCustomers.isEmpty()){
        //iterate over all the new records being updated or inserted
        for(Customer__c cust : Trigger.new){
            if(mapOfPhoneToCustomers.ContainsKey(cust.Phone__c)){
                cust.adderror('Customer already Exists in DaTabase with Name: '+
                              mapOfPhoneToCustomers.get(cust.Phone__c).Name);
            }
        }

    }
    
    
    
    

}