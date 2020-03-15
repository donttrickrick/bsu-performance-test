// delete [select id, name from opportunity];

Account oneAccount = [SELECT Id, Name FROM Account LIMIT 1];
List<Opportunity> opptyList = new List<Opportunity>();
for(Integer i =0; i < 5000; i++) {
    opptyList.add(new Opportunity(Name = 'Dummy Name', AccountId = oneAccount.Id, CloseDate = Date.today(), StageName = 'Prospecting'));
}
Datetime startTime = Datetime.now();
insert opptyList;
Datetime endTime = Datetime.now();
System.debug('***Elapsed Time: '  + (endTime.getTime() - startTime.getTime())); // 13ms
