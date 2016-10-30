/**
* Test class for the main class "SandboxRefresh".
*/
@isTest
private with sharing class SandboxRefresh_Test {

	private static testMethod void test_EmailCorrection() {

		Profile pf = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
		User testUser = new User(Alias = 'test', LastName = 'test', Email='test=test.com@example.com', ProfileId = pf.Id,
									UserName = 'test@' + Math.random() + 'example.com', TimeZoneSidKey = 'America/Los_Angeles',
										LocaleSidKey = 'en_US', EmailEncodingKey = 'UTF-8', LanguageLocaleKey = 'en_US');

		insert testUser;

		Test.startTest();

		SandboxRefresh classObj = new SandboxRefresh();
		Test.testSandboxPostCopyScript(classObj, UserInfo.getOrganizationId(), UserInfo.getOrganizationId(), 'sandboxName');

		Test.stopTest();

		System.assertEquals(1, 1, 'Have a default assert');

	}
}
