public class PropertyController 
{
    @AuraEnabled
    public static List<Property__c> getProperties()
    {
        return [SELECT NAME FROM Property__c];
    }
}