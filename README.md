# nvim

Nvim config with installation script.

> [!NOTE]
> Despite installation script shows some errors,
> nvim config is set correctly.

Errors in the status bar reports user actions required
by some plugins. You can remove those plugins by removing it
from .config/nvim/lua/hugo/packer.lua and reloading the
packages.

### How to update - reload packages

Go to .config/nvim/lua/hugo/packer.lua and do the following
commands:

```lua
:so
:PackerSync
:PackerCompile
```

### Cheatsheet

There are a file called ./vim_cheatsheet.md with (almost) all the mappings.

### How to learn a bit more

I copy the config from @ThePrimeagen and do my own modifications.
So [this video](https://youtu.be/w7i4amO_zaE?si=fkHsVl8H6WOGavTf) should explain a little more about the config.
