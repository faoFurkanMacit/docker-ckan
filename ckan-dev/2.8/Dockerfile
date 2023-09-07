FROM openknowledge/ckan-base:2.8.12

MAINTAINER Open Knowledge International <info@okfn.org>

ENV APP_DIR=/srv/app
ENV SRC_EXTENSIONS_DIR=/srv/app/src_extensions
ENV GIT_BRANCH=2.8
# Install packages needed by the dev requirements
RUN apk add --no-cache libffi-dev
# Install CKAN dev requirements
#RUN pip install --no-binary :all: -r https://raw.githubusercontent.com/ckan/ckan/${GIT_BRANCH}/dev-requirements.txt
COPY dev-requirements.txt ${APP_DIR}
RUN pip install -r ${APP_DIR}/dev-requirements.txt

# Create folder for local extensions sources
RUN mkdir $SRC_EXTENSIONS_DIR

COPY 2.8/setup/start_ckan_development.sh ${APP_DIR}

CMD ["/srv/app/start_ckan_development.sh"]
