let g:python3_host_prof = '~/.config/nvim/venv/bin/python'
let g:dein#install_process_timeout = 5000
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/nathanbrown/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/nathanbrown/.cache/dein')
  call dein#begin('/Users/nathanbrown/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/nathanbrown/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('scrooloose/nerdtree')
  " call dein#add('neoclide/coc.nvim', {'build': './install.sh'})
  call dein#add('tpope/vim-fugitive')
  if has('nvim')
      " no support for powerline yet sads
      call dein#add('vim-airline/vim-airline')
      call dein#add('vim-airline/vim-airline-themes')
  else
      call dein#add('powerline/powerline')
  endif

  call dein#add('neomake/neomake')
  call dein#add('mileszs/ack.vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('cocopon/iceberg.vim')
  call dein#add('octol/vim-cpp-enhanced-highlight')
  call dein#add('iamcco/markdown-preview.nvim', { 'build': 'cd app & yarn install'  })
  call dein#add('srishanbhattarai/neovim-spotify', { 'build': 'bash install.sh' })
  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

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

"End dein Scripts-------------------------set number
tnoremap <ESC> <C-\><C-N>
inoremap jj <ESC> 
source ~/.vimrc
colorscheme Tomorrow-Night-Eighties
set clipboard+=unnamedplus
let g:airline_theme='iceberg'
set completeopt=menu

let g:multi_cursor_quit_key = '<ESC>'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set nohlsearch
nnoremap <Leader>m :Neomake<CR>
colorscheme Tomorrow-Night
autocmd TermOpen * DisableWhitespace

let g:neomake_cpp_enabled_makers=['clang', 'linter', 'tidy']
" clang-check
let g:neomake_cpp_clang_maker = {
            \ 'exe' : 'clang-check',
            \ 'args': [@%, '-extra-arg', '-fno-modules', '-p', '/Users/nathanbrown/mongodb/mongo/']
            \ }
" clang-tidy
let g:neomake_cpp_tidy_maker = {
            \ 'exe' : 'clang-tidy',
            \ 'args': ['-p', '.', '-checks=-*,clang-analyzer-*,-clang-analyzer-cplusplus*,bugprone-*,cert-*,cppcoreguidelines-*,misc-*,modernize-*,performance-*,portability-*,readability-']
            \ }
" c++ linter
let g:neomake_cpp_linter_maker = {
            \ 'exe' : 'python',
            \ 'args': ['buildscripts/lint.py']
            \ }
" eslint
let g:neomake_javascript_eslint_maker = {
            \ 'exe' : 'python',
            \ 'args': ['buildscripts/eslint.py', 'lint']
            \ }
