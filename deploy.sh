git pull && \
sudo systemctl restart mysql.service && \
sudo systemctl reload nginx && \
pushd webapp/go/ && \
make && \
popd