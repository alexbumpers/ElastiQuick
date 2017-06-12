# ElastiQuick
Quickly deploy a Python3 + Django project to an AWS Elastic Beanstalk instance.

## About
ElastiQuick serves as an easy, quick, and efficient way to quickly create and
deploy an Elastic Beanstalk site through Amazon Web Services. Although Elastic
Beanstalk probably isn't sufficient for larger projects with heavy scaling needs,
it is a great way to get a basic website up and running. This repository allows
you to deploy an Elastic Beanstalk site by simply running `ElastiQuick.sh`
in your shell.

This should work on any standard Linux/Mac OS installation, but
you will likely have to edit things like file paths if running on Windows.

## Getting started
Fork the repository on Github and then clone it:
`git clone https://github.com/alexbumpers/ElastiQuick.git`

See this guide for working with forked projects: https://help.github.com/articles/fork-a-repo/

Once you've got the repository locally, you'll need to give your shell the
following command in order to make it executable:
`chmod +x ./ElastiQuick.sh`

After that, be sure to change the variables in the <> tags in the script,
and then run it. You will prompted by the AWS CLI for a few things, like
server location and SSH (if applicable), and voila!, your project is running
on an AWS Elastic Beanstalk instance.

## Help
Questions about running the script, setting up WSGI configuration, or anything
else? Open up an issue/PR, or contact me on Github and we'll work together to
resolve the issue.
