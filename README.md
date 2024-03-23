# A Vim theme
![](https://github.com/Skalyaeve/images/blob/main/screenshot/vim-theme.png)

## Installation
- Via vim-plug:
```vim
call plug#begin()
...
Plug 'Skalyaeve/a-vim-theme'
...
call plug#end()
```
```vim
:PlugInstall
```
- Manually:
```sh
mkdir -p ~/.vim/colors
https://github.com/Skalyaeve/a-vim-theme.git ~/.vim/colors/neon
```

Also make sure these lines are in your `.vimrc`:
```vim
syntax on
if (has("termguicolors"))
    set termguicolors
endif
colorscheme neon
```

I also recommend theses plugins for better syntax highlighting:
- LSP: [prabirshrestha/vim-lsp](https://github.com/prabirshrestha/vim-lsp)
- Shell syntax: [lunacookies/vim-sh](https://github.com/lunacookies/vim-sh)
