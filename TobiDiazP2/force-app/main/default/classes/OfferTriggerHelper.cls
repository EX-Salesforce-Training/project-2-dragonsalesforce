public class OfferTriggerHelper 
{
    public static void AssignPropertyName(List<Offer__c> offers)
    {
        List<Property__c> properties = [SELECT Name, Id FROM Property__c];
        
        for(Offer__c o : offers)
        {
            for(Property__c p : properties)
            {
                if(o.Property__c == p.id)
                {
                    o.Property_Field__c = p.Name;
                }
            }
        }
    }
}