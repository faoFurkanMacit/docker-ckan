#!/bin/bash

cd ${APP_DIR}/src_extensions/ckanext-terriajs/ &&\
pip install -r requirements.txt &&\
paster --plugin=ckan config-tool ${APP_DIR}/production.ini \
    "ckanext.terriajs.default.name=TerriaJS Map" \
    "ckanext.terriajs.always_available=True" \
    "ckanext.terriajs.default.title=Map" \
    "ckanext.terriajs.url=http://localhost:8080" \
    "ckanext.terriajs.schema.type_mapping=${APP_DIR}/terriajs-type-mapping.json" &&\
cp ./type-mapping.json ${APP_DIR}/terriajs-type-mapping.json