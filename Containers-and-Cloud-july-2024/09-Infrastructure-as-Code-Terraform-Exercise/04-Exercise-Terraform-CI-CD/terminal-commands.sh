az login

# create service principal that will work as the connecting point between Github and Azure
az ad sp create-for-rbac --name "Azure-Terraform-Miro-SP" --role contributor --scopes /subscriptions/"your subscription id from azure portal" --sdk-auth


# !!! Steps below are executed for the purpose of saving the tfstate file in the cloud !!!
# create new resource grp for the storage (hard disc)
az group create --name StorageRG --location northeurope

# create storage account
az storage account create --name taskboardstoragemhh --resource-group StorageRG --location northeurope --sku Standard_LRS --kind StorageV2

# think of the container as a folder that keeps different files
# !!! add backend 'azurerm' in the terraform main.tf file 
az storage container create -n taskboardcontainer --account-name taskboardstoragemhh