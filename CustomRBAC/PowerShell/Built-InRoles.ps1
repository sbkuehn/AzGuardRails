Get-AzRoleDefinition | Select-Object Name, Description | Export-Csv c:\Scripts\allArmRoles.csv -NTI
