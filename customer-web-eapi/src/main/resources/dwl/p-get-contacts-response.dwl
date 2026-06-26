%dw 2.0
output application/json skipNullOn="everywhere"
---
payload map (item, index) -> {
	  id: item.id,
	  accountId: item.accountId,
	  accountName: item.accountName,
	  salutation: item.salutation,
	  firstName: item.firstName,
	  lastName: item.lastName,
	  phone: item.phone,
	  email: item.email,
	  contactPreference: item.contactPreference,
	  mailingAddress: {
	      street: item.mailingAddress.street,
	      city: item.mailingAddress.city,
	      state: item.mailingAddress.state,
	      country: item.mailingAddress.country,
	      zip: item.mailingAddress.zip
	    }
  }