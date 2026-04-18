#/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"

nvim_config_dir=$HOME/.config/nvim
nvim_backup_dir=$HOME/.config/nvim_old

if [ -d "$nvim_config_dir" ]; then
        mkdir -p $nvim_backup_dir
        new_backup_dir=$nvim_backup_dir/`date --iso-8601=seconds`
        mv $nvim_config_dir $new_backup_dir
else
        mkdir -p $nvim_config_dir
fi

if [ "$1" == "-l" ]; then
	ln -s $SCRIPT_DIR $nvim_config_dir
else
	mkdir -p $nvim_config_dir
	cp $SCRIPT_DIR/init.lua $nvim_config_dir
fi

if [[ ! -f "$HOME/.local/share/nvim/site/spell/es.utf-8.spl" ]]; then
    cp "$SCRIPT_DIR/es.utf-8.spl" "$HOME/.local/share/nvim/site/spell/"
fi
