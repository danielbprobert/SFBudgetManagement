/**
 * @description       : reusable helpers across the budget year trigger
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
public with sharing class BudgetYearTriggerHelper {

    /**
    * @description      method to set the name before insert / before update
    * @param List<Budget_Year__c> currentRecords 
    **/
    public static void setName(List<Budget_Year__c> currentRecords){

        for(Budget_Year__c budgetYear:currentRecords){
            
            integer startYear = budgetYear.Start_Date__c.year();
            
            integer endYear = budgetYear.End_Date__c.year();
            
            if(startYear != endYear){
            
                budgetYear.Name = string.valueOf(startYear) + '-' + string.valueOf(endYear);
            
            } else {
            
                budgetYear.Name = string.valueOf(startYear);
            
            }
        
        }

    }


    /**
    * @description          method to compare the old dates and name to confirm if during before update if we need to take any action to set name
    * @param                List<Budget_Year__c> currentRecords 
    * @param                Map<ID, Budget_Year__c> oldRecords 
    * @return               List<Budget_Year__c> 
    **/
    public static List<Budget_Year__c> checkDateChanges(List<Budget_Year__c> currentRecords, Map<ID, Budget_Year__c> oldRecords){

        List<Budget_Year__c> returnList = new List<Budget_Year__c>();

        for(Budget_Year__c budgetYear:currentRecords){
        
            date oldStartDate = (date)oldRecords.get(budgetYear.Id).get('Start_Date__c');
        
            date endStartDate = (date)oldRecords.get(budgetYear.Id).get('End_Date__c');
        
            string oldName = (string)oldRecords.get(budgetYear.Id).get('Name');
        
            if(budgetYear.Start_Date__c != oldStartDate || budgetYear.End_Date__c != endStartDate || budgetYear.Name != oldName){
        
                returnList.add(budgetYear);
        
            }
        
        }

        return returnList;

    }

}
