/**
 * @description       : Budget Version trigger helper class
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
public with sharing class BudgetVersionTriggerHelper {
    
    /**
    * @description      method to set the current version number on a budget submission
    * @param            List<Budget_Version__c> currentRecords 
    **/
    public static void setName(List<Budget_Version__c> currentRecords){

        integer currentCount = [SELECT COUNT() FROM Budget_Version__c];

        for(Budget_Version__c budgetVersion:currentRecords){
        
            currentCount = currentCount + 1;
        
            budgetVersion.Name = string.valueOf(currentCount);
        
        }
        
    }
}
