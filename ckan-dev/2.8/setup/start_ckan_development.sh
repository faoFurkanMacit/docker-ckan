#!/bin/bash

# Install any local extensions in the src_extensions volume
echo "Looking for local extensions to install..."
echo "Extension dir contents:"
ls -la $SRC_EXTENSIONS_DIR
for i in $SRC_EXTENSIONS_DIR/*
do
    if [ -d $i ];
    then

        if [ -f $i/pip-requirements.txt ];
        then
            pip install -r $i/pip-requirements.txt
            echo "Found requirements file in $i"
        fi
        if [ -f $i/requirements.txt ];
        then
            pip install -r $i/requirements.txt
            echo "Found requirements file in $i"
        fi
        if [ -f $i/dev-requirements.txt ];
        then
            pip install -r $i/dev-requirements.txt
            echo "Found dev-requirements file in $i"
        fi
        if [ -f $i/setup.py ];
        then
            cd $i
            python $i/setup.py develop
            echo "Found setup.py file in $i"
            cd $APP_DIR
        fi

        # Point `use` in test.ini to location of `test-core.ini`
        if [ -f $i/test.ini ];
        then
            echo "Updating \`test.ini\` reference to \`test-core.ini\` for plugin $i"
            paster --plugin=ckan config-tool $i/test.ini "use = config:../../src/ckan/test-core.ini"
        fi
    fi
done

# Set debug to true
echo "Enabling debug mode"
paster --plugin=ckan config-tool $CKAN_INI -s DEFAULT "debug = true"

# Update the plugins setting in the ini file with the values defined in the env var
echo "Loading the following plugins: $CKAN__PLUGINS"
paster --plugin=ckan config-tool $CKAN_INI "ckan.plugins = $CKAN__PLUGINS"

# Update test-core.ini DB, SOLR & Redis settings
echo "Loading test settings into test-core.ini"
paster --plugin=ckan config-tool $SRC_DIR/ckan/test-core.ini \
    "sqlalchemy.url = $TEST_CKAN_SQLALCHEMY_URL" \
    "ckan.datastore.write_url = $TEST_CKAN_DATASTORE_WRITE_URL" \
    "ckan.datastore.read_url = $TEST_CKAN_DATASTORE_READ_URL" \
    "solr_url = $TEST_CKAN_SOLR_URL" \
    "ckan.redis.url = $TEST_CKAN_REDIS_URL"

# Run the prerun script to init CKAN and create the default admin user
sudo -u ckan -EH python prerun.py

# Run any startup scripts provided by images extending this one
if [[ -d "/docker-entrypoint.d" ]]
then
    for f in /docker-entrypoint.d/*; do
        case "$f" in
            *.sh)     echo "$0: Running init file $f"; . "$f" ;;
            *.py)     echo "$0: Running init file $f"; python "$f"; echo ;;
            *)        echo "$0: Ignoring $f (not an sh or py file)" ;;
        esac
        echo
    done
fi

# Start supervisord
supervisord --configuration /etc/supervisord.conf &


if [[ -n "$UNIT_TEST" ]]
then 
    echo "[START_CKAN_DEVELOPMENT] UNIT_TEST SET" 
    echo "[START_CKAN_DEVELOPMENT] Set CKAN_SQLALCHEMY_URL to $TEST_CKAN_SQLALCHEMY_URL"
    export CKAN_SQLALCHEMY_URL=$TEST_CKAN_SQLALCHEMY_URL

    pip install --upgrade --no-cache-dir -r src/ckan/dev-requirements.txt 
    pip install --upgrade --no-cache-dir pytest-ckan 

    for PLUGIN in $UNIT_TEST_PLUGINS; do
        
        echo "[START_CKAN_DEVELOPMENT] UNIT_TEST for plugin $PLUGIN"
        PYTEST_COMMAND="/usr/bin/pytest --ckan-ini=$APP_DIR/src_extensions/ckanext-$PLUGIN/test.ini $APP_DIR/src_extensions/ckanext-$PLUGIN/ckanext/$PLUGIN/tests"
        
        EXIT_CODE=$?
        if [ $EXIT_CODE != 0 ]; then 
            echo "[START_CKAN_DEVELOPMENT] ERROR: Could not configure test.ini. Check your configurations about $PLUGIN: exit code $EXIT_CODE"
        else
            if [[ -n "$DEBUGPY" ]]
            then
                pip install debugpy
                echo "[START_CKAN_DEVELOPMENT] DEBUG SET; Starting tests in debug mode"
                #sudo -u ckan -EH /usr/bin/python -m debugpy --log-to-stderr --wait-for-client --listen 0.0.0.0:5678 $PYTEST_COMMAND
                sudo -u ckan -EH /usr/bin/python -m debugpy --log-to-stderr --listen 0.0.0.0:5678 $PYTEST_COMMAND
            else
                $PYTEST_COMMAND
                EXIT_CODE=$?
                if [ $EXIT_CODE != 0 ]; then 
                    echo "[START_CKAN_DEVELOPMENT] ERROR: Something went wrong while executing tests on $PLUGIN: exit code $EXIT_CODE"
                fi
            fi
        fi        
    done 
        
elif [[ -n "$DEBUGPY" ]]
then
    echo "[START_CKAN_DEVELOPMENT] DEBUG SET; Starting CKAN in debug mode"
    pip install debugpy
    # sudo -u ckan -EH /usr/bin/python -m debugpy --log-to-stderr --listen 0.0.0.0:5678 /usr/bin/paster serve --reload $CKAN_INI
    sudo -u ckan -EH /usr/bin/python -m debugpy --log-to-stderr --wait-for-client --listen 0.0.0.0:5678 /usr/bin/paster serve --reload $CKAN_INI
else
    sudo -u ckan -EH paster serve --reload $CKAN_INI
fi
