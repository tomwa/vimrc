syntax on

let mapleader = "-"

colorscheme github

" for taglist plugin
filetype plugin on

"Note hardcoded path
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev @@ chsnow@apache.org
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix stty on os x
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"

    " alias vim="stty stop '' -ixoff; vim"
    noremap <silent> <C-S>          :update<CR>
    vnoremap <silent> <C-S>         <C-C>:update<CR>
    inoremap <silent> <C-S>         <C-O>:update<CR>
  endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copy and paste to clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus,unnamed,autoselect 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" maps for quoting current word
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
nnoremap tn :set nonumber!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map for conque term - note second <CR> to skip warning
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap co :ConqueTermSplit bash<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shortcuts for editing and saving vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make it easy to navigate errors (and helpgrep)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <RIGHT><RIGHT> :cnf<CR><C-G>
nmap <silent> <LEFT> :cprev<CR>
nmap <silent> <LEFT><LEFT> :cpf<CR><C-G>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigate buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" previous buffer
nnoremap gp :bp<CR>
" next buffer
nnoremap gn :bn<CR>
" List buffers with
nnoremap gl :ls<CR>
" List buffers and goto buffer
nnoremap gb :ls<CR>:b
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap to :TlistOpen<CR>
nnoremap tu :TlistUpdate<CR>
nnoremap tc :TlistClose<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap no :NERDTree<CR>
nnoremap nc :NERDTreeClose<CR>
nnoremap nf :NERDTreeFind<CR>
nnoremap np :NERDTreeCWD<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set shiftwidth=4
set tabstop=4
set expandtab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show current command in status bar
set showcmd

" <TAB> complete settings
set wildmode=list:longest

:filetype on
:autocmd FileType c,cpp :set cindent

"filetype plugin indent off

au BufNewFile,BufRead *.gradle setf groovy

" Use builtin omnifun for autocomplete.  Usage: crtl-x ctrl-o
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType json setlocal syntax=javascript

" Erlang support
" --------------
autocmd FileType erlang setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
autocmd BufNewFile,BufRead rebar.config setlocal ft=erlang


" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
filetype plugin indent on
let g:EclimCompletionMethod = 'omnifunc'


Plugin 'elzr/vim-json'
Bundle 'scrooloose/syntastic'
Bundle 'jimenezrick/vimerl'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree.git'
" NerdTree on by default
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" Close nerdtree if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Javascript indentation
Plugin 'pangloss/vim-javascript'

" execute shell commands like curl with :ExecuteSelection
Bundle 'https://github.com/JarrodCTaylor/vim-shell-executor'

"Plugin 'taglist.vim'
Plugin 'taglist-plus'
autocmd VimEnter * TlistOpen
autocmd VimEnter * wincmd p

Plugin 'ZoomWin'

call vundle#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight text over 80 columns wide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight OverLength ctermbg=red ctermfg=white guibg=#592929

let s:activatedh = 0 
function! ToggleH()
    if s:activatedh == 0
        let s:activatedh = 1 
        match OverLength '\%>80v.\+'
    else
        let s:activatedh = 0 
        match none
    endif
endfunction
nnoremap <leader>m :call ToggleH()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ctrlp cordova
set wildignore+=*/platforms/* 
set wildignore+=*/plugins/* 
set wildignore+=*/hooks/* 

" read project/.vim files
let b:thisdir=expand("%:p:h")
let b:vim=b:thisdir."/.vim"
if (filereadable(b:vim))
    execute "source ".b:vim
endif

" syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ignore tidy errors/warnings for ionic 
let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Erlang ctags - https://francoisorsini.wordpress.com/2012/04/14/vim-ctags-for-erlang/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Use_Right_Window=1
let Tlist_Enable_Fold_Column=0
let Tlist_Show_One_File=1 " especially with this one
let Tlist_Compact_Format=1
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set updatetime=1000
nmap ,t :!(cd %:p:h;ctags *)& " Maps the updates of tags to key ,t.
set tags=tags; " The ';' at the end will cause the ctags plugin to search for current dir and above dirs until it find a tag file.

" Add the following below if you want to generate ctags upon saving a file
" Auto-generate ctags upon making changes to a file
autocmd BufWritePost *.erl :silent !(cd %:p:h;ctags *)&

" If you want to auto compile (erlc) upon saving a file, then add that one as well
" Run erlc on the file being saved
autocmd BufWritePost *.erl :!erlc <afile>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


