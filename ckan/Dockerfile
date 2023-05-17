FROM depositar/ckan-base:latest

# Set up environment variables
ENV APP_DIR=/srv/app
ENV TZ=UTC
RUN echo ${TZ} > /etc/timezone

# Make sure both files are not exactly the same
RUN if ! [ /usr/share/zoneinfo/${TZ} -ef /etc/localtime ]; then \
        cp /usr/share/zoneinfo/${TZ} /etc/localtime ;\
    fi ;

COPY setup/prerun.py.override ${APP_DIR}/prerun.py
COPY setup/supervisor-ckan-worker.conf /etc/supervisord.d/

# Install necessary packages to run depositar
RUN apk add --no-cache --virtual .build-deps \
        gcc \
        g++ \
        python3-dev \
        geos-dev \
        proj-util \
        proj-dev

# Install depositar
RUN pip3 install -e git+https://github.com/depositar/ckanext-data-depositario.git#egg=ckanext-data-depositario && \
    pip3 install -r ${SRC_DIR}/ckanext-data-depositario/requirements.txt && \
    # Install other required extesions
    pip3 install -r ${SRC_DIR}/ckanext-spatial/pip-requirements.txt && \
    pip3 install -r https://raw.githubusercontent.com/ckan/ckanext-xloader/master/requirements.txt && \
    pip3 install messytables && \
    pip3 install -r ${SRC_DIR}/ckanext-dcat/requirements.txt && \
    pip3 install -r ${SRC_DIR}/ckanext-harvest/pip-requirements.txt && \
    # Update CKAN config
    ckan config-tool ${CKAN_INI} -f ${SRC_DIR}/ckanext-data-depositario/config/custom_options.ini && \
    ckan config-tool ${CKAN_INI} "licenses_group_url = file://${SRC_DIR}/ckanext-data-depositario/ckanext/data_depositario/public/license_list.json"
