param location string = resourceGroup().location

param clusterName string = 'hfvanroontestaks'
param nodeCount int = 3
param vmSize string = 'Standard_DS2_v2'

resource aks 'Microsoft.ContainerService/managedClusters@2021-10-01' = {
  name: clusterName
  location: location
  tags: {
    pillar: 'M Cloud'
    usage: 'Devoteam related activities'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    servicePrincipalProfile: {
      clientId: 'string'
      secret: 'secret'
    }
    dnsPrefix: clusterName
    agentPoolProfiles: [
      {
        name: 'hvraks'
        count: nodeCount
        vmSize: vmSize
        mode: 'System'
      }
    ]
  }
}
