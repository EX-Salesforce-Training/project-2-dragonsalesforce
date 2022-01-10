trigger OfferTrigger on Offer__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) 
{
    switch on Trigger.OperationType
    {
        when BEFORE_INSERT
        {
           OfferTriggerHelper.AssignPropertyName(Trigger.new);
        }
    }
}