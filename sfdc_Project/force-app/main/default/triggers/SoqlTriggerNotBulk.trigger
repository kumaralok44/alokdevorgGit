trigger SoqlTriggerNotBulk on Account (after update) {
    for (Account a : Trigger.new){
        Opportunity[] opps =[select id, name,closedate from opportunity
							where AccountId = :a.Id];
    }
}