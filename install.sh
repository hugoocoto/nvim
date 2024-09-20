#!/bin/bash


CONFIG_NVIM="$HOME/.config/nvim"
NEW_NVIM_FOLDER="./nvim"
NVIM_PACKER="$HOME/.config/nvim/lua/hugo/packer.lua"

# Verificar si la carpeta .config/nvim existe
if [ -d "$CONFIG_NVIM" ]; then
    BACKUP_FOLDER="$HOME/.config/nvim_backup_$(date +%Y%m%d_%H%M%S)"
    echo "[+] Moving $CONFIG_NVIM to $BACKUP_FOLDER"

    # Mover la carpeta y manejar errores
    if mv "$CONFIG_NVIM" "$BACKUP_FOLDER"; then
        echo "[+] Backup created at $BACKUP_FOLDER"
    else
        echo "[-] Error moving $CONFIG_NVIM to $BACKUP_FOLDER" >&2
        exit 1
    fi
fi

echo "[+] Installing packer"
if git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim > ./log 2>&1 ; then
    echo "[+] Installed"
else
    echo "[-] Error installing packer"
fi


# Copiar la nueva carpeta
echo "[+] Copying $NEW_NVIM_FOLDER to $CONFIG_NVIM"
if cp -r "$NEW_NVIM_FOLDER" "$CONFIG_NVIM" ; then
    echo "[+] Config moved"
else
    echo "[-] Error moving $NEW_NVIM_FOLDER to $CONFIG_NVIM" >&2
    exit 1
fi

echo "[+] Removing after folder"
if rm -fr "$CONFIG_NVIM/after" ; then
    echo "[+] Removed "
else
    echo "[-] Error moving $NEW_NVIM_FOLDER to $CONFIG_NVIM" >&2
    exit 1
fi

# Instalar paquetes usando Packer
echo "[+] Installing packages"
if ! nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' > ./log 2>&1 ; then
    echo "[-] Error sourcing packer config" >&2

else
    echo "[+] Packages installed and compiled successfully."
fi

echo "[+] Copying after folder"
if cp -r "$NEW_NVIM_FOLDER/after" "$CONFIG_NVIM/after" ; then
    echo "[+] Copied"
else
    echo "[-] Error moving $NEW_NVIM_FOLDER to $CONFIG_NVIM" >&2
    exit 1
fi

