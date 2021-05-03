/**
 * @description       : Budget Year Trigger
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
trigger BudgetYearTrigger on Budget_Year__c (before insert, before update, before delete, after insert, after update, after delete) {
    
    // send all records to handler
    BudgetYearTriggerHandler.run(trigger.new, trigger.oldMap, Trigger.operationType);
    
}