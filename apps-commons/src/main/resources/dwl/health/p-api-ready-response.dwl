%dw 2.0
output application/json
---
{
  status: "OK",
  apiName: p('app.name'),
  apiVersion: p('app.version'),
  timestamp: now() as String,
  dependencies: payload.dependencies
}