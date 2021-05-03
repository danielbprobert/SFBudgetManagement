/**
 * @description       : budget trigger helper class
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
public with sharing class BudgetTriggerHelper {
    
    public static List<Budget_Year__c> getBudgetYears(){
        return [SELECT ID FROM Budget_Year__c];
    }
}
