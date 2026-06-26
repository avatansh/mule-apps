%dw 2.0
output application/json
---
if(attributes.headers.externalTranId != null) attributes.headers.externalTranId else correlationId