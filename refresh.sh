#!/bin/bash
base_dir=$(cd "$(dirname "$0")";pwd)

echo "Refreshing folders from "${base_dir}
rm -r ${base_dir}/about
rm -r ${base_dir}/archives
rm -r ${base_dir}/categories
rm -r ${base_dir}/css
rm -r ${base_dir}/en
rm -r ${base_dir}/images
rm -r ${base_dir}/lib
rm -r ${base_dir}/js
rm -r ${base_dir}/page
rm -r ${base_dir}/tags
rm -r ${base_dir}/zh-Hans
rm -r ${base_dir}/index.html
rm -r ${base_dir}/search.xml

cp -R ${base_dir}/public/about ${base_dir}/about
cp -R ${base_dir}/public/archives ${base_dir}/archives
cp -R ${base_dir}/public/categories ${base_dir}/categories
cp -R ${base_dir}/public/css ${base_dir}/css
cp -R ${base_dir}/public/en ${base_dir}/en
cp -R ${base_dir}/public/images ${base_dir}/images
cp -R ${base_dir}/public/lib ${base_dir}/lib
cp -R ${base_dir}/public/js ${base_dir}/js
cp -R ${base_dir}/public/page ${base_dir}/page
cp -R ${base_dir}/public/tags ${base_dir}/tags
cp -R ${base_dir}/public/zh-Hans ${base_dir}/zh-Hans
cp -R ${base_dir}/public/index.html ${base_dir}/index.html
cp -R ${base_dir}/public/search.xml ${base_dir}/search.xml

echo "Done!"