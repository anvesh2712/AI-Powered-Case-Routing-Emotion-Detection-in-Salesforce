public class CaseClassifierAsync {
    @future(callout=true)
    public static void classifyCaseAsync(Id caseId) {
        Case c = [SELECT Id, Subject, Description FROM Case WHERE Id = :caseId LIMIT 1];
        String input = c.Subject + ' ' + c.Description;

        String department = CaseClassifierService.classifyDepartment(input);
        String emotion = CaseClassifierService.detectEmotion(input);

        c.Predicted_Department__c = department;
        c.Predicted_Emotion__c = emotion;

        update c;
    }
}