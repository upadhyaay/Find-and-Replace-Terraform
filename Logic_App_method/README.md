# Word Replacement API Problem Statement
## Azure APIM and Azure Logic App method

In this method , the RESTful API is created using Azure API management services and the logic for Word replacement api is implemented using azure logic app.The IAC tool used is Terraform to provision the infrastructure for APIM and Logic app.

### Approach

An API is created and a logic app is integrated in the backedn policy of the API operation. The API is HTTP POST public endpoint service, which expects a string value to be provided as the input payload, also no authorization policy is applied. After the API is triggered , the logic app gets hit(also http triggered), which in turns process the input string do the changes(as per the problem statement) and returns the replaced string as a response.

### IAC Tool Used

* Terraform


### Variables used 

* subscription_id = "provide the subscription ID"
* tenant_id       = "provide the tenant ID"
* sku_name        = "provide the sku for APIM"

You can provide the values for these variables in the tfvars file present in the working directory.
Also, you have to provide the "logic app ID" and "sig value" in the Api-policy.xml file. 
#### Directory Structure of this solution

After Cloning the repo, directory will look something like this :-

```
+---Logic_App_method
|   |   apim.tfvars
|   |   main.tf
|   |   variables.tf
|   |   README.md
|   |
|   \---templates
|           Api-policy.xml
|           Api-spec.yaml
|           lapp_parameters.json
|           lapp_template.json
```

#### Process
1. Run the following command to run the `terraform` code

```
terraform init
terraform plan
terraform apply
```
