#!/bin/bash

# paster --plugin=ckan config-tool /srv/app/production.ini \
#     "scheming.dataset_schemas = ckanext.scheming_iso19115:scheming/iso.yaml"

# provided plugins:

# jsonschema - base plugin

# jsonschema_iso19139 - extension to provide an iso19139 binding

#
# harvest harvester_iso19139 jsonschema jsonschema_iso19139 jsonschema_iso


#paster --plugin=ckanext-harvest harvester initdb --config=${APP_DIR}/production.ini
# https://github.com/okfn/docker-ckan/issues/84
PATH_CORE=/srv/app/src_extensions/ckanext-jsonschema/ckanext/schema/core/
mkdir -p $PATH_CORE
chown -R ckan $PATH_CORE

# apk add geos &&\
# pip install \
#     ckantoolkit \
#     GeoAlchemy>=0.6 \
#     GeoAlchemy2==0.5.0 \
#     shapely==1.3.0 \
#     pyproj==1.9.3 \
#     OWSLib==0.18.0 \
#     lxml>=2.3 \
#     argparse \
#     pyparsing>=2.1.10 \
#     requests>=1.1.0 \
#     six
    