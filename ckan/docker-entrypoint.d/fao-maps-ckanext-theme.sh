#!/bin/bash
cd ${APP_DIR}/src_extensions/fao-maps-ckanext-theme/ &&\
pip install -r requirements.txt &&\
python setup.py develop