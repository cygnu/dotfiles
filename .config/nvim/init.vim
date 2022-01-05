"dein Scripts----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" プラグインがインストールされるディレクトリ
let s:dein_dir      = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 管理するプラグインを記述したファイル
let s:toml_dir  = expand('~/.dein/')
let s:toml      = s:toml_dir . 'dein.toml'
let s:toml_lazy = s:toml_dir . 'dein-lazy.toml'

" プラグインの追加
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml)
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Required:
" ファイルタイプを一旦無効化し、最後に有効にする
filetype plugin indent on
syntax enable             " シンタックスハイライト

set bg=dark

" colorscheme iceberg

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts------------------------

"----------------------------------------
" 検索
"----------------------------------------
set hlsearch   " 検索結果をハイライト表示
set ignorecase " 検索するときに大文字小文字を区別しない
set incsearch  " インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set smartcase  " 小文字で検索すると大文字と小文字を無視して検索
set wrapscan   " 検索がファイル末尾まで進んだら、ファイル先頭から再び検索

"----------------------------------------
" 表示設定
"----------------------------------------
hi Comment ctermfg=3            " コメントの色を水色
set backspace=indent,eol,start  " 挿入モードでバックスペースで削除できるようにする
set cursorline                  " カーソルラインハイライト
set laststatus=2                " ステータス行を常に表示
set list                        " 不可視文字を表示する
set listchars=tab:^\ ,trail:~   " 行末のスペースを可視化
set noerrorbells                " エラーメッセージの表示時にビープを鳴らさない
set number                      " 行番号を表示
set shiftwidth=2                " インデント幅
set showmatch                   " 対応する括弧を強調表示
set showmatch matchtime=1       " 対応する括弧やブレースを表示
set title                       " タイトルを表示
set whichwrap=b,s,h,l,<,>,[,],~ " 行をまたいで移動
set wildmenu                    " コマンドライン補完

" Tab
set expandtab     " 入力モードでTabキー押下時に半角スペースを挿入
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set softtabstop=2 " Tabキー押下時に挿入される文字幅を指定
set tabstop=2     " ファイル内にあるタブ文字の表示幅

syntax on               " シンタックスハイライト
let g:netrw_banner=0    " 上部に表示される情報を非表示
let g:netrw_liststyle=3 " 表示形式をTreeViewに変更
let g:netrw_altv=1      " 左右分割を右側に開く
let g:netrw_winsize=85  " 分割で開いたときに85%のサイズで開く

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
