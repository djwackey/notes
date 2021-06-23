# Exam Name: Google Cloud Certified - Associate Cloud Engineer

1. Every employee of your company has a Google account. Your operational team needs to manage a large number of instances on Compute Engine. Each member of this team needs only administrative access to the servers. Your security team wants to ensure that the deployment of credentials is operationally efficient and must be able to determine who accessed a given instance. What should you do?

  - A. Generate a new SSH key pair. Give the private key to each member of your team. Configure the public key in the metadata of each instance.
  - B. Ask each member of the team to generate a new SSH key pair and to send you their public key. Use a configuration management tool to deploy those keys on each instance.
  - **`C. Ask each member of the team to generate a new SSH key pair and to add the public key to their Google account. Grant the compute.osAdminLogin role to the Google group corresponding to this team.`**
  - D. Generate a new SSH key pair. Give the private key to each member of your team. Configure the public key as a project-wide public SSH key in your Cloud Platform project and allow project-wide public SSH keys on each instance.


2. You need to create a custom VPC with a single subnet. The subnet”s range must be as large as possible. Which range should you use?

  - A. 0.0.0.0/0
  - **`B. 10.0.0.0/8`** 
  - C. 172.16.0.0/12
  - D. 192.168.0.0/16


3. You want to select and configure a cost-effective solution for relational data on Google Cloud Platform. You are working with a small set of operational data in one geographic location. You need to support point-in-time recovery. What should you do?

  - **`A. Select Cloud SQL (MySQL). Verify that the enable binary logging option is selected.`**
  - B. Select Cloud SQL (MySQL). Select the create failover replicas option.
  - C. Select Cloud Spanner. Set up your instance with 2 nodes.
  - D. Select Cloud Spanner. Set up your instance as multi-regional.


4. You want to configure autohealing for network load balancing for a group of Compute Engine instances that run in multiple zones, using the fewest possible steps. You need to configure re-creation of VMs if they are unresponsive after 3 attempts of 10 seconds each. What should you do?

  - A. Create an HTTP load balancer with a backend configuration that references an existing instance group. Set the health check to healthy (HTTP)
  - B. Create an HTTP load balancer with a backend configuration that references an existing instance group. Define a balancing mode and set the maximum RPS to 10.
  - **`C. Create a managed instance group. Set the Autohealing health check to healthy (HTTP)`**
  - D. Create a managed instance group. Verify that the autoscaling setting is on.


5. You are using multiple configurations for gcloud. You want to review the configured Kubernetes Engine cluster of an inactive configuration using the fewest possible steps. What should you do?

  - A. Use gcloud config configurations describe to review the output.
  - B. Use gcloud config configurations activate and gcloud config list to review the output.
  - C. Use kubectl config get-contexts to review the output.
  - **`D. Use kubectl config use-context and kubectl config view to review the output.`**


6. Your company uses Cloud Storage to store application backup files for disaster recovery purposes. You want to follow Google's recommended practices. Which storage option should you use?

  - A. Multi-Regional Storage
  - B. Regional Storage
  - C. Nearline Storage
  - **`D. Coldline Storage`**


7. Several employees at your company have been creating projects with Cloud Platform and paying for it with their personal credit cards, which the company reimburses. The company wants to centralize all these projects under a single, new billing account. What should you do?

  - A. Contact cloud-billing@google.com with your bank account details and request a corporate billing account for your company.
  - B. Create a ticket with Google Support and wait for their call to share your credit card details over the phone.
  - **`C. In the Google Platform Console, go to the Resource Manage and move all projects to the root Organizarion.`**
  - D. In the Google Cloud Platform Console, create a new billing account and set up a payment method.


8. You have an application that looks for its licensing server on the IP 10.0.3.21. You need to deploy the licensing server on Compute Engine. You do not want to change the configuration of the application and want the application to be able to reach the licensing server. What should you do?

  - **`A. Reserve the IP 10.0.3.21 as a static internal IP address using gcloud and assign it to the licensing server.`**
  - B. Reserve the IP 10.0.3.21 as a static public IP address using gcloud and assign it to the licensing server.
  - C. Use the IP 10.0.3.21 as a custom ephemeral IP address and assign it to the licensing server.
  - D. Start the licensing server with an automatic ephemeral IP address, and then promote it to a static internal IP address.


9. You are deploying an application to App Engine. You want the number of instances to scale based on request rate. You need at least 3 unoccupied instances at all times. Which scaling type should you use?

  - A. Manual Scaling with 3 instances.
  - B. Basic Scaling with min_instances set to 3.
  - C. Basic Scaling with max_instances set to 3.
  - **`D. Automatic Scaling with min_idle_instances set to 3.`**


10. You have a development project with appropriate IAM roles defined. You are creating a production project and want to have the same IAM roles on the new project, using the fewest possible steps. What should you do?

  - **`A. Use gcloud iam roles copy and specify the production project as the destination project.`**
  - B. Use gcloud iam roles copy and specify your organization as the destination organization.
  - C. In the Google Cloud Platform Console, use the "create role from role" functionality.
  - D. In the Google Cloud Platform Console, use the "create role" functionality and select all applicable permissions.


11. You need a dynamic way of provisioning VMs on Compute Engine. The exact specifications will be in a dedicated configuration file. You want to follow Google's recommended practices. Which method should you use?

  - A. Deployment Manager
  - B. Cloud Composer
  - **`C. Managed Instance Group`**
  - D. Unmanaged Instance Group


12. You have a Dockerfile that you need to deploy on Kubernetes Engine. What should you do?

  - A. Use kubectl app deploy \<dockerfilename\>.
  - B. Use gcloud app deploy \<dockerfilename\>.
  - **`C. Create a docker image from the Dockerfile and upload it to Container Registry. Create a Deployment YAML file to point to that image. Use kubectl to create the deployment with that file.`**
  - D. Create a docker image from the Dockerfile and upload it to Cloud Storage. Create a Deployment YAML file to point to that image. Use kubectl to create the deployment with that file.
