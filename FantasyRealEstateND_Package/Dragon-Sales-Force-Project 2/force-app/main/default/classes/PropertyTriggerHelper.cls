public class PropertyTriggerHelper {
    
    //Assigns the description value of property before update
    public static void UpdateDescription(List<Property__c> prop){
        //iterates through prop (trigger.new) and populates the description field based on other field values
        for(Property__c propIt: prop){
            propIt.Description__c = propIt.Location__c + ' location, \n' + propIt.Bed__c + ' beds ' + propIt.Bath__c + ' baths. \n' + 'Asking Price: ' + propIt.Price__c;
        }       
    }
    
    //Creates an Archive Property record of a property that is being updated to Closed Sold/Unsold
    //Archive Property has the same values of the property
    public static void ArchiveProperty(List<Property__c> prop){
        List<Archive_Property__c> archiveProp = new List<Archive_Property__c>();
        for(Property__c propIt: prop){
            if(propIt.Bidding_Stage__c == 'Closed Sold' || propIt.Bidding_Stage__c == 'Closed Unsold'){
                Archive_Property__c newArchive = new Archive_property__c();
                newArchive.Accepted_Bid__c = propIt.Accepted_Bid__c;
                newArchive.Address__c = propIt.Address__c;
                newArchive.Bath__c = propIt.Bath__c;
                newArchive.Bed__c = propIt.Bed__c;
                newArchive.Bidding_Stage__c = propIt.Bidding_Stage__c;
                newArchive.Name = propIt.Name;
                newArchive.Price__c = propIt.Price__c;
                newArchive.Property_Owner__c = propIt.Property_Owner__c;
                newArchive.Realtor__c = propIt.Realtor__c;
                newArchive.Location__c = propIt.Location__c;
                archiveProp.add(newArchive);
            }
  		}
        database.insert(archiveProp);
    }
    
    //Deletes properties after property is updated to be Closed Sold/Unsold
    public static void DeleteArchivedProperty(){
        List<Property__c> deleteProp = [SELECT id FROM Property__c WHERE Bidding_Stage__c LIKE 'Closed%'];
        
        database.delete(deleteProp);
    }
}