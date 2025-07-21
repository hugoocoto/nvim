#/bin/bash

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"

nvim_config_dir=~/.config/nvim
nvim_backup_dir=~/.config/nvim_old

if [ -d "$nvim_config_dir" ]; then
        mkdir -p $nvim_backup_dir
        new_backup_dir=$nvim_backup_dir/`date --iso-8601=seconds`
        mv $nvim_config_dir $new_backup_dir
fi

if [ "$1" == "-l" ]; then
	ln -s $SCRIPT_DIR $nvim_config_dir
else
	mkdir $nvim_config_dir
	cp $SCRIPT_DIR/init.lua $nvim_config_dir
fi

nvim --headless -c "Lazy! install" -c "qa" 

