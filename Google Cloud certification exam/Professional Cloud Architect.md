# Professional Cloud Architect

1. Your company's test suite is a custom C++ application that runs tests throughout each day on Linux virtual machines. The full test suite takes several hours to complete, running on a limited number of on-premises servers reserved for testing. Your company wants to move the testing infrastructure to the cloud, to reduce the amount of time it takes to fully test a change to the system, while changing the tests as little as possible. Which cloud infrastructure should you recommend?

  - A. Google Compute Engine unmanaged instance groups and Network Load Balancer
  - B. Google Compute Engine managed instance groups with auto-scaling
  - C. Google Cloud Dataproc to run Apache Hadoop jobs to process each test
  - D. Google App Engine with Google StackDriver for logging

```
Correct Answer: B
Google Compute Engine enables users to launch virtual machines (VMs) on demand. VMs can be launched from the standard images or custom images created by users.
Managed instance groups offer autoscaling capabilities that allow you to automatically add or remove instances from a managed instance group based on increases or decreases in load. Autoscaling helps your applications gracefully handle increases in traffic and reduces cost when the need for resources is lower.
Incorrect Answers:
A: There is no mention of incoming IP data traffic for the custom C++ applications.
C: Apache Hadoop is not fit for testing C++ applications. Apache Hadoop is an open-source software framework used for distributed storage and processing of datasets of big data using the MapReduce programming model.
D: Google App Engine is intended to be used for web applications.
Google App Engine (often referred to as GAE or simply App Engine) is a web framework and cloud computing platform for developing and hosting web applications in Google-managed data centers.
Reference:
https://cloud.google.com/compute/docs/autoscaler/
```


2. A lead software engineer tells you that his new application design uses websockets and HTTP sessions that are not distributed across the web servers. You want to help him ensure his application will run properly on Google Cloud Platform.
What should you do?

  - A. Help the engineer to convert his websocket code to use HTTP streaming
  - B. Review the encryption requirements for websocket connections with the security team
  - C. Meet with the cloud operations team and the engineer to discuss load balancer options
  - D. Help the engineer redesign the application to use a distributed user session service that does not rely on websockets and HTTP sessions.


3. The application reliability team at your company this added a debug feature to their backend service to send all server events to Google Cloud Storage for eventual analysis. The event records are at least 50 KB and at most 15 MB and are expected to peak at 3,000 events per second. You want to minimize data loss.
Which process should you implement?

  - A. ג€¢ Append metadata to file body ג€¢ Compress individual files ג€¢ Name files with serverName ג€" Timestamp ג€¢ Create a new bucket if bucket is older than 1 hour and save individual files to the new bucket. Otherwise, save files to existing bucket.
  - B. ג€¢ Batch every 10,000 events with a single manifest file for metadata ג€¢ Compress event files and manifest file into a single archive file ג€¢ Name files using serverName ג€" EventSequence ג€¢ Create a new bucket if bucket is older than 1 day and save the single archive file to the new bucket. Otherwise, save the single archive file to existing bucket.
  - C. ג€¢ Compress individual files ג€¢ Name files with serverName ג€" EventSequence ג€¢ Save files to one bucket ג€¢ Set custom metadata headers for each object after saving
  - D. ג€¢ Append metadata to file body ג€¢ Compress individual files ג€¢ Name files with a random prefix pattern ג€¢ Save files to one bucket


4. A recent audit revealed that a new network was created in your GCP project. In this network, a GCE instance has an SSH port open to the world. You want to discover this network's origin.
What should you do?

  - A. Search for Create VM entry in the Stackdriver alerting console
  - B. Navigate to the Activity page in the Home section. Set category to Data Access and search for Create VM entry
  - C. In the Logging section of the console, specify GCE Network as the logging section. Search for the Create Insert entry
  - D. Connect to the GCE instance using project SSH keys. Identify previous logins in system logs, and match these with the project owners list


5. You want to make a copy of a production Linux virtual machine in the US-Central region. You want to manage and replace the copy easily if there are changes on the production virtual machine. You will deploy the copy as a new instance in a different project in the US-East region.
What steps must you take?

  - A. Use the Linux dd and netcat commands to copy and stream the root disk contents to a new virtual machine instance in the US-East region.
  - B. Create a snapshot of the root disk and select the snapshot as the root disk when you create a new virtual machine instance in the US-East region.
  - C. Create an image file from the root disk with Linux dd command, create a new virtual machine instance in the US-East region
  - D. Create a snapshot of the root disk, create an image file in Google Cloud Storage from the snapshot, and create a new virtual machine instance in the US-East region using the image file the root disk.


6. Your company runs several databases on a single MySQL instance. They need to take backups of a specific database at regular intervals. The backup activity needs to complete as quickly as possible and cannot be allowed to impact disk performance.
How should you configure the storage?

  - A. Configure a cron job to use the gcloud tool to take regular backups using persistent disk snapshots.
  - B. Mount a Local SSD volume as the backup location. After the backup is complete, use gsutil to move the backup to Google Cloud Storage.
  - C. Use gcsfise to mount a Google Cloud Storage bucket as a volume directly on the instance and write backups to the mounted location using mysqldump.
  - D. Mount additional persistent disk volumes onto each virtual machine (VM) instance in a RAID10 array and use LVM to create snapshots to send to Cloud Storage


7. You are helping the QA team to roll out a new load-testing tool to test the scalability of your primary cloud services that run on Google Compute Engine with Cloud Bigtable.
Which three requirements should they include? (Choose three.)

  - A. Ensure that the load tests validate the performance of Cloud Bigtable
  - B. Create a separate Google Cloud project to use for the load-testing environment
  - C. Schedule the load-testing tool to regularly run against the production environment
  - D. Ensure all third-party systems your services use is capable of handling high load
  - E. Instrument the production services to record every transaction for replay by the load-testing tool
  - F. Instrument the load-testing tool and the target services with detailed logging and metrics collection


8. Your customer is moving their corporate applications to Google Cloud Platform. The security team wants detailed visibility of all projects in the organization. You provision the Google Cloud Resource Manager and set up yourself as the org admin.
What Google Cloud Identity and Access Management (Cloud IAM) roles should you give to the security team?

  - A. Org viewer, project owner
  - B. Org viewer, project viewer
  - C. Org admin, project browser
  - D. Project owner, network admin


9. Your company places a high value on being responsive and meeting customer needs quickly. Their primary business objectives are release speed and agility. You want to reduce the chance of security errors being accidentally introduced.
Which two actions can you take? (Choose two.)

  - A. Ensure every code check-in is peer reviewed by a security SME
  - B. Use source code security analyzers as part of the CI/CD pipeline
  - C. Ensure you have stubs to unit test all interfaces between components
  - D. Enable code signing and a trusted binary repository integrated with your CI/CD pipeline
  - E. Run a vulnerability security scanner as part of your continuous-integration /continuous-delivery (CI/CD) pipeline


10. You want to enable your running Google Kubernetes Engine cluster to scale as demand for your application changes.
What should you do?

  - A. Add additional nodes to your Kubernetes Engine cluster using the following command: gcloud container clusters resize CLUSTER_Name ג€" -size 10
  - B. Add a tag to the instances in the cluster with the following command: gcloud compute instances add-tags INSTANCE - -tags enable- autoscaling max-nodes-10
  - C. Update the existing Kubernetes Engine cluster with the following command: gcloud alpha container clusters update mycluster - -enable- autoscaling - -min-nodes=1 - -max-nodes=10
  - D. Create a new Kubernetes Engine cluster with the following command: gcloud alpha container clusters create mycluster - -enable- autoscaling - -min-nodes=1 - -max-nodes=10 and redeploy your application


11. Your marketing department wants to send out a promotional email campaign. The development team wants to minimize direct operation management. They project a wide range of possible customer responses, from 100 to 500,000 click-through per day. The link leads to a simple website that explains the promotion and collects user information and preferences.
Which infrastructure should you recommend? (Choose two.)

  - A. Use Google App Engine to serve the website and Google Cloud Datastore to store user data.
  - B. Use a Google Container Engine cluster to serve the website and store data to persistent disk.
  - C. Use a managed instance group to serve the website and Google Cloud Bigtable to store user data.
  - D. Use a single Compute Engine virtual machine (VM) to host a web server, backend by Google Cloud SQL.


12. Your company just finished a rapid lift and shift to Google Compute Engine for your compute needs. You have another 9 months to design and deploy a more cloud-native solution. Specifically, you want a system that is no-ops and auto-scaling.
Which two compute products should you choose? (Choose two.)

  - A. Compute Engine with containers
  - B. Google Kubernetes Engine with containers
  - C. Google App Engine Standard Environment
  - D. Compute Engine with custom instance types
  - E. Compute Engine with managed instance groups


13. One of your primary business objectives is being able to trust the data stored in your application. You want to log all changes to the application data.
How can you design your logging system to verify authenticity of your logs?

  - A. Write the log concurrently in the cloud and on premises
  - B. Use a SQL database and limit who can modify the log table
  - C. Digitally sign each timestamp and log entry and store the signature
  - D. Create a JSON dump of each log entry and store it in Google Cloud Storage


14. Your company has decided to make a major revision of their API in order to create better experiences for their developers. They need to keep the old version of the API available and deployable, while allowing new customers and testers to try out the new API. They want to keep the same SSL and DNS records in place to serve both APIs.
What should they do?

  - A. Configure a new load balancer for the new version of the API
  - B. Reconfigure old clients to use a new endpoint for the new API
  - C. Have the old API forward traffic to the new API based on the path
  - D. Use separate backend pools for each API path behind the load balancer


15. Your company plans to migrate a multi-petabyte data set to the cloud. The data set must be available 24hrs a day. Your business analysts have experience only with using a SQL interface.
How should you store the data to optimize it for ease of analysis?

  - A. Load data into Google BigQuery
  - B. Insert data into Google Cloud SQL
  - C. Put flat files into Google Cloud Storage
  - D. Stream data into Google Cloud Datastore


16. The operations manager asks you for a list of recommended practices that she should consider when migrating a J2EE application to the cloud.
Which three practices should you recommend? (Choose three.)

  - A. Port the application code to run on Google App Engine
  - B. Integrate Cloud Dataflow into the application to capture real-time metrics
  - C. Instrument the application with a monitoring tool like Stackdriver Debugger
  - D. Select an automation framework to reliably provision the cloud infrastructure
  - E. Deploy a continuous integration tool with automated testing in a staging environment
  - F. Migrate from MySQL to a managed NoSQL database like Google Cloud Datastore or Bigtable


17. A news feed web service has the following code running on Google App Engine. During peak load, users report that they can see news articles they already viewed.
What is the most likely cause of this problem?
```python
import news
from flask import Flask, redirect, request
from flask.ext.api import status
from google.appengine.api import users

app = Flask(__name__)
sessions = {}

@app.route("/")
def homepage():
    user = users.get_current_user()
    if not user:
        return "Invalid login", status.HTTP_401_UNAUTHORIZED
        
    if user not in sessions:
        sessions[user] = {"viewed": []}
        
    news_articles = news.get_new_news(user, sessions[user]["viewed"])
    sessions[user]["viewed"] += [n["id"] for n in news_articles]
    
    return news.render(news_articles)
    
if __name__ == "__main__":
    app.run()
```

  - A. The session variable is local to just a single instance
  - B. The session variable is being overwritten in Cloud Datastore
  - C. The URL of the API needs to be modified to prevent caching
  - D. The HTTP Expires header needs to be set to -1 stop caching


18. An application development team believes their current logging tool will not meet their needs for their new cloud-based product. They want a better tool to capture errors and help them analyze their historical log data. You want to help them find a solution that meets their needs.
What should you do?

  - A. Direct them to download and install the Google StackDriver logging agent
  - B. Send them a list of online resources about logging best practices
  - C. Help them define their requirements and assess viable logging tools
  - D. Help them upgrade their current tool to take advantage of any new features


19. You need to reduce the number of unplanned rollbacks of erroneous production deployments in your company's web hosting platform. Improvement to the QA/
Test processes accomplished an 80% reduction.
Which additional two approaches can you take to further reduce the rollbacks? (Choose two.)

  - A. Introduce a green-blue deployment model
  - B. Replace the QA environment with canary releases
  - C. Fragment the monolithic platform into microservices
  - D. Reduce the platform's dependency on relational database systems
  - E. Replace the platform's relational database systems with a NoSQL database


20. To reduce costs, the Director of Engineering has required all developers to move their development infrastructure resources from on-premises virtual machines
(VMs) to Google Cloud Platform. These resources go through multiple start/stop events during the day and require state to persist. You have been asked to design the process of running a development environment in Google Cloud while providing cost visibility to the finance department.
Which two steps should you take? (Choose two.)

  - A. Use the --no-auto-delete flag on all persistent disks and stop the VM
  - B. Use the --auto-delete flag on all persistent disks and terminate the VM
  - C. Apply VM CPU utilization label and include it in the BigQuery billing export
  - D. Use Google BigQuery billing export and labels to associate cost to groups
  - E. Store all state into local SSD, snapshot the persistent disks, and terminate the VM
  - F. Store all state in Google Cloud Storage, snapshot the persistent disks, and terminate the VM


21. Your company wants to track whether someone is present in a meeting room reserved for a scheduled meeting. There are 1000 meeting rooms across 5 offices on 3 continents. Each room is equipped with a motion sensor that reports its status every second. The data from the motion detector includes only a sensor ID and several different discrete items of information. Analysts will use this data, together with information about account owners and office locations.
Which database type should you use?

  - A. Flat file
  - B. NoSQL
  - C. Relational
  - D. Blobstore


22. You set up an autoscaling instance group to serve web traffic for an upcoming launch. After configuring the instance group as a backend service to an HTTP(S) load balancer, you notice that virtual machine (VM) instances are being terminated and re-launched every minute. The instances do not have a public IP address.
You have verified the appropriate web response is coming from each instance using the curl command. You want to ensure the backend is configured correctly.
What should you do?

  - A. Ensure that a firewall rules exists to allow source traffic on HTTP/HTTPS to reach the load balancer.
  - B. Assign a public IP to each instance and configure a firewall rule to allow the load balancer to reach the instance public IP.
  - C. Ensure that a firewall rule exists to allow load balancer health checks to reach the instances in the instance group.
  - D. Create a tag on each instance with the name of the load balancer. Configure a firewall rule with the name of the load balancer as the source and the instance tag as the destination.


23. You write a Python script to connect to Google BigQuery from a Google Compute Engine virtual machine. The script is printing errors that it cannot connect to
BigQuery.
What should you do to fix the script?

  - A. Install the latest BigQuery API client library for Python
  - B. Run your script on a new virtual machine with the BigQuery access scope enabled
  - C. Create a new service account with BigQuery access and execute your script with that user
  - D. Install the bq component for gcloud with the command gcloud components install bq.


24. Your customer is moving an existing corporate application to Google Cloud Platform from an on-premises data center. The business owners require minimal user disruption. There are strict security team requirements for storing passwords.
What authentication strategy should they use?

  - A. Use G Suite Password Sync to replicate passwords into Google
  - B. Federate authentication via SAML 2.0 to the existing Identity Provider
  - C. Provision users in Google using the Google Cloud Directory Sync tool
  - D. Ask users to set their Google password to match their corporate password


25. Your company has successfully migrated to the cloud and wants to analyze their data stream to optimize operations. They do not have any existing code for this analysis, so they are exploring all their options. These options include a mix of batch and stream processing, as they are running some hourly jobs and live- processing some data as it comes in.
Which technology should they use for this?

  - A. Google Cloud Dataproc
  - B. Google Cloud Dataflow
  - C. Google Container Engine with Bigtable
  - D. Google Compute Engine with Google BigQuery


26. Your customer is receiving reports that their recently updated Google App Engine application is taking approximately 30 seconds to load for some of their users.
This behavior was not reported before the update.
What strategy should you take?

  - A. Work with your ISP to diagnose the problem
  - B. Open a support ticket to ask for network capture and flow data to diagnose the problem, then roll back your application
  - C. Roll back to an earlier known good release initially, then use Stackdriver Trace and Logging to diagnose the problem in a development/test/staging environment
  - D. Roll back to an earlier known good release, then push the release again at a quieter period to investigate. Then use Stackdriver Trace and Logging to diagnose the problem


27. A production database virtual machine on Google Compute Engine has an ext4-formatted persistent disk for data files. The database is about to run out of storage space.
How can you remediate the problem with the least amount of downtime?

  - A. In the Cloud Platform Console, increase the size of the persistent disk and use the resize2fs command in Linux.
  - B. Shut down the virtual machine, use the Cloud Platform Console to increase the persistent disk size, then restart the virtual machine
  - C. In the Cloud Platform Console, increase the size of the persistent disk and verify the new space is ready to use with the fdisk command in Linux
  - D. In the Cloud Platform Console, create a new persistent disk attached to the virtual machine, format and mount it, and configure the database service to move the files to the new disk
  - E. In the Cloud Platform Console, create a snapshot of the persistent disk restore the snapshot to a new larger disk, unmount the old disk, mount the new disk and restart the database service


28. Your application needs to process credit card transactions. You want the smallest scope of Payment Card Industry (PCI) compliance without compromising the ability to analyze transactional data and trends relating to which payment methods are used.
How should you design your architecture?

  - A. Create a tokenizer service and store only tokenized data
  - B. Create separate projects that only process credit card data
  - C. Create separate subnetworks and isolate the components that process credit card data
  - D. Streamline the audit discovery phase by labeling all of the virtual machines (VMs) that process PCI data
  - E. Enable Logging export to Google BigQuery and use ACLs and views to scope the data shared with the auditor


29. You have been asked to select the storage system for the click-data of your company's large portfolio of websites. This data is streamed in from a custom website analytics package at a typical rate of 6,000 clicks per minute. With bursts of up to 8,500 clicks per second. It must have been stored for future analysis by your data science and user experience teams.
Which storage infrastructure should you choose?

  - A. Google Cloud SQL
  - B. Google Cloud Bigtable
  - C. Google Cloud Storage
  - D. Google Cloud Datastore


30. You are creating a solution to remove backup files older than 90 days from your backup Cloud Storage bucket. You want to optimize ongoing Cloud Storage spend.
What should you do?

  - A. Write a lifecycle management rule in XML and push it to the bucket with gsutil
  - B. Write a lifecycle management rule in JSON and push it to the bucket with gsutil
  - C. Schedule a cron script using gsutil ls ג€"lr gs://backups/** to find and remove items older than 90 days
  - D. Schedule a cron script using gsutil ls ג€"l gs://backups/** to find and remove items older than 90 days and schedule it with cron


31. Your company is forecasting a sharp increase in the number and size of Apache Spark and Hadoop jobs being run on your local datacenter. You want to utilize the cloud to help you scale this upcoming demand with the least amount of operations work and code change.
Which product should you use?

  - A. Google Cloud Dataflow
  - B. Google Cloud Dataproc
  - C. Google Compute Engine
  - D. Google Kubernetes Engine


32. The database administration team has asked you to help them improve the performance of their new database server running on Google Compute Engine. The database is for importing and normalizing their performance statistics and is built with MySQL running on Debian Linux. They have an n1-standard-8 virtual machine with 80 GB of SSD persistent disk.
What should they change to get better performance from this system?

  - A. Increase the virtual machineג€™s memory to 64 GB
  - B. Create a new virtual machine running PostgreSQL
  - C. Dynamically resize the SSD persistent disk to 500 GB
  - D. Migrate their performance metrics warehouse to BigQuery
  - E. Modify all of their batch jobs to use bulk inserts into the database


33. You want to optimize the performance of an accurate, real-time, weather-charting application. The data comes from 50,000 sensors sending 10 readings a second, in the format of a timestamp and sensor reading.
Where should you store the data?

  - A. Google BigQuery
  - B. Google Cloud SQL
  - C. Google Cloud Bigtable
  - D. Google Cloud Storage


34. Your company's user-feedback portal comprises a standard LAMP stack replicated across two zones. It is deployed in the us-central1 region and uses autoscaled managed instance groups on all layers, except the database. Currently, only a small group of select customers have access to the portal. The portal meets a
99,99% availability SLA under these conditions. However next quarter, your company will be making the portal available to all users, including unauthenticated users. You need to develop a resiliency testing strategy to ensure the system maintains the SLA once they introduce additional user load.
What should you do?

  - A. Capture existing users input, and replay captured user load until autoscale is triggered on all layers. At the same time, terminate all resources in one of the zones
  - B. Create synthetic random user input, replay synthetic load until autoscale logic is triggered on at least one layer, and introduce ג€chaosג€ to the system by terminating random resources on both zones
  - C. Expose the new system to a larger group of users, and increase group size each day until autoscale logic is triggered on all layers. At the same time, terminate random resources on both zones
  - D. Capture existing users input, and replay captured user load until resource utilization crosses 80%. Also, derive estimated number of users based on existing user's usage of the app, and deploy enough resources to handle 200% of expected load


35. One of the developers on your team deployed their application in Google Container Engine with the Dockerfile below. They report that their application deployments are taking too long.
```
FROM ubuntu:16.04
COPY . /src
RUN apt-get update && apt-get install -y python python-pip
RUN pip install -r requirements.txt
```
You want to optimize this Dockerfile for faster deployment times without adversely affecting the app's functionality.
Which two actions should you take? (Choose two.)

  - A. Remove Python after running pip
  - B. Remove dependencies from requirements.txt
  - C. Use a slimmed-down base image like Alpine Linux
  - D. Use larger machine types for your Google Container Engine node pools
  - E. Copy the source after he package dependencies (Python and pip) are installed


36. Your solution is producing performance bugs in production that you did not see in staging and test environments. You want to adjust your test and deployment procedures to avoid this problem in the future.
What should you do?

  - A. Deploy fewer changes to production
  - B. Deploy smaller changes to production
  - C. Increase the load on your test and staging environments
  - D. Deploy changes to a small subset of users before rolling out to production


37. A small number of API requests to your microservices-based application take a very long time. You know that each request to the API can traverse many services.
You want to know which service takes the longest in those cases.
What should you do?

  - A. Set timeouts on your application so that you can fail requests faster
  - B. Send custom metrics for each of your requests to Stackdriver Monitoring
  - C. Use Stackdriver Monitoring to look for insights that show when your API latencies are high
  - D. Instrument your application with Stackdriver Trace in order to break down the request latencies at each microservice


38. During a high traffic portion of the day, one of your relational databases crashes, but the replica is never promoted to a master. You want to avoid this in the future.
What should you do?

  - A. Use a different database
  - B. Choose larger instances for your database
  - C. Create snapshots of your database more regularly
  - D. Implement routinely scheduled failovers of your databases


39. Your organization requires that metrics from all applications be retained for 5 years for future analysis in possible legal proceedings.
Which approach should you use?

  - A. Grant the security team access to the logs in each Project
  - B. Configure Stackdriver Monitoring for all Projects, and export to BigQuery
  - C. Configure Stackdriver Monitoring for all Projects with the default retention policies
  - D. Configure Stackdriver Monitoring for all Projects, and export to Google Cloud Storage


40. Your company has decided to build a backup replica of their on-premises user authentication PostgreSQL database on Google Cloud Platform. The database is 4
TB, and large updates are frequent. Replication requires private address space communication.
Which networking approach should you use?

  - A. Google Cloud Dedicated Interconnect
  - B. Google Cloud VPN connected to the data center network
  - C. A NAT and TLS translation gateway installed on-premises
  - D. A Google Compute Engine instance with a VPN server installed connected to the data center network


41. Auditors visit your teams every 12 months and ask to review all the Google Cloud Identity and Access Management (Cloud IAM) policy changes in the previous 12 months. You want to streamline and expedite the analysis and audit process.
What should you do?

  - A. Create custom Google Stackdriver alerts and send them to the auditor
  - B. Enable Logging export to Google BigQuery and use ACLs and views to scope the data shared with the auditor
  - C. Use cloud functions to transfer log entries to Google Cloud SQL and use ACLs and views to limit an auditor's view
  - D. Enable Google Cloud Storage (GCS) log export to audit logs into a GCS bucket and delegate access to the bucket


42. You are designing a large distributed application with 30 microservices. Each of your distributed microservices needs to connect to a database back-end. You want to store the credentials securely.
Where should you store the credentials?

  - A. In the source code
  - B. In an environment variable
  - C. In a secret management system
  - D. In a config file that has restricted access through ACLs


43. A lead engineer wrote a custom tool that deploys virtual machines in the legacy data center. He wants to migrate the custom tool to the new cloud environment.
You want to advocate for the adoption of Google Cloud Deployment Manager.
What are two business risks of migrating to Cloud Deployment Manager? (Choose two.)

  - A. Cloud Deployment Manager uses Python
  - B. Cloud Deployment Manager APIs could be deprecated in the future
  - C. Cloud Deployment Manager is unfamiliar to the company's engineers
  - D. Cloud Deployment Manager requires a Google APIs service account to run
  - E. Cloud Deployment Manager can be used to permanently delete cloud resources
  - F. Cloud Deployment Manager only supports automation of Google Cloud resources


44. A development manager is building a new application. He asks you to review his requirements and identify what cloud technologies he can use to meet them. The application must:
1. Be based on open-source technology for cloud portability
2. Dynamically scale compute capacity based on demand
3. Support continuous software delivery
4. Run multiple segregated copies of the same application stack
5. Deploy application bundles using dynamic templates
6. Route network traffic to specific services based on URL
Which combination of technologies will meet all of his requirements?

  - A. Google Kubernetes Engine, Jenkins, and Helm
  - B. Google Kubernetes Engine and Cloud Load Balancing
  - C. Google Kubernetes Engine and Cloud Deployment Manager
  - D. Google Kubernetes Engine, Jenkins, and Cloud Load Balancing


45. You have created several pre-emptible Linux virtual machine instances using Google Compute Engine. You want to properly shut down your application before the virtual machines are preempted.
What should you do?

  - A. Create a shutdown script named k99.shutdown in the /etc/rc.6.d/ directory
  - B. Create a shutdown script registered as a xinetd service in Linux and configure a Stackdriver endpoint check to call the service
  - C. Create a shutdown script and use it as the value for a new metadata entry with the key shutdown-script in the Cloud Platform Console when you create the new virtual machine instance
  - D. Create a shutdown script, registered as a xinetd service in Linux, and use the gcloud compute instances add-metadata command to specify the service URL as the value for a new metadata entry with the key shutdown-script-url


46. Your organization has a 3-tier web application deployed in the same network on Google Cloud Platform. Each tier (web, API, and database) scales independently of the others. Network traffic should flow through the web to the API tier and then on to the database tier. Traffic should not flow between the web and the database tier.
How should you configure the network?

  - A. Add each tier to a different subnetwork
  - B. Set up software based firewalls on individual VMs
  - C. Add tags to each tier and set up routes to allow the desired traffic flow
  - D. Add tags to each tier and set up firewall rules to allow the desired traffic flow


47. Your development team has installed a new Linux kernel module on the batch servers in Google Compute Engine (GCE) virtual machines (VMs) to speed up the nightly batch process. Two days after the installation, 50% of the batch servers failed the nightly batch run. You want to collect details on the failure to pass back to the development team.
Which three actions should you take? (Choose three.)

  - A. Use Stackdriver Logging to search for the module log entries
  - B. Read the debug GCE Activity log using the API or Cloud Console
  - C. Use gcloud or Cloud Console to connect to the serial console and observe the logs
  - D. Identify whether a live migration event of the failed server occurred, using in the activity log
  - E. Adjust the Google Stackdriver timeline to match the failure time, and observe the batch server metrics
  - F. Export a debug VM into an image, and run the image on a local server where kernel log messages will be displayed on the native screen


48. Your company wants to try out the cloud with low risk. They want to archive approximately 100 TB of their log data to the cloud and test the analytics features available to them there, while also retaining that data as a long-term disaster recovery backup.
Which two steps should you take? (Choose two.)

  - A. Load logs into Google BigQuery
  - B. Load logs into Google Cloud SQL
  - C. Import logs into Google Stackdriver
  - D. Insert logs into Google Cloud Bigtable
  - E. Upload log files into Google Cloud Storage


49. You created a pipeline that can deploy your source code changes to your infrastructure in instance groups for self-healing. One of the changes negatively affects your key performance indicator. You are not sure how to fix it, and investigation could take up to a week.
What should you do?

  - A. Log in to a server, and iterate on the fox locally
  - B. Revert the source code change, and rerun the deployment pipeline
  - C. Log into the servers with the bad code change, and swap in the previous code
  - D. Change the instance group template to the previous one, and delete all instances


50. Your organization wants to control IAM policies for different departments independently, but centrally.
Which approach should you take?

  - A. Multiple Organizations with multiple Folders
  - B. Multiple Organizations, one for each department
  - C. A single Organization with Folders for each department
  - D. A single Organization with multiple projects, each with a central owner


51. You deploy your custom Java application to Google App Engine. It fails to deploy and gives you the following stack trace.
What should you do?
```
java.lang.SecurityException: SHA1 digest error for com/Altostrat/CloakedServlet.class
    at com.google.appengine.runtime.Request.process-d36f818a24b8cf1d (Request.java)
    at sun.security.util.ManifestEntryVerifier.verify (ManifestEntryVerifier.java:210)
    at java.util.jar.JarVerifier.processEntry (JarVerifier.java:218)
    at java.util.jar.JarVerifier.update (JarVerifier.java:205)
    at java.util.jar.JarVerifiersVerifierStream.read (JarVerifier.java:428)
    at sun.misc.Resource.getBytes (Resource.java:124)
    at java.net.URL.ClassLoader.defineClass (URLClassLoader.java:273)
    at sun.reflect.GeneratedMethodAccessor5.invoke (Unknown Source)
    at sun.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:616)
    at.java.lang.ClassLoader.loadClass (ClassLoader.java:266)
```

  - A. Upload missing JAR files and redeploy your application.
  - B. Digitally sign all of your JAR files and redeploy your application
  - C. Recompile the CLoakedServlet class using and MD5 hash instead of SHA1


52. You are designing a mobile chat application. You want to ensure people cannot spoof chat messages, by providing a message were sent by a specific user.
What should you do?

  - A. Tag messages client side with the originating user identifier and the destination user.
  - B. Encrypt the message client side using block-based encryption with a shared key.
  - C. Use public key infrastructure (PKI) to encrypt the message client side using the originating user's private key.
  - D. Use a trusted certificate authority to enable SSL connectivity between the client application and the server.


53. As part of implementing their disaster recovery plan, your company is trying to replicate their production MySQL database from their private data center to their GCP project using a Google Cloud VPN connection. They are experiencing latency issues and a small amount of packet loss that is disrupting the replication.
What should they do?

  - A. Configure their replication to use UDP.
  - B. Configure a Google Cloud Dedicated Interconnect.
  - C. Restore their database daily using Google Cloud SQL.
  - D. Add additional VPN connections and load balance them.
  - E. Send the replicated transaction to Google Cloud Pub/Sub.


54. Your customer support tool logs all email and chat conversations to Cloud Bigtable for retention and analysis. What is the recommended approach for sanitizing this data of personally identifiable information or payment card information before initial storage?

  - A. Hash all data using SHA256
  - B. Encrypt all data using elliptic curve cryptography
  - C. De-identify the data with the Cloud Data Loss Prevention API
  - D. Use regular expressions to find and redact phone numbers, email addresses, and credit card numbers


55. You are using Cloud Shell and need to install a custom utility for use in a few weeks. Where can you store the file so it is in the default execution path and persists across sessions?

  - A. ~/bin
  - B. Cloud Storage
  - C. /google/scripts
  - D. /usr/local/bin


56. You want to create a private connection between your instances on Compute Engine and your on-premises data center. You require a connection of at least 20
Gbps. You want to follow Google-recommended practices. How should you set up the connection?

  - A. Create a VPC and connect it to your on-premises data center using Dedicated Interconnect.
  - B. Create a VPC and connect it to your on-premises data center using a single Cloud VPN.
  - C. Create a Cloud Content Delivery Network (Cloud CDN) and connect it to your on-premises data center using Dedicated Interconnect.
  - D. Create a Cloud Content Delivery Network (Cloud CDN) and connect it to your on-premises datacenter using a single Cloud VPN.


57. You are analyzing and defining business processes to support your startup's trial usage of GCP, and you don't yet know what consumer demand for your product will be. Your manager requires you to minimize GCP service costs and adhere to Google best practices. What should you do?

  - A. Utilize free tier and sustained use discounts. Provision a staff position for service cost management.
  - B. Utilize free tier and sustained use discounts. Provide training to the team about service cost management.
  - C. Utilize free tier and committed use discounts. Provision a staff position for service cost management.
  - D. Utilize free tier and committed use discounts. Provide training to the team about service cost management.


58. You are building a continuous deployment pipeline for a project stored in a Git source repository and want to ensure that code changes can be verified before deploying to production. What should you do?

  - A. Use Spinnaker to deploy builds to production using the red/black deployment strategy so that changes can easily be rolled back.
  - B. Use Spinnaker to deploy builds to production and run tests on production deployments.
  - C. Use Jenkins to build the staging branches and the master branch. Build and deploy changes to production for 10% of users before doing a complete rollout.
  - D. Use Jenkins to monitor tags in the repository. Deploy staging tags to a staging environment for testing. After testing, tag the repository for production and deploy that to the production environment.


59. You have an outage in your Compute Engine managed instance group: all instances keep restarting after 5 seconds. You have a health check configured, but autoscaling is disabled. Your colleague, who is a Linux expert, offered to look into the issue. You need to make sure that he can access the VMs. What should you do?

  - A. Grant your colleague the IAM role of project Viewer
  - B. Perform a rolling restart on the instance group
  - C. Disable the health check for the instance group. Add his SSH key to the project-wide SSH Keys
  - D. Disable autoscaling for the instance group. Add his SSH key to the project-wide SSH Keys


60. Your company is migrating its on-premises data center into the cloud. As part of the migration, you want to integrate Google Kubernetes Engine (GKE) for workload orchestration. Parts of your architecture must also be PCI DSS-compliant. Which of the following is most accurate?

  - A. App Engine is the only compute platform on GCP that is certified for PCI DSS hosting.
  - B. GKE cannot be used under PCI DSS because it is considered shared hosting.
  - C. GKE and GCP provide the tools you need to build a PCI DSS-compliant environment.
  - D. All Google Cloud services are usable because Google Cloud Platform is certified PCI-compliant.


61. Your company has multiple on-premises systems that serve as sources for reporting. The data has not been maintained well and has become degraded over time.
You want to use Google-recommended practices to detect anomalies in your company data. What should you do?

  - A. Upload your files into Cloud Storage. Use Cloud Datalab to explore and clean your data.
  - B. Upload your files into Cloud Storage. Use Cloud Dataprep to explore and clean your data.
  - C. Connect Cloud Datalab to your on-premises systems. Use Cloud Datalab to explore and clean your data.
  - D. Connect Cloud Dataprep to your on-premises systems. Use Cloud Dataprep to explore and clean your data.


62. Google Cloud Platform resources are managed hierarchically using organization, folders, and projects. When Cloud Identity and Access Management (IAM) policies exist at these different levels, what is the effective policy at a particular node of the hierarchy?

  - A. The effective policy is determined only by the policy set at the node
  - B. The effective policy is the policy set at the node and restricted by the policies of its ancestors
  - C. The effective policy is the union of the policy set at the node and policies inherited from its ancestors
  - D. The effective policy is the intersection of the policy set at the node and policies inherited from its ancestors


63. You are migrating your on-premises solution to Google Cloud in several phases. You will use Cloud VPN to maintain a connection between your on-premises systems and Google Cloud until the migration is completed. You want to make sure all your on-premise systems remain reachable during this period. How should you organize your networking in Google Cloud?

  - A. Use the same IP range on Google Cloud as you use on-premises
  - B. Use the same IP range on Google Cloud as you use on-premises for your primary IP range and use a secondary range that does not overlap with the range you use on-premises
  - C. Use an IP range on Google Cloud that does not overlap with the range you use on-premises
  - D. Use an IP range on Google Cloud that does not overlap with the range you use on-premises for your primary IP range and use a secondary range with the same IP range as you use on-premises


64. You have found an error in your App Engine application caused by missing Cloud Datastore indexes. You have created a YAML file with the required indexes and want to deploy these new indexes to Cloud Datastore. What should you do?

  - A. Point gcloud datastore create-indexes to your configuration file
  - B. Upload the configuration file to App Engine's default Cloud Storage bucket, and have App Engine detect the new indexes
  - C. In the GCP Console, use Datastore Admin to delete the current indexes and upload the new configuration file
  - D. Create an HTTP request to the built-in python module to send the index configuration file to your application


65. You have an application that will run on Compute Engine. You need to design an architecture that takes into account a disaster recovery plan that requires your application to fail over to another region in case of a regional outage. What should you do?

  - A. Deploy the application on two Compute Engine instances in the same project but in a different region. Use the first instance to serve traffic, and use the HTTP load balancing service to fail over to the standby instance in case of a disaster.
  - B. Deploy the application on a Compute Engine instance. Use the instance to serve traffic, and use the HTTP load balancing service to fail over to an instance on your premises in case of a disaster.
  - C. Deploy the application on two Compute Engine instance groups, each in the same project but in a different region. Use the first instance group to serve traffic, and use the HTTP load balancing service to fail over to the standby instance group in case of a disaster.
  - D. Deploy the application on two Compute Engine instance groups, each in a separate project and a different region. Use the first instance group to serve traffic, and use the HTTP load balancing service to fail over to the standby instance group in case of a disaster.


66. You are deploying an application on App Engine that needs to integrate with an on-premises database. For security purposes, your on-premises database must not be accessible through the public internet. What should you do?

  - A. Deploy your application on App Engine standard environment and use App Engine firewall rules to limit access to the open on-premises database.
  - B. Deploy your application on App Engine standard environment and use Cloud VPN to limit access to the on-premises database.
  - C. Deploy your application on App Engine flexible environment and use App Engine firewall rules to limit access to the on-premises database.
  - D. Deploy your application on App Engine flexible environment and use Cloud VPN to limit access to the on-premises database.


67. You are working in a highly secured environment where public Internet access from the Compute Engine VMs is not allowed. You do not yet have a VPN connection to access an on-premises file server. You need to install specific software on a Compute Engine instance. How should you install the software?

  - A. Upload the required installation files to Cloud Storage. Configure the VM on a subnet with a Private Google Access subnet. Assign only an internal IP address to the VM. Download the installation files to the VM using gsutil.
  - B. Upload the required installation files to Cloud Storage and use firewall rules to block all traffic except the IP address range for Cloud Storage. Download the files to the VM using gsutil.
  - C. Upload the required installation files to Cloud Source Repositories. Configure the VM on a subnet with a Private Google Access subnet. Assign only an internal IP address to the VM. Download the installation files to the VM using gcloud.
  - D. Upload the required installation files to Cloud Source Repositories and use firewall rules to block all traffic except the IP address range for Cloud Source Repositories. Download the files to the VM using gsutil.


68. Your company is moving 75 TB of data into Google Cloud. You want to use Cloud Storage and follow Google-recommended practices. What should you do?

  - A. Move your data onto a Transfer Appliance. Use a Transfer Appliance Rehydrator to decrypt the data into Cloud Storage.
  - B. Move your data onto a Transfer Appliance. Use Cloud Dataprep to decrypt the data into Cloud Storage.
  - C. Install gsutil on each server that contains data. Use resumable transfers to upload the data into Cloud Storage.
  - D. Install gsutil on each server containing data. Use streaming transfers to upload the data into Cloud Storage.


69. You have an application deployed on Google Kubernetes Engine using a Deployment named echo-deployment. The deployment is exposed using a Service called echo-service. You need to perform an update to the application with minimal downtime to the application. What should you do?

  - A. Use kubectl set image deployment/echo-deployment \<new-image\>
  - B. Use the rolling update functionality of the Instance Group behind the Kubernetes cluster
  - C. Update the deployment yaml file with the new container image. Use kubectl delete deployment/echo-deployment and kubectl create ג€"f \<yaml-file\>
  - D. Update the service yaml file which the new container image. Use kubectl delete service/echo-service and kubectl create ג€"f \<yaml-file\>


70. Your company is using BigQuery as its enterprise data warehouse. Data is distributed over several Google Cloud projects. All queries on BigQuery need to be billed on a single project. You want to make sure that no query costs are incurred on the projects that contain the data. Users should be able to query the datasets, but not edit them.
How should you configure users' access roles?

  - A. Add all users to a group. Grant the group the role of BigQuery user on the billing project and BigQuery dataViewer on the projects that contain the data.
  - B. Add all users to a group. Grant the group the roles of BigQuery dataViewer on the billing project and BigQuery user on the projects that contain the data.
  - C. Add all users to a group. Grant the group the roles of BigQuery jobUser on the billing project and BigQuery dataViewer on the projects that contain the data.
  - D. Add all users to a group. Grant the group the roles of BigQuery dataViewer on the billing project and BigQuery jobUser on the projects that contain the data.


71. You have developed an application using Cloud ML Engine that recognizes famous paintings from uploaded images. You want to test the application and allow specific people to upload images for the next 24 hours. Not all users have a Google Account. How should you have users upload images?

  - A. Have users upload the images to Cloud Storage. Protect the bucket with a password that expires after 24 hours.
  - B. Have users upload the images to Cloud Storage using a signed URL that expires after 24 hours.
  - C. Create an App Engine web application where users can upload images. Configure App Engine to disable the application after 24 hours. Authenticate users via Cloud Identity.
  - D. Create an App Engine web application where users can upload images for the next 24 hours. Authenticate users via Cloud Identity.


72. Your web application must comply with the requirements of the European Union's General Data Protection Regulation (GDPR). You are responsible for the technical architecture of your web application. What should you do?

  - A. Ensure that your web application only uses native features and services of Google Cloud Platform, because Google already has various certifications and provides ג€pass-onג€ compliance when you use native features.
  - B. Enable the relevant GDPR compliance setting within the GCPConsole for each of the services in use within your application.
  - C. Ensure that Cloud Security Scanner is part of your test planning strategy in order to pick up any compliance gaps.
  - D. Define a design for the security of data in your web application that meets GDPR requirements.


73. You need to set up Microsoft SQL Server on GCP. Management requires that there's no downtime in case of a data center outage in any of the zones within a
GCP region. What should you do?

  - A. Configure a Cloud SQL instance with high availability enabled.
  - B. Configure a Cloud Spanner instance with a regional instance configuration.
  - C. Set up SQL Server on Compute Engine, using Always On Availability Groups using Windows Failover Clustering. Place nodes in different subnets.
  - D. Set up SQL Server Always On Availability Groups using Windows Failover Clustering. Place nodes in different zones.


74. The development team has provided you with a Kubernetes Deployment file. You have no infrastructure yet and need to deploy the application. What should you do?

  - A. Use gcloud to create a Kubernetes cluster. Use Deployment Manager to create the deployment.
  - B. Use gcloud to create a Kubernetes cluster. Use kubectl to create the deployment.
  - C. Use kubectl to create a Kubernetes cluster. Use Deployment Manager to create the deployment.
  - D. Use kubectl to create a Kubernetes cluster. Use kubectl to create the deployment.


75. You need to evaluate your team readiness for a new GCP project. You must perform the evaluation and create a skills gap plan which incorporates the business goal of cost optimization. Your team has deployed two GCP projects successfully to date. What should you do?

  - A. Allocate budget for team training. Set a deadline for the new GCP project.
  - B. Allocate budget for team training. Create a roadmap for your team to achieve Google Cloud certification based on job role.
  - C. Allocate budget to hire skilled external consultants. Set a deadline for the new GCP project.
  - D. Allocate budget to hire skilled external consultants. Create a roadmap for your team to achieve Google Cloud certification based on job role.


76. You are designing an application for use only during business hours. For the minimum viable product release, you'd like to use a managed product that automatically ג€scales to zeroג€ so you don't incur costs when there is no activity.
Which primary compute resource should you choose?

  - A. Cloud Functions
  - B. Compute Engine
  - C. Google Kubernetes Engine
  - D. AppEngine flexible environment


77. You are creating an App Engine application that uses Cloud Datastore as its persistence layer. You need to retrieve several root entities for which you have the identifiers. You want to minimize the overhead in operations performed by Cloud Datastore. What should you do?

  - A. Create the Key object for each Entity and run a batch get operation
  - B. Create the Key object for each Entity and run multiple get operations, one operation for each entity
  - C. Use the identifiers to create a query filter and run a batch query operation
  - D. Use the identifiers to create a query filter and run multiple query operations, one operation for each entity


78. You need to upload files from your on-premises environment to Cloud Storage. You want the files to be encrypted on Cloud Storage using customer-supplied encryption keys. What should you do?
A. Supply the encryption key in a .boto configuration file. Use gsutil to upload the files.
B. Supply the encryption key using gcloud config. Use gsutil to upload the files to that bucket.
C. Use gsutil to upload the files, and use the flag --encryption-key to supply the encryption key.
D. Use gsutil to create a bucket, and use the flag --encryption-key to supply the encryption key. Use gsutil to upload the files to that bucket.


79. Your customer wants to capture multiple GBs of aggregate real-time key performance indicators (KPIs) from their game servers running on Google Cloud Platform and monitor the KPIs with low latency. How should they capture the KPIs?

  - A. Store time-series data from the game servers in Google Bigtable, and view it using Google Data Studio.
  - B. Output custom metrics to Stackdriver from the game servers, and create a Dashboard in Stackdriver Monitoring Console to view them.
  - C. Schedule BigQuery load jobs to ingest analytics files uploaded to Cloud Storage every ten minutes, and visualize the results in Google Data Studio.
  - D. Insert the KPIs into Cloud Datastore entities, and run ad hoc analysis and visualizations of them in Cloud Datalab.


80. You have a Python web application with many dependencies that requires 0.1 CPU cores and 128 MB of memory to operate in production. You want to monitor and maximize machine utilization. You also want to reliably deploy new versions of the application. Which set of steps should you take?

  - A. Perform the following: 1. Create a managed instance group with f1-micro type machines. 2. Use a startup script to clone the repository, check out the production branch, install the dependencies, and start the Python app. 3. Restart the instances to automatically deploy new production releases.
  - B. Perform the following: 1. Create a managed instance group with n1-standard-1 type machines. 2. Build a Compute Engine image from the production branch that contains all of the dependencies and automatically starts the Python app. 3. Rebuild the Compute Engine image, and update the instance template to deploy new production releases.
  - C. Perform the following: 1. Create a Google Kubernetes Engine (GKE) cluster with n1-standard-1 type machines. 2. Build a Docker image from the production branch with all of the dependencies, and tag it with the version number. 3. Create a Kubernetes Deployment with the imagePullPolicy set to 'IfNotPresent' in the staging namespace, and then promote it to the production namespace after testing.
  - D. Perform the following: 1. Create a GKE cluster with n1-standard-4 type machines. 2. Build a Docker image from the master branch with all of the dependencies, and tag it with 'latest'. 3. Create a Kubernetes Deployment in the default namespace with the imagePullPolicy set to 'Always'. Restart the pods to automatically deploy new production releases.
