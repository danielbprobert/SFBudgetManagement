BEGIN TRANSACTION;
CREATE TABLE "Budget_Line__c" (
	id INTEGER NOT NULL, 
	"Actual__c" VARCHAR(255), 
	"Projected__c" VARCHAR(255), 
	"Budget_Version__c" VARCHAR(255), 
	"Budget_Year__c" VARCHAR(255), 
	"Budget__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Budget_Line__c" VALUES(1,'0.0','0.0','1','2','1');
INSERT INTO "Budget_Line__c" VALUES(2,'0.0','0.0','1','1','1');
INSERT INTO "Budget_Line__c" VALUES(3,'0.0','0.0','1','3','1');
INSERT INTO "Budget_Line__c" VALUES(4,'0.0','0.0','1','2','2');
INSERT INTO "Budget_Line__c" VALUES(5,'0.0','0.0','1','1','2');
INSERT INTO "Budget_Line__c" VALUES(6,'0.0','0.0','1','3','2');
CREATE TABLE "Budget_Version__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Budget_Version__c" VALUES(1,'1');
CREATE TABLE "Budget_Year__c" (
	id INTEGER NOT NULL, 
	"End_Date__c" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"Start_Date__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Budget_Year__c" VALUES(1,'2022-12-31','2022','2022-01-01');
INSERT INTO "Budget_Year__c" VALUES(2,'2022-12-31','2021-2022','2021-01-01');
INSERT INTO "Budget_Year__c" VALUES(3,'2023-12-31','2023','2023-01-01');
CREATE TABLE "Budget__c" (
	id INTEGER NOT NULL, 
	"Line_Description__c" VARCHAR(255), 
	"Budget_Version__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Budget__c" VALUES(1,'Expenditure','1');
INSERT INTO "Budget__c" VALUES(2,'Income','1');
COMMIT;
