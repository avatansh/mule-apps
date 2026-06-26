%dw 2.0
output application/json
---
{
  status: "OK",
  apiName: p('app.name'),
  apiVersion: p('app.version'),
  timestamp: now() as String,
  dependencies: [
    {
      name: "Salesforce",
      status: if(!isEmpty(payload)) "UP" else "Down",
    }
  ]
}