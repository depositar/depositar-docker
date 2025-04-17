#! /bin/sh
sed -i "s/{{time}}/${TIME}/g" ./index.html

/bin/httpd -f -v -p 3000 -c httpd.conf