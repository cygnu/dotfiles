"dein Scripts----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+={path to dein.vim directory}

" Required:
call dein#begin({path to plugin base path directory})

" Let dein manage dein
call dein#add({path to dein.vim directory})
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Required:
call dein#end()

" Required:
" ファイルタイプを一旦無効化し、最後に有効にする
filetype plugin indent on

syntax enable

set bg=dark

" colorscheme iceberg

" If you want to install not installed plugins on startup.
"if dein#check_install()
" call dein#install()
"endif
"End dein Scripts------------------------

" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start

"----------------------------------------
" 検索
"----------------------------------------
" 検索結果をハイライト表示
set hlsearch

" 検索するときに大文字小文字を区別しない
set ignorecase

" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch

" 小文字で検索すると大文字と小文字を無視して検索
set smartcase

" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan

"----------------------------------------
" 表示設定
"----------------------------------------
" コメントの色を水色
hi Comment ctermfg=3

" カーソルラインハイライト
set cursorline

" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab

" ステータス行を常に表示
set laststatus=2

" 不可視文字を表示する
set list

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" 行番号を表示
set number

" インデント幅
set shiftwidth=2

" 対応する括弧を強調表示
set showmatch

" 対応する括弧やブレースを表示
set showmatch matchtime=1

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" Tabキー押下時に挿入される文字幅を指定
set softtabstop=2

" ファイル内にあるタブ文字の表示幅
set tabstop=2

" タイトルを表示
set title

" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~

" コマンドライン補完
set wildmenu

" シンタックスハイライト
syntax on

" 上部に表示される情報を非表示
let g:netrw_banner=0

" 表示形式をTreeViewに変更
let g:netrw_liststyle=3

" 左右分割を右側に開く
let g:netrw_altv=1

" 分割で開いたときに85%のサイズで開く
let g:netrw_winsize=85

" 挿入モードでカーソルの形状を変える
if &term =~ "screen"
  let &t_SI = "\eP\e]50;CursorShape=1\x7\e\\"
  let &t_EI = "\eP\e]50;CursorShape=0\x7\e\\"
elseif &term =~ "xterm"
  let &t_SI = "\e]50;CursorShape=1\x7"
  let &t_EI = "\e]50;CursorShape=0\x7"
endif

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

filetype plugin indent on
