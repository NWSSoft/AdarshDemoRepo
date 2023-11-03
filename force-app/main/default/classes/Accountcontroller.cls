public with sharing class Accountcontroller {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(Id accountId) {
        // Fetch and return Contacts related to the Account

        List<Contact> relatedContacts = new List<Contact>();

        // Query the Account related to the Opportunity
        Opportunity opp = [SELECT AccountId FROM Opportunity WHERE Id = :opportunityId LIMIT 1];

        if (opp != null && opp.AccountId != null) {
            // Query the Contacts related to the Account
            relatedContacts = [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE AccountId = :opp.AccountId];
        }

        // Query the Contacts related to the Opportunity
        List<Contact> opportunityContacts = [SELECT Id, FirstName, LastName, Email, Phone, ... FROM Contact WHERE Opportunity__c = :opportunityId];

        // Add the Opportunity-related Contacts to the list
        relatedContacts.addAll(opportunityContacts);

        return relatedContacts;
    }
    }



  