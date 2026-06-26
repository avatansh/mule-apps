%dw 2.0
output application/json skipNullOn="everywhere"
---
{
    fromAddress: p('secure::email.from'),
    toAddress: p('secure::email.to'),
    emailSubject: "Error in Publishing on Transient Error Queue",
    emailBody: {
    	"Details": {
    		"Name": payload.name,
    		"Id": payload.id,
    		"error": {
    			"code": error.errorType.identifier as String,
				"message": ((error.errorType.namespace as String) ++ ":" ++ (error.errorType.identifier as String)),
    			"description": error.description as String
    		}
    	}
    }
}