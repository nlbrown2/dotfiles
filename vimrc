" list of plugins
" YouCompleteMe
" ack.vim
" ctrlp
" nerdtree
" nerdtree-git-plugin
" tern_for_vim
" tmuxline.vim
" undotree
" vim-better-whitespace
" vim-colors-solarized
" vim-commentary
" vim-fugitive
" vim-jsx
" vim-markdown-preview
" vim-multiple-cursors
" vim-on-write
" vim-qargs
" vim-signature
set nocompatible              " be iMproved, required
filetype off                  " required
set expandtab
set tabstop=4
set shiftwidth=4
if !has('nvim')
  execute pathogen#infect()
endif
filetype off
syntax on
set number
filetype plugin indent on
" colorscheme 1989
" set wildchar=<Tab> wildmenu wildmode=full
set clipboard^=unnamed
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#000040')
call NERDTreeHighlightFile('h', 'green', 'none', 'green', '#000040')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('md', 'green', 'none', '#3366FF', '#000040')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#73dd27', '#000040')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#000040')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#000040')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#000040')
call NERDTreeHighlightFile('js', 'Red', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('jsx', 'Red', 'none', 'yellow', '#000040')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#000040')
call NERDTreeHighlightFile('Python', 'blue', 'none', '#3366FF', '#000040')
call NERDTreeHighlightFile('sh', 'yellow', 'NONE', 'red', '#000040')
call NERDTreeHighlightFile('py', 'blue', 'none', '#ffa500', '#000040')
call NERDTreeHighlightFile('pyc', 'blue', 'none', '#ffa500', '#000040')
call NERDTreeHighlightFile('txt', 'Red', 'none', '#fc16ca', '#000040')
call NERDTreeHighlightFile('babelrc', 'Red', 'none', 'red', '#000040')
call NERDTreeHighlightFile('lock', 'Red', 'none', 'red', '#000040')
call NERDTreeHighlightFile('cpp', 'lightblue', 'none', 'blue', '#000040')
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
:let mapleader = "\\"
:inoremap jj <ESC>
"put an empty line above this one
:nnoremap <Leader>- O<ESC>j
"put an empty line below this one
:nnoremap <Leader>_ o<ESC>k
:nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
"Double {{ will open braces for a function
:inoremap {{ {<ESC>o}<ESC>O
"wrap the current word in quotes
:noremap <Leader>" <ESC>viw<ESC>a"<ESC>bi"<ESC>lel
"wrap the selection in quotes
:vnoremap <Leader>" <ESC>`<i"<ESC>`>la"
"Easier window management
:noremap <C-h> <C-w><c-h>
:noremap <C-j> <C-w><c-j>
:noremap <C-k> <C-w><c-k>
:noremap <C-l> <C-w><c-l>
" :inoremap <Tab> <C-n>
:noremap gm `
:vnoremap <Space> <ESC>

function! Strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

" change quit key for multi cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='j'
set modifiable

" next two lines allow pasting in visual mode w/o overwriting the buffer
xnoremap p pgvy
:xnoremap <expr> p 'pgv"'.v:register.'y`>'
highlight ColorColumn ctermbg=darkred

" clang format options
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
