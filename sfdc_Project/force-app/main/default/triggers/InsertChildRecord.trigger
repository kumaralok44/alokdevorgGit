trigger InsertChildRecord on Project__c (after insert,after Update) {
   // List<Requirement__c> Childs = new List<Requirement__c>();

    for(Project__c a : trigger.new)
    {
       Requirement__c Child = new Requirement__c ();
       Child.Name = a.id;
       Child.Name = 'testName4';
       Child.Name = 'testName5';
		Child.Name = 'testName6'; 
      // Childs.add(Child);  
		Insert Child;    
    } 
 }