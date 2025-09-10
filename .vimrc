
" Automatic installation https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'linusng/green-shades.vim'

call plug#end()

set number

" https://lanbugs.de/howtos/linux-tipps-tricks/vim-for-yaml-editing/
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 et ai
set colorcolumn=80
set cursorcolumn



:colorscheme green-shades

