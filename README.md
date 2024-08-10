### DevSecOps Webserver Automation Project README

---

#### Project Overview

This project demonstrates a comprehensive DevSecOps pipeline aimed at automating the deployment and monitoring of a web server on an AWS EC2 instance. The pipeline integrates multiple stages including Continuous Integration (CI), Continuous Deployment (CD), and security scanning, utilizing tools like Jenkins, GitHub, Logstash, Elasticsearch, and Kibana. This README provides an in-depth look at the setup, configurations, errors encountered, and troubleshooting steps taken to achieve a fully automated and secure webserver deployment.

---

#### **1. Infrastructure Setup**

**AWS EC2 Instance**:
- **OS**: Amazon Linux 2
- **Security Group Configuration**:
    - SSH (Port 22) - Restricted to my IP.
    - Logstash (Port 5044) - Restricted to my IP.
    - Kibana (Port 5601) - Restricted to my IP.
    - Elasticsearch (Port 9200) - Restricted to my IP.

Refer to the `images` directory for screenshots of the security group configurations.

---

#### **2. Jenkins Configuration**

**Jenkins Setup**:
- Installed and configured Jenkins on an AWS EC2 instance.
- Configured Jenkins to use GitHub as the SCM, automatically triggering builds on every push event.

**Pipeline Configuration**:
- The pipeline was defined in a `Jenkinsfile`, outlining steps for:
    - Checking out the code from GitHub.
    - Fetching the necessary artifacts.
    - Deploying the application to the EC2 instance.

**Webhook Integration**:
- Configured a webhook on GitHub to trigger Jenkins builds upon each push to the repository.

Refer to the `images` directory for screenshots of the Jenkins dashboard, pipeline stages, and webhook configuration.

---

#### **3. Web Server Setup**

The web server setup was automated using a bash script, `websetup.sh`, which handled the following tasks:
- Installed necessary dependencies such as `httpd`, `wget`, and `unzip`.
- Deployed the web application by downloading and extracting the artifact into the web server's root directory.
- Restarted the Apache web server to apply the changes.
- Cleaned up temporary files to maintain a clean environment.

---

#### **4. Monitoring with ELK Stack**

**Logstash**:
- Installed Logstash on the EC2 instance and configured it to collect logs from the application.
- Logs were shipped to Elasticsearch for indexing and further analysis.

**Elasticsearch & Kibana**:
- Elasticsearch was configured to index logs, and Kibana was set up to visualize and monitor the logs in real time.

**Kibana Visualization**:
- Created visualizations in Kibana to monitor log data, which helped in identifying and addressing issues in real-time.

Refer to the `images` directory for screenshots of the Kibana dashboard, Elasticsearch status, and Logstash configurations.

---

#### **5. Troubleshooting and Error Resolution**

Throughout the project, several issues were encountered and resolved, showcasing advanced troubleshooting skills:
- **Logstash Configuration Errors**: Ensured the correct port and codec settings were applied.
- **Kibana Index Patterns**: Addressed issues related to index patterns not matching the expected logs.
- **Jenkins Build Failures**: Resolved SCM and deployment issues by fine-tuning the pipeline stages.

Refer to the `images` directory for logs and error outputs captured during troubleshooting.

---

#### **6. Conclusion**

This project demonstrates proficiency in setting up a complete CI/CD pipeline with integrated security practices, utilizing a wide array of tools such as Jenkins, Logstash, Elasticsearch, and Kibana. The automation of web server deployment and log monitoring is essential for maintaining a secure and reliable infrastructure, showcasing my capability as a DevSecOps professional.

This README is designed to boost my profile by showcasing my ability to integrate, automate, and monitor infrastructure efficiently, with a strong emphasis on security.

