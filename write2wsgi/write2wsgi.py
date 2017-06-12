beanstalk_wsgi = """option_settings:
  aws:elasticbeanstalk:container:python:
    WSGIPath: ebdjango/wsgi.py"""
def write2wsgi(wsgi_file):
    with open(wsgi_file, 'a') as wsgi_config:
        aws_wsgi = wsgi_config.write(beanstalk_wsgi)
write2wsgi('.ebextensions/django.config')
