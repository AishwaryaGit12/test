param administratorLogin string
param location string
param sqlServerName string
param keyVaultName string
param keyVaultResourceGroup string

resource kv 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: keyVaultName
  scope: resourceGroup(keyVaultResourceGroup)
}

module sqlServerDeployment '../modules/SQLserver.bicep' = {
  name: 'sqlServerDeployment'
  params: {
    administratorLogin: administratorLogin
    administratorLoginPassword: kv.getSecret('sqlsrvadmin')
    location: location
    sqlServerName: sqlServerName
  }
  dependsOn: [
    vnetResourceDeployment
  ]
}
