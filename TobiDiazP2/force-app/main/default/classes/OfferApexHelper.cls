public with sharing class OfferApexHelper 
{
    @AuraEnabled(cacheable=true)
    public static List<Offer__c> OfferHelper() 
    {
        ID userID = UserInfo.getUserID();

        List<Offer__c> query = [SELECT ID, CreatedByID, Offer_Amount__c, Property_Field__c FROM Offer__c WHERE CreatedByID = :userID];

        return query;
    }
}