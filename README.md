<h1 align="center"># Un theme pour vim</h1>
![](https://github.com/Skalyaeve/images-1/blob/main/screenshot/vim-theme.png)

## Installation
### .vimrc
```vim
call plug#begin()
...
Plug 'Skalyaeve/a-vim-theme'
...
call plug#end()

syntax on
if (has("termguicolors"))
    set termguicolors
endif
colorscheme neon
...
```
```vim
:source %
:PlugInstall
```
