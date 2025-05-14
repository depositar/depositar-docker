FROM busybox:musl

WORKDIR /home/
COPY ./entrypoint.sh .

WORKDIR /home/static
COPY ./static/ .

ENTRYPOINT [ "sh", "/home/entrypoint.sh" ]