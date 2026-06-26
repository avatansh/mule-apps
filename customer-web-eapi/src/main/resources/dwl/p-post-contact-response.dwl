%dw 2.0
output application/json skipNullOn="everywhere"
---
{
  status: payload.status,
  id: payload.id,
  message: payload.message,
  transactionId: payload.transactionId,
  timeStamp: payload.timeStamp
}