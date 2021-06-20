git pull && \
sudo bash -c 'echo "" > /var/log/mysql/mysql-slow.log' && \
sudo bash -c 'echo "" > /var/log/nginx/access.log' && \
sudo systemctl restart mysql.service && \
sudo systemctl reload nginx && \
pushd webapp/go/ && \
make && \
popd