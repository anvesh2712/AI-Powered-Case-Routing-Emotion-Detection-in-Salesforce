trigger CaseClassifierTrigger on Case (after insert) {
    for (Case c : Trigger.new) {
        if (String.isNotBlank(c.Subject) && String.isNotBlank(c.Description)) {
            CaseClassifierAsync.classifyCaseAsync(c.Id);
        }
    }
}