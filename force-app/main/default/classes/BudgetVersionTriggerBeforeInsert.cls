/**
 * @description       : Budget Version before insert trigger methods
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
public with sharing class BudgetVersionTriggerBeforeInsert {
    
    /**
    * @description      method for handling before insert of budget versions
    * @param            List<Budget_Version__c> currentRecords 
    **/
    public static void beforeInsert(List<Budget_Version__c> currentRecords){

        BudgetVersionTriggerHelper.setName(currentRecords);

    }
    
}
