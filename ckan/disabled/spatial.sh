
cd ${APP_DIR}/src_extensions/ckanext-spatial/

#apk add --no-cache --virtual libgeos-dev && \
# apk add --no-cache --virtual proj 

# echo "#include <unistd.h>" > /usr/include/sys/unistd.h
# pip install conda

    # Shapely>=1.2.13 \
    # pyproj==2.2.2 \
# apk add --no-cache --virtual proj-util &&\
# pip install -r pip-requirements-py2.txt &&\
# pip install -c requirements-py2.txt shapely==1.3.0 pyproj==1.9.3  && \

#pip install -e "git+https://github.com/ckan/ckanext-spatial.git#egg=ckanext-spatial" &&\
python setup.py develop &&\
apk add geos &&\
pip install \
    ckantoolkit \
    GeoAlchemy>=0.6 \
    GeoAlchemy2==0.5.0 \
    shapely==1.3.0 \
    pyproj==1.9.3 \
    OWSLib==0.18.0 \
    lxml>=2.3 \
    argparse \
    pyparsing>=2.1.10 \
    requests>=1.1.0 \
    six &&\
    
paster --plugin=ckan config-tool ${APP_DIR}/production.ini \
    "ckan.spatial.validator.profiles=iso19139,iso19115" &&\
paster --plugin=ckan config-tool ${APP_DIR}/production.ini \
    "ckan.spatial.srid=4326" &&\
paster --plugin=ckan config-tool ${APP_DIR}/production.ini \
    "ckanext.spatial.search_backend=solr" &&\
paster --plugin=ckan config-tool ${APP_DIR}/production.ini \
    "ckanext.spatial.harvest.continue_on_validation_errors=true" &&\
paster --plugin=ckan config-tool ${APP_DIR}/production.ini \
    "ckanext.spatial.harvest.validate_wms=true" &&\
paster --plugin=ckanext-spatial spatial initdb 4326 --config=$APP_DIR/production.ini

#spatial_metadata spatial_query csw_harvester iso19115_harvester

pip install geoalchemy2


