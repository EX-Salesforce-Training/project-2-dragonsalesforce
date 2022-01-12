trigger PropertyTrigger on Property__c (before insert, before update, before delete, after insert, after update, after delete, after undelete){
    Switch on Trigger.OperationType{
    	when BEFORE_INSERT{
        	PropertyTriggerHelper.UpdateDescription(trigger.new);
    	}
    	when BEFORE_UPDATE {
            PropertyTriggerHelper.ArchiveProperty(trigger.new);
    	}
    	when BEFORE_DELETE {
            
    	}
    	when AFTER_INSERT {
            
    	}
    	when AFTER_UPDATE {
           PropertyTriggerHelper.DeleteArchivedProperty();
    	}
    	when AFTER_DELETE {
            
    	}
    	when else {
            
    	}
	}
}