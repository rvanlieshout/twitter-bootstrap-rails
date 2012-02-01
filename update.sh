#!/bin/bash
#
# Fetches latest assets and toolkit from twitter/bootstrap 2.0-wip branch
#
git clone git://github.com/twitter/bootstrap.git ../bootstrap && \
cd ../bootstrap && \
git checkout 2.0-wip && \
cd ../twitter-bootstrap-rails && \
rm -rf ./vendor/toolkit/twitter/bootstrap/* && \
cp -v ../bootstrap/less/*.less ./vendor/toolkit/twitter/bootstrap/ && \
rm -rf ./vendor/assets/javascripts/twitter/bootstrap/* && \
cp -v ../bootstrap/js/*.js ./vendor/assets/javascripts/twitter/bootstrap/
ls ../bootstrap/js/*.js | sed s/\s/\\n/ | sed "s/.*\///" | sed s/.js// | sed '/popover/d' | sed "s/^/\/\/= require twitter\/bootstrap\//" > vendor/assets/javascripts/twitter/bootstrap.js && \
echo "//= require twitter/bootstrap/bootstrap-popover" >> vendor/assets/javascripts/twitter/bootstrap.js && \
cp -v ../bootstrap/img/* ./vendor/assets/images/ && \
cp vendor/toolkit/twitter/bootstrap/sprites.less sprite.less && \
cat sprite.less | sed "s/url.\.\.\/img\//image-url\(/" > vendor/toolkit/twitter/bootstrap/sprites.less && \
rm sprite.less && \
rm -rf ../bootstrap
