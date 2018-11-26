##Get-AzResProvAll
##Gets all AzureRM Resource Provider Operations and exports to a CSV
##Note: Put the \ at the end of the filePath: c:\users\user1\
Function Get-ResProvAll {
    Param([Parameter(Position=0,Mandatory=$true)]
    [string]$filePath,
    [Parameter(Position=1,Mandatory=$true)]
    [string]$fileName)
    Get-AzureRmProviderOperation -OperationSearchString * | Select Operation,OperationName,ProviderNamespace,Description | Export-Csv -Path "$filePath $fileName" -nti
    }

##Custom-RbacAssignment
##Assigns a custom role based upon
Function Custom-RbacAssignment {
    [CmdletBinding()]
    Param([Parameter(Mandatory=$true)]
    [string]$builtinRoleName,
    [Parameter(Mandatory=$true)]
    [string]$newRoleName,
    [Parameter(Mandatory=$true)]
    [string]$roleDescription,
    [Parameter(Mandatory=$true)]
    [string]$subOrResGrp,
    [Parameter(Mandatory=$true)]
    [string]$ADGroup)

    $role = Get-AzureRmRoleDefinition "Virtual Machine Contributor"
    $role.Name = $newRoleName
    $role.Id = $null
    $role.Description = $roleDescription
    $role.Actions.Clear()
    $role.Actions.Add("Microsoft.Authorization/*/read")
    $role.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/read")
    $role.Actions.Add("Microsoft.Compute/*/read")
    $role.Actions.Add("Microsoft.Compute/virtualMachines/start/action")
    $role.Actions.Add("Microsoft.Compute/virtualMachines/restart/action")
    $role.Actions.Add("Microsoft.Compute/virtualMachines/powerOff/action")
    $role.Actions.Add("Microsoft.Compute/virtualMachines/deallocate/action")
    $role.Actions.Add("Microsoft.Network/networkInterfaces/read")
    $role.Actions.Add("Microsoft.Compute/disks/read")
    $role.Actions.Add("Microsoft.Insights/alertRules/read")
    $role.Actions.Add("Microsoft.Insights/diagnosticSettings/read")
    $role.AssignableScopes.Clear()
    $role.AssignableScopes.Add($subOrRG)
 
    New-AzureRmRoleAssignment -RoleDefinitionName $role.name -Scope $subOrResGrp
}
 

##Extracts built in roles for RBAC in Azure.
Get-AzureRmRoleDefinition | Select-Object Name, Description

##Extracts existing role, converts to json (to edit inside a text editor), and then inputs the new role definition for use in the ARM portal.
Get-AzureRmRoleDefinition -Name "Network Contributor" | ConvertTo-Json | Out-File "C:\CustomRBAC\NetworkContributor.json"
New-AzureRmRoleDefinition -InputFile C:\CustomRBAC\CustomRole.json