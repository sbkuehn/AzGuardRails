﻿$ADGroup = "Digital Security"
$ADGroupSearch = Get-AzureRmADGroup -SearchString $ADGroup

#subscription ID in form of "subscriptions/xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx" : Can only add one subscription in this form

$scope = ""

$role = Get-AzureRmRoleDefinition "Reader" 
$role.id = $null
$role.name = "Digital Security"
$role.Description = "Digital Security Role"
$role.Actions.Clear()
$role.NotActions.Clear()
$role.Actions.Add("*/read")
$role.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/write")
$role.Actions.Add("Microsoft.Storage/storageaccounts/write")
$role.Actions.Add("Microsoft.resources/deployments/*")
$role.Actions.Add("Microsoft.EventHub/namespaces/eventhubs/*")
$role.AssignableScopes.Clear()
$role.AssignableScopes.Add($scope)

New-AzureRmRoleDefinition -Role $role 

New-AzureRmRoleAssignment -ObjectId $ADGroupSearch.Id.Guid -RoleDefinitionName $role.name -Scope $scope