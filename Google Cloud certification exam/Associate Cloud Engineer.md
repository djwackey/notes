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
