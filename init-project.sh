# requires:
#   nvm

# store location we call this from and location of script 
PROJECT_DIR=$(pwd)
SCRIPT_DIR=$(dirname "$0")

# setup nvm for latest lts version of node
. ~/.nvm/nvm.sh
nvm install --lts
nvm use --lts
node -v > .nvmrc

# set up npm project
npm init
npm install yarn -g
mkdir src && touch $PROJECT_DIR/src/index.ts

yarn add nodemon prettier eslint jest jest-junit ts-jest \
        eslint-config-airbnb-typescript eslint-config-prettier \
        eslint-plugin-eslint-comments eslint-plugin-import \
        eslint-plugin-prettier -D

yarn add ts-node @types/node typescript pre-push

# copy config files
cp -a $SCRIPT_DIR/config/. $PROJECT_DIR

# Merge the package.json modifier (scripts and tooling config)
PACKAGE=$(jq -s '.[0] * .[1]' $PROJECT_DIR/package.json $SCRIPT_DIR/package-modifiers.json)
rm -rf $PROJECT_DIR/package.json
echo $PACKAGE > $PROJECT_DIR/package.json
