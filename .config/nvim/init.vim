if &compatible
  set nocompatible
endif
syntax on
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles/')
  call dein#begin('~/.vim/bundles/')

  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tmhedberg/SimpylFold')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('tyrannicaltoucan/vim-deep-space')
  call dein#add('ajmwagar/vim-deus')
  call dein#add('joshdick/onedark.vim')
  call dein#add('nanotech/jellybeans.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
let mapleader="\<SPACE>"
set number
set modeline
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set expandtab " spaces in tabs
set tabstop=4 " amount of spaces in TAB
set showmatch " matching brackets
set splitbelow
set splitright
set ignorecase " searching is case insensitive
" Enable folding
set foldmethod=indent
set foldlevel=99
function! NumberToggle() " relative number toggle
	if(&relativenumber==1)
		set nornu
		set number
	else
		set rnu
	endif
endfunc
if(&relativenumber!=1)
   call NumberToggle() " init with relative number
endif
colorscheme jellybeans
" leader + r toggles between normal and relative
nnoremap <leader>r :call NumberToggle()<cr> 
" minimize keystrokes 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H>
nnoremap ; :
