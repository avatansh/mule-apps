%dw 2.0
output application/json skipNullOn="everywhere"
---
{
    fromAddress: p('secure::email.from'),
    toAddress: payload.email,
    emailSubject: "Accounts Notification",
    emailBody: {
    	"AccountDetails": {
    		"Name": payload.name,
    		"Id": payload.id
    	}
    }
}