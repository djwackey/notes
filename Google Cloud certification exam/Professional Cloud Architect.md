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


4. A recent audit revealed that a new network was created in your GCP project. In this network, a GCE instance has an SSH port open to the world. You want to discover this networkג€™s origin.
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


19. You need to reduce the number of unplanned rollbacks of erroneous production deployments in your companyג€™s web hosting platform. Improvement to the QA/
Test processes accomplished an 80% reduction.
Which additional two approaches can you take to further reduce the rollbacks? (Choose two.)

  - A. Introduce a green-blue deployment model
  - B. Replace the QA environment with canary releases
  - C. Fragment the monolithic platform into microservices
  - D. Reduce the platformג€™s dependency on relational database systems
  - E. Replace the platformג€™s relational database systems with a NoSQL database


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


29. You have been asked to select the storage system for the click-data of your companyג€™s large portfolio of websites. This data is streamed in from a custom website analytics package at a typical rate of 6,000 clicks per minute. With bursts of up to 8,500 clicks per second. It must have been stored for future analysis by your data science and user experience teams.
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
