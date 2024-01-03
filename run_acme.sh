acme.sh --issue --dns dns_ali -d jordanyang.scutbot.cn
acme.sh --install-cert -d jordanyang.scutbot.cn \
--key-file       /var/www/wordpress/nginx/cert/jordanyang.key \
--fullchain-file /var/www/wordpress/nginx/cert/jordanyang.crt \
--reloadcmd     "docker restart wp_nginx"
