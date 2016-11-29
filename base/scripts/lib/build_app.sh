set -e

COPIED_APP_PATH=/copied-app
BUNDLE_DIR=/tmp/bundle-dir

# sometimes, directly copied folder cause some wierd issues
# this fixes that
cp -R /app $COPIED_APP_PATH
cd $COPIED_APP_PATH/app

meteor build --verbose --directory $BUNDLE_DIR --server=http://localhost:3000

cd $BUNDLE_DIR/bundle/programs/server/

sed -i -e 's/"fibers": "1.0.*",/"fibers": "1.0.10",/g' npm/promise/node_modules/meteor-promise/package.json npm/babel-compiler/node_modules/meteor-babel/package.json package.json
rm npm-shrinkwrap.json

echo "Start npm i"

npm i

cp -R $BUNDLE_DIR/bundle /built_app

# cleanup
rm -rf $COPIED_APP_PATH
rm -rf $BUNDLE_DIR
rm -rf ~/.meteor
rm /usr/local/bin/meteor
