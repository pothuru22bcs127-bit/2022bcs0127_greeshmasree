# Start from official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root to install Python
USER root

# Update package list and install Python3 and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Make python3 available as python (so Jenkinsfile can call 'python')
RUN ln -s /usr/bin/python3 /usr/bin/python

# Switch back to Jenkins user
USER jenkins
