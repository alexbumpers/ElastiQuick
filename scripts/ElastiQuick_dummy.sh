#!/bin/bash
# Simple --DUMMY -- script for quickly instantiating and deploying an AWS Elastic
# Beanstalk instance with Python 3 and Django. You can run this script without
# changing anything if you'd like to create a quick dummy/test AWSEB instance.
# Not recommended for real development.
# ------------------------------------------
# ------------------------------------------
# Begin at home directory
# cd ~
# Instantiate a virtual environment with Python 3
virtualenv -p python3.4 test_venv
# Replace <environment-name> with preferred tag
source test_venv/bin/activate
# Installs most up-to-date Django version
pip install django
pip freeze
# Instantiate Django project. Replace <project-name> with preferred tag
django-admin startproject dummy
sleep 10
# Navigate to primary Django project directory
source ./dummy
sleep 10
# Write installed packages to requirements.txt
pip freeze > requirements.txt
# Create .ebextensions for WSGI config later
mkdir .ebextensions
# C
touch .ebextensions/django.config
# Write WSGI configuration to /.ebextensions/django.config/
python3 write2wsgi.py
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
