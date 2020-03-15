trigger OpportunityTrigger on Opportunity (before insert, before update) {
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            List<Id> validOpptyAccountIdList = new List<Id>();
            for(Opportunity oneOppty : trigger.new) {
                if(oneOppty.AccountId != null) {
                    validOpptyAccountIdList.add(oneOppty.AccountId);
                }
            }
            Map<Id, Account> validOpptyAccountMap = new Map<Id, Account>([SELECT Id, Name FROM Account WHERE Id IN :validOpptyAccountIdList]);
            for(Opportunity oneOppty : trigger.new) {
                if(oneOppty.AccountId != null && validOpptyAccountMap.containsKey(oneOppty.AccountId)) {
                    oneOppty.Name = validOpptyAccountMap.get(oneOppty.AccountId).Name;
                }
            }
        } else if(Trigger.isUpdate) {
            List<Id> validOpptyAccountIdList = new List<Id>();
            for(Opportunity oneOppty : trigger.new) {
                if(oneOppty.AccountId != null) {
                    validOpptyAccountIdList.add(oneOppty.AccountId);
                }
            }
            Map<Id, Account> validOpptyAccountMap = new Map<Id, Account>([SELECT Id, Name FROM Account WHERE Id IN :validOpptyAccountIdList]);
            for(Opportunity oneOppty : trigger.new) {
                if(oneOppty.AccountId != null && validOpptyAccountMap.containsKey(oneOppty.AccountId)) {
                    oneOppty.Name = validOpptyAccountMap.get(oneOppty.AccountId).Name;
                }
            }
        }
        
    }
}