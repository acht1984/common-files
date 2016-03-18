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
\     'win32' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'YankRing.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'honza/vim-snippets'
NeoBundle 'othree/html5.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'Shougo/neossh.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'cohama/agit.vim'
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
NeoBundle 'alfredodeza/pytest.vim'
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
NeoBundleLazy "lambdalisue/vim-django-support", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "htmldjango"]
      \ }}
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'fatih/vim-go'
NeoBundle 'artur-shaik/vim-javacomplete2'
NeoBundle 'soramugi/auto-ctags.vim'
" NeoBundle 'shawncplus/phpcomplete.vim'
" NeoBundle 'm2mdas/phpcomplete-extended'
" NeoBundle 'm2mdas/phpcomplete-extended-laravel'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"---------------------------------------------------------------------------
" vim-singleton
"
" call singleton#enable()

"---------------------------------------------------------------------------
" キーマップの設定
"
" .vimrcを開く
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
" source ~/.vimrc を実行する。
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR>
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>
" 検索のデフォルトをvery magicに
nnoremap /  /\v
" コマンド履歴を賢く
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>
"---------------------------------------------------------------------------
" 入力の改善
"
set backspace=indent,eol,start  " バックスペースで特殊記号も削除可能に
set formatoptions=lmoq          " 整形オプション，マルチバイト系を追加
set whichwrap=b,s,h,l,<,>,[,]   " カーソルを行頭、行末で止まらないようにする
let g:sql_type_default = 'mysql'

"---------------------------------------------------------------------------
" indentの設定
"
set ignorecase
set wildignorecase
set nosmartcase
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
if has('win32')
    autocmd vimrc FileType java setlocal noet sw=4 ts=4 sts=4 fenc=sjis
    autocmd vimrc FileType javascript setlocal noet sw=2 ts=2 sts=2 ff=unix fenc=utf-8
    autocmd vimrc FileType html setlocal noet sw=2 ts=2 sts=2 ff=unix fenc=utf-8
    autocmd vimrc FileType css setlocal noet sw=2 ts=2 sts=2 ff=unix fenc=utf-8
    autocmd vimrc FileType coffee setlocal noet sw=2 ts=2 sts=2 ff=unix fenc=utf-8
endif
autocmd vimrc FileType json setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType gitcommit setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType sh setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType ruby setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType python setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType hive setlocal et ff=unix fenc=utf-8
autocmd vimrc FileType markdown setlocal et sw=4 ts=4 sts=4 ff=unix fenc=utf-8

" go setting
autocmd vimrc FileType go setlocal noet sw=4 ts=4 sts=4 ff=unix fenc=utf-8
autocmd vimrc FileType go nmap <leader>b <Plug>(go-build)
autocmd vimrc FileType go nmap <leader>t <Plug>(go-test)
autocmd vimrc FileType go nmap <leader>c <Plug>(go-coverage)

" java setting
autocmd vimrc FileType java setlocal noet sw=4 ts=4 sts=4
autocmd vimrc FileType java nmap <F4> <Plug>(JavaComplete-Imports-Add)
autocmd vimrc FileType java imap <F4> <Plug>(JavaComplete-Imports-Add)
autocmd vimrc FileType java nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)
autocmd vimrc FileType java imap <F5> <Plug>(JavaComplete-Imports-AddMissing)
autocmd vimrc FileType java nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
autocmd vimrc FileType java imap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)

"---------------------------------------------------------------------------
" Untiteの設定
"
let g:unite_source_file_mru_limit = 300
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = "rightbelow"

" for ag
if executable('ag')
  let g:unite_source_rec_async_command=['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
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
" completeの設定
"
" Enable omni completion.
autocmd vimrc FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd vimrc FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd vimrc FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd vimrc FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd vimrc FileType java setlocal omnifunc=javacomplete#Complete
" autocmd vimrc FileType php setlocal omnifunc=phpcomplete#CompletePHP
" let g:phpcomplete_index_composer_command = 'composer'
" autocmd vimrc FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
" jedi-vimの設定
"
autocmd vimrc FileType python setlocal omnifunc=jedi#completions
" jediにvimの設定を任せると'completeopt+=preview'するので
" 自動設定機能をOFFにし手動で設定を行う
let g:jedi#auto_vim_configuration = 0
" 補完の最初の項目が選択された状態だと使いにくいためオフにする
let g:jedi#popup_select_first = 0
" quickrunと被るため大文字に変更
let g:jedi#rename_command = '<Leader>R'
let g:jedi#popup_on_dot = 0
" let g:jedi#auto_initialization = 1

" neocompleteの設定
" http://pocke.hatenablog.com/entry/2015/10/01/222216
"
if neobundle#tap('neocomplete')
  call neobundle#config({
  \   'depends': ['Shougo/context_filetype.vim', 'ujihisa/neco-look', 'pocke/neco-gh-issues', 'Shougo/neco-syntax'],
  \ })

  " 起動時に有効化
  let g:neocomplete#enable_at_startup = 1
  " 大文字が入力されるまで大文字小文字の区別を無視する
  let g:neocomplete#enable_smart_case = 1
  " _(アンダースコア)区切りの補完を有効化
  let g:neocomplete#enable_underbar_completion = 1
  let g:neocomplete#enable_camel_case_completion  =  1
  " ポップアップメニューで表示される候補の数
  let g:neocomplete#max_list = 20
  " シンタックスをキャッシュするときの最小文字長
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  " 補完を表示する最小文字数
  let g:neocomplete#auto_completion_start_length = 2
  " preview window を閉じない
  let g:neocomplete#enable_auto_close_preview = 0
  autocmd InsertLeave * silent! pclose!

  let g:neocomplete#max_keyword_width = 10000

  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif

  let g:neocomplete#sources#omni#input_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
  let g:neocomplete#sources#omni#input_patterns.java = '[^. \t]\.\%(\h\w*\)\?'
  let g:neocomplete#sources#omni#input_patterns.python = '[^. \t]\.\%(\h\w*\)\?'
  let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
  " let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

  call neocomplete#custom#source('look', 'min_pattern_length', 1)

  call neobundle#untap()
endif

"---------------------------------------------------------------------------
" snipetの設定
"
if neobundle#tap('neosnippet')
  "http://kazuph.hateblo.jp/entry/2013/01/19/193745

  " <TAB>: completion.
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

  " Plugin key-mappings.
  imap <silent><C-k> <Esc>:let g:neosnippet_expanding_or_jumpping = 1<CR>a<Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)

  " SuperTab like snippets behavior.
  imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory="$VIMLOCAL/bundle/vim-snippets/snippets, $VIM/snippets"

  call neobundle#untap()
endif

"---------------------------------------------------------------------------
" quickrunの設定
"
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ }

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
set nobackup
set noswapfile
if !isdirectory(expand("$VIMLOCAL/undofiles"))
  lcd $VIMLOCAL
  silent !mkdir undofiles
endif
set undofile
set undodir=$VIMLOCAL/undofiles

"---------------------------------------------------------------------------
" 見た目の設定
"
if !has('gui_running')
  colorscheme solarized
endif
set cursorline
set number
"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells
" 新しいウィンドウを右下に開く
set splitbelow splitright
" カーソルの見た目
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

"---------------------------------------------------------------------------
" ctags
"
set tags+=.git/tags
let g:auto_ctags_directory_list = ['.git']
let g:auto_ctags = 0
let g:auto_ctags_filetype_mode = 1

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
command! -nargs=1 Memo edit ~/Documents/memo/<args>.md
" 一時ファイル
command! -nargs=1 Tmp edit ~/.vim/tmp.<args>
command! -nargs=1 Temp edit ~/.vim/tmp.<args>
" cd
command! Ccd lcd %:p:h
" vimgrepの結果をquickfixで表示
autocmd vimrc QuickFixCmdPost *grep* cwindow
set number
