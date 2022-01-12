@isTest
public class NDApexTest {
	
    //////////////////////////////////////////////////////////
    //														//
    //			Update Description, Single and Many			//
    //  Tests if descriptions update based on record values	//
    //  													//
    //////////////////////////////////////////////////////////
    @isTest
    private static void UpdateDescriptionSingleTest(){
        List<Property__c> testProps = new List<Property__c>();
        for(integer i = 0; i < 1; i++)
        {
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProps.add(testProp);
        }
        insert(testProps);
        PropertyTriggerHelper.UpdateDescription(testProps);
        
        System.assertEquals('Here location, \n1 beds 1 baths. \nAsking Price: 5', testProps[0].Description__c);
    }
    
    @isTest
    private static void UpdateDescriptionManyTest(){
        List<Property__c> testProps = new List<Property__c>();
        for(integer i = 0; i<100; i++)
        {
            Property__c testProp = new Property__C();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProps.add(testProp);
        }
        insert(testProps);
        PropertyTriggerHelper.UpdateDescription(testProps);
        for(integer i = 0; i < 100; i++){
        	System.assertEquals('Here location, \n1 beds 1 baths. \nAsking Price: 5', testProps[i].Description__c);
        }
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    //////////////////////////////////////////////////////
    //													//
    //	 	  Archive Property Single and Many			//
    //	 Tests whether Closed properties are archived	//
    //													//
    //////////////////////////////////////////////////////
    @isTest
    private static void ArchivePropertySingleTest(){
        List<Property__c> testProps = new List<Property__c>();
        for(integer i = 0; i<1; i++){
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProp.Bidding_Stage__c = 'Closed Sold';
            testProps.add(testProp);
        }
        insert(testProps);
        PropertyTriggerHelper.ArchiveProperty(testProps);
        
        List<Archive_Property__c> testArchives = [SELECT Name, Location__c, Bed__c, Bath__c, Price__c, Bidding_Stage__c FROM Archive_Property__c];
        System.assertEquals(1, testArchives.size());
    }
    
    @isTest
    private static void ArchivePropertyManyTest(){
        List<Property__c> testProps = new List<Property__c>();
        //creates closed records not to be deleted
        for(integer i = 0; i<100; i++){
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProp.Bidding_Stage__c = 'Closed Sold';
            testProps.add(testProp);
        }
        insert(testProps);
        PropertyTriggerHelper.ArchiveProperty(testProps);
        
        List<Archive_Property__c> testArchives = [SELECT Name, Location__c, Bed__c, Bath__c, Price__c, Bidding_Stage__c FROM Archive_Property__c];
        
        System.assertEquals(100, testArchives.size());
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////
    //																							//
    //								Delete Archived Properties:									//
    //						Single without delete, many without delete							//
    //						  Single with delete, many with delete								//
    //								 Many with partial delete									//
    //																							//
    //		Test deletion of properties (not archives) where properties should be deleted		//
    //																							//
    //////////////////////////////////////////////////////////////////////////////////////////////
    
    @isTest
    private static void DeleteArchivedPropertySingleNoDeleteTest(){
        List<Property__c> testProps = new List<Property__c>();
        //creates an open record to be deleted
        for(integer i = 0; i<1; i++){
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProp.Bidding_Stage__c = 'Open';
            testProps.add(testProp);
        }
        insert(testProps);
        PropertyTriggerHelper.DeleteArchivedProperty();
        List<Property__c> testRemainingProps = [SELECT Name FROM Property__c];
		System.assertEquals(1, testRemainingProps.size());
    }
	private static void DeleteArchivedPropertySingleFullDeleteTest(){
        List<Property__c> testProps = new List<Property__c>();
        for(integer i = 0; i<1; i++){
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProp.Bidding_Stage__c = 'Closed Sold';
            testProps.add(testProp);
        }
        insert(testProps);
        PropertyTriggerHelper.DeleteArchivedProperty();
        List<Property__c> testRemainingProps = [SELECT Name FROM Property__c];
		System.assertEquals(0, testRemainingProps.size());
    }    
    @isTest
    private static void DeleteArchivedPropertyManyNoDeleteTest(){
        List<Property__c> testProps = new List<Property__c>();
        for(integer i = 0; i<100; i++){
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProp.Bidding_Stage__c = 'Open';
            testProps.add(testProp);
        }
        insert(testProps);
        PropertyTriggerHelper.DeleteArchivedProperty();
        List<Property__c> testRemainingProps = [SELECT Name FROM Property__c];
		System.assertEquals(100, testRemainingProps.size());
    }
    @isTest
    private static void DeleteArchivedPropertyManyFullDeleteTest(){
        List<Property__c> testProps = new List<Property__c>();
        for(integer i = 0; i<100; i++){
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProp.Bidding_Stage__c = 'Closed Sold';
            testProps.add(testProp);
        }
        insert(testProps);
        PropertyTriggerHelper.DeleteArchivedProperty();
        List<Property__c> testRemainingProps = [SELECT Name FROM Property__c];
		System.assertEquals(0, testRemainingProps.size());
    }
    @isTest
    private static void DeleteArchivedPropertyManyPartialDeleteTest(){
        List<Property__c> testProps = new List<Property__c>();
        //Closed Sold get deleted
        for(integer i = 0; i<25; i++){
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProp.Bidding_Stage__c = 'Closed Sold';
            testProps.add(testProp);
        }
        //Closed Unsold get deleted
        for(integer i = 0; i<25; i++){
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProp.Bidding_Stage__c = 'Closed Unsold';
            testProps.add(testProp);
        }
        //Open do not get deleted
        for(integer i = 0; i<50; i++){
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProp.Bidding_Stage__c = 'Open';
            testProps.add(testProp);
        }
        insert(testProps);
        PropertyTriggerHelper.DeleteArchivedProperty();
        //pulls not-deleted records
        List<Property__c> testRemainingProps = [SELECT Name FROM Property__c];
        //open records not deleted
		System.assertEquals(50, testRemainingProps.size());
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////////////////////////
    //																					//
    //						Get Property Fields Single and Many							//
    //		Tests that returned list of properties contains all existing properties		//
    //																					//
    //////////////////////////////////////////////////////////////////////////////////////
    
    @isTest
    private static void getPropertyFieldsSingleTest(){
        List<Property__c> testProps = new List<Property__c>();
        for(integer i = 0; i<1; i++)
        {
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProps.add(testProp);
        }
        insert(testProps);
        List<Property__c> testPropsReceived = PicklistViewerGetFields.getPropertyFields();
        system.assertEquals(testProps, testPropsReceived);
    }
    
    @isTest
    private static void getPropertyFieldsManyTest(){
        List<Property__c> testProps = new List<Property__c>();
        for(integer i = 0; i < 100; i++)
        {
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProps.add(testProp);
        }
        insert(testProps);
        List<Property__c> testPropsReceived = PicklistViewerGetFields.getPropertyFields();
        system.assertEquals(testProps, testPropsReceived);
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    //////////////////////////////////////////////////////////////////
    //																//
    //		Get Properties (Apex Controller) Single and Many		//
    //			Tests that all properties are returned				//
    //																//
    //////////////////////////////////////////////////////////////////
    @isTest
    private static void getPropertiesSingleTest(){
        List<Property__c> testProps = new List<Property__c>();
        for(integer i = 0; i < 1; i++)
        {
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProps.add(testProp);
        }
        insert(testProps);
        List<Property__c> testPropsReceived = PropertyController.getProperties();
        system.assertEquals(testProps.size(), testPropsReceived.size());
        
    }
    
    @isTest
    private static void getPropertiesManyTest(){
        List<Property__c> testProps = new List<Property__c>();
        for(integer i = 0; i < 100; i++)
        {
            Property__c testProp = new Property__c();
            testProp.Name = 'This';
            testProp.Location__c = 'Here';
            testProp.Bed__c = 1;
            testProp.Bath__c = 1;
            testProp.Price__c = 5;
            testProps.add(testProp);
        }
        insert(testProps);
        List<Property__c> testPropsReceived = PropertyController.getProperties();
        system.assertEquals(testProps.size(), testPropsReceived.size());
        
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
   
}