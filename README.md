# Word Replacement API Problem Statement

All the Code used and written in this repo are written by me using Terraform (IAC tool).

# Problem Statement
The problem statement was to build a web api that contains the logic to find and replace certain words out of the string provided as input and returns the replaced string as a response.

Terraform is used to deploy the infrastructure for a web app and an APIM with Logic App integrated. 

# Approach
 There are two different approaches are built for the above problem statement:
 * APIM with Logic App method.
 * Web App method.

Hence for both methods there is the respective Terraform code is built in different named folders which can be used to provision the cloud infrastructre on Azure Cloud. 

### IAC Tool Used

* Terraform

# Installation

### Install Terraform

To install Terraform, find the [appropriate package](https://www.terraform.io/downloads.html) for your system and download it as a zip archive.

After downloading Terraform, unzip the package. Terraform runs as a single binary named `terraform`. Any other files in the package can be safely removed and Terraform will still function.

Finally, make sure that the `terraform` binary is available on your `PATH`. This process will differ depending on your operating system.

Print a colon-separated list of locations in your `PATH`.
```
    $ echo $PATH
```

Move the Terraform binary to one of the listed locations. This command assumes that the binary is currently in your downloads folder and that your `PATH` includes `/usr/local/bin`, but you can customize it if your locations are different.

```
$ mv ~/Downloads/terraform /usr/local/bin/
```

#### Directory Structure of Assignment

After Cloning the repo, directory will look something like this :-

```
+---Logic_App_method
|   |   apim.tfvars
|   |   main.tf
|   |   variables.tf
|   |
|   \---templates
|           Api-policy.xml
|           Api-spec.yaml
|           parameters.json
|           template.json
|
\---Web App method
        main.tf
        variables.tf
        webapp.tfvars
```
## Git clone


1. Clone the following Repo

```
git clone https://github.com/upadhyaay/Find-and-Replace-Terraform.git
```
2. Run the following command to run the `terraform` code

```
terraform init
terraform plan
terraform apply
```
