/**
 * @description       : Budget Test Data Factory to centralise the creation of records within the budget application
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
public with sharing class BudgetDataFactory {
    
    /**
     * @description in memory is used to confirm if we should be creating the records or just returing them
    */
    public static boolean inmemory;

    /**
    * @description      create 1 budget year 
    * @param            date startDate 
    * @param            date endDate 
    * @return           Budget_Year__c 
    **/
    public static Budget_Year__c createBudgetYear(date startDate, date endDate) {
        
        Budget_Year__c budgetYear = new Budget_Year__c(Name='DEMO', Start_Date__c=startDate, End_Date__c=endDate);
        
        if(!inmemory){
        
            insert budgetYear;
        
        }
        
        return budgetYear;
    
    }

    /**
    * @description      create x budget years 
    * @param            date startDate 
    * @param            date endDate 
    * @param            integer numberOfYears
    * @return           Budget_Year__c 
    **/
    public static List<Budget_Year__c> createListBudgetYear(date startDate, date endDate, integer numberOfYears) {

        List<Budget_Year__c> budgetYears = new List<Budget_Year__c>();

        for(integer i = 0; i < numberOfYears; i++){
        
            date recordStartDate = startDate.addYears(i);
        
            date recordEndDate = endDate.addYears(i);
        
            Budget_Year__c budgetYear = new Budget_Year__c(Name='DEMO ' + i, Start_Date__c=recordStartDate, End_Date__c=recordEndDate);
        
            budgetYears.add(budgetYear);
        
        }

        if(!inmemory){
        
            insert budgetYears;
        
        }
        
        return budgetYears;

    }
}
