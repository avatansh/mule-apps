%dw 2.0
output application/json
---
payload ++ {"transactionId": vars.globalTranId, "timeStamp": now()}