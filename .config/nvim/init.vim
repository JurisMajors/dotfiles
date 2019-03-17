if &compatible
  set nocompatible
endif
syntax on
" Add the dein installation directory into runtimepath
set runtimepath+=/home/juris/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/juris/.cache/dein')
  call dein#begin('/home/juris/.cache/dein')

  call dein#add('/home/juris/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tmhedberg/SimpylFold')
  call dein#add('artur-shaik/vim-javacomplete2')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('rafi/awesome-vim-colorschemes')
  call dein#add('davidhalter/jedi-vim') " python completion
  call dein#add('mboughaba/i3config.vim')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tpope/vim-surround')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 0
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#disable_auto_complete = 1

inoremap <silent><expr> <C-Space>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunc

let g:jedi#popup_on_dot=1
let g:jedi#completions_command="<C-Space>"
let g:airline_powerline_fonts=1
let g:asyncrun_open=6
set rtp+=~/.fzf
colorscheme happy_hacking
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
nnoremap <leader>r :call NumberToggle()<CR> 
nnoremap ,<leader> :nohlsearch<CR>
" minimize keystrokes 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H>
nnoremap ; :
nnoremap <C-W><C-S> :NERDTreeToggle<CR>
" print shortcut
autocmd FileType java inoremap sout<space> System.out.println();<left><left>
" main method shortcut
autocmd FileType java inoremap psvm<space> public static void main(String[] args) {<CR>}<ESC>O
" compiling
autocmd FileType java nnoremap <buffer> <F9> :exec '!javac' shellescape(expand('%'), 1)<CR>
inoremap " ""<left>
inoremap ' ''<left>
" if pressing space after then just empty brackets
inoremap (<space> ()<right>
" otherwise go in brackets and type
inoremap ( ()<left>
inoremap [<space> []<right>
inoremap [ []<left>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
vnoremap < <gv
vnoremap > >gv
