consul agent \
  -server \
  -bootstrap-expect=2 \
  -bind=10.0.0.10 \
  -data-dir=/tmp/consul \
  -config-dir=/etc/consul.d