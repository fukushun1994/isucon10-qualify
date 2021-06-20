git pull && \
sudo cp mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf && \
sudo bash -c 'echo "" > /var/log/mysql/mysql-slow.log' && \
sudo bash -c 'echo "" > /var/log/nginx/access.log' && \
sudo systemctl restart mysql.service && \
sudo systemctl restart nginx && \
sudo systemctl restart isuumo.go.service && \
pushd webapp/go/ && \
make && \
popd