public with sharing class Opportunitycontroller {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity>  getopp() {
        // Fetch and return Account data related to the Opportunity
       
       List<Opportunity> opp =[select id,AccountId from opportunity where AccountId!=null];

         return opp;
    }
    @AuraEnabled
    public static Account getacc (Id accId){
        
        Account acc =[Select Id,Name from Account where Id=:accId ];

        return acc;
    }
    
    

}