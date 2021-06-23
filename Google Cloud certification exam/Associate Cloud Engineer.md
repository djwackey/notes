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


13. Your development team needs a new Jenkins server for their project. You need to deploy the server using the fewest steps possible. What should you do?

  - A. Download and deploy the Jenkins Java WAR to App Engine Standard.
  - B. Create a new Compute Engine instance and install Jenkins through the command line interface.
  - C. Create a Kubernetes cluster on Compute Engine and create a deployment with the Jenkins Docker image.
  - **`D. Use GCP Marketplace to launch the Jenkins solution.`**


14. You need to update a deployment in Deployment Manager without any resource downtime in the deployment. Which command should you use?

  - A. gcloud deployment-manager deployments create --config \<deployment-config-path\>
  - **`B. gcloud deployment-manager deployments update --config \<deployment-config-path\>`**
  - C. gcloud deployment-manager resources create --config \<deployment-config-path\>
  - D. gcloud deployment-manager resources update --config \<deployment-config-path\>


15. You need to run an important query in BigQuery but expect it to return a lot of records. You want to find out how much it will cost to run the query. You are using on-demand pricing. What should you do?

  - A. Arrange to switch to Flat-Rate pricing for this query, then move back to on-demand.
  - **`B. Use the command line to run a dry run query to estimate the number of bytes read. Then convert that bytes estimate to dollars using the Pricing Calculator.`**
  - C. Use the command line to run a dry run query to estimate the number of bytes returned. Then convert that bytes estimate to dollars using the Pricing Calculator.
  - D. Run a select count (*) to get an idea of how many records your query will look through. Then convert that number of rows to dollars using the Pricing Calculator.


16. You have a single binary application that you want to run on Google Cloud Platform. You decided to automatically scale the application based on underlying infrastructure CPU usage. Your organizational policies require you to use virtual machines directly. You need to ensure that the application scaling is operationally efficient and completed as quickly as possible. What should you do?

  - A. Create a Google Kubernetes Engine cluster, and use horizontal pod autoscaling to scale the application.
  - **`B. Create an instance template, and use the template in a managed instance group with autoscaling configured.`**
  - C. Create an instance template, and use the template in a managed instance group that scales up and down based on the time of day.
  - D. Use a set of third-party tools to build automation around scaling the application up and down, based on Stackdriver CPU usage monitoring.


17. You are analyzing Google Cloud Platform service costs from three separate projects. You want to use this information to create service cost estimates by service type, daily and monthly, for the next six months using standard query syntax. What should you do?

  - A. Export your bill to a Cloud Storage bucket, and then import into Cloud Bigtable for analysis.
  - B. Export your bill to a Cloud Storage bucket, and then import into Google Sheets for analysis.
  - C. Export your transactions to a local file, and perform analysis with a desktop tool.
  - **`D. Export your bill to a BigQuery dataset, and then write time window-based SQL queries for analysis.`**


18. You need to set up a policy so that videos stored in a specific Cloud Storage Regional bucket are moved to Coldline after 90 days, and then deleted after one year from their creation. How should you set up the policy?

  - A. Use Cloud Storage Object Lifecycle Management using Age conditions with SetStorageClass and Delete actions. Set the SetStorageClass action to 90 days and the Delete action to 275 days (365-90).
  - **`B. Use Cloud Storage Object Lifecycle Management using Age conditions with SetStorageClass and Delete actions. Set the SetStorageClass action to 90 days and the Delete action to 365 days.`**
  - C. Use gsutil rewrite and set the Delete action to 275 days (365-90).
  - D. Use gsutil rewrite and set the Delete action to 365 days.


19. You have a Linux VM that must connect to Cloud SQL. You created a service account with the appropriate access rights. You want to make sure that the VM uses this service account instead of the default Compute Engine service account. What should you do?

  - **`A. When creating the VM via the web console, specify the service account under the "Identity and API Access" section.`**
  - B. Download a JSON Private Key for the service account. On the Project Metadata, add that JSON as the value for the key compute-engine-service-account.
  - C. Download a JSON Private Key for the service account. On the Custom Metadata of the VM, add that JSON as the value for the key compute-engine-service-account.
  - D. Download a JSON Private Key for the service account. After creating the VM, ssh into the VM and save the JSON under ~/.gcloud/ compute-engine-service- account.json.


20. You created an instance of SQL Server 2017 on Compute Engine to test features in the new version. You want to connect to this instance using the fewest number of steps. What should you do?

  - A. Install a RDP client on your desktop. Verify that a firewall rule for port 3389 exists.
  - B. Install a RDP client in your desktop. Set a Windows username and password in the GCP Console. Use the credentials to log in to the instance.
  - C. Set a Windows password in the GCP Console. Verify that a firewall rule for port 22 exists. Click the RDP button in the GCP Console and supply the credentials to log in.
  - **`D. Set a Windows username and password in the GCP Console. Verify that a firewall rule for port 3389 exists. Click the RDP button in the GCP Console, and supply the credentials to log in.`**


21. You have one GCP account running in your default region and zone and another account running in a non-default region and zone. You want to start a new Compute Engine instance in these two Google Cloud Platform accounts using the command line interface. What should you do?

  - **`A. Create two configurations using gcloud config configurations create \[NAME\]. Run gcloud config configurations activate \[NAME\] to switch between accounts when running the commands to start the Compute Engine instances.`**
  - B. Create two configurations using gcloud config configurations create \[NAME\]. Run gcloud configurations list to start the Compute Engine instances.
  - C. Activate two configurations using gcloud configurations activate \[NAME\]. Run gcloud config list to start the Compute Engine instances.
  - D. Activate two configurations using gcloud configurations activate \[NAME\]. Run gcloud configurations list to start the Compute Engine instances.


22. You significantly changed a complex Deployment Manager template and want to confirm that the dependencies of all defined resources are properly met before committing it to the project. You want the most rapid feedback on your changes. What should you do?

  - A. Use granular logging statements within a Deployment Manager template authored in Python.
  - B. Monitor activity of the Deployment Manager execution on the Stackdriver Logging page of the GCP Console.
  - C. Execute the Deployment Manager template against a separate project with the same configuration, and monitor for failures.
  - **`D. Execute the Deployment Manager template using the "-preview option in the same project, and observe the state of interdependent resources.`**


23. You are building a pipeline to process time-series data. Which Google Cloud Platform services should you put in boxes 1,2,3, and 4?

![image](https://raw.githubusercontent.com/djwackey/notes/master/Google%20Cloud%20certification%20exam/images/23.png)

  - A. Cloud Pub/Sub, Cloud Dataflow, Cloud Datastore, BigQuery
  - B. Firebase Messages, Cloud Pub/Sub, Cloud Spanner, BigQuery
  - C. Cloud Pub/Sub, Cloud Storage, BigQuery, Cloud Bigtable
  - **`D. Cloud Pub/Sub, Cloud Dataflow, Cloud Bigtable, BigQuery`**
