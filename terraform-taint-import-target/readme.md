#In this section discussed about terraform commands like terraform taint,import,target,refresh and environment variables.
## Terraform Target

_**If we want to create or delete the particular resource which is defined in configuration file need to use target.**_

_**syntax for `target` command**_
| command | Usage |
----------|--------
| `terraform plan -target=< resource address >`  | If you want to create execution plan for particula resource. |
| `terraform apply -target=< resource address >`  | If you want to create particular resource. |
| `terraform destroy -target=< resource address >`  | If we want to delete particular resource which was created in previous apply.|
| `terraform plan or apply or destroy -target=< resource address > -target=< resource address >` | we can use multiple `-target` arguments to effect multiple resources |

`scenario`: If you want to run plan or apply or destroy on a particular resource we can use target option.

example:
  **`terraform plan -target=azurerm_virtual_network.vnet`**
  
  ![image](https://user-images.githubusercontent.com/121039917/209086624-8bf9c4fa-d7ba-4093-9cf0-c3629e9ae372.png)
  
## Terraform Taint and Replace

_**If we want to replace any particular damaged or degraded object in next apply need to use taint or replace.**_

`terraform taint` will update the object as tainted in state file and terraform will replace the tainted object in next plan and apply. Recommended to use `replace` after  terraform _0.15_ version in terraform apply. so, tainted object will be deleted and then created. \
example:\
**`terraform taint azurerm_virtual_network.vnet`**

![image](https://user-images.githubusercontent.com/121039917/209114435-0df21d54-335d-48c6-9c7c-e60f9b37f806.png)

**`terraform apply -replace=azurerm_virtual_network.vnet`**

![image](https://user-images.githubusercontent.com/121039917/209115396-c65406ce-285c-4cd6-aa80-a73c550bcb03.png)

![image](https://user-images.githubusercontent.com/121039917/209115627-08c14511-fd11-48c9-b7a3-e9a1eb80365a.png)

## Terraform Import

_**If we want to bring the manually created resouce to terraform managed resources need to use terraform import**_ 

Before executing `terraform import`, we should write resource configuration in terraform file and get the resource from target provider which we need to add terraform.

_**syntax for `import` command**_ \
`terraform import <ADDR> <ID>`\
example:\
 In this example i created one resource group manually in portal and bring it to terraform managed.\
 `terraform import azurerm_resource_group.rg-import /subscriptions/< subscriptionId >/resourceGroups/< resource Group Name of manually created>`
 
 **rg-import** is the resource created manually in Azure.
 
 ![image](https://user-images.githubusercontent.com/121039917/209124546-5ca40e2a-f60e-4bb9-9df2-a45e092d4f07.png)

Resource id of **rg-import** resource group, which required for import command.

![image](https://user-images.githubusercontent.com/121039917/209124797-fa71af47-8a78-4e82-8db6-e6970f96b02d.png)

Need to write configuration in terraform file Manually.

`resource "azurerm_resource_group" "import-example" {`
 `name = "rg-import"`
  `location = "eastus"` 
 `}`

 ![image](https://user-images.githubusercontent.com/121039917/209126220-2911b19c-b0af-4a08-b716-bd312f24a6c6.png)
 
 Now it is added to terraform configuration and now we should add this to state file using import command.\
 _*here is the syntax*_\
 `terraform import <ADDR> <ID>`\
 `<ADDR>` = **`azurerm_resource_group.import-example`** this value is from terraform configuration file\
 `<ID>` = **`/subscriptions/14a20d13-d0a0-4bf6-93db-ebc8d5dd970a/resourceGroups/rg-import`** this value we will get from azure portal.\
 Run the below command as per your environment.\
 `terraform import azurerm_resource_group.import-example /subscriptions/14a20d13-d0a0-4bf6-93db-ebc8d5dd970a/resourceGroups/rg-import`\
 ![image](https://user-images.githubusercontent.com/121039917/209127473-007ee63c-74d0-4921-8314-095d546e8278.png)

 
 

 




