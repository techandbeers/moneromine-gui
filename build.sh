#!/bin/bash -x
# sudo npm install -g uglifycss uglify-js html-minifier

#Web miner does not work for RandomX, need to support multiple coins for it to work. See: https://github.com/notgiven688/webminerpool

uglifycss --output build/style_min.css style.css &&\
uglifyjs  --output build/script_min.js script.js web_miner/miner.js &&\
uglifyjs  --output build/worker.js web_miner/worker.js &&\
cp web_miner/cn.min.js build/cn.min.js &&\
html-minifier --output build/index-raw.html index.html --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype --minify-css true --minify-js true &&\
node critical.js &&\
rm build/index-raw.html &&\
echo OK
