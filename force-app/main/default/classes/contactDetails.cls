public with sharing class contactDetailss {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        try {
            return [
                SELECT Id,Name, Phone, AccountId 
                FROM Contact 
                ORDER BY LastName ASC
            ];
        } catch (Exception e) {
            throw new AuraHandledException('Error retrieving contacts: ' + e.getMessage());
        }
    }
}
