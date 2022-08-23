# Word Replacement API Problem Statement
## Azure APIM and Azure Logic App method

In this method , the RESTful API is created using ASP.NET Web API (.NET Framework) and which is further published to Azure web app on an app service plan.

### Approach

An API is created and a logic is built using C# which is stored in a remote repository. Here we're creating the infrastructure for Azure app service plan and an azure web app and implementing the code on top of it, which will be used to fulfill the problem statement purpose.

### IAC Tool Used

* Terraform


### Variables used 

* subscription_id = "provide the subscription ID"
* tenant_id       = "provide the tenant ID"
* asp_tier        = "provide the tier for App service plan"

You can provide the values for these variables in the tfvars file present in the working directory.

#### Directory Structure of this solution

After Cloning the repo, directory will look something like this :-

```
\---Web App method
        main.tf
        variables.tf
        webapp.tfvars
        README.md
```

#### Process
1. Run the following command to run the `terraform` code

```
terraform init
terraform plan
terraform apply
```