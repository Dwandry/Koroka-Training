public interface ITrigger {
    Boolean isDisabled();

    void beforeInsert(List<SObject> newList);    

    void beforeUpdate(List<SObject> newList, List<SObject> oldList, Map<Id,SObject> newMap, Map<Id,SObject> oldMap);

    void beforeDelete(List<SObject> oldList, Map<Id,SObject> oldMap);

    void afterInsert(List<SObject> newList, Map<Id,SObject> newMap);

    void afterUpdate(List<SObject> newList, List<SObject> oldList, Map<Id,SObject> newMap, Map<Id,SObject> oldMap);

    void afterDelete(List<SObject> oldList, Map<Id,SObject> oldMap);

    void afterUndelete(List<SObject> newList, Map<Id,SObject> newMap);

    void andFinally();

}