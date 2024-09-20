#!/bin/bash
cd ${APP_DIR}/src_extensions/ckanext-publisher/ &&\
pip install -r requirements.txt &&\
python setup.py develop