/**
 * @description       : 
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
public with sharing class BudgetVersionTriggerHandler {
    
    /**
    * @description      core handler for the budget version trigger
    * @param            List<Budget_Version__c> currentRecords 
    * @param            List<Budget_Version__c> oldRecords 
    * @param            System.TriggerOperation triggerEvent 
    **/
    public static void run(List<Budget_Version__c> currentRecords, Map<ID, Budget_Version__c> oldRecords, System.TriggerOperation triggerEvent ) {
        
        switch on triggerEvent {
            
            when BEFORE_INSERT {
                BudgetVersionTriggerBeforeInsert.beforeInsert(currentRecords);
            } 
            
            when BEFORE_UPDATE {}

            when BEFORE_DELETE {}

            when AFTER_UPDATE {} 

            when AFTER_INSERT {}

            when AFTER_DELETE {}
            
        }
    }
}
