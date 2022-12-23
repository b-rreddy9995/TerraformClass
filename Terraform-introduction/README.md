# Terraform Introduction
##### 1.What is Terraform?
        Terraform is an open-source infrastructure as code software tool that enables you to safely and 
        predictably create, change, and improve infrastructure.
##### 2.Terraform features?
        Infrastructure as code: terraform configuration write using Hashicorp Configuration Language which is declarative 
                                and human readable.It can be reusable as well
        Execution Plans: Once write describe the infrastructure, terraform will create the execution plan 
                                which can show us the infrastructure changes will be done.
        Resource Graph: Terraform graph feature will show us graphical representation of dependencies between the infrastructure resources.
        Change Automation: Terraform can implement complex changesets to the infrastructure with virtually no human interaction. 
                                When users update the configuration files,Terraform figures out what has changed and 
                                creates an incremental execution plan that respects the dependencies
        
##### 3.Terraform Pros and Cons?
| Pros | Cons |
|-----------|--------------|
| 1.Support multiple infrastructure providers | 1. There is no auto roll back on failures |
| 2.Code resuability for multiple environments | 2. Import command would not not update configurations |
| 3.Tracking infrastructure changes with statefile | 3. There is no error handling and if conditions |

##### 4.Terraform Installation 
Get the terraform installer from [here](https://developer.hashicorp.com/terraform/downloads) \
Follow the installation instructions: [installation instructions](https://spacelift.io/blog/how-to-install-terraform)
  
##### 5.Terraform Execution flow?
        The core Terraform workflow has three steps:
            Write - Author infrastructure as code.
            Plan - Preview changes before applying.
            Apply - Provision reproducible infrastructure.

##### 6.Terraform main commands?
        terraform init - It will initialize the terraform working directory and it will install the required provider plugins.
        terraform validate - To validate configuration file's syntax
        terraform plan - It will show us the execution plan like what are the resources will be created,changed or destroyed.
        terraform apply - It will create the resources in the target environment which are described in configuration file.
        terraform destroy - It will delete the infrastructure which were created by terraform.
        terraform import - It will import the infrastructure which was created manually or used by other scripts to terraform managed.
        terraform show - It will shows the content of statefile which has actual infrastructure information.
        terraform taint - It will mark the infrastructure resources as tainted in state file and it will be replaced in next terraform apply.
        terraform refresh - It will update the manual changes of infra resources in statefile but not updated in configuration file.
                            Those changes will be destroyed in next apply if we not updated in configuration file.

##### 7.Terraform directory or file structure?

Terraform configuration files extension is **`.tf`** in which we write infrastructure in hashicorp Configuration Language. \
**`.tfvars`** - is the file for passing the values to variables at runtime. \
**`.tfstate`** - is the terraform state file and it has the infrastructure details created by terraform. \
**`.terraform.lock.hcl`** - is the lock file which has the provider versions and we can use to freeze the provider version changes. \
**`.tfstate.lock`** - is the lock file will be generated when ever running plan,apply and destroy. It will lock the statefile to prevent execution of another plan,apply and destroy commands. this file will be deleted once the terraform plan,apply and destroy after commands execution \

***DirectoryStructure*** \

It is recommended to follow the moduler structure. we have Root module and child modules. child will be under Root Module directory.\
As shown in the below picture.

![image](https://user-images.githubusercontent.com/121039917/209388880-39c6310b-1125-43e7-99b4-c57239885a44.png)


##### 8.Terraform variables?
##### 9.Terraform(HCL) Syntax?
##### 10.Terraform meta-arguments?
