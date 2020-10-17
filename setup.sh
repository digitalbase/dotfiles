# inspired by https://gist.github.com/w3cj/76cd9fb9f346e153b6f0dc46fd025620

xcode-select --install
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install stable

npm install -g lite-server eslint