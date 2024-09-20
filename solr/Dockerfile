FROM solr:6.2-alpine
MAINTAINER Open Knowledge

# Enviroment
ENV SOLR_CORE ckan
# Adjust to your needs
#ENV CKAN_VERSION dev-v2.9
ENV CKAN_VERSION dev-v2.8

# User
USER root

# Create Directories
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE/conf
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE/data

# Adding Files
ADD solrconfig.xml \
    #https://raw.githubusercontent.com/ckan/ckan/$CKAN_VERSION/ckan/config/solr/schema.xml \
    schema.xml \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/currency.xml \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/synonyms.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/stopwords.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/protwords.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/data_driven_schema_configs/conf/elevate.xml \
    /opt/solr/server/solr/$SOLR_CORE/conf/

# Create Core.properties
RUN echo name=$SOLR_CORE > /opt/solr/server/solr/$SOLR_CORE/core.properties

# Giving ownership to Solr
RUN chown -R $SOLR_USER:$SOLR_USER /opt/solr/server/solr/$SOLR_CORE

# ADDITIONAL ONES
##############################################################################


ENV SOLR_CORE_PACKAGE ckan_packages
# Adjust to your needs
#ENV CKAN_VERSION dev-v2.9
#ENV CKAN_VERSION dev-v2.8

# User
USER root

# Create Directories
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE_PACKAGE/conf
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE_PACKAGE/data

# Adding Files
ADD solrconfig.xml \
    #https://raw.githubusercontent.com/ckan/ckan/$CKAN_VERSION/ckan/config/solr/schema.xml \
    package/schema.xml \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/currency.xml \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/synonyms.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/stopwords.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/protwords.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/data_driven_schema_configs/conf/elevate.xml \
    /opt/solr/server/solr/$SOLR_CORE_PACKAGE/conf/
# Create Core.properties
RUN echo name=$SOLR_CORE_PACKAGE > /opt/solr/server/solr/$SOLR_CORE_PACKAGE/core.properties

# Giving ownership to Solr
RUN chown -R $SOLR_USER:$SOLR_USER /opt/solr/server/solr/$SOLR_CORE_PACKAGE

##############################################################################

ENV SOLR_CORE_VIEW ckan_views
# Adjust to your needs
#ENV CKAN_VERSION dev-v2.9
#ENV CKAN_VERSION dev-v2.8

# User
USER root

# Create Directories
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE_VIEW/conf
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE_VIEW/data

# Adding Files
ADD solrconfig.xml \
    #https://raw.githubusercontent.com/ckan/ckan/$CKAN_VERSION/ckan/config/solr/schema.xml \
    view/schema.xml \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/currency.xml \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/synonyms.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/stopwords.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/protwords.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/data_driven_schema_configs/conf/elevate.xml \
    /opt/solr/server/solr/$SOLR_CORE_VIEW/conf/
# Create Core.properties
RUN echo name=$SOLR_CORE_VIEW > /opt/solr/server/solr/$SOLR_CORE_VIEW/core.properties

# Giving ownership to Solr
RUN chown -R $SOLR_USER:$SOLR_USER /opt/solr/server/solr/$SOLR_CORE_VIEW

##############################################################################

ENV SOLR_CORE_RESOURCE ckan_resources
# Adjust to your needs
#ENV CKAN_VERSION dev-v2.9
#ENV CKAN_VERSION dev-v2.8


USER root

# Create Directories
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE_RESOURCE/conf
RUN mkdir -p /opt/solr/server/solr/$SOLR_CORE_RESOURCE/data

# Adding Files
ADD solrconfig.xml \
    #https://raw.githubusercontent.com/ckan/ckan/$CKAN_VERSION/ckan/config/solr/schema.xml \
    resource/schema.xml \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/currency.xml \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/synonyms.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/stopwords.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/basic_configs/conf/protwords.txt \
    https://raw.githubusercontent.com/apache/lucene-solr/releases/lucene-solr/6.6.6/solr/server/solr/configsets/data_driven_schema_configs/conf/elevate.xml \
    /opt/solr/server/solr/$SOLR_CORE_RESOURCE/conf/
# Create Core.properties
RUN echo name=$SOLR_CORE_RESOURCE > /opt/solr/server/solr/$SOLR_CORE_RESOURCE/core.properties

# Giving ownership to Solr
RUN chown -R $SOLR_USER:$SOLR_USER /opt/solr/server/solr/$SOLR_CORE_RESOURCE