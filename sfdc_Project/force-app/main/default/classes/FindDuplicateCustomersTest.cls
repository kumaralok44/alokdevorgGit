@isTest
private class FindDuplicateCustomersTest {
    static void init(){
        List<Customer__c> customerList = new List<Customer__c> ();
		String phone = '0987654321';
		customerList.add(new Customer__c(Name = 'John Snow', Phone__c = phone));
        insert customerList;
    }
    /**Test with a new contact**/
    

}