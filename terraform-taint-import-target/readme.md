#In this section discussed about terraform commands like terraform taint,import,target,refresh and environment variables.

#syntax for target command.
terraform plan -target=<resource address>

scenario: If you want to run plan,apply or destroy on a particular resource we can use target option.

example:
  terraform plan -target=azurerm_virtual_network.vnet
  
  ![image](https://user-images.githubusercontent.com/121039917/209086624-8bf9c4fa-d7ba-4093-9cf0-c3629e9ae372.png)
