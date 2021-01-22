public class AccountListController {
    @AuraEnabled
    public static List<Account> getAccounts() { 
        return [SELECT Name,AccountNumber,Number_Of_Contact__c,CreatedDate FROM Account Order by CreatedDate LIMIT 10];
    }
}