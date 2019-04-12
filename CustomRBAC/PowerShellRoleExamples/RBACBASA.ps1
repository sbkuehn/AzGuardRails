$ADGroup = "Business Analysts"
$ADGroupSearch = Get-AzADGroup -SearchString $ADGroup

#subscription ID in form of "subscriptions/xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxx" : Can only add one subscription in this form

$scope = ""

$role = Get-AzureRmRoleDefinition "Reader" 
$role.id = $null
$role.name = "BA SA"
$role.Description = "Business Analyst Role"
$role.Actions.Clear()
$role.NotActions.Clear()
$role.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/read")
$role.Actions.Add("Microsoft.Storage/storageAccounts/read")
$role.Actions.Add("Microsoft.Network/virtualNetworks/read")
$role.Actions.Add("Microsoft.Network/virtualNetworks/subnets/read")
$role.Actions.Add("Microsoft.resources/deployments/*")
$role.Actions.Add("Microsoft.Compute/*/read")
$role.Actions.Add("Microsoft.Compute/virtualMachines/restart/action")
$role.Actions.Add("Microsoft.Compute/virtualMachineScaleSets/restart/action")
$role.Actions.Add("Microsoft.Compute/virtualMachineScaleSets/virtualMachines/restart/action")
$role.Actions.Add("Microsoft.Sql/*/read")
$role.AssignableScopes.Clear()
$role.AssignableScopes.Add($scope)

New-AzRoleDefinition -Role $role 

New-AzRoleAssignment -ObjectId $ADGroupSearch.Id.Guid -RoleDefinitionName $role.name -Scope $scope
