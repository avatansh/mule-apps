%dw 2.0
output application/json skipNullOn="everywhere"
---
{
	(accountName : attributes.queryParams.accountName) if(attributes.queryParams.accountName != null),
	(fromDate: attributes.queryParams.fromDate) if(attributes.queryParams.fromDate != null),
	(toDate: attributes.queryParams.toDate) if(attributes.queryParams.toDate != null)
}