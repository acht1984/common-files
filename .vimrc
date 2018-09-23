""---------------------------------------------------------------------------
"" dein.vim
""
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('altercation/vim-colors-solarized.git')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-fugitive')
call dein#add('thinca/vim-quickrun')
call dein#add('scrooloose/syntastic')
call dein#add('itchyny/lightline.vim')
call dein#add('elzr/vim-json')
call dein#add('plasticboy/vim-markdown')
call dein#add('fatih/vim-go')
call dein#add('maralla/completor.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('majutsushi/tagbar')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('vim-airline/vim-airline')
call dein#add('airblade/vim-gitgutter')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('scrooloose/nerdtree')

call dein#end()

"---------------------------------------------------------------------------
" キーマップの設定
"
" .vimrcを開く
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
" source ~/.vimrc を実行する。
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR>
"---------------------------------------------------------------------------
" 入力の改善
"
set backspace=indent,eol,start  " バックスペースで特殊記号も削除可能に
set formatoptions=lmoq          " 整形オプション，マルチバイト系を追加
set whichwrap=b,s,h,l,<,>,[,]   " カーソルを行頭、行末で止まらないようにする
let g:sql_type_default = 'mysql'

"============================================================================
" Set up persistent undo (with all undo files in one directory)
"============================================================================
if has('persistent_undo')
   set undofile
endif

set undodir=$HOME/.vim/undofiles

set undolevels=5000

"---------------------------------------------------------------------------
" indentの設定
"
set wildignorecase
set wildmode=list:longest,full
set ambiwidth=double
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=4 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"============================================================================
" Enabling some cool search options
"============================================================================
"Incremental search
set incsearch
"Highlight search
set hlsearch
"Remap search key to allow Perl like regular expression search with \v directly
nnoremap / /\v
"Setting ignore case and smart case
set ignorecase smartcase

"---------------------------------------------------------------------------
" 見た目の設定
"
if !has('gui_running')
  colorscheme solarized
endif
set cursorline number
syntax on
filetype plugin indent on
"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells
" 新しいウィンドウを右下に開く
set splitbelow splitright

"============================================================================
" Status bar
"============================================================================
" Show the status bar all the time
set laststatus=2

"Enable tabs on airline status
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

""---------------------------------------------------------------------------
"" filetype毎の設定
""
autocmd BufRead,BufNewFile,BufReadPre *.md set filetype=markdown
autocmd BufRead,BufNewFile,BufReadPre *.mkd set filetype=markdown
autocmd FileType json setlocal et ff=unix fenc=utf-8
autocmd FileType gitcommit setlocal et ff=unix fenc=utf-8
autocmd FileType sh setlocal et ff=unix fenc=utf-8
autocmd FileType python setlocal et ff=unix fenc=utf-8

"============================================================================
" Options for vim-go and Golang programming in general
"============================================================================
" Line numbers on by default for Go files
"autocmd BufNewFile,BufRead *.go set number

" Set tabs in go to equivalent of 4 spaces (instead of 8)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" GoImports will run on Save
let g:go_fmt_command="goimports"

" Common Go commands
au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>a <Plug>(go-alternate-edit)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" Enabling GoMetaLinter on save
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

"============================================================================
" Enable neosnippet
"============================================================================
let g:go_snippet_engine = "neosnippet"
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"============================================================================
" Useful plugins
"============================================================================
" Enable neocomplete by default (for vim7)
"let g:neocomplete#enable_at_startup = 1

" Map Tagbar to F9
nnoremap <silent> <F9> :TagbarToggle<CR>

"## For Ctrl-P extension
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"============================================================================
" NERDTree plugin
"============================================================================
map <F5> :NERDTreeToggle<CR>
""---------------------------------------------------------------------------
"" quickrunの設定
""
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ }

"---------------------------------------------------------------------------
" その他設定
"
" TODOファイル
command! Todo edit ~/todo.txt
" 一時ファイル
command! -nargs=1 Tmp edit ~/.vim/tmp.<args>
command! -nargs=1 Temp edit ~/.vim/tmp.<args>
" cd
command! Ccd lcd %:p:h
set timeout timeoutlen=1000 ttimeoutlen=50
