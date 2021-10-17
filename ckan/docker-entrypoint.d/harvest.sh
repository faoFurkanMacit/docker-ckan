#!/bin/bash

# sudo apt-get install redis-server
# sudo apt-get -y install rabbitmq-server
# required by dcat harvester

pip install -e git+https://github.com/ckan/ckanext-harvest.git#egg=ckanext-harvest

pip install -r ${APP_DIR}/src_extensions/ckanext-harvest/pip-requirements.txt

paster --plugin=ckanext-harvest harvester initdb --config=${APP_DIR}/production.ini