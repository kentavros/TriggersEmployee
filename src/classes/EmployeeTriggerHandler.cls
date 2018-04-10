public class EmployeeTriggerHandler {

    public EmployeeTriggerHandler() {
        this.manage();
    } 

    public void manage() {
        
        if(Trigger.isInsert && Trigger.isBefore)
        {
            EmployeeTriggerHelper.insertTriggerBefore(Trigger.new);
        }
        else if(Trigger.isUpdate && Trigger.isAfter)
        {
            EmployeeTriggerHelper.updateTriggerBefore(Trigger.new);  
        }
        else if(Trigger.isDelete && Trigger.isBefore)
        {
            EmployeeTriggerHelper.deleteTriggerBefore(Trigger.old);
        }
        // else if(Trigger.isDelete && Trigger.isAfter)
        // {
        //     EmployeeTriggerHelper.deleteTriggerAfter(Trigger.old);
        // }
        // else if(Trigger.isInsert && Trigger.isAfter)
        // {

        // }
        // else if(Trigger.isUpdate && Trigger.isAfter)
        // {

        // }
        // else if(Trigger.isundelete)
        // {
           
        // }
    }
    
}