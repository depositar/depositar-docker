FROM jonasal/nginx-certbot:5.4

ENV NGINX_DIR=/etc/nginx

RUN apt-get update &&  apt-get install --no-install-recommends --no-install-suggests -y \
 wget

# https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/blob/master/MANUAL-CONFIGURATION.md
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/conf.d/globalblacklist.conf -O ${NGINX_DIR}/conf.d/globalblacklist.conf
RUN mkdir ${NGINX_DIR}/bots.d 
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/bots.d/blockbots.conf -O ${NGINX_DIR}/bots.d/blockbots.conf
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/bots.d/ddos.conf -O ${NGINX_DIR}/bots.d/ddos.conf
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/bots.d/whitelist-ips.conf -O ${NGINX_DIR}/bots.d/whitelist-ips.conf
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/bots.d/whitelist-domains.conf -O ${NGINX_DIR}/bots.d/whitelist-domains.conf
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/bots.d/blacklist-user-agents.conf -O ${NGINX_DIR}/bots.d/blacklist-user-agents.conf
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/bots.d/custom-bad-referrers.conf -O ${NGINX_DIR}/bots.d/custom-bad-referrers.conf
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/bots.d/blacklist-ips.conf -O ${NGINX_DIR}/bots.d/blacklist-ips.conf
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/bots.d/bad-referrer-words.conf -O ${NGINX_DIR}/bots.d/bad-referrer-words.conf
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/conf.d/botblocker-nginx-settings.conf -O ${NGINX_DIR}/conf.d/botblocker-nginx-settings.conf
