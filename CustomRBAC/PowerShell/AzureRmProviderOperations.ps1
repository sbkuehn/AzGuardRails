# Exports a list of all Azure Provider Operations to a CSV file.
Get-AzureRmProviderOperation -OperationSearchString * | Select Operation,OperationName,ProviderNamespace,Description | Export-Csv c:\Demos\CustomRBAC\resourceprovideractions.csv -nti

# Working examples to drill deeper into specific provider namespaces.
Get-AzureRmResourceProvider | Select ProviderNameSpace | Export-Csv C:\Demos\CustomRBAC\ResourceProviders.csv -nti
Get-AzureRmProviderOperation -OperationSearchString Microsoft.Automation/* | Select Operation,OperationName,Description | Export-Csv C:\Demos\CustomRBAC\Automation.csv -nti
Get-AzureRmProviderOperation -OperationSearchString Microsoft.Compute/* | Select Operation,OperationName,Description | Export-Csv C:\Demos\CustomRBAC\Compute.csv -nti
Get-AzureRmProviderOperation -OperationSearchString Microsoft.HDInsight/* | Select Operation,OperationName,Description | Export-Csv C:\Demos\CustomRBAC\HDInsight.csv -nti
Get-AzureRmProviderOperation -OperationSearchString Microsoft.insights/* | Select Operation,OperationName,Description | Export-Csv C:\Demos\CustomRBAC\insights.csv -nti
Get-AzureRmProviderOperation -OperationSearchString Microsoft.Network/* | Select Operation,OperationName,Description | Export-Csv C:\Demos\CustomRBAC\Network.csv -nti
Get-AzureRmProviderOperation -OperationSearchString Microsoft.OperationalInsights/* | Select Operation,OperationName,Description | Export-Csv C:\Demos\CustomRBAC\OpsInsights.csv -nti
Get-AzureRmProviderOperation -OperationSearchString Microsoft.OperationsManagement/* | Select Operation,OperationName,Description | Export-Csv C:\Demos\CustomRBAC\OpsMgmt.csv -nti
Get-AzureRmProviderOperation -OperationSearchString Microsoft.Sql/* | Select Operation,OperationName,Description | Export-Csv C:\Demos\CustomRBAC\SQL.csv -nti
Get-AzureRmProviderOperation -OperationSearchString Microsoft.Storage/* | Select Operation,OperationName.Description | Export-Csv C:\Demos\CustomRBAC\Storage.csv -nti
Get-AzureRmProviderOperation -OperationSearchString Microsoft.Resources/* | Select Operation,OperationName,Description | Export-Csv C:\Demos\CustomRBAC\Resources.csv -nti
Get-AzureRmProviderOperation -OperationSearchString '*' | ? { $_.Operation -like 'Microsoft.Network/*' } | select Operation,OperationName,Description | Out-File azure-network-permissions.txt