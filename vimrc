set nocompatible              " be iMproved, required
filetype off                  " required
set expandtab
set tabstop=2
set shiftwidth=2
execute pathogen#infect()
filetype off
syntax on
set number
filetype plugin indent on
colorscheme darkblue
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
set wildchar=<Tab> wildmenu wildmode=full
let vim_markdown_preview_github=1
set clipboard^=unnamed
:imap jj <ESC>
