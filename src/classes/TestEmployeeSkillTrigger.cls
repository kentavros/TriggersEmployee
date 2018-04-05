@isTest
private class TestEmployeeSkillTrigger {

	@isTest static void testInsertTriggerAfterErr() {
		Employee__c employee = new Employee__c(	First_Name__c = 'TestF', Last_Name__c='TestL', 
			Birthday__c=system.today(), IT_Department__c='QA', Level__c='Junior', 	Start_Date__c=system.today()
		);
		insert employee;

		Project__c project = new Project__c(
			Name = 'Test', 	Start_Date__c = system.today(), Priority__c = 'Hot'
		);
		insert project;

		EmployeeSkill__c skill1 = new EmployeeSkill__c(
			Name='Test', Position__c = 'Tester', Assigned_Time__c=8.0, Employee__c = employee.Id,
			Project__c = project.Id
		);
		insert skill1;

		EmployeeSkill__c skill2 = new EmployeeSkill__c(
			Name='Test2', Position__c = 'Tester', Assigned_Time__c=8.0, Employee__c = employee.Id,
			Project__c = project.Id
		);

		Test.startTest();
		Database.SaveResult result = Database.insert(skill2, false);
		Test.stopTest();

		System.assert(!result.isSuccess());
		System.assert(result.getErrors().size() > 0);
		System.assertEquals('The employee\'s time threshold is too high!',
                             result.getErrors()[0].getMessage());
	}

	@isTest static void testInsertTriggerAfter() {
		Employee__c employee = new Employee__c(	First_Name__c = 'TestF', Last_Name__c='TestL', 
			Birthday__c=system.today(), IT_Department__c='QA', Level__c='Junior', 	Start_Date__c=system.today()
		);
		insert employee;

		Project__c project = new Project__c(
			Name = 'Test', 	Start_Date__c = system.today(), Priority__c = 'Hot'
		);
		insert project;

		EmployeeSkill__c skill1 = new EmployeeSkill__c(
			Name='Test', Position__c = 'Tester', Assigned_Time__c=5.0, Employee__c = employee.Id,
			Project__c = project.Id
		);
		insert skill1;

		EmployeeSkill__c skill2 = new EmployeeSkill__c(
			Name='Test2', Position__c = 'Tester', Assigned_Time__c=3.0, Employee__c = employee.Id,
			Project__c = project.Id
		);
		

		Test.startTest();
		Database.SaveResult result = Database.insert(skill2);
		Test.stopTest();

		System.assert(result.isSuccess());
		System.assert(result.getErrors().size() == 0);
	}

	@isTest static void testUpdateTriggerAfterErr() {
		Employee__c employee = new Employee__c(	First_Name__c = 'TestF', Last_Name__c='TestL', 
			Birthday__c=system.today(), IT_Department__c='QA', Level__c='Junior', 	Start_Date__c=system.today()
		);
		insert employee;

		Project__c project = new Project__c(
			Name = 'Test', 	Start_Date__c = system.today(), Priority__c = 'Hot'
		);
		insert project;

		EmployeeSkill__c skill1 = new EmployeeSkill__c(
			Name='Test', Position__c = 'Tester', Assigned_Time__c=7.0, Employee__c = employee.Id,
			Project__c = project.Id
		);
		EmployeeSkill__c skill2 = new EmployeeSkill__c(
			Name='Test', Position__c = 'Tester', Assigned_Time__c=1.0, Employee__c = employee.Id,
			Project__c = project.Id
		);
		insert skill1;
		insert skill2;
		skill2.Assigned_Time__c = 5.0;

		Test.startTest();
		Database.SaveResult result = Database.update(skill2, false);
		Test.stopTest();

		System.assert(!result.isSuccess());
		System.assert(result.getErrors().size() > 0);
		System.assertEquals('The employee\'s time threshold is too high!',
			result.getErrors()[0].getMessage());
	}	


	@isTest static void testUpdateTriggerAfter() {
		Employee__c employee = new Employee__c(	First_Name__c = 'TestF', Last_Name__c='TestL', 
			Birthday__c=system.today(), IT_Department__c='QA', Level__c='Junior', 	Start_Date__c=system.today()
		);
		insert employee;

		Project__c project = new Project__c(
			Name = 'Test', 	Start_Date__c = system.today(), Priority__c = 'Hot'
		);
		insert project;

		EmployeeSkill__c skill1 = new EmployeeSkill__c(
			Name='Test', Position__c = 'Tester', Assigned_Time__c=8.0, Employee__c = employee.Id,
			Project__c = project.Id
		);
		insert skill1;
		skill1.Assigned_Time__c = 5.0;

		Test.startTest();
		Database.SaveResult result = Database.update(skill1);
		Test.stopTest();

		System.assert(result.isSuccess());
		System.assert(result.getErrors().size() == 0);
	}	
}