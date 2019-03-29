## AutoDeploy Application using Terraform.
Introduction
The aim of this project is to automatically set up an AWS Instance onto which an AMI containing the Node Application is going to run

#### Technologies Used
- Packer
- Terraform
- AWS
- Ansible

#### Setting up Terraform
Install Terraform on your local computer using a numnber of methods listed below depending on the operating system type
- MacOs

    brew install terraform
- Linux

    Obtain a terraform link address from [terraform](https://www.terraform.io/)website

    Download terraform using wget <link address>

    Unzip the downloaded folder using unzip <file name>

    Install terraform using sudo snap install terraform
#### Running this module manually
 - Sign up for AWS.
 
 - Configure your AWS credentials using one of the supported methods for AWS CLI tools, such as setting the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables. If you're using the ~/.aws/config file for profiles then export AWS_SDK_LOAD_CONFIG as "True".
 
 - Clone this repository by running `git clone https://github.com/mariamiah/Terraform-Deployment.git`
 
 - Navigate into the Terraform-Deployment folder
 
 - Change permissions of launch.sh by running `chmod +x launch.sh`
 
 - Build the AMI and provision it by launching the script `./launch.sh`.
 
 - Once the build is complete, navigate to the instance at `aws.amazon.com`
 
 - Obtain the IP address of the instance and open it in the browser
