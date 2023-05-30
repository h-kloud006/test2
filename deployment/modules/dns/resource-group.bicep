targetScope = 'subscription' // Resource group must be deployed under 'subscription' scope

param resourceGroupName string
param resourceGroupLocation string


resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  tags: {}
}




//resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' existing = {
 // name: resourceGroupName
//}
