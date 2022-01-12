public with sharing class PicklistViewerGetFields {
    @AuraEnabled(cacheable = true)
    public static List<Property__c> getPropertyFields(){
        //returns properties to be used in the Picklist Viewer LWC/Aura
        return[SELECT Name, Address__c, Location__c, Bed__c, Bath__c, Price__c, Picture_1__c, Picture_2__c, Picture_3__c, Picture_4__c, Picture_5__c
              FROM Property__c];    
    }
    
}