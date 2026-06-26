%dw 2.0
output application/json skipNullOn="everywhere"
---
payload map (item, index) -> {
        "id": item.Id,
		"name": item.Name,
		"accountNumber": item.AccountNumber,
        "phone": item.Phone replace /[^0-9]/ with "",
		"email": item.Email__c,
		"contactPreference": item.Contact_Preference__c,
        "billingAddress": {
            "street": item.BillingAddress.street,
            "city": item.BillingAddress.city,
            "state": item.BillingAddress.state,
            "country": item.BillingAddress.country,
            ("zip": item.BillingAddress.postalCode as String) if(item.BillingAddress.postalCode != null)
        }
    }