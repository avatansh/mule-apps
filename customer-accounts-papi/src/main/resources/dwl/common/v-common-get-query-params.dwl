%dw 2.0
output application/json skipNullOn="everywhere"
---
{
	(accountName : attributes.queryParams.accountName) if(attributes.queryParams.accountName != null),
	(fromDate: (attributes.queryParams.fromDate ++ "T00:00:00Z") as String) if(attributes.queryParams.fromDate != null),
	(toDate: (attributes.queryParams.toDate ++ "T00:00:00Z") as String) if(attributes.queryParams.toDate != null)
}