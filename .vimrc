"---------------------------------------------------------------------------
" NeoBundle install
"
let $VIMLOCAL=expand('$HOME/.vim')
if !isdirectory($VIMLOCAL)
  lcd $HOME
  silent !mkdir .vim
endif

let vundle_readme=expand('$VIMLOCAL/bundle/neobundle.vim/README.md')

if !filereadable(vundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  lcd $VIMLOCAL
  silent !mkdir bundle
  silent !git clone https://github.com/Shougo/neobundle.vim bundle/neobundle.vim/
endif

"---------------------------------------------------------------------------
" NeoBundle start
"
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=$VIMLOCAL/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand("$VIMLOCAL/bundle/"))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"---------------------------------------------------------------------------
" NeoBundle setting
"
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'YankRing.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'othree/html5.vim'
NeoBundle 'Shougo/echodoc'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'Shougo/neossh.vim'
NeoBundle 'Shougo/vim-vcs'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-singleton'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'fuenor/im_control.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elzr/vim-json'
NeoBundle 'plasticboy/vim-markdown'
" NeoBundleLazy 'JavaScript-syntax', {'autoload':{'filetypes':['javascript']}}
" NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'marijnh/tern_for_vim', {
      \ 'build' : {
      \ 'others' : 'npm install'
      \ }}
NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3"],
      \ }
      \ }
NeoBundleLazy "autowitch/hive.vim", {
      \ "autoload": {
      \   "filetypes": ["hive"],
      \ }
      \ }
NeoBundle 'Vim-R-plugin'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"---------------------------------------------------------------------------
" vim-singleton
"
call singleton#enable()

"---------------------------------------------------------------------------
" キーマップの設定
"
" .vimrcを開く
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
" source ~/.vimrc を実行する。
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR> 
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>

"---------------------------------------------------------------------------
" 入力の改善
"
set backspace=indent,eol,start		" バックスペースで特殊記号も削除可能に
set formatoptions=lmoq			" 整形オプション，マルチバイト系を追加
set whichwrap=b,s,h,l,<,>,[,]		" カーソルを行頭、行末で止まらないようにする

"---------------------------------------------------------------------------
" indentの設定
"
set ignorecase
set wildignorecase
set nosmartcase
set wildmode=list:full
set ambiwidth=double
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"---------------------------------------------------------------------------
" filetype毎の設定
"
augroup vimrc
  autocmd!
augroup END
autocmd vimrc BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd vimrc BufRead,BufNewFile,BufReadPre *.hive set filetype=hive
autocmd vimrc BufRead,BufNewFile,BufReadPre *.q set filetype=hive
autocmd vimrc BufRead,BufNewFile,BufReadPre *.md set filetype=markdown
autocmd vimrc BufRead,BufNewFile,BufReadPre *.mkd set filetype=markdown
autocmd vimrc FileType java setlocal noet sw=4 ts=4 sts=4 fenc=sjis
autocmd vimrc FileType javascript setlocal noet sw=2 ts=2 sts=2 ff=unix fenc=utf-8
autocmd vimrc FileType html setlocal noet sw=2 ts=2 sts=2 ff=unix fenc=utf-8
autocmd vimrc FileType css setlocal noet sw=2 ts=2 sts=2 ff=unix fenc=utf-8
autocmd vimrc FileType coffee setlocal noet sw=2 ts=2 sts=2 ff=unix fenc=utf-8
autocmd vimrc FileType json setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType gitcommit setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType sh setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType ruby setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType python setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType hive setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType markdown setlocal et sw=2 ts=2 sts=2 ff=unix fenc=utf-8

"---------------------------------------------------------------------------
" Untiteの設定
"
let g:unite_source_file_mru_limit = 300
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = "rightbelow"

" for ag
if executable('ag')
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" key-map
nnoremap  [unite]  <Nop>
nmap      <Space>u  [unite]

" プロジェクトファイルの検索
nnoremap <space><space> :<C-u>Unite -start-insert file_rec/async:!<cr>
" unite起動
nnoremap [unite]u :<C-u>Unite -no-split<Space>
" カレントリスト
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep:. <CR>
" バッファリスト
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" 最近使ったファイル
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" yank履歴
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
" unite-outline
nnoremap <silent> [unite]o :<C-u>Unite -vertical -no-quit -winwidth=30 outline<CR>
" unite restart
nnoremap <space>r <Plug>(unite_restart)

"---------------------------------------------------------------------------
" neocompleteの設定
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd vimrc FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd vimrc FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd vimrc FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd vimrc FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd vimrc FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd vimrc FileType python setlocal omnifunc=jedi#completions completeopt-=preview
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#rename_command = '<Leader>R'

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" let g:neocomplete#force_omni_input_patterns.python = '\h\w|[^. \t].\w'

"---------------------------------------------------------------------------
" snipetの設定
"
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

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

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 2

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory="$VIMLOCAL/bundle/vim-snippets/snippets, $VIM/snippets"

"---------------------------------------------------------------------------
" vimfilerの設定
"
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

"---------------------------------------------------------------------------
" syntasticの設定
"
let b:is_bash = 1
let g:syntastic_css_csslint_args = '--ignore=box-model,ids,adjoining-classes,universal-selector,important'
let g:syntastic_javascript_jshint_conf_args = '--config "d:/tool/js_coding_conventions/.jshintrc--config"'
let g:syntastic_python_checkers = ['flake8']

"---------------------------------------------------------------------------
" jqの設定
"
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    set ft=json
    execute "%!jq " . l:arg
endfunction

"---------------------------------------------------------------------------
" matchitの設定
" 対応する単語を「%」で移動
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
let b:match_words = "「:」"

"---------------------------------------------------------------------------
" backup,swapの設定
"
if !isdirectory(expand("$VIMLOCAL/backup"))
  lcd $VIMLOCAL
  silent !mkdir backup
endif
set backup
set backupdir=$VIMLOCAL/backup
if !isdirectory(expand("$VIMLOCAL/swapfiles"))
  lcd $VIMLOCAL
  silent !mkdir swapfiles
endif
set swapfile
set directory=$VIMLOCAL/swapfiles
if !isdirectory(expand("$VIMLOCAL/undofiles"))
  lcd $VIMLOCAL
  silent !mkdir undofiles
endif
set undofile
set undodir=$VIMLOCAL/undofiles

"---------------------------------------------------------------------------
" 見た目とか
"
" 新しいウィンドウを右下に開く
set splitbelow splitright
colorscheme hybrid

"---------------------------------------------------------------------------
" 見た目の設定
set cursorline
set number
"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells 

"---------------------------------------------------------------------------
" メモとかの設定
"
" TODOファイル
command! Todo edit ~/todo.txt
" 日報
command! -nargs=? Nippo call s:Nippo()
function! s:Nippo()
  let l:day = (60 * 60 * 24)
  let l:w_file = 'D:/My Documents/日報/' . strftime("%Y%m%d") . '.md'
  execute 'edit ' . l:w_file
  if !filereadable(l:w_file)
    " 3日前まで探す
    let l:search_day = localtime()
    for i in range(1, 3)
      let l:search_day = l:search_day - l:day
      let l:r_file = 'D:/My Documents/日報/' . strftime("%Y%m%d", l:search_day) . '.md'
      if filereadable(l:r_file)
        execute '0r ' . l:r_file
        break
      endif
    endfor
    " 結果を書込
    write
  endif
endfunction
" メモ
command! -nargs=1 Memo edit D:/My Documents/議事メモ/<args>.txt
" 一時ファイル
command! -nargs=1 Tmp edit ~/.vim/tmp.<args>
command! -nargs=1 Temp edit ~/.vim/tmp.<args>
" cd
command! Ccd lcd %:p:h
" vimgrepの結果をquickfixで表示
autocmd vimrc QuickFixCmdPost *grep* cwindow
set number
