# nvim

Nvim config with installation script.

> ![NOTE]
> Despite installation script shows some errors,
> nvim config is set correctly.

Errors in the status bar reports plugins that require
user actions. You can remove this plugin by removing it
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
