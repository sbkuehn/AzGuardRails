# Exports a list of all Azure Provider Operations to a CSV file.
Get-AzResourceProviderAction -OperationSearchString * | Select Operation,OperationName,ProviderNamespace,Description `
| Export-Csv c:\Scripts\CustomRBAC\resourceprovideractions.csv -nti

# Working examples to drill deeper into specific provider namespaces.
Get-AzResourceProvider | Select ProviderNameSpace | Export-Csv C:\Scripts\CustomRBAC\ResourceProviders.csv -nti

Get-AzResourceProviderAction -OperationSearchString Microsoft.Automation/* `
| Select Operation,OperationName,Description | Export-Csv C:\Scripts\CustomRBAC\Automation.csv -nti

Get-AzResourceProviderAction -OperationSearchString Microsoft.Compute/* `
| Select Operation,OperationName,Description | Export-Csv C:\Scripts\CustomRBAC\Compute.csv -nti

Get-AzResourceProviderAction -OperationSearchString Microsoft.HDInsight/* `
| Select Operation,OperationName,Description | Export-Csv CC:\Scripts\CustomRBAC\HDInsight.csv -nti

Get-AzResourceProviderAction -OperationSearchString Microsoft.insights/* `
| Select Operation,OperationName,Description | Export-Csv C:\Scripts\CustomRBAC\insights.csv -nti

Get-AzResourceProviderAction -OperationSearchString Microsoft.Network/* `
| Select Operation,OperationName,Description | Export-Csv C:\Scripts\CustomRBAC\Network.csv -nti

Get-AzResourceProviderAction -OperationSearchString Microsoft.OperationalInsights/* `
| Select Operation,OperationName,Description | Export-Csv C:\Scripts\CustomRBAC\OpsInsights.csv -nti

Get-AzResourceProviderAction -OperationSearchString Microsoft.OperationsManagement/* `
| Select Operation,OperationName,Description | Export-Csv CC:\Scripts\CustomRBAC\OpsMgmt.csv -nti

Get-AzResourceProviderAction -OperationSearchString Microsoft.Sql/* `
| Select Operation,OperationName,Description | Export-Csv C:\Scripts\CustomRBAC\SQL.csv -nti

Get-AzResourceProviderAction -OperationSearchString Microsoft.Storage/* `
| Select Operation,OperationName.Description | Export-Csv C:\Scripts\CustomRBAC\Storage.csv -nti

Get-AzResourceProviderAction -OperationSearchString Microsoft.Resources/* `
| Select Operation,OperationName,Description | Export-Csv C:\Scripts\CustomRBAC\Resources.csv -nti

Get-AzResourceProviderAction -OperationSearchString '*' | ? { $_.Operation -like 'Microsoft.Network/*' } `
| select Operation,OperationName,Description | Out-File azure-network-permissions.txt
