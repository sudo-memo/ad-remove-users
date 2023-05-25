This is a very basic powershell script that should work with any AD environment.
What it does is search for any disabled user account within the defined OU that has not been modified for over X amount of years.
You can modify the script to change the number of years, or even add some more logic to setup a legitimate dry-run flag. Up to you!
There is also a section of the script that you can uncomment to run manually and get a list of all users that would be affected, you can use this before running LIVE.
Ideally you would create a scheduled task to run this script once a month. 
