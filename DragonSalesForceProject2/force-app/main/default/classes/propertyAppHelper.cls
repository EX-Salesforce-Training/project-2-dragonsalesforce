public with sharing class propertyAppHelper {
    @AuraEnabled(cacheable=true)
    public static List<Property__C> getPropertyInfo(){
        List<Property__C> pList = [SELECT Id, Name, Address__c, Bath__c, Bed__c, Description__c, Location__c, Picture_1__c, Picture_2__c, Picture_4__c, Picture_3__c, Picture_5__c, Price__c, Property_Owner__c, Realtor__c,combo_desc__C FROM Property__c];
        return pList;

    }
    @AuraEnabled
    public static List<Property__C> getAllRegions(){
        List<Property__C> rList = [SELECT Location__c FROM Property__C];
        return rList;
    }
}