#!/bin/bash -x
# sudo npm install -g uglifycss uglify-js html-minifier

# This will min all of the required html/css/js. Move files from /build to root and update css/js links in index.html (and in css)
# Web miner does not work for RandomX, need to support multiple coins for it to work. See: https://github.com/notgiven688/webminerpool

uglifycss --output build/style_min.css build/assets/css/style.css &&\
uglifycss --output build/main_min.css build/assets/css/main.css &&\
uglifycss --output build/responsiveStyles_min.css build/assets/css/responsiveStyles.css &&\
uglifyjs  --output build/script_min.js script.js web_miner/miner.js &&\
uglifyjs  --output build/worker.js web_miner/worker.js &&\
cp build/css/noscript.css build/noscript.css &&\
cp build/css/fontawesome-all.min.css build/fontawesome-all.min.css &&\
cp web_miner/cn.min.js build/cn.min.js &&\
html-minifier --output build/index-raw.html index.html --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true &&\
node critical.js &&\
rm build/index-raw.html &&\
echo OK
