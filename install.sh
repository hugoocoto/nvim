#!/bin/bash

# La migracion de packer a lazy la hizo chatgpt
# No está probado

CONFIG_NVIM="$HOME/.config/nvim"
NEW_NVIM_FOLDER="./nvim"
LAZY_PATH="$HOME/.local/share/nvim/lazy/lazy.nvim"

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

# Instalar Lazy.nvim
echo "[+] Installing lazy.nvim"
if git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_PATH" > ./log 2>&1; then
    echo "[+] lazy.nvim installed successfully"
else
    echo "[-] Error installing lazy.nvim" >&2
    exit 1
fi

# Copiar la nueva configuración de Neovim
echo "[+] Copying $NEW_NVIM_FOLDER to $CONFIG_NVIM"
if cp -r "$NEW_NVIM_FOLDER" "$CONFIG_NVIM"; then
    echo "[+] Config copied"
else
    echo "[-] Error copying $NEW_NVIM_FOLDER to $CONFIG_NVIM" >&2
    exit 1
fi

# Eliminar carpeta 'after' si existe en el nuevo config
echo "[+] Removing after folder"
if rm -fr "$CONFIG_NVIM/after"; then
    echo "[+] Removed"
else
    echo "[-] Error removing 'after' folder" >&2
    exit 1
fi

# Lanzar Neovim en modo headless para instalar plugins con Lazy
echo "[+] Installing packages with lazy.nvim"
if ! nvim --headless "+Lazy! sync" +qa > ./log 2>&1; then
    echo "[-] Error installing packages with lazy.nvim" >&2
    exit 1
else
    echo "[+] Plugins installed successfully"
fi

# Copiar la carpeta after al final
echo "[+] Copying after folder"
if cp -r "$NEW_NVIM_FOLDER/after" "$CONFIG_NVIM/after"; then
    echo "[+] Copied"
else
    echo "[-] Error copying 'after' folder" >&2
    exit 1
fi

