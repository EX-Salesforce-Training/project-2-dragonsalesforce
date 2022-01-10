@isTest
public class TDApexTest 
{
	@isTest
    private static void AssignPropertyNameSingleTest()
    {
        List<Property__c> properties = new List<Property__c>();
        List<Offer__c> offers = new List<Offer__c>();
        List<Contact> potentialBuyers = new List<Contact>();
        
        Contact c = new Contact();
        c.LastName = 'Johnson';
        
        potentialBuyers.add(c);
        
        insert potentialBuyers;
        
        List<Contact> contactIds = [SELECT Id FROM Contact];
        
        integer i;
        
        for(i = 0; i < 1; i++)
        {
            Property__c prop = new Property__c();
            prop.Name = 'My House';
            prop.Bidding_Stage__c = 'Open';
            properties.add(prop);
        }
        
        insert properties;
        
        List<Property__c> propIds = [SELECT Id FROM Property__c];
        
        for(i = 0; i < 1; i++)
        {
            Offer__c offer = new Offer__c();
            offer.Name = 'New Offer';
        	offer.Offer_Amount__c = 9000;
        	offer.Potential_Buyer__c = contactIds[0].Id;
        	offer.Property__c = propIds[i].Id;
            offers.add(offer);
        }
        
        database.insert(offers);
        
        OfferTriggerHelper.AssignPropertyName(offers);
        
        for(i = 0; i < 1; i++)
        {
            System.assertEquals('My House', offers[i].Property_Field__c);
        }
    }
    
    @isTest
    private static void AssignPropertyNameBulkTest()
    {
        List<Property__c> properties = new List<Property__c>();
        List<Offer__c> offers = new List<Offer__c>();
        List<Contact> potentialBuyers = new List<Contact>();
        
        Contact c = new Contact();
        c.LastName = 'Johnson';
        
        potentialBuyers.add(c);
        
        insert potentialBuyers;
        
        List<Contact> contactIds = [SELECT Id FROM Contact];
        
        integer i;
        
        for(i = 0; i < 100; i++)
        {
            Property__c prop = new Property__c();
            prop.Name = 'My House';
            prop.Bidding_Stage__c = 'Open';
            properties.add(prop);
        }
        
        insert properties;
        
        List<Property__c> propIds = [SELECT Id FROM Property__c];
        
        for(i = 0; i < 100; i++)
        {
            Offer__c offer = new Offer__c();
            offer.Name = 'New Offer';
        	offer.Offer_Amount__c = 9000;
        	offer.Potential_Buyer__c = contactIds[0].Id;
        	offer.Property__c = propIds[i].Id;
            offers.add(offer);
        }
        
        database.insert(offers);
        
        OfferTriggerHelper.AssignPropertyName(offers);
        
        for(i = 0; i < 100; i++)
        {
            System.assertEquals('My House', offers[i].Property_Field__c);
        }
    }
    
    @isTest
    private static void getPropertiesSingleTest()
    {
        List<Property__c> properties = new List<Property__c>();
        
        for(integer i = 0; i < 1; i++)
        {
            Property__c prop = new Property__c();
            prop.Name = 'My House';
            prop.Bidding_Stage__c = 'Open';
            properties.add(prop);
        }
        
        insert properties;
        
        List<Property__c> controllerProperties = PropertyController.getProperties();
        
        System.assertEquals(controllerProperties.size(), properties.size());
    }
    
    @isTest
    private static void getPropertiesBulkTest()
    {
        
    }
    
    @isTest
    private static void OfferHelperSingleTest()
    {
        List<Property__c> properties = new List<Property__c>();
        List<Offer__c> offers = new List<Offer__c>();
        List<Contact> potentialBuyers = new List<Contact>();
        
        Contact c = new Contact();
        c.LastName = 'Johnson';
        
        potentialBuyers.add(c);
        
        insert potentialBuyers;
        
        List<Contact> contactIds = [SELECT Id FROM Contact];
        
        integer i;
        
        for(i = 0; i < 1; i++)
        {
            Property__c prop = new Property__c();
            prop.Name = 'My House';
            prop.Bidding_Stage__c = 'Open';
            properties.add(prop);
        }
        
        insert properties;
        
        List<Property__c> propIds = [SELECT Id FROM Property__c];
        
        for(i = 0; i < 1; i++)
        {
            Offer__c offer = new Offer__c();
            offer.Name = 'New Offer';
        	offer.Offer_Amount__c = 9000;
        	offer.Potential_Buyer__c = contactIds[0].Id;
        	offer.Property__c = propIds[i].Id;
            offers.add(offer);
        }
        
        database.insert(offers);
        
        List<Offer__c> newOffers = OfferApexHelper.OfferHelper();
        
        System.assertEquals(offers.size(), newOffers.size());
    }
    
    @isTest
    private static void OfferHelperBulkTest()
    {
        List<Property__c> properties = new List<Property__c>();
        List<Offer__c> offers = new List<Offer__c>();
        List<Contact> potentialBuyers = new List<Contact>();
        
        Contact c = new Contact();
        c.LastName = 'Johnson';
        
        potentialBuyers.add(c);
        
        insert potentialBuyers;
        
        List<Contact> contactIds = [SELECT Id FROM Contact];
        
        integer i;
        
        for(i = 0; i < 100; i++)
        {
            Property__c prop = new Property__c();
            prop.Name = 'My House';
            prop.Bidding_Stage__c = 'Open';
            properties.add(prop);
        }
        
        insert properties;
        
        List<Property__c> propIds = [SELECT Id FROM Property__c];
        
        for(i = 0; i < 100; i++)
        {
            Offer__c offer = new Offer__c();
            offer.Name = 'New Offer';
        	offer.Offer_Amount__c = 9000;
        	offer.Potential_Buyer__c = contactIds[0].Id;
        	offer.Property__c = propIds[i].Id;
            offers.add(offer);
        }
        
        database.insert(offers);
        
        List<Offer__c> newOffers = OfferApexHelper.OfferHelper();
        
        System.assertEquals(offers.size(), newOffers.size());
    }
}