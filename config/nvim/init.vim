set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog = '/home/nathan/.config/nvim/venv/bin/python'
let g:dein#install_process_timeout = 5000
set termguicolors

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/nathan/.cache/nvim/./repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/nathan/.cache/nvim/.')
    call dein#begin('/home/nathan/.cache/nvim/.')

    " Let dein manage dein
    " Required:
    call dein#add('/home/nathan/.cache/nvim/./repos/github.com/Shougo/dein.vim')
    call dein#add('neovim/nvim-lsp') " integrated LSP client
    call dein#add('ervandew/supertab') " Better autocomplete with LSP client
    call dein#add('Chiel92/vim-autoformat') " Format on save
    call dein#add('flazz/vim-colorschemes') " colorscheme pack
    call dein#add('neomake/neomake') " Async linting and Makefile integration
    call dein#add('mileszs/ack.vim') " Faster grep
    call dein#add('scrooloose/nerdtree') " File tree
    call dein#add('tpope/vim-commentary') " comment/uncomment blocks and lines
    call dein#add('tpope/vim-fugitive') " git plugin
    call dein#add('terryma/vim-multiple-cursors') " ...multiple cursors
    call dein#add('ntpeters/vim-better-whitespace') " highlight and remove trailing whitespace
    call dein#add('sakhnik/nvim-gdb', {'build': './install.sh'}) " gdb and lldb plugin
    call dein#add('kshenoy/vim-signature') " Show marks
    call dein#add('octol/vim-cpp-enhanced-highlight') " better C++ syntax highlighting
    call dein#add('iamcco/markdown-preview.nvim', { 'on_ft': ['markdown', 'pandoc.markdown', 'rmd'], 'build': 'cd app & yarn install'  }) " Markdown preview when writing documentation
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/deoplete-lsp')
    " call dein#add('Shougo/neoinclude.vim')
    call dein#add('dylanaraps/wal.vim') " Integration to system theme via wal
    call dein#add('xuhdev/vim-latex-live-preview') " Preview Latex documents while writing them
    call dein#add('morhetz/gruvbox')
    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set expandtab
set tabstop=4
set shiftwidth=4
syntax on
set number
filetype plugin indent on
" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('h', 'green', 'none', 'green', '#000040')
call NERDTreeHighlightFile('md', 'green', 'none', '#3366FF', '#000040')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#73dd27', '#000040')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#000040')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#000040')
call NERDTreeHighlightFile('js', 'Red', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#000040')
call NERDTreeHighlightFile('Python', 'blue', 'none', '#3366FF', '#000040')
call NERDTreeHighlightFile('sh', 'yellow', 'NONE', 'red', '#000040')
call NERDTreeHighlightFile('py', 'blue', 'none', '#ffa500', '#000040')
call NERDTreeHighlightFile('pyc', 'blue', 'none', '#ffa500', '#000040')
call NERDTreeHighlightFile('txt', 'Red', 'none', '#fc16ca', '#000040')
call NERDTreeHighlightFile('lock', 'Red', 'none', 'red', '#000040')
call NERDTreeHighlightFile('cpp', 'lightblue', 'none', 'blue', '#000040')
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
:let mapleader = "\\"
:inoremap jj <ESC>
:nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
"Double {{ will open braces for a function
:inoremap {{ {<ESC>o}<ESC>O
"Easier window management
:noremap <C-h> <C-w><c-h>
:noremap <C-j> <C-w><c-j>
:noremap <C-k> <C-w><c-k>
:noremap <C-l> <C-w><c-l>
:noremap gm `
:vnoremap <Space> <ESC>
let g:ackhighlight=1
highlight ColorColumn ctermbg=darkred

set clipboard^=unnamed
set clipboard+=unnamedplus
set completeopt=menu

call neomake#configure#automake('nrwi', 200)

" Terminal escape is also jj
tnoremap jj <C-\><C-n>

let g:multi_cursor_quit_key = '<ESC>'

set nohlsearch

nnoremap <leader>m :Neomake<CR>
colorscheme gruvbox
autocmd TermOpen * DisableWhitespace
au BufRead,BufNewFile *.cuh set filetype=cpp " proper cuda syntax highlighting
let g:airline_powerline_fonts=1

lua require'nvim_lsp'.rust_analyzer.setup{}
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd BufWrite * :Autoformat
nnoremap <leader>c :!cargo clippy

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deoplete#enable_at_startup = 1
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
set background=dark
