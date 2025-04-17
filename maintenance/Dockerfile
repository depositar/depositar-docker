FROM busybox:musl

WORKDIR /home/
COPY ./entrypoint.sh .

WORKDIR /home/static
COPY ./static/ .
RUN sed -i "s/{{TIME}}/$(echo ${TIME})/g" ./index.html

ENTRYPOINT [ "sh", "/home/entrypoint.sh" ]