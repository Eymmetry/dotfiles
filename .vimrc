"jjをESCに割あて"
inoremap <silent> jj <ESC>
"clipboardを有効"
set clipboard=unnamedplus
"行番号を表示"
set number
"相対表示"
set relativenumber
"ステータスラインを常に表示(デフォルトは0)"
set laststatus=2
"タブ幅をスペース4つ分にする
set tabstop=4
"vimが自動で生成する(読み込み時など)タブ幅をスペース4つ分にする
set shiftwidth=4
"改行時に入力された行の末尾合わせて次の行のインデントを増減する
set smartindent

syntax on

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set encoding=utf-8
scriptencoding utf-8
set ambiwidth=double " UTF-8の□や○でカーソル位置がずれないようにする

set wildmenu
set autoindent


call plug#begin()

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'KeitaNakamura/neodark.vim' " vim-plug
set termguicolors                " recommended
let g:neodark#terminal_transparent = 1 " default: 0

Plug 'lervag/vimtex'
let g:latex_latexmk_options = '-pdf'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_progname='nvr'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jpalardy/vim-slime' "なんか別のtarget(tmuxとか)に送るやつ
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default=1 "こいつはいちいち聞いてくるやつを聞いてこないようにする(defaultにする)


Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

Plug 'itchyny/lightline.vim' "なんかステータスバーをいい感じにするやつ


Plug 'mroavi/vim-julia-cell', { 'for': 'julia' } "vim-slimeをつかってjuliaのvim環境を良くするやつ
let g:julia_cell_delimit_cells_by = 'tags'

" map <Leader>jr to run entire file
nnoremap <Leader>jr :JuliaCellRun<CR>

" map <Leader>jc to execute the current cell
nnoremap <Leader>jc :JuliaCellExecuteCell<CR>

" map <Leader>jC to execute the current cell and jump to the next cell
nnoremap <Leader>jC :JuliaCellExecuteCellJump<CR>

" map <Leader>jl to clear Julia screen
nnoremap <Leader>jl :JuliaCellClear<CR>

" map <Leader>jp and <Leader>jn to jump to the previous and next cell header
nnoremap <Leader>jp :JuliaCellPrevCell<CR>
nnoremap <Leader>jn :JuliaCellNextCell<CR>

" map <Leader>je to execute the current line or current selection
nmap <Leader>je <Plug>SlimeLineSend
xmap <Leader>je <Plug>SlimeRegionSend

Plug 'tpope/vim-fugitive'

call plug#end()

colorscheme neodark
set term=xterm-256color "tmuxがちゃんとした色になるように必要だった。

