#!/bin/bash
# Simple script for quickly instantiating and deploying an AWS Elastic
# Beanstalk instance with Python 3 and Django. Fill in <>'s with appropriate
# information.
# ------------------------------------------
# ------------------------------------------
# Instantiate a virtual environment with Python 3
virtualenv -p python3.4 ~/<environment-name>
# Replace <environment-name> with preferred tag
source ~/<environment-name>/bin/activate
# Installs most up-to-date Django version
pip install django
pip freeze
# Instantiate Django project. Replace <project-name> with preferred tag
django-admin startproject <project-name>
sleep 10
# Navigate to primary Django project directory
source <project-name>
sleep 10
# Write installed packages to requirements.txt
pip freeze > requirements.txt
# Create .ebextensions for WSGI config later
mkdir .ebextensions
# Create django.config file for WSGI configuration
touch .ebextensions/django.config
# Write WSGI configuration to /.ebextensions/django.config/
python3 write2wsgi.py
# Deactivate virtual environment
deactivate
# Initialize AWS Elastic Beanstalk app with Python 3.4
eb init -p python3.4 <my-app-name>
sleep 10
# (Optional) Configure default keypair to connect with SSH
eb init
sleep 10
# Create your AWS Elastic Beanstalk environment and deploy your application to it
eb create <env-name>
sleep 10
# Open your site in your default browser
eb open
# (Optional) Deploy site into production
eb deploy
