public with sharing class EmployeeTriggerHelper {
	
	public static void insertTriggerBefore(List<Employee__c> employees){

		List<String> firstName = new List<String>();
		List<String> lastName = new List<String>();
		List<Date> birthday = new List<Date>();

		for (Employee__c employee : employees) {
			firstName.add(employee.First_Name__c);
			lastName.add(employee.Last_Name__c);
			birthday.add(employee.Birthday__c);
		}

		List<Employee__c> employeesList = [SELECT Id, First_Name__c, Last_Name__c, Birthday__c FROM Employee__c 
			WHERE First_Name__c IN :firstName AND Last_Name__c IN :lastName AND Birthday__c IN :birthday];

		if(!employeesList.isEmpty()) {
			for (Employee__c emDublic : employeesList) {
				for (Employee__c employee : employees) {
					if (emDublic.First_Name__c == employee.First_Name__c && 
						emDublic.Last_Name__c == employee.Last_Name__c &&
						emDublic.Birthday__c == employee.Birthday__c &&
						emDublic.Id != employee.Id) {
							employee.addError('Employee with such data already exists!');
					}
				}
			}
		}
	}

	public static void updateTriggerBefore(List<Employee__c> employees) {

		EmployeeTriggerHelper.insertTriggerBefore(employees);

	}



}