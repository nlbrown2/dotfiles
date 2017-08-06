" list of plugins
" YouCompleteMe
" ack.vim
" ctrlp
" nerdtree
" nerdtree-git-plugin
" tern_for_vim
" tmuxline.vim
" undotree
" vim-airline
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
" vim-tmux
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
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
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
:let mapleader = "\\"
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
:vnoremap <Leader>" <ESC>`<i"<ESC>`>la"
"Don't use ESC!
:inoremap <ESC> <nop>
"Easier window management
:noremap <C-h> <C-w><c-h>
:noremap <C-j> <C-w><c-j>
:noremap <C-k> <C-w><c-k>
:noremap <C-l> <C-w><c-l>
call pathogen#helptags()
:inoremap <Tab> <C-n>
:noremap gm `
:vnoremap <Space> <ESC>
"Status line is filename left, modifiled flag, column number right
:set statusline=%f
:set statusline +=%2*%m%*
:set statusline+=%=
:set statusline+=%c
"Ack highlight search term in quickfix window
let g:ackhighlight=1
"Funciton to strip whitespace from a string, useful for arguments
function! Strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function! SearchAndReplace(from, to)
  exec 'Ack ' Strip(a:from)
  exec 'Qdo %s/'.Strip(a:from).'/'.Strip(a:to).'/gc'
endfunction
if !exists("g:SearchAndReplace")
  :command -nargs=* SearchAndReplace call SearchAndReplace(<f-args>)
  let g:SearchAndReplace=1
endif
"Remove files in .gitignore from CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlPMixed'
" change quit key for multi cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='j'
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '',
      \'c'    : '',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : ''}

"For persistent undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

:noremap U :UndotreeShow<cr>
