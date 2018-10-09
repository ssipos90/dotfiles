if has ('autocmd') " Remain compatible with earlier versions
  filetype indent plugin on

  augroup vimrc     " Source vim configuration upon save
  autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
  autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

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

colorscheme PaperColor

