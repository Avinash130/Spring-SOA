trigger CountContactOnAccount on Contact(after insert, after update, after delete) {
    Set<Id> acctIds = new Set<Id>();
    List<Account> lstAccountUpdate = new List<Account>();
    if(Trigger.isInsert){
    for(Contact con : trigger.new) {
    acctIds.add(con.accountId);
    }
      }
    if(Trigger.isUpdate || Trigger.isDelete){
    for(Contact con : trigger.old){
    acctIds.add(con.accountId);
    
    }
    
       }
    
    for(Account acc: [Select Id, Name, No_Of_Contacts__c,(select Id from Contacts) from Account where Id IN: acctIds]){
    Account acct = new Account();
    acct.Id = acc.Id;
    acct.No_Of_Contacts__c = acc.Contacs.size();
     lstAccountUpdate .add(acct);
    }
    
    update lstAccountUpdate ;
    
    }