# nvim

Nvim config with installation script.

### Quick setup

> [!NOTE] Nvim version has to be 0.11+

```sh git clone https://github.com/hugoocoto/nvim cd nvim ./install.sh ```

You can use the `./install.sh -l` flag to create a symlink instead of copying
the contents of this folder. Make sure that this directory is not moved or
deleted. It’s better to clone the repo into `.config` if you want to keep it
up to date.

### Quickstart

I use Lazy as the package manager. To open Lazy, use `:Lazy`. To add or remove
packages, edit the config block where all packages are listed. I recommend
reading the Lazy wiki before doing so. The few keymaps I use are defined in
the same file. I recommend reading the `init.lua` file. Leader key is `space`.

### Color Scheme

By default, I use my custom color scheme, which is installed as a Lazy
package. To change it, install another color scheme (or use a built-in one),
and modify the line that says `colorscheme shoebill`, replacing `shoebill`
with the desired one.

### Workflow

Terminal-based, single window, minimal setup. Telescope, netrw, and native
Nvim commands to navigate between files. Not using too many custom mappings —
the defaults are pretty good.

### Cheatsheet

There’s a file called `./vim_cheatsheet.md` with (almost) all the mappings.

### Known issues

Clang formatting using LSP fails, so I had to add an `autocmd`. It’ll be fixed
once I figure out the correct configuration.
