#!/bin/bash
VERSION=1.21.3
rm -rf nginx.tgz build final
curl -o nginx.tgz http://nginx.org/download/nginx-${VERSION}.tar.gz
mkdir build final
tar -zxf ./nginx.tgz -C build --strip-components=1
(
  cd build
  ./configure --prefix=/app/nginx --with-http_ssl_module --without-http_fastcgi_module --without-http_uwsgi_module --without-http_grpc_module --without-http_scgi_module --without-mail_imap_module --without-mail_pop3_module
  make -j4
  make DESTDIR=../final install
)

