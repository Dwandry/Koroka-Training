public with sharing class TriggerFactory {
    public static void run(ITrigger handler){
        if (handler.isDisabled()) {
            return;
        }
        if (Trigger.IsBefore) {
            if(Trigger.IsInsert){
                handler.beforeInsert(Trigger.new);
            }
            if (Trigger.IsUpdate) {
                handler.beforeUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
            if(Trigger.IsDelete){
                handler.beforeDelete(Trigger.old, Trigger.oldMap);
            }
        }
        if (Trigger.IsAfter) {
            if(Trigger.IsInsert){
                handler.afterInsert(Trigger.new, Trigger.newMap);
            }
            if (Trigger.IsUpdate) {
                handler.afterUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
            if(Trigger.IsDelete){
                handler.afterDelete(Trigger.old, Trigger.oldMap);
            }
            if(Trigger.IsUndelete){
                handler.afterUndelete(Trigger.new, Trigger.newMap);
            }
        }
    }
}
