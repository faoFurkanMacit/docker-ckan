#!/bin/bash
cd ${APP_DIR}/src_extensions/ckanext-jsonschema/ &&\
pip install -r requirements.txt &&\
python setup.py develop