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

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#000040')
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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Open nerdtree, but move to available buffer.
exec "normal! \<c-w>\<c-w>"
"Leader is now 'm' "
:let mapleader = "m"
:inoremap jj <ESC>
"put an empty line above this one
:nnoremap <Leader>- Ojjj
"put an empty line below this one
:nnoremap <Leader>_ ojjk
:nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
"Double {{ will open braces for a function 
:inoremap {{ {<ESC>o}<ESC>O
"wrap the current word in quotes
:inoremap <Leader>" <ESC>viwa"<ESC>bi"<ESC>lel
"wrap the selection in quotes
:vnoremap <Leader>" <ESC>`<i"<ESC>`>a"
"Don't use ESC!
:inoremap <ESC> <nop>
