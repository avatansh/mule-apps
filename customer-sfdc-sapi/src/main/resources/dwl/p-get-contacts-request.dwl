%dw 2.0
output text/plain
---
if(vars.queryParams.toDate != null and vars.queryParams.fromDate != null) "SELECT Id, (SELECT FIELDS(ALL) FROM Account.Contacts WHERE LastModifiedDate > " ++ vars.queryParams.fromDate ++ " and LastModifiedDate < " ++ vars.queryParams.toDate ++ " LIMIT 200) FROM Account where Name IN('" ++ vars.queryParams.accountName ++ "') LIMIT 200"
else
if(vars.queryParams.fromDate != null) "SELECT Id, (SELECT FIELDS(ALL) FROM Account.Contacts WHERE LastModifiedDate > " ++ vars.queryParams.fromDate ++ " LIMIT 200) FROM Account where Name IN('" ++ vars.queryParams.accountName ++ "') LIMIT 200" 
else 
if(vars.queryParams.toDate != null) "SELECT Id, (SELECT FIELDS(ALL) FROM Account.Contacts WHERE LastModifiedDate < " ++ vars.queryParams.toDate ++ " LIMIT 200) FROM Account where Name IN('" ++ vars.queryParams.accountName ++ "') LIMIT 200"
else "SELECT Id, (SELECT FIELDS(ALL) FROM Account.Contacts LIMIT 200) FROM Account where Name IN('" ++ vars.queryParams.accountName ++ "') LIMIT 200"