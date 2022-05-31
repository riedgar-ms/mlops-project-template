param prefix string
param postfix string
param env string
param location string
param tags object

// Storage Account
resource stoacct 'Microsoft.Storage/storageAccounts@2019-04-01' = {
  name: 'st${prefix}${postfix}${env}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    encryption: {
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    supportsHttpsTrafficOnly: true
  }

  tags: tags
}

output stoacctOut string = stoacct.id
