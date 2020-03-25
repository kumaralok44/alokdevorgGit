trigger SoqlTriggerBulk on Account (after update) {
    List<Account> AccWithOpp = [select id, (select id, name, closedate from Opportunities) from Account 
											where Id IN : Trigger.New];
    for (Account a : AccWithOpp){
        Opportunity[] Relatedopp = a.Opportunities;
    }
}