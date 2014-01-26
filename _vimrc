set nocompatible
set enc=utf-8

" PATHOGEN "
execute pathogen#infect()

" BASIC SETTINGS"
syntax on
filetype plugin indent on
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nu
set cursorline
set lazyredraw
set backupdir=~/.vim/backup

set incsearch
set hlsearch

" PLUGIN SETTINGS "
let g:syntastic_c_check_header = 1
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_no_default_include_dirs = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:kolor_italic = 1
let g:kolor_bold = 1
let g:kolor_underlined = 0
let g:kolor_alternative_matchparen = 0
let g:NERDTreeDirArrows = 1
let g:tagbar_ctags_bin = 'C:\bin\ctags58\ctags.exe'
let g:tagbar_usearrows = 1

let mapleader=","
inoremap jk <esc>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>u :GundoToggle<CR>

" KEYBINDS "
map <C-n> :NERDTreeToggle<CR>
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <M-n> :call NumberToggle()<CR>
nnoremap <F8> :TagbarToggle<CR>


" FUNCTIONS "
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" AUTO-RUN COMMANDS "
if has("autocmd")
    if has("gui_runnng")
        autocmd bufwritepost _gvimrc source $MYGVIMRC
    else
        autocmd bufwritepost _vimrc source $MYVIMRC
    endif
endif
