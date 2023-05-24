param subscriptionId string = ''
param resourceGroupName string
param dns object

module rg './resource-group.bicep' = {
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope
  params: {
    resourceGroupName: resourceGroupName
  }
}

module privateDnsZone 'private-dns.bicep' = {
  name: dns.dnsName
  params: {
    dns: dns

  }
}
