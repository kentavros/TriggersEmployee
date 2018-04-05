public with sharing class EmployeeTriggerHelper {
	
	public static void insertTriggerBefore(List<Employee__c> employees){

		EmployeeTriggerService.getInsertTriggerBefore(employees);

	}

	public static void updateTriggerBefore(List<Employee__c> employees) {

		EmployeeTriggerService.getInsertTriggerBefore(employees);

	}

}