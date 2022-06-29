# Playground

This repo is my playground on technologies i like and  want to learn more about.

![Playground](https://i.gifer.com/K7lG.gif)

## Terraform

### Install Terraform on Ubuntu OS

Ensure that your system is up to date, and you have the gnupg, software-properties-common, and curl packages installed. You will use these packages to verify HashiCorp's GPG signature, and install HashiCorp's Debian package repository.

```sh
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
```

Add the HashiCorp [GPG key](https://apt.releases.hashicorp.com/gpg).

```sh
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

Add the official HashiCorp Linux repository.

```sh
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

Update to add the repository, and install the Terraform CLI.

```sh
sudo apt-get update && sudo apt-get install terraform
```

### Verify the installation
Verify that the installation worked by opening a new terminal session and listing Terraform's available subcommands.

```sh
terraform -help
Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.
##...
```

## Google Cloud Platform (GCP)

### Set up GCP

Create GCP account

After creating your GCP account, create or modify the following resources to enable Terraform to provision your infrastructure:


- **A GCP Project**: GCP organizes resources into projects. Create one now in the GCP console and make note of the project ID. You can see a list of your projects in the cloud resource manager.


- **Google Compute Engine**: Enable Google Compute Engine for your project in the GCP console. Make sure to select the project you are using to follow this tutorial and click the "Enable" button.


- **A GCP service account key**: [Create a service account key](https://console.cloud.google.com/apis/credentials/serviceaccountkey) to enable Terraform to access your GCP account. When creating the key, use the following settings:

  - Select the project you created in the previous step.

  - Click "Create Service Account".
  - Give it any name you like and click "Create".
  - For the Role, choose "Project -> Editor", then click "Continue".
  - Skip granting additional users access, and click "Done".
  
After you create your service account, download your service account key.

- Select your service account from the list.
- Select the "Keys" tab.
- In the drop down menu, select "Create new key".
- Leave the "Key Type" as JSON.
- Click "Create" to create the key and save the key file to your system.

You can read more about service account keys in [Google's documentation](https://cloud.google.com/iam/docs/creating-managing-service-account-keys).

## Git tips

To keep git history clear, this repo branch integration uses rebase strategy.
I have misconfigured git therefore, firsts commits are not linear.

Recommendations: Uncheck `Allow merge commits` checkbox

## Local branches
To avoid local branches accumulation use following command to delete all branches that has been integrated to main.

```shell
git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
```