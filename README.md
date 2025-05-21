# nvim

Nvim config with installation script.

### Quick setup

>> [!CAUTION]
> After nvim 0.11 installation script does not work. Im planning to
> fix it when I have time. It is possible to use a previous commit to
> install it.

> [!NOTE]
> Nvim version have to be 0.9+
``` sh
git clone https://github.com/hugocotoflorez/nvim
cd nvim
./install.sh
```

You should have your neovim set. Open nvim to check. If some
packages where not be installed, reload packages.

Errors in the status bar reports user actions required
by some plugins. You can remove those plugins by removing it
from .config/nvim/lua/hugo/packer.lua and reloading the
packages.

### First steps

[video](https://youtu.be/hmRQnlduRI0?si=D3b94qrLLSUw36vj)

- 1 **Remove wakatime if not needed**: Go to .config/nvim/lua/hugo/packer and remove the line with `use ..wakatime..`
- 2 **Remove Obsidian if not needed**: Go to .config/nvim/after/plugin and delete obsidian.lua. Then go to .config/nvim/lua/hugo/packer.lua and remove the `use({...})` which contains ..obsidian..

> [!CAUTION]
> Some ubuntu users report issues with clipboard. It can be fixed by installing wl-clipboard: `apt install wl-clipboard`.

### How to update - reload packages

Go to .config/nvim/lua/hugo/packer.lua and do the following commands:

```lua
:so
:PackerSync
:PackerCompile
```

### Cheatsheet

There is a file called ./vim_cheatsheet.md with (almost) all the mappings.

### How to learn a bit more

I copy the config from @ThePrimeagen and do my own modifications.
So [this video](https://youtu.be/w7i4amO_zaE?si=fkHsVl8H6WOGavTf) should explain a little more about the config.
