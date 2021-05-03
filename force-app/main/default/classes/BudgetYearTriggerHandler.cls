/**
 * @description       : trigger handler for budget year trigger
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
public with sharing class BudgetYearTriggerHandler {
    
    /**
    * @description      core handler for the budget year trigger
    * @param            List<Budget_Year__c> currentRecords 
    * @param            List<Budget_Year__c> oldRecords 
    * @param            System.TriggerOperation triggerEvent 
    **/
    public static void run(List<Budget_Year__c> currentRecords, Map<ID, Budget_Year__c> oldRecords, System.TriggerOperation triggerEvent ) {
        
        switch on triggerEvent {
            
            when BEFORE_INSERT {
                BudgetYearTriggerBeforeInsert.beforeInsert(currentRecords);
            } 
            
            when BEFORE_UPDATE {
                BudgetYearTriggerBeforeUpdate.beforeUpdate(currentRecords, oldRecords);
            }

            when BEFORE_DELETE {}

            when AFTER_UPDATE {} 

            when AFTER_INSERT {}

            when AFTER_DELETE {}
            
        }
    }
}
