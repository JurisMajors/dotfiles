if &compatible
  set nocompatible
endif
syntax on
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles/')
  call dein#begin('~/.vim/bundles/')

  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('Valloric/YouCompleteMe')
  call dein#add('scrooloose/nerdtree')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tmhedberg/SimpylFold')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('rafi/awesome-vim-colorschemes')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('artur-shaik/vim-javacomplete2')
  call dein#add('mboughaba/i3config.vim')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd VimEnter * NERDTree | wincmd p
let g:asyncrun_open=6
set rtp+=~/.fzf
colorscheme happy_hacking 
filetype plugin indent on
syntax enable
let mapleader="\<SPACE>"
set number
set modeline
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set expandtab " spaces in tabs
set autoindent
set smartindent
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
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
" leader + r toggles between normal and relative
nnoremap <leader>r :call NumberToggle()<cr> 
" minimize keystrokes 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H>
nnoremap ; :
nnoremap <C-W><C-S> :NERDTreeToggle<CR>
if &compatible
  set nocompatible
endif
syntax on
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles/')
  call dein#begin('~/.vim/bundles/')

  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('Valloric/YouCompleteMe')
  call dein#add('scrooloose/nerdtree')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tmhedberg/SimpylFold')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('rafi/awesome-vim-colorschemes')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('artur-shaik/vim-javacomplete2')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd VimEnter * NERDTree | wincmd p
set rtp+=~/.fzf
colorscheme happy_hacking 
filetype plugin indent on
syntax enable
let mapleader="\<SPACE>"
set number
set modeline
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set expandtab " spaces in tabs
set autoindent
set smartindent
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
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
" leader + r toggles between normal and relative
nnoremap <leader>r :call NumberToggle()<cr> 
" minimize keystrokes 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H>
nnoremap ; :
vnoremap < <gv
vnoremap > >gv
nnoremap <C-W><C-S> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
