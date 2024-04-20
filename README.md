# <h1 align="center">A theme for neovim</h1>
![](https://github.com/Skalyaeve/images-1/blob/main/screenshot/nvim-theme.png)

## Install
- Plugin Manager:
```
Skalyaeve/a-nvim-theme
```
- Manual:
```sh
dst=~/.config/nvim/pack/themes/start
mkdir -p $dst && cd $dst
git clone https://github.com/Skalyaeve/a-nvim-theme.git
mkdir -p ~/.config/nvim/colors
ln -s $PWD/a-nvim-theme/colors/neon.vim ~/.config/nvim/colors/neon.vim
```

- `init.lua`:
```lua
vim.cmd('colorscheme neon')
```

- `init.vim`:
```vim
colorscheme neon
```
