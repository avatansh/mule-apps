%dw 2.0
output application/json
---
{
  status: "OK",
  apiName: p('app.name'),
  apiVersion: p('app.version'),
  timestamp: now() as String,
  dependencies: payload."0".payload.dependencies ++ payload."1".payload.dependencies
}
