public with sharing class EmployeeSkillTriggerHelper {
	
	public static void insertTriggerAfter(List<EmployeeSkill__c> skills) {
		//Get ids Employees 
		List<String> ids = EmployeeSkillTriggerHelper.getIdsEmployee(skills);
		//Get WrappEmployee with Properties
		List<WrappEmployee> wrapEmployees = EmployeeSkillTriggerHelper.getListWrappEmployees(ids);
		//Check the time
		EmployeeSkillTriggerHelper.timeCheck(wrapEmployees, skills);
	}

	private static List<String> getIdsEmployee(List<EmployeeSkill__c> skills) {
		List<String> ids = new List<String>();
		if (!skills.isEmpty()) {
			for (EmployeeSkill__c skill : skills) {
				ids.add(skill.Employee__c);
			}
		} else {
			System.debug('Error - Trriger is empty!');
		}
		return ids;
	}

	private static List<WrappEmployee> getListWrappEmployees(List<String> ids) {
		List<WrappEmployee> wrapEmployees = new List<WrappEmployee>();
		try {
			List<AggregateResult> listEmplSkills = 
				[SELECT Employee__c, max(Employee__r.Availability__c) Availability, 
				SUM(Assigned_Time__c)TotalHours FROM EmployeeSkill__c 
				WHERE Employee__c IN :ids GROUP BY Employee__c];

			for (AggregateResult eSkill : listEmplSkills ) {
				WrappEmployee wEmp = new WrappEmployee();
				Integer tH = Integer.valueOf((Decimal)eSkill.get('TotalHours'));
				Integer avabil = Integer.valueOf((Decimal)eSkill.get('Availability'));
				wEmp.id = (String)eSkill.get('Employee__c');
				wEmp.totalHours = tH;
				wEmp.availability = avabil;
				wrapEmployees.add(wEmp);
			}
			
		} catch (QueryException e) {
            System.debug('QueryException caught: ' + e.getMessage());
        } catch(Exception e){
            System.debug('Exception caught: ' + e.getMessage());
        }
		return wrapEmployees;
	}

	private static void timeCheck(List<WrappEmployee> wrapEmpls, List<EmployeeSkill__c> skills ){
		if (!wrapEmpls.isEmpty()) {

			for (WrappEmployee wEmp : wrapEmpls) {
				if (wEmp.totalHours > wEmp.availability) {
					for (EmployeeSkill__c skill : skills) {
						if (wEmp.id == skill.Employee__c) {
							skill.addError('The employee\'s time threshold is too high!');
						}
					}
				}
			}

		} else {
			System.debug('Error - time check');
		}
	}

	public class WrappEmployee {
	
		public String id {get; set;}
		public Integer totalHours {get; set;}
		public Integer availability {get; set;}
		
	}
}