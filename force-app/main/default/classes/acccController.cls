public with sharing class acccController {
   
 @AuraEnabled(cacheable=true)
 public static list<Account> getacc(){
    try {
        list<Account> acc = [Select Id,Name,Type,Annualrevenue from Account limit 10];
         return acc;
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
 }
    
}