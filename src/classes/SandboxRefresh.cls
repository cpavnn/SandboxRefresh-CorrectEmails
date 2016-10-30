/**
* Class to perform email correction on User records, upon sandbox creation
* Removes '@example.com' from the end of the email, and replaces '=' with '@'
*/
public with sharing class SandboxRefresh implements SandboxPostCopy{

	public void runApexClass(System.SandboxContext context){
		//Only System Admin users are corrected. Add more profiles as needed (or push it using custom settings)
		correctEmailForProfile(new set<String>{'System Administrator'});
	}

	public static void correctEmailForProfile(set<String> profiles){
		list<User> users = [SELECT Id, Email FROM User WHERE IsActive = TRUE AND Profile.Name IN :profiles];
		list<user> userToUpdate = new list<user>();

		for(User singleUser : users){
			if(singleUser.Email.endsWith('@example.com')){
				singleUser.Email = singleUser.Email.removeEnd('@example.com');
				singleUser.Email = singleUser.Email.replace('=','@');
				userToUpdate.add(singleUser);
			}
		}

		list<Database.SaveResult> results = Database.update(userToUpdate, FALSE);

		for(Database.SaveResult sr : results){
			if(!sr.isSuccess()){
				for(Database.Error err : sr.getErrors()) {
					System.debug(err.getStatusCode() + ': ' + err.getMessage());
        		}
			}
		}
	}
}
