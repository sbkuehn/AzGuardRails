$ADGroup = "Engineering"
$ADGroupSearch = Get-AzureRmADGroup -SearchString $ADGroup

#subscription ID in form of "subscriptions/xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx" : Can only add one subscription in this form

$scope = ""

$role = Get-AzureRmRoleDefinition "Reader" 
$role.id = $null
$role.name = "CloudOps Lead"
$role.Description = "Cloud Engineering Lead"
$role.Actions.Clear()
$role.NotActions.Clear()
$role.Actions.Add("*")
$role.NotActions.Add("Microsoft.Network/*/delete")
$role.NotActions.Add("Microsoft.Network/*/write")
$role.AssignableScopes.Clear()
$role.AssignableScopes.Add($scope)

New-AzureRmRoleDefinition -Role $role 

New-AzureRmRoleAssignment -ObjectId $ADGroupSearch.Id.Guid -RoleDefinitionName $role.name -Scope $scope
