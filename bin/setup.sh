# Load nvm
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# node
node_version=$(node -v)
if [[ $node_version =~ ^v18 ]]
then
  echo 'node' $node_version
else
  nvm_version=$(nvm --version)
  if [[ $nvm_version =~ ^[0-9] ]]
  then
    echo 'check nvm installed.'
  else
    echo 'install nvm.'
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    echo 'installed nvm.'
  fi
  nvm_check=$(nvm ls 18)
  if [[ $nvm_check =~ v18 ]]
  then
    echo 'check node v18 installed.'
  else
    nvm install node 18
    echo 'install node v18.'
  fi
  nvm use v18
  node_version=$(node -v)
  echo 'use node' $node_version
fi

# yarn
yarn_version=$(yarn -v)
if [[ $yarn_version =~ ^[0-9] ]]
then
  echo 'check yarn installed.'
else
  echo 'install yarn.'
  npm install -g yarn
  echo 'installed yarn.'
fi

# lerna
lerna_version=$(lerna -v)
if [[ $lerna_version =~ ^[0-9] ]]
then
  echo 'check lerna installed.'
else
  echo 'install lerna.'
  yarn global add lerna
  echo 'installed lerna.'
fi
yarn bootstrap

# setup script
node scripts/setup.js
