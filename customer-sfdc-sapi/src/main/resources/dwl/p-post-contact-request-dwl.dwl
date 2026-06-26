%dw 2.0
output application/json skipNullOn="everywhere"
---
 [{
	  AccountId: payload.accountId,
	  Salutation: payload.salutation,
	  FirstName: payload.firstName,
	  LastName: payload.lastName,
	  Phone: payload.phone,
	  Email: payload.email,
	  Contact_Preference__c: payload.contactPreference,
	  MailingStreet: payload.mailingAddress.street,
	  MailingCity: payload.mailingAddress.city,
	  MailingState: payload.mailingAddress.state,
	  MailingCountry: payload.mailingAddress.country,
	  MailingPostalCode: payload.mailingAddress.zip
  }]