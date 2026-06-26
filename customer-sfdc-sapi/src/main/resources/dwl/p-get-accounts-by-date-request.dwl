%dw 2.0
output text/plain
---
if(vars.queryParams.toDate != null and vars.queryParams.fromDate != null) "SELECT FIELDS(ALL) FROM Account WHERE LastModifiedDate > " ++ vars.queryParams.fromDate ++ " and LastModifiedDate < " ++ vars.queryParams.toDate ++ " LIMIT 200"
else
if(vars.queryParams.fromDate != null) "SELECT FIELDS(ALL) FROM Account WHERE LastModifiedDate > " ++ vars.queryParams.fromDate ++ " LIMIT 200" 
else 
"SELECT FIELDS(ALL) FROM Account WHERE LastModifiedDate < " ++ vars.queryParams.toDate ++ " LIMIT 200"