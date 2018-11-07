# This scripts allows you to change a bulk of users passwords. 
# Will ask you for identifiable Given name for the users Then display the output so you can check its the right ones
# Will then ask then complete the change. 

$givenname = Read-Host -Prompt 'What is the customer abbreviation for the accounts? E.G FRF'
$password = Read-Host -Prompt 'What would you like to change the password too?'


$testgiven = get-aduser -filter {GivenName -eg '$givenname'}
Write-Output $testgiven


Read-Host -Prompt "Check the above output has given you the correct accounts before continuing. Any button to continue Ctrl + C to cancel." 
get-aduser -filter {GivenName -eg '$givenname'} | Set-ADAccountPassword -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$password" -Force)


