set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog = '/home/nathan/.config/nvim/venv/bin/python'
let g:dein#install_process_timeout = 5000
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/nathan/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/nathan/.cache/dein')
  call dein#begin('/home/nathan/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/nathan/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
   if has('nvim')
      " nvim doesn't support powerline yet: https://github.com/powerline/powerline/issues/1287
      call dein#add('vim-airline/vim-airline')
      call dein#add('vim-airline/vim-airline-themes')
    else
      call dein#add('powerline/powerline')
    endif "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('neoclide/coc.nvim', { 'build': 'yarn install --frozen-lockfile' })
  " call dein#add('Shougo/deoplete.nvim')
  " Change clang options
  " call deoplete#custom#var('clangx', 'default_c_options', '')
  " call deoplete#custom#var('clangx', 'default_cpp_options', '')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('flazz/vim-colorschemes')
  call dein#add('neomake/neomake')
  call dein#add('mileszs/ack.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('sakhnik/nvim-gdb', {'build': './install.sh'})
  call dein#add('kshenoy/vim-signature')
  call dein#add('cocopon/iceberg.vim')
  call dein#add('octol/vim-cpp-enhanced-highlight')
  call dein#add('iamcco/markdown-preview.nvim', { 'build': 'cd app & yarn install'  })
  call dein#add('thaerkh/vim-workspace')
  call dein#add('tpope/vim-eunuch')
  " call dein#add('arithran/vim-delete-hidden-buffers')
  " call dein#add('stsewd/spotify.nvim')
  " call dein#add('srishanbhattarai/neovim-spotify', { 'build': 'bash install.sh' })
  call dein#add('Shougo/neoinclude.vim')
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
source ~/.vimrc
colorscheme Tomorrow-Night-Eighties
set clipboard+=unnamedplus
let g:airline_theme='iceberg'
" let g:deoplete#enable_at_startup=1
" let g:deoplete#sources#clang#libclang_path='/usr/local/Cellar/llvm/7.0.0/lib/libclang.dylib'
"  let g:deoplete#sources#clang#clang_header='/usr/local/opt/llvm/include/'
 " Change clang binary path
 " call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')
 " call deoplete#custom#option('auto_complete_delay', 200)
set completeopt=menu
" TAB through autocomplete suggestions
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" :
" \ <SID>check_back_space() ? "\<TAB>" :
" \ deoplete#mappings#manual_complete()
" function! s:check_back_space() abort "{{{
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" coc tab for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" " use tab and shift tab to cycle through completion otions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" autoclose window if done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

call neomake#configure#automake('nrwi', 200)
tnoremap jj <C-\><C-n>
let g:ycm_disable_for_files_larger_than_kb = 1
let g:multi_cursor_quit_key = '<ESC>'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
nnoremap <leader>S :ToggleWorkspace<CR>
" Set column width and color
" set colorcolumn=80
" highlight ColorColumn ctermbg=darkred
set nohlsearch
let g:neomake_cpp_clang_args = neomake#makers#ft#cpp#clang().args + ['-I..']
nnoremap <leader>w :ToggleWorkspace<CR>
nnoremap <leader>m :Neomake<CR>
colorscheme Tomorrow-Night
autocmd TermOpen * DisableWhitespace
