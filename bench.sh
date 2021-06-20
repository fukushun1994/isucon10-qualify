pushd bench && \
sudo bash -c 'echo "" > /var/log/mysql/mysql-slow.log' && \
sudo bash -c 'echo "" > /var/log/nginx/access.log' && \
sudo systemctl restart mysql.service && \
sudo systemctl reload nginx && \
sudo systemctl restart isuumo.go.service && \
./bench -target-url http://127.0.0.1 && \
popd