public with sharing class EmployeeSkillTriggerHandler {
	
	public EmployeeSkillTriggerHandler() {
        this.manage();
	}

    public void manage() {
        
        if(Trigger.isInsert && Trigger.isAfter)
        {
            EmployeeSkillTriggerHelper.insertTriggerAfter(Trigger.new); 
        }
        else if(Trigger.isUpdate && Trigger.isAfter)
        {
            EmployeeSkillTriggerHelper.insertTriggerAfter(Trigger.new);
        }
        //else if(Trigger.isInsert && Trigger.isBefore)
        // {
        //     EmployeeSkillTriggerHelper.insertTriggerBefore(Trigger.new);
        // }
        // else if(Trigger.isUpdate && Trigger.isBefore)
        // {
            //EmployeeTriggerHelper.updateTriggerBefore(Trigger.new);
        // }
        // else if(Trigger.isDelete && Trigger.isBefore)
        // {

        // }
        // else if(Trigger.isDelete && Trigger.isAfter)
        // {

        // }
        // else if(Trigger.isundelete)
        // {
           
        // }
    }
}