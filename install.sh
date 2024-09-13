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

echo "Installing packer"
if git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim; then
    echo "[+] Installed"
else
    echo "[-] Error installing packer">&2
    exit 1
fi


# Copiar la nueva carpeta
echo "[+] Copying $NEW_NVIM_FOLDER to $CONFIG_NVIM"
if mv "$NEW_NVIM_FOLDER" "$CONFIG_NVIM"; then
    echo "[+] Config moved"
else
    echo "[-] Error moving $NEW_NVIM_FOLDER to $CONFIG_NVIM" >&2
    exit 1
fi

# Instalar paquetes usando Packer
echo "[+] Installing packages"

echo "    Source packer config        [--      ]"
if ! nvim --headless +"so $NVIM_PACKER" +q; then
    echo "[-] Error sourcing packer config" >&2
    exit 1
fi

echo "    Installing packages         [----    ]"
if ! nvim --headless +"PackerInstall" +q; then
    echo "[-] Error installing packages" >&2
    exit 1
fi

echo "    Installing packages (check) [------  ]"
if ! nvim --headless +"PackerInstall" +q; then
    echo "[-] Error on package installation check" >&2
    exit 1
fi

echo "    Compiling packer            [--------]"
if ! nvim --headless +"PackerCompile" +q; then
    echo "[-] Error compiling packer" >&2
    exit 1
fi

echo "[+] Packages installed and compiled successfully."

