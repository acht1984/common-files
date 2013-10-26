"------------------------------------------------------------
" ヘルプの日本語化
helptags ~/.vim/doc

"------------------------------------------------------------
" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

"------------------------------------------------------------
" NeoBundleの設定
"
filetype off
if has('vim_starting')
	set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Shougo
NeoBundle 'Shougo/unite'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/vimproc' , { 'build' : { 'unix' : 'make -f make_unix.mak' } }
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'

" Bundleの追加
" original repos on github
NeoBundle 'tpope/vim-fugitive' 
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'} 
NeoBundle 'tpope/vim-surround' 
NeoBundle 'tpope/vim-rails.git' 
NeoBundle 'scrooloose/nerdcommenter'

" javascript plugins 
NeoBundle 'JavaScript-syntax' 
NeoBundle 'pangloss/vim-javascript' 
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'lordm/vim-browser-reload-linux'

" quickrun
NeoBundle 'thinca/vim-quickrun' 
NeoBundle "scrooloose/syntastic"

" gitv
NeoBundle 'gregsexton/gitv'

" colorsheme
NeoBundle 'w0ng/vim-hybrid'

" statusline
NeoBundle 'itchyny/lightline.vim'

filetype plugin indent on

"------------------------------------------------------------
" 強く推奨するオプション

" 色づけをオン
syntax on

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完を便利に
set wildmenu
set wildignorecase
set wildmode=list:full

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" 歴史的にモードラインはセキュリティ上の脆弱性になっていたので、
" オフにして代わりに上記のsecuremodelinesスクリプトを使うとよい。
set nomodeline

" 日本語文字幅の設定
set ambiwidth=double

"------------------------------------------------------------
" Usability options 

"インクリメンタルサーチを行う
set incsearch

" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
"set smartcase

" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

" <C-L>で検索後の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

"検索結果に移動したとき、その位置を画面の中央にします。 
nnoremap n nzz 
nnoremap N Nzz 
nnoremap * *zz 
nnoremap # #zz 
nnoremap g* g*zz 
nnoremap g# g#zz<br /><br />

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" オートインデント
set autoindent

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 画面最下行に行番号を表示する
set number

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" 全モードでマウスを有効化
set mouse=a

" コマンドラインの高さを2行に
set cmdheight=2

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>

" ファイル、バッファの切り替えでカレントディレクトリを切り替え（CD.vim）
" :au BufEnter * execute ":lcd " . expand("%:p:h")

""バックアップファイルの保存場所を設定 
set backupdir=~/.vim/vimbackup 

"スワップファイルの保存場所を設定 
set directory=~/.vim/vimswap 

"------------------------------------------------------------
" インデント関連のオプション 
"
" タブ文字の代わりにスペース2個を使う場合の設定。
" この場合、'tabstop'はデフォルトの8から変えない。
"set shiftwidth=2
"set softtabstop=2
"set expandtab

" インデントにハードタブを使う場合の設定。
" タブ文字を2文字分の幅で表示する。
set shiftwidth=2
set tabstop=2

"------------------------------------------------------------
" マッピング
"
" leaderの変更
let mapleader = ","
nnoremap \ ,

" Yの動作をDやCと同じにする
map Y y$

nnoremap [editrc]    <Nop>
nmap <Space>. [editrc]
nnoremap [editrc]e   :tabnew $MYVIMRC<CR>
nnoremap [editrc]s   :w <CR>:source $MYVIMRC<CR>

"------------------------------------------------------------
" uniteの設定
"
let g:unite_source_history_yank_enable = 1  "history/yankの有効化
let g:unite_split_rule = "rightbelow" 

nnoremap [unite]    <Nop>
nmap     <Space>u [unite]

nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]y   :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]o   :<C-u>Unite -vertical -winwidth=30 -no-quit outline<CR>

"------------------------------------------------------------
" unite-tagの設定
"
" path にヘッダーファイルのディレクトリを追加することで
" neocomplcache が include 時に tag ファイルを作成してくれる
set path+=$LIBSTDCPP
set path+=$BOOST_LATEST_ROOT

" neocomplcache が作成した tag ファイルのパスを tags に追加する
function! s:TagsUpdate()
    " include している tag ファイルが毎回同じとは限らないので毎回初期化
    setlocal tags=
    for filename in neocomplcache#sources#include_complete#get_include_files(bufnr('%'))
        execute "setlocal tags+=".neocomplcache#cache#encode_name('tags_output', filename)
    endfor
endfunction

command!
    \ -nargs=? PopupTags
    \ call <SID>TagsUpdate()
    \ |Unite tag:<args>

function! s:get_func_name(word)
    let end = match(a:word, '<\|[\|(')
    return end == -1 ? a:word : a:word[ : end-1 ]
endfunction

" カーソル下のワード(word)で絞り込み
noremap <silent> g<C-]> :<C-u>execute "PopupTags ".expand('<cword>')<CR>

" カーソル下のワード(WORD)で ( か < か [ までが現れるまでで絞り込み
" 例)
" boost::array<std::stirng... → boost::array で絞り込み
noremap <silent> G<C-]> :<C-u>execute "PopupTags "
    \.substitute(<SID>get_func_name(expand('<cWORD>')), '\:', '\\\:', "g")<CR>

"------------------------------------------------------------
" neocomplcache
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"------------------------------------------------------------
" snippetsの文法チェック設定
"
" Plugin key-mappings.
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"------------------------------------------------------------
" JavaScriptの文法チェック設定
"
autocmd FileType javascript :compiler gjslint
autocmd QuickfixCmdPost make copen

"------------------------------------------------------------
" NerdCommenter
"
let NERDSpaceDelims = 1

"-------------------------------------------------------------------
" Color setting"
"
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" カーソル
set cursorline

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }

