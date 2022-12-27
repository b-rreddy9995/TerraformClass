## Terraform Provisioners
Terraform Provisioners are used to performing certain custom actions and \
tasks either on the local machine or on the remote machine.

**The custom actions can vary in nature and it can be -**

Running custom shell script on the local machine
Running custom shell script on the remote machine
Copy file to the remote machine

**Also there are two types of provisioners -**\
`Generic Provisioners (file, local-exec, and remote-exec)`\
`Vendor Provisioners (chef, habitat, puppet, salt-masterless)`

**Generic Provisioners -** Generally vendor independent and can be used with any cloud vendor(GCP, AWS, AZURE)

**Vendor Provisioners -** It can only be used only with its vendor. For example, chef provisioner can only be used with chef for automating \
and provisioning the server configuration.
