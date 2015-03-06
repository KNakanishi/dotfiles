if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone
    git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'
 
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-rails'
NeoBundleLazy 'basyura/unite-rails'
NeoBundleLazy 'Shougo/neosnippet'

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on


" if や for などの文字にも%で移動できるようになる
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1

" set t_Co=256は256色対応のターミナルソフトでのみ作用
set t_Co=256
" 色づけを on にする
syntax on
" カラースキーマを設定する。jellybeansは最初はないカラースキーマだが、次回説明するプラグインにて説明する。
" colorscheme jellybeans
" ターミナルの右端で文字を折り返さない
set nowrap

" ハイライトサーチを有効にする。文字列検索は /word とか * ね
set hlsearch
" 大文字小文字を区別しない(検索時)
set ignorecase
" ただし大文字を含んでいた場合は大文字小文字を区別する(検索時)
set smartcase

" カーソル位置が右下に表示される
set ruler
" 行番号を付ける
set number
" コマンドライン補完が強力になる
set wildmenu
" コマンドを画面の最下部に表示する
set showcmd
" クリップボードを共有する(設定しないとvimとのコピペが面倒です)
set clipboard=unnamed

" 改行時にインデントを引き継いで改行する
" set autoindent
" インデントにつかわれる空白の数
set shiftwidth=2
" <Tab>押下時の空白数
set softtabstop=2
" <Tab>押下時に<Tab>ではなく、ホワイトスペースを挿入する
set expandtab
" <Tab>が対応する空白の数
set tabstop=2
set nopaste

" マウス使えます
set mouse=a

" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
imap [ []<left>
imap ( ()<left>
imap { {}<left>

" 挿入モード時のカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ２回esc を押したら検索のハイライトをヤメる
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" backspaceで文字を消せるようにする
set bs=start,indent
set backspace=2

" grepで検索した場合に、検索結果一覧を別画面で表示
autocmd QuickFixCmdPost *grep* cwindow

nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>
nnoremap gg <C-W><C-W>

" vimgrepのシュートカット：カーソル位置の単語を検索
nnoremap <expr> gr ':vimgrep ;\<' . expand('<cword>') . '\>; '
" 現在開いているファイルに対してカーソル位置の単語を検索
nnoremap <expr> hgr ':vimgrep ;\<' . expand('<cword>') . '\>; % '
