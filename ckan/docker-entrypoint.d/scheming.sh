#!/bin/bash
cd ${APP_DIR}/src_extensions/ckanext-scheming/

pip install .
# pip install -r requirements.txt

# Requirement already satisfied: python-slugify>=1.0 in /usr/lib/python2.7/site-packages/python_slugify-5.0.2-py2.7.egg (from ckanapi->ckanext-scheming==2.1.0) (5.0.2)
# ERROR: Package 'python-slugify' requires a different Python: 2.7.18 not in '>=3.6'
pip install python-slugify==4.0.1


