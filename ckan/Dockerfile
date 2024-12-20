FROM depositar/ckan-base:release-data-depositar-io-py3.10

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

ENV CKAN__PLUGINS="activity dcat depositar_iso639 data_depositario depositar_theme_rep_str depositar_theme ark citation wikidatakeyword showcase dcat_json_interface structured_data stats datastore resource_proxy datapusher_plus datatables_view recline_view text_view image_view webpage_view recline_grid_view recline_map_view audio_view video_view pdf_view spatial_metadata spatial_query geo_view geojson_view wmts_view shp_view scheming_datasets envvars"

USER root

# ckan/ckan-docker#196
RUN mkdir /srv/app/.local && chown ckan /srv/app/.local

USER ckan

RUN pip3 install -e git+https://github.com/depositar/ckanext-data-depositario.git#egg=ckanext-data-depositario && \
    pip3 install -r ${SRC_DIR}/ckanext-data-depositario/requirements.txt && \
    # Install other required extesions
    pip3 install -r ${SRC_DIR}/ckanext-spatial/pip-requirements.txt && \
    pip3 install -r ${SRC_DIR}/ckanext-dcat/requirements.txt && \
    pip3 install -r ${SRC_DIR}/datapusher-plus/requirements.txt && \
    # Update CKAN config
    ckan config-tool ${CKAN_INI} -f ${SRC_DIR}/ckanext-data-depositario/config/custom_options.ini && \
    ckan config-tool ${CKAN_INI} "ckan.plugins = ${CKAN__PLUGINS}" && \
    ckan config-tool ${CKAN_INI} "licenses_group_url = file://${SRC_DIR}/ckanext-data-depositario/ckanext/data_depositario/public/license_list.json"

# sed needs to create a temp file
USER ckan-sys

RUN sed -i -e '/^\[app:main\]/a\\' -e '/^\[app:main\]/r '${SRC_DIR}'/ckanext-data-depositario/config/custom_options_extra.ini' ${CKAN_INI}

USER root

RUN chown ckan:ckan-sys ${CKAN_INI}

# Copy qsv 0.138.0 and Supervisor configuration for datapusher-plus
RUN apt-get install --no-install-recommends -y uchardet
COPY --chown=ckan-sys:ckan-sys qsvdp /usr/local/bin
COPY setup/supervisor-ckan-worker.conf /etc/supervisord.d

# Copy custom initialization scripts
COPY --chown=ckan-sys:ckan-sys docker-entrypoint.d/* /docker-entrypoint.d/

# Apply any patches needed to CKAN core or any of the built extensions (not the
# runtime mounted ones)
COPY --chown=ckan-sys:ckan-sys patches ${APP_DIR}/patches

USER ckan

RUN for d in $APP_DIR/patches/*; do \
        if [ -d $d ]; then \
            for f in `ls $d/*.patch | sort -g`; do \
                cd $SRC_DIR/`basename "$d"` && echo "$0: Applying patch $f to $SRC_DIR/`basename $d`"; patch -p1 < "$f" ; \
            done ; \
        fi ; \
    done
