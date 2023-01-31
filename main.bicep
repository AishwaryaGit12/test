param administratorLogin string
param location string
param sqlServerName string

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
