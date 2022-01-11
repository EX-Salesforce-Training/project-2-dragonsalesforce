@isTest
public class AEApexTest {
	
    @isTest
    private static void propertyInfoSTest(){
        propertyAppHelper.getPropertyInfo();
        Property__C prop = new Property__C();
        prop.Name = 'test guy';
       	insert prop;
        propertyAppHelper.getPropertyInfo();
        List<Property__C> testList = [SELECT Id, Name, Address__c, Bath__c, Bed__c, Description__c, Location__c, Picture_1__c, Picture_2__c, Picture_4__c, Picture_3__c, Picture_5__c, Price__c, Property_Owner__c, Realtor__c,combo_desc__C FROM Property__c];
        system.assertEquals(1, testList.size());
    }
     @isTest
    private static void propertyInfoBTest(){
        propertyAppHelper.getPropertyInfo();
        List<Property__C> propList = new List<Property__C>();
        integer I;
        for(i=0;i<100;i++){
            Property__C prop = new Property__C();
            prop.name = 'test guy';
        	propList.add(prop);
        }
        insert propList;
        propertyAppHelper.getPropertyInfo();
        List<Property__C> testList = [SELECT Id, Name, Address__c, Bath__c, Bed__c, Description__c, Location__c, Picture_1__c, Picture_2__c, Picture_4__c, Picture_3__c, Picture_5__c, Price__c, Property_Owner__c, Realtor__c,combo_desc__C FROM Property__c];
        system.assertEquals(100, testList.size());
    }
    @isTest
    private static void propertyInfoNTest(){
        List<Property__C> testList = [SELECT Id, Name, Address__c, Bath__c, Bed__c, Description__c, Location__c, Picture_1__c, Picture_2__c, Picture_4__c, Picture_3__c, Picture_5__c, Price__c, Property_Owner__c, Realtor__c,combo_desc__C FROM Property__c];
        system.assertEquals(0, testList.size());
    }
     @isTest
    private static void getAllRegionsNTest(){
        propertyAppHelper.getAllRegions();
        List<Property__C> testList = [SELECT Location__c FROM Property__C];
        system.assertEquals(0, testList.size());
    }
     @isTest
    private static void getAllRegionsSTest(){
        
        Property__C prop = new Property__C();
        prop.Name = 'test guy';
       	insert prop;
        List<Property__C> testList = [SELECT Location__c FROM Property__C];
        system.assertEquals(1, testList.size());
    }
    @isTest
    private static void getAllRegionsBTest(){
        propertyAppHelper.getAllRegions();
         List<Property__C> propList = new List<Property__C>();
        integer I;
        for(i=0;i<100;i++){
            Property__C prop = new Property__C();
            prop.name = 'test guy';
        	propList.add(prop);
        }
        insert propList;
        List<Property__C> testList = [SELECT Location__c FROM Property__C];
        system.assertEquals(100, testList.size());
    }
    @isTest
    private static void createPropertySTest(){
        List<Opportunity> oList = new List<Opportunity>();
        integer I;
         for(i=0;i<1;i++){
            Opportunity o = new Opportunity();
            date datafiller = date.newInstance(2021, 1, 26);
        	o.StageName = 'Closed Won';
        	o.Name = 'test';
            o.CloseDate = datafiller;
            o.Bath__c = 2;
            o.Bed__c = 2;
             oList.add(o);
        }
        triggerHelperAE.createProperty(oList);
        List<Property__C> testList = [SELECT Location__c FROM Property__C];
        system.assertEquals(1, testList.size());
            
    }
     @isTest
    private static void createPropertyBTest(){
        List<Opportunity> oList = new List<Opportunity>();
        integer I;
         for(i=0;i<100;i++){
            Opportunity o = new Opportunity();
            date datafiller = date.newInstance(2021, 1, 26);
        	o.StageName = 'Closed Won';
        	o.Name = 'test';
            o.CloseDate = datafiller;
            o.Bath__c = 2;
            o.Bed__c = 2;
             oList.add(o);
        }
        triggerHelperAE.createProperty(oList);
        List<Property__C> testList = [SELECT Location__c FROM Property__C];
        system.assertEquals(100, testList.size());
            
    }
     @isTest
    private static void createPropertyNTest(){
        List<Opportunity> oList = new List<Opportunity>();
        integer I;
         for(i=0;i<0;i++){
            Opportunity o = new Opportunity();
            date datafiller = date.newInstance(2021, 1, 26);
        	o.StageName = 'Closed Won';
        	o.Name = 'test';
            o.CloseDate = datafiller;
            o.Bath__c = 2;
            o.Bed__c = 2;
             oList.add(o);
        }
        triggerHelperAE.createProperty(oList);
        List<Property__C> testList = [SELECT Location__c FROM Property__C];
        system.assertEquals(0, testList.size());
            
    }
     @isTest
    private static void createPropertyOwnerSTest(){
        List<Opportunity> oList = new List<Opportunity>();
        integer I;
         for(i=0;i<1;i++){
            Opportunity o = new Opportunity();
            date datafiller = date.newInstance(2021, 1, 26);
        	o.StageName = 'Closed Won';
        	o.Name = 'test';
            o.CloseDate = datafiller;
            o.Bath__c = 2;
            o.Bed__c = 2;
             oList.add(o);
        }
        insert oList;
        list<User> uList = [SELECT Id,Name From User];
        List<Opportunity> oTest = [SELECT Id,CreatedByID,StageName From Opportunity];
        triggerHelperAE.createPropertyOwner(otest);
        List<Property_Owner__c> testList = [SELECT Id,CreatedByID FROM Property_Owner__c];
        system.assertEquals(1, testlist.size());
            
    }
      @isTest
    private static void createPropertyOwnerBTest(){
        List<Opportunity> oList = new List<Opportunity>();
        integer I;
         for(i=0;i<100;i++){
            Opportunity o = new Opportunity();
            date datafiller = date.newInstance(2021, 1, 26);
        	o.StageName = 'Closed Won';
        	o.Name = 'test';
            o.CloseDate = datafiller;
            o.Bath__c = 2;
            o.Bed__c = 2;
             oList.add(o);
        }
        insert oList;
        list<User> uList = [SELECT Id,Name From User];
        List<Opportunity> oTest = [SELECT Id,CreatedByID,StageName From Opportunity];
        triggerHelperAE.createPropertyOwner(otest);
        List<Property_Owner__c> testList = [SELECT Id,CreatedByID FROM Property_Owner__c];
        system.assertEquals(100, testlist.size());
            
    }
    
}