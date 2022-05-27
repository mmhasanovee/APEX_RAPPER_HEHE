public with sharing class ClosedCasesController {
    public ClosedCasesController() {

    }
    
    @AuraEnabled(cacheable=true)
    public static List<CaseWrapper> getClosedCases(){

        List<CaseWrapper> caseList = new List<CaseWrapper>();
        try {
            for(Case caseRecord : [Select Id, CaseNumber, Subject, Status From Case Where status !='Closed' Limit 50]){
            CaseWrapper cw = new CaseWrapper(caseRecord);
            caseList.add(cw);
            //caseList = [SELECT Id, CaseNumber, Subject, Status FROM Case  WHERE Status = 'Closed'  WITH SECURITY_ENFORCED Limit 50];
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return caseList;
    }

    @AuraEnabled
    public static String closeSelectedCases(String caseString){
        System.debug(caseString);
        try {
            List<CaseWrapper> caseList = (List<CaseWrapper>)JSON.deserialize(caseString, List<CaseWrapper>.class);
            //after deserializing
            System.debug(caseList);
            List<Case> caseToUpdate = new List<Case>();
            for(CaseWrapper wrapper : caseList){
                if(wrapper.isSelected == true){
                    Case caseRecord = wrapper.caseRecord;
                    caseRecord.Status = 'Closed';
                    caseToUpdate.add(caseRecord);
                }
            }
        update caseToUpdate;
        return 'Successfully updated the records';

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }
}
