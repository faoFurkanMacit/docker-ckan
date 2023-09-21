#!/bin/bash

cd ${APP_DIR}/src_extensions/fao-maps-ckan-authentication/ &&\
pip install -r requirements.txt &&\
paster --plugin=ckan config-tool ${APP_DIR}/production.ini -s app:main \
    "ckanext.gciap.authorization_endpoint=https://data.review.fao.org/ckan-auth" \
    "ckanext.gciap.remember_name=auth_tkt" \
    "ckanext.gciap.authorization_header=X-Goog-Iap-Jwt-Assertion" \
    "ckanext.gciap.reset_url=https://data.review.fao.org/ckan-auth?gcp-iap-mode=GCIP_SIGNOUT" \
    "ckanext.gciap.session_exp=480" \
    "ckanext.gciap.local_ip=https://localhost:5000" \
    "ckanext.gciap.profile_api_user_field=gciap.email" \
    "ckanext.gciap.profile_api_fullname_field=gcip.firebase.name" \
    "ckanext.gciap.profile_api_mail_field=gciap.email" \
    "ckanext.gciap.profile_api_groupmembership_field=''" \
    "ckanext.gciap.sysadmin_group_name=''" \
    "ckanext.gciap.skip_list=[\"/api/\", \"/terriajs/\"]"
# ckan config-tool /etc/ckan/default/ckan.ini -f custom_options.ini
