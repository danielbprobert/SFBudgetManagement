/**
 * @description       : trigger handler for the budget trigger
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
public with sharing class BudgetTriggerHandler {
    
    /**
    * @description      core handler for the budget trigger
    * @param            List<Budget__c> currentRecords 
    * @param            List<Budget__c> oldRecords 
    * @param            System.TriggerOperation triggerEvent 
    **/
    public static void run(List<Budget__c> currentRecords, Map<ID, Budget__c> oldRecords, System.TriggerOperation triggerEvent ) {
        
        switch on triggerEvent {
            
            when BEFORE_INSERT {
                BudgetTriggerBeforeInsert.beforeInsert(currentRecords);
            } 
            
            when BEFORE_UPDATE {}

            when BEFORE_DELETE {}

            when AFTER_UPDATE {} 

            when AFTER_INSERT {
                BudgetTriggerAfterInsert.afterInsert(currentRecords);
            }

            when AFTER_DELETE {}
            
        }
    }
}
