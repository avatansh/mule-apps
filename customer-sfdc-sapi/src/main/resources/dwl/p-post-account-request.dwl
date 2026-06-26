%dw 2.0
output application/json skipNullOn="everywhere"
---
 [{
    Name: payload.name,
    AccountNumber: payload.accountNumber,
    Phone: payload.phone,
    Email__c: payload.email,
    Contact_Preference__c: payload.contactPreference,
	BillingStreet: payload.mailingAddress.street,
	BillingCity: payload.mailingAddress.city,
	BillingState: payload.mailingAddress.state,
	BillingCountry: payload.mailingAddress.country,
	BillingPostalCode: payload.mailingAddress.zip
  }]