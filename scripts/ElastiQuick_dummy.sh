#!/bin/bash
# Simple script for quickly instantiating and deploying an AWS Elastic
# Beanstalk instance with Python 3 and Django
# ------------------------------------------
# ------------------------------------------
# Instantiate a virtual environment with Python 3
virtualenv -p python3.4 ~/eb-virt
# Replace <environment-name> with preferred tag
source ~/eb-virt/bin/activate
# Installs most up-to-date Django version
pip install django
pip freeze
# Instantiate Django project. Replace <project-name> with preferred tag
django-admin startproject dummy
# Navigate to primary Django project directory
cd dummy
# Write installed packages to requirements.txt
pip freeze > requirements.txt
# Create .ebextensions for WSGI config later
mkdir .ebextensions
# Deactivate virtual environment
deactivate
# Initialize AWS Elastic Beanstalk app with Python 3.4
eb init -p python3.4 dummy-app
# (Optional) Configure default keypair to connect with SSH
eb init
# Create your AWS Elastic Beanstalk environment and deploy your application to it
eb create dummy-env
# Open your site in your default browser
eb open
# (Optional) Deploy site into production
eb deploy
