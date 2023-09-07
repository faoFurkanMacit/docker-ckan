#!/bin/bash

paster --plugin=ckan config-tool /srv/app/production.ini \
    "scheming.dataset_schemas = ckanext.scheming_iso19115:scheming/iso.yaml"
paster --plugin=ckan config-tool /srv/app/production.ini \
    "scheming.presets = ckanext.scheming_iso19115:scheming/presets.json"
    
#scheming.organization_schemas = ckanext.scheming_dcat:scheming/dcat_org.json