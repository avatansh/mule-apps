%dw 2.0
output application/json skipNullOn="everywhere"
---
 {
    id: payload.id,
    name: payload.name,
    accountNumber: payload.accountNumber,
    phone: payload.phone,
    email: payload.email,
    contactPreference: payload.contactPreference,
    mailingAddress: {
      street: payload.mailingAddress.street,
      city: payload.mailingAddress.city,
      state: payload.mailingAddress.state,
      country: payload.mailingAddress.country,
      postalCode: payload.mailingAddress.postalCode
    },
  	shippingAddress: {
      street: payload.shippingAddress.street,
  	  city: payload.shippingAddress.city,
  	  state: payload.shippingAddress.state,
      country: payload.shippingAddress.country,
      postalCode: payload.shippingAddress.postalCode
	}
  }