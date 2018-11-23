﻿$ADGroup = "NetworkAdmins"
$ADGroupSearch = Get-AzureRmADGroup -SearchString $ADGroup

#subscription ID in form of "subscriptions/xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx" : Can only add one subscription in this form

$scope = ""

$role = Get-AzureRmRoleDefinition "Reader" 
$role.id = $null
$role.name = "NetworkingTest"
$role.Description = "Networking Role"
$role.Actions.Clear()
$role.NotActions.Clear()
$role.Actions.Add("*/read")
$role.Actions.Add("Microsoft.Network/*")
$role.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/write")
$role.Actions.Add("Microsoft.Storage/storageaccounts/write")
$role.Actions.Add("Microsoft.Storage/storageAccounts/read")
$role.Actions.Add("Microsoft.resources/deployments/*")
$role.AssignableScopes.Clear()
$role.AssignableScopes.Add($scope)

New-AzureRmRoleDefinition -Role $role 

New-AzureRmRoleAssignment -ObjectId $ADGroupSearch.Id.Guid -RoleDefinitionName $role.name -Scope $scope