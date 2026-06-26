%dw 2.0
output application/json
---
if(typeOf(payload) != Array) [payload] else payload