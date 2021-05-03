/**
 * @description       : Budget Year Trigger before insert methods
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
public with sharing class BudgetYearTriggerBeforeInsert {
    
    /**
    * @description      before insert method that sets the name field based on the start / end date provided
    * @param            List<Budget_Year__c> currentRecords 
    **/
    public static void beforeInsert(List<Budget_Year__c> currentRecords){
        
        BudgetYearTriggerHelper.setName(currentRecords);
    
    }

}
