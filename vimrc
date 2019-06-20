if has ('autocmd') " Remain compatible with earlier versions
  filetype indent plugin on

  augroup vimrc     " Source vim configuration upon save
  autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
  autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

syntax on

set guioptions-=m "menu bar
set guioptions-=T "toolbar
set guioptions-=r "scrollbar
set nocompatible
set path+=**
set viminfo+=n~/.vim/.viminfo
set wildmenu
set background=dark
set tabstop=4
set expandtab
set number relativenumber
set hlsearch

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"hello world"
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:hdevtools_stack=1
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpackkeywords

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

colorscheme PaperColor

function! PackInit() abort
    packadd minpac

    call minpac#init({'package_name': 'ssipos'})

    call minpac#add('k-takata/minpac', {'type': 'opt'})
    call minpac#add('tpope/vim-surround')
    call minpac#add('vim-airline/vim-airline')
    call minpac#add('tpope/vim-unimpaired')
    call minpac#add('jpalardy/vim-slime')
    call minpac#add('alx741/vim-hindent')
    call minpac#add('bitc/vim-hdevtools')
    call minpac#add('neovimhaskell/haskell-vim')
    call minpac#add('aiya000/vim-ghcid-quickfix')
    call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
    call minpac#add('w0rp/ale')
    call minpac#add('bitc/vim-hdevtools')
    call minpac#add('ConradIrwin/vim-bracketed-paste')
endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

