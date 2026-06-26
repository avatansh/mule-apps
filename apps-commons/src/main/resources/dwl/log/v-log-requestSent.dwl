%dw 2.0
output application/json
---
{
    "externalTrackingId": vars.externalTranId,
	"globalTransactionId": vars.globalTranId,
    "muleTransactionId": vars.muleTranId,
	"applicationName": p('app.name'),
	"processName": message.attributes."requestPath",
	"flowName": vars.flowName,
	"environment": p('env'),
	"source": p('source'),
	"target": p('target'),
	"httpMethod": message.attributes."Method",
	"milestoneStatus": "RequestSent",
	"customerId": vars.externalTranId
}