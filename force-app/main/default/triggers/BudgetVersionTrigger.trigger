/**
 * @description       : budget version trigger
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
trigger BudgetVersionTrigger on Budget_Version__c (before insert, before update, after insert, after update, before delete, after delete) {
    BudgetVersionTriggerHandler.run(trigger.new, trigger.oldMap, Trigger.operationType);
}