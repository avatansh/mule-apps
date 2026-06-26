%dw 2.0
output application/json
---
{
  status: "OK",
  apiName: p('app.name'),
  apiVersion: p('app.version'),
  timestamp: now() as String,
  dependencies: payload."0".payload ++ payload."1".payload ++ payload."2".payload
}
