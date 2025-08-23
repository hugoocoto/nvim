#!/usr/bin/env bash

# curl -Lo es.oxt https://extensions.openoffice.org/en/download/18972
# unzip -d es es.oxt
# nvim --headless -c "mkspell! es es/es_ES" -c "q!"
# rm -rf es.oxt es
# mkdir -p ~/.local/share/nvim/site/spell/
# mv es.utf-8.spl ~/.local/share/nvim/site/spell/

# if this stop working you can use the first one
wget https://ftp.nluug.nl/vim/runtime/spell/es.utf-8.spl
mkdir -p ~/.local/share/nvim/site/spell/
mv es.utf-8.spl ~/.local/share/nvim/site/spell/
