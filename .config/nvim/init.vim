if &compatible
  eset nocompatible
endif
syntax on
" Add the dein installation directory into runtimepath
set runtimepath+=/home/juris/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/juris/.cache/dein')
  call dein#begin('/home/juris/.cache/dein')

  call dein#add('/home/juris/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('skywind3000/asyncrun.vim')
  " file tree
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('scrooloose/nerdtree')
  " language pack
  call dein#add('sheerun/vim-polyglot')
  " folding
  call dein#add('tmhedberg/SimpylFold')
  " syntax for i3
  call dein#add('mboughaba/i3config.vim')
  " surrounding character easier
  call dein#add('tpope/vim-surround')
  " autocomplete and syntax checking
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('deoplete-plugins/deoplete-jedi') " python completion
  call dein#add('carlitux/deoplete-ternjs', {'build': 'npm install -g tern'})
  call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})
  call dein#add('moby/moby', {'rtp' : '/contrib/syntax/vim/'})
  " latex support
  call dein#add('lervag/vimtex')
  " snippets
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  " themes
  call dein#add('rafi/awesome-vim-colorschemes')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#tern_bin = '/usr/bin/tern'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunc

" tex setup
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'pdflatex'
let g:vimtex_view_method = 'zathura'
call deoplete#custom#var('omni', 'input_patterns', {
            \ 'tex' : g:vimtex#re#deoplete
            \})
" snippet basic binds 
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsListSnippets="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsSnippetsDir="/home/juris/.cache/dein/repos/github.com/honza/vim-snippets/UltiSnips/"
let g:UltiSnipsEditSplit="vertical"

" let g:airline_powerline_fonts=1
let g:asyncrun_open=6
set rtp+=~/.fzf
" colorscheme Tomorrow-Night-Bright
colorscheme molokai
syntax enable

let mapleader="\<SPACE>"
set number
set modeline
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set expandtab " spaces in tabs
set autoindent
set incsearch
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

fun! SplitTerminal()
    " open buffer
    exe '15new'
    exe 'terminal'
endfunc


if(&relativenumber!=1)
   call NumberToggle() " init with relative number
endif

" leader + r toggles between normal and relative
nnoremap <leader>r :call NumberToggle()<CR> 
nnoremap ,<leader> :nohlsearch<CR>
" search and replace with leader s
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" terminal 
nnoremap <buffer> <Leader>mt :call SplitTerminal()<CR>
tnoremap <C-n><Esc> <C-\><C-n>
" minimize keystrokes 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H>
nnoremap ; :
nnoremap <C-W><C-S> :NERDTreeToggle<CR>
" compiling a java file
autocmd FileType java nnoremap <buffer> <F9> :exec '!javac' shellescape(expand('%'), 1)<CR>
" compiling latex
autocmd FileType tex nnoremap <buffer> <F9> :exec 'VimtexCompile'<CR>

" smarter bracket binds
inoremap [<space> []
inoremap [] []
inoremap [ []<left>
inoremap (<space> ()
inoremap () ()
inoremap ( ()<left>
inoremap {<space> {}
inoremap {} {}
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

inoremap "" ""<left>
inoremap '' ''<left>
" looping through autocomplete suggestions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" dont leave visual mode after reindenting
vnoremap < <gv
vnoremap > >gv
