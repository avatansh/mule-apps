%dw 2.0
output application/json skipNullOn="everywhere"
---
{
	  fromNumber: p('secure::sms.from'),
	  toNumber: if(payload.phone startsWith("+")) payload.phone else("+91" ++ payload.phone),
	  message: "Account with Name: " ++ payload.name ++ " and Id: " ++ payload.id ++ " was updated"
}