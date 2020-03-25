trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
	List<task> carry=New List<task>();
    for(opportunity opp:trigger.new){
        if(opp.StageName=='Closed Won'){
            task t= new task(WhatId=opp.Id,Subject='Follow Up Test Task');
                carry.add(t);
        }
    }
    insert carry;
}