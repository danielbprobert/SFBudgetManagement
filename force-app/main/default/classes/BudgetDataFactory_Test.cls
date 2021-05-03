/**
 * @description       : Test Class for BudgetDataFactory
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
@IsTest
public class BudgetDataFactory_Test {

    @IsTest
    static void basicTestRunInMemory(){
        
        BudgetDataFactory.inmemory = true;
        Budget_Year__c budgetYear = BudgetDataFactory.createBudgetYear(system.today(), system.today().addyears(1));
        insert budgetYear;
        system.assertEquals(1, [SELECT COUNT() FROM Budget_Year__c], 'Correct Number of budget years created');

        List<Budget_Year__c> budgetYears = BudgetDataFactory.createListBudgetYear(system.today(), system.today().addyears(1), 9);
        insert budgetYears;
        system.assertEquals(10, [SELECT COUNT() FROM Budget_Year__c], 'Correct Number of budget years created');

    }

    @IsTest
    static void basicTestRunOutMemory(){
    
        BudgetDataFactory.inmemory = false;
        Budget_Year__c budgetYear = BudgetDataFactory.createBudgetYear(system.today(), system.today().addyears(1));
        system.assertEquals(system.today(), budgetYear.Start_Date__c, 'Correct Start Date Set');

        List<Budget_Year__c> budgetYears = BudgetDataFactory.createListBudgetYear(system.today(), system.today().addyears(1), 9);
        system.assertEquals(10, [SELECT COUNT() FROM Budget_Year__c], 'Correct Number of budget years created');

    }
    
}
