 # Set the date threshold for disabling accounts
$threshold = (Get-Date).AddYears(-2)

# Specify the distinguished name of the OU to search in
$searchBase = "OU=Employee,OU=Accounts,DC=your,DC=domain,DC=com"

# Find all disabled user accounts that haven't been modified since the threshold date within the specified OU
$disabledAccounts = Get-ADUser -SearchBase $searchBase -Filter {(Enabled -eq $false) -and (WhenChanged -le $threshold)} -Properties WhenChanged

# Comment this out to run a DRY-RUN
#foreach ($account in $disabledAccounts) {
#       Write-Output "Would delete user account $($account.SamAccountName)."
#   }
    
# Comment this out to run a LIVE RUN THAT DELETES    
foreach ($account in $disabledAccounts) {
        Remove-ADObject -Identity $account.DistinguishedName -Recursive -Confirm:$false
        Write-Output "Deleted user account $($account.SamAccountName)."
    } 
