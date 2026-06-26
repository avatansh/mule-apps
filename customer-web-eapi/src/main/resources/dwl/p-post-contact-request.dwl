%dw 2.0
output application/json skipNullOn="everywhere"
---
 {
	  id: payload.id,
	  accountId: payload.accountId,
	  accountName: payload.accountName,
	  salutation: payload.salutation,
	  firstName: payload.firstName,
	  lastName: payload.lastName,
	  phone: payload.phone,
	  email: payload.email,
	  contactPreference: payload.contactPreference,
	  mailingAddress: {
	      street: payload.mailingAddress.street,
	      city: payload.mailingAddress.city,
	      state: payload.mailingAddress.state,
	      country: payload.mailingAddress.country,
	      zip: payload.mailingAddress.zip
	    }
  }