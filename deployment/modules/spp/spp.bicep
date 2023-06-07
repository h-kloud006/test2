param subscriptionId string = ''
param resourceGroupName string
param location string
param webApp object
param keyVault object
param tags object
param sql object
param registry object
param storageAccount object

module rg 'resource-group.bicep' = {
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope
  params: {
    resourceGroupName: resourceGroupName
    resourceGroupLocation: location
  }
}

module testWebApp 'web-app.bicep' = {
  name: webApp.aspName
  params: {
    webApp: webApp
    location: location
  }
}

module kv 'key-vault.bicep' = {
  scope: resourceGroup(rg.name)
  name: keyVault.kvName
  params: {
    keyVault: keyVault
    tags: tags
  }
}

module sqldb 'sql-db.bicep' = {
  name: 'sqlserver'
  params: {
    sql: sql
    location: location
  }
}

module acr 'container-registry.bicep' = {
  name: registry.registryName
  params: {
    registry: registry
    registryLocation: location
    tags: tags
  }
}

module sa 'storage-account.bicep'={
  name:storageAccount.name
  params:{
    storageAccount:storageAccount
    storageAccountLocation:location
    tags:tags
  }
}
