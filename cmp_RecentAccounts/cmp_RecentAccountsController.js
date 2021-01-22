({
    doInit: function(component, event, helper) { 
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'AccountNumber', fieldName: 'AccountNumber', type: 'text'},
            {label: 'CreatedDate', fieldName: 'CreatedDate', type: 'date'},
            {label: 'Number Of Contact', fieldName: 'Number_Of_Contact__c', type: 'number'}
        ]); 
        var action = component.get("c.getAccounts"); 
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.lstAccounts", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        }); 
        $A.enqueueAction(action);
    }
})