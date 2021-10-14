public with sharing class dragAndDropController {
    @AuraEnabled
    global static List<String> getValues(){
        List<String> groceries = new List<String>();
        groceries.add('Bread');
        groceries.add('Bread');
        groceries.add('Bread');
        groceries.add('Bread');
        groceries.add('Bread');
        groceries.add('Bread');
        groceries.add('Bread');
    }
}
