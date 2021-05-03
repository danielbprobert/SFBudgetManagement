/**
 * @description       : Test class for the BudgetYear trigger/trigger handler and helper
 * @author            : daniel@hyphen8.com
 * @group             : 
 * @last modified on  : 04-30-2021
 * @last modified by  : daniel@hyphen8.com
 * Modifications Log 
 * Ver   Date         Author               Modification
 * 1.0   04-30-2021   daniel@hyphen8.com   Initial Version
**/
@IsTest
public with sharing class BudgetYearTrigger_Test {
    
    @IsTest
    static void insertTest(){

        BudgetDataFactory.inmemory = true;

        date startOfYear = date.newInstance(system.today().year(), 1, 1);
        date endOfYear = date.newInstance(system.today().year(), 12, 31);

        test.startTest();

            Budget_Year__c budgetYear = BudgetDataFactory.createBudgetYear(startOfYear, endOfYear);
            insert budgetYear;

            string currentYear = string.valueOf(startOfYear.year());

            system.assertEquals([SELECT Name FROM Budget_Year__c LIMIT 1].Name, currentYear, 'Correct Year Name Set');

        test.stopTest();
    }

    @IsTest
    static void updateTest(){

        BudgetDataFactory.inmemory = true;

        date startOfYear = date.newInstance(system.today().year(), 1, 1);
        date endOfYear = date.newInstance(system.today().year(), 12, 31);

        Budget_Year__c budgetYear = BudgetDataFactory.createBudgetYear(startOfYear, endOfYear);
        insert budgetYear;

        test.startTest();
            budgetYear.Start_Date__c = system.today();
            budgetYear.End_Date__c = system.today().addYears(1);
            update budgetYear;

            string newName = string.valueOf(system.today().year()) + '-' + string.valueOf(system.today().addYears(1).year());

            system.assertEquals(newName, [SELECT Name FROM Budget_Year__c LIMIT 1].Name, 'Correct name change occured');

        test.stopTest();
    }

    @IsTest
    static void deleteTest(){

        BudgetDataFactory.inmemory = true;
        Budget_Year__c budgetYear = BudgetDataFactory.createBudgetYear(system.today(), system.today().addYears(1));
        insert budgetYear;
        List<Budget_Year__c> budgetYears = BudgetDataFactory.createListBudgetYear(system.today(), system.today().addyears(1), 10);
        insert budgetYears;

        test.startTest();
            delete budgetYear;
            delete budgetYears;
            system.assertEquals(0, [SELECT COUNT() FROM Budget_Year__c], 'No records left in system');
        test.stopTest();
    }
}
