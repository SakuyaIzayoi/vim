set nocompatible
set enc=utf-8

" PATHOGEN "
execute pathogen#infect()

" BASIC SETTINGS"
color solarized
set background=light
syntax on
filetype plugin indent on
set guioptions=

" FORMATTING SETTINGS "
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" VISIBILITY SETTINGS "
set number
set cursorline
set lazyredraw
set smartindent

" SEARCH SETTINGS "
set ignorecase
set smartcase
set incsearch
set hlsearch

" PLUGIN SETTINGS "
let g:airline_powerline_fonts = 1
let g:syntastic_c_check_header = 1
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_no_default_include_dirs = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:molokai_original = 1
let g:tagbar_usearrows = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_preview = 1
au BufRead,BufNewFile *.des set syntax=levdes
if has('win32')
    let g:tagbar_ctags_bin = 'C:\bin\ctags58\ctags.exe'
endif
set undodir=$HOME/.undodir/
set undofile

" FUNCTIONS "
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

" KEYBINDS "
let mapleader=","
inoremap jk <esc>
nnoremap <silent> <M-n> :call NumberToggle()<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <Leader>mbt :MBEToggle<CR>
nnoremap <Leader>b :MBEFocus<CR>
nnoremap <silent> <leader><space> :nohl<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>
nnoremap ; :
nnoremap : ;
nnoremap j gj
nnoremap k gk
call togglebg#map("<Leader>s")

" Window Split Movement "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" AUTO-RUN COMMANDS "
if has("autocmd")
    if has("gui_runnng")
        autocmd bufwritepost _gvimrc source $MYGVIMRC
    else
        autocmd bufwritepost _vimrc source $MYVIMRC
    endif
endif
