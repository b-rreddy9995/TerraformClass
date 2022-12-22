#In this section discussed about terraform commands like terraform taint,import,target,refresh and environment variables.

_**If we want to create or delete the particular resource which is defined in configuration file need to use target.**_

## syntax for `target` command
| command | Usage |
----------|--------
| `terraform plan -target=< resource address >`  | If you want to create execution plan for single resource. |
| `terraform apply -target=< resource address >`  | If you want to create to single resource or particular resource. |
| `terraform destroy -target=< resource address >`  | If we want to delete particular resource which was created in previous apply. |

scenario: If you want to run plan or apply or destroy on a particular resource we can use target option.

example:
  **`terraform plan -target=azurerm_virtual_network.vnet`**
  
  ![image](https://user-images.githubusercontent.com/121039917/209086624-8bf9c4fa-d7ba-4093-9cf0-c3629e9ae372.png)
