%dw 2.0
output application/json skipNullOn="everywhere"
---
{
  status: if(payload.items[0].successful) "Success" else "Failure",
  id: payload.items[0].id,
  message: if(payload.items[0].successful) "Record Created Successfully" else payload.items[0].payload.errors[0].message,
  transactionId: payload.transactionId default vars.globalTranId,
  timeStamp: payload.timeStamp default now() as String
}