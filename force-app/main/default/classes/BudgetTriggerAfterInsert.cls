/**
 * @description       : budget trigger after insert process
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
public with sharing class BudgetTriggerAfterInsert {
    
    public static void afterInsert(List<Budget__c> currentRecords){

        List<Budget_Year__c> budgetYears = BudgetTriggerHelper.getBudgetYears();

        List<Budget_Line__c> linesToInsert = new List<Budget_Line__c>();

        for(Budget__c budget:currentRecords){
            for(Budget_Year__c year:budgetYears){
                Budget_Line__c budgetLine = new Budget_Line__c();
                budgetLine.Budget__c = budget.Id;
                budgetLine.Budget_Version__c = budget.Budget_Version__c;
                budgetLine.Budget_Year__c = year.Id;
                linesToInsert.add(budgetLine);
            }
        }

        database.insert(linesToInsert);
        
    }
}
