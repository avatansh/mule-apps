%dw 2.0
output application/json skipNullOn="everywhere"
---
{
    fromAddress: p('secure::email.from'),
    toAddress: p('secure::email.to'),
    emailSubject: "Error Accounts Process Notification",
    emailBody: {
    	"Error Details": {
			"code": if(error.errorMessage.payload.code != null) error.errorMessage.payload.code else error.errorType.identifier as String,
			"message": if(error.errorMessage.payload.message != null) error.errorMessage.payload.message else ((error.errorType.namespace as String) ++ ":" ++ (error.errorType.identifier as String)),
		    "description": if(error.errorMessage.payload.description != null) error.errorMessage.payload.description else error.description as String,
		    "transactionId": if(error.errorMessage.payload.transactionId != null) error.errorMessage.payload.transactionId else vars.globalTranId default correlationId,
		    "timeStamp": if(error.errorMessage.payload.timeStamp != null) error.errorMessage.payload.timeStamp else now()
		}
    }
}