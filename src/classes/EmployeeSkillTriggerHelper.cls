public with sharing class EmployeeSkillTriggerHelper {
	
	public static void insertTriggerAfter(List<EmployeeSkill__c> skills) {
		EmployeeSkillTriggerService.getInsertTriggerAfter(skills);
	}
}