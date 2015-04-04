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
" �L�[�}�b�v�̐ݒ�
"
" .vimrc���J��
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
" source ~/.vimrc �����s����B
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR> 
" �u���{����͌Œ胂�[�h�v�ؑփL�[
inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>

"---------------------------------------------------------------------------
" ���͂̉��P
"
set backspace=indent,eol,start		" �o�b�N�X�y�[�X�œ���L�����폜�\��
set formatoptions=lmoq			" ���`�I�v�V�����C�}���`�o�C�g�n��ǉ�
set whichwrap=b,s,h,l,<,>,[,]		" �J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���

"---------------------------------------------------------------------------
" indent�̐ݒ�
"
set ignorecase
set wildignorecase
set nosmartcase
set wildmode=list:full
set ambiwidth=double
"Tab�A�s���̔��p�X�y�[�X�𖾎��I�ɕ\������
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set expandtab "�^�u���͂𕡐��̋󔒓��͂ɒu��������
set tabstop=2 "��ʏ�Ń^�u��������߂镝
set shiftwidth=2 "�����C���f���g�ł���镝
set softtabstop=2 "�A�������󔒂ɑ΂��ă^�u�L�[��o�b�N�X�y�[�X�L�[�ŃJ�[�\����������
set smartindent "���s���ɓ��͂��ꂽ�s�̖����ɍ��킹�Ď��̍s�̃C���f���g�𑝌�����

"---------------------------------------------------------------------------
" filetype���̐ݒ�
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
" Untite�̐ݒ�
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

" �v���W�F�N�g�t�@�C���̌���
nnoremap <space><space> :<C-u>Unite -start-insert file_rec/async:!<cr>
" unite�N��
nnoremap [unite]u :<C-u>Unite -no-split<Space>
" �J�����g���X�g
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep:. <CR>
" �o�b�t�@���X�g
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" �ŋߎg�����t�@�C��
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" yank����
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
" unite-outline
nnoremap <silent> [unite]o :<C-u>Unite -vertical -no-quit -winwidth=30 outline<CR>
" unite restart
nnoremap <space>r <Plug>(unite_restart)

"---------------------------------------------------------------------------
" neocomplete�̐ݒ�
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
" snipet�̐ݒ�
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
" vimfiler�̐ݒ�
"
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

"---------------------------------------------------------------------------
" syntastic�̐ݒ�
"
let b:is_bash = 1
let g:syntastic_css_csslint_args = '--ignore=box-model,ids,adjoining-classes,universal-selector,important'
let g:syntastic_javascript_jshint_conf_args = '--config "d:/tool/js_coding_conventions/.jshintrc--config"'
let g:syntastic_python_checkers = ['flake8']

"---------------------------------------------------------------------------
" jq�̐ݒ�
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
" matchit�̐ݒ�
" �Ή�����P����u%�v�ňړ�
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
let b:match_words = "�u:�v"

"---------------------------------------------------------------------------
" backup,swap�̐ݒ�
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
" �����ڂƂ�
"
" �V�����E�B���h�E���E���ɊJ��
set splitbelow splitright
colorscheme hybrid

"---------------------------------------------------------------------------
" �����ڂ̐ݒ�
set cursorline
set number
"�r�[�v�����ׂĂ𖳌��ɂ���
set visualbell t_vb=
set noerrorbells 

"---------------------------------------------------------------------------
" �����Ƃ��̐ݒ�
"
" TODO�t�@�C��
command! Todo edit ~/todo.txt
" ����
command! -nargs=? Nippo call s:Nippo()
function! s:Nippo()
  let l:day = (60 * 60 * 24)
  let l:w_file = 'D:/My Documents/����/' . strftime("%Y%m%d") . '.md'
  execute 'edit ' . l:w_file
  if !filereadable(l:w_file)
    " 3���O�܂ŒT��
    let l:search_day = localtime()
    for i in range(1, 3)
      let l:search_day = l:search_day - l:day
      let l:r_file = 'D:/My Documents/����/' . strftime("%Y%m%d", l:search_day) . '.md'
      if filereadable(l:r_file)
        execute '0r ' . l:r_file
        break
      endif
    endfor
    " ���ʂ�����
    write
  endif
endfunction
" ����
command! -nargs=1 Memo edit D:/My Documents/�c������/<args>.txt
" �ꎞ�t�@�C��
command! -nargs=1 Tmp edit ~/.vim/tmp.<args>
command! -nargs=1 Temp edit ~/.vim/tmp.<args>
" cd
command! Ccd lcd %:p:h
" vimgrep�̌��ʂ�quickfix�ŕ\��
autocmd vimrc QuickFixCmdPost *grep* cwindow
set number
