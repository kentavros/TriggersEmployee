public with sharing class MyProjectController {

	@AuraEnabled
	public static List<Project__c> getProjects() {
		return [SELECT Id, Name FROM Project__c LIMIT 30];
	}

}