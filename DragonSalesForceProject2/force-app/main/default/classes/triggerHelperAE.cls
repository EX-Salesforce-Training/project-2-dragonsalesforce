public with sharing class triggerHelperAE {
    public static void createProperty(List<Opportunity> propCreate){
        List<Property__C> newProps = new List<Property__C>();
        for(Opportunity o: propCreate){
            if(o.StageName == 'Closed Won'){
                Property__C newProp = new Property__C();
                newProp.Address__c = o.Address__c;
                newProp.Bath__c = o.Bath__c;
                newProp.Bed__c = o.Bed__c;
                newProp.Location__c = o.Location__c;
                newProp.Price__c = o.Amount;
                newProp.Picture_1__c = o.Picture_1__c;
                newProp.Picture_2__c = o.Picture_2__c;
                newProp.Picture_3__c = o.Picture_3__c;
                newProp.Picture_4__c = o.Picture_4__c;
                newProp.Picture_5__c = o.Picture_5__c;
                newProp.Name = o.Name;
                newProps.add(newProp);
            }
        }
        if(newProps.size()>0){
            insert newProps;
        }
    }
    public static void createPropertyOwner(List<Opportunity> propOwnCreate){
        List<Property_Owner__c> newOwners = new List<Property_Owner__c>();
        List<User> ulist = [SELECT Name, Id, Email, Phone FROM User];
        for(Opportunity o: propOwnCreate){
            if(o.StageName == 'Closed Won'){
                for(User u: ulist){
                    if(u.Id == o.CreatedById){
                    Property_Owner__c newOwner = new Property_Owner__c();
                    newOwner.Name = u.Name;
                    newOwner.Email_Address__c = u.Email;
                    newOwner.Phone_Number__c = u.Phone;
                    newOwners.add(newOwner);
                    }
            }
            }
            

        }
        if(newOwners.size()>0){
            insert newOwners;
        }
    }
}