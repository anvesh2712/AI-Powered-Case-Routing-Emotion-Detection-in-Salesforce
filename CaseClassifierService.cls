public class CaseClassifierService {
    public static String classifyDepartment(String text) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:HuggingFace_API/models/facebook/bart-large-mnli');
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer YOUR_HUGGINGFACE_TOKEN');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');

        String body = '{"inputs": "' + text.escapeJava() + '", "parameters": {"candidate_labels": ["Technical Support", "Billing", "HR", "Compliance", "Product Feedback"]}}';
        req.setBody(body);

        Http http = new Http();
        try {
            HttpResponse res = http.send(req);
            if (res.getStatusCode() == 200) {
                Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                List<Object> labels = (List<Object>) result.get('labels');
                if (!labels.isEmpty()) return (String) labels[0];
            }
        } catch (Exception e) {
            System.debug('Department classification error: ' + e.getMessage());
        }
        return 'Unknown';
    }

    public static String detectEmotion(String text) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:HuggingFace_API/models/bhadresh-savani/distilbert-base-uncased-emotion');
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer YOUR_HUGGINGFACE_TOKEN');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');

        String body = '{"inputs": "' + text.escapeJava() + '"}';
        req.setBody(body);

        Http http = new Http();
        try {
            HttpResponse res = http.send(req);
            if (res.getStatusCode() == 200) {
                Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                List<Object> labels = (List<Object>) result.get('labels');
                if (!labels.isEmpty()) return (String) labels[0];
            }
        } catch (Exception e) {
            System.debug('Emotion detection error: ' + e.getMessage());
        }
        return 'Neutral';
    }
}