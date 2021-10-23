@isTest 
private class ClassEnrollmentTriggerTest {
    @isTest static void validateRelationInTrigger() { 
        //already existed relation
		Student__c s1 = new Student__c(Name = 'Student 4', Year_of_Study__c = '3');
    	Class__c c1 = new Class__c(Subject__c = 'Algebra', Year_of_Study__c = '3');
    	Class_Enrollment__c e1 = new Class_Enrollment__c(Class__c = c1.Id , Student__c = s1.Id , Grade__c = 58); 
        insert s1;
        insert c1;
        insert e1;
        
        test.startTest();
        Class_Enrollment__c duplicateClassEnrollment = new Class_Enrollment__c(Class__c = c1.Id , Student__c = s1.Id , Grade__c = 95);
        insert duplicateClassEnrollment;
        List<Class_Enrollment__c> actualResult = new List<Class_Enrollment__c>([
            SELECT Id 
            FROM Class_Enrollment__c
            WHERE Id =: duplicateClassEnrollment.Id
        ]);
		test.StopTest();
        
        System.assertEquals( 
            0, 
            actualResult.size(), 
            'ClassEnrollmentTrigger is working incorrectly.'
        );
    }    
}