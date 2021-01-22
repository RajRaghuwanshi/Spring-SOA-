/**
* @ClassName    : ContactTriggerHandler 
* @CreatedOn    : 22/01/2021
* @Description  : Handler Class For Trigger.
**/
public class ContactTriggerHandler {
    public void afterOperations(Map<Id, Contact> MapNewContact,Map<Id, Contact> MapOldContact,String strOperationName){ 
        System.debug('MapNewContact'+MapNewContact);
        set<Id> SetAccID = new Set<Id>(); 
        List<Account> lstAccount = new List<Account>();
        if(strOperationName == 'Update'){
            for(Id conId : MapNewContact.keySet()){
                if(MapOldContact.get(conId).AccountId == MapNewContact.get(conId).AccountId){
                    SetAccID.add(MapNewContact.get(conId).AccountId);
                }else{
                    SetAccID.add(MapNewContact.get(conId).AccountId);
                    SetAccID.add(MapOldContact.get(conId).AccountId);
                }
            } 
        }else if(strOperationName == 'Insert'){ 
            for(Id conId : MapNewContact.keySet()){
                SetAccID.add(MapNewContact.get(conId).AccountId);
            } 
        }else if(strOperationName == 'Delete'){ 
            for(Id conId : MapOldContact.keySet()){
                SetAccID.add(MapOldContact.get(conId).AccountId);
            } 
        }
        if(!SetAccID.isEmpty()){
            for(Account objAccount : [SELECT Id, Number_Of_Contact__c , (SELECT Id FROM Contacts) FROM Account WHERE Id =: SetAccID ]){
                objAccount.Number_Of_Contact__c = objAccount.Contacts.size();
                lstAccount.add(objAccount);
            }
            if(!lstAccount.isEmpty()){
                update lstAccount;
            }   
        }
        
    }
}