# Provides a baseline template to work off of with an existing builtin role.
Get-AzRoleDefinition -Name "Network Contributor" | ConvertTo-Json | Out-File "C:\ScriptOutputs\NetworkContributor.json"
