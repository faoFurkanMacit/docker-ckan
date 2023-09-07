#!/bin/bash

# https://github.com/ckan/ckanext-harvest

# sudo apt-get install redis-server
# sudo apt-get -y install rabbitmq-server
# required by dcat harvester
cd ${APP_DIR}/src_extensions/ckanext-harvest/

# pip install -e git+https://github.com/ckan/ckanext-harvest.git#egg=ckanext-harvest

pip setup.py develop

pip install -r pip-requirements.txt

paster --plugin=ckanext-harvest harvester initdb --config=${APP_DIR}/production.ini

# ON CKAN >= 2.9:
# (pyenv) $ ckan --config=/etc/ckan/default/ckan.ini harvester initdb

#DEBUG
paster --plugin=ckan config-tool ${APP_DIR}/production.ini \
    "ckan.harvest.log_scope=0"

#harvest ckan_harvester 

# "ckan.harvest.log_level=info"
