# SandboxRefresh-CorrectEmails
Simple code to correct emails of users after sandbox refresh

#ABOUT
1) The class SandboxRefresh will correct the email ids of all System Administrators.
2) Removes '@example.com' from the end of the email, and replaces '=' with '@'

#Execution
1) Specify the class name when creating/refreshing a sandbox.
2) To correct the email after sandbox has been created, invoke the method as shown below:
SandboxRefresh.correctEmailForProfile(new set<String>{'System Administrator'});
