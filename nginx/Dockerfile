FROM jonasal/nginx-certbot:5.4

ENV NGINX_DIR=/etc/nginx

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
 wget curl dnsutils

# https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/blob/master/AUTO-CONFIGURATION.md
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/install-ngxblocker -O /usr/local/sbin/install-ngxblocker
WORKDIR /usr/local/sbin
RUN chmod +x install-ngxblocker
RUN install-ngxblocker -x
