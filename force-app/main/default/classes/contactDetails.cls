public with sharing class contactDetails {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        try {
            System.debug('Hello apex'+Userinfo.getUserId());
           // System.debug('Hello apex'+Userinfo.getUserId());
            return [
                SELECT Id, Name,  Phone, AccountId 
                FROM Contact 
                ORDER BY LastName ASC
            ];
        } catch (Exception e) {
            throw new AuraHandledException('Error retrieving contacts: ' + e.getMessage());
        }
    }
}
