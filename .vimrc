inoremap <tab> <C-n>

set shell=bash\ -i
"设置非兼容模式
set nocompatible
set nocp
"防止mac中delete键失效 0 :set backspace= (Vi compatible);1“:set backspace=indent,eol”; 2 :set backspace=indent,eol,start
set backspace=2
"设置mapleader
let mapleader="'"
"搜索相关
set hls
set is
"文件格式相关
set encoding=utf-8
set fileencodings=utf-8,gbk
set ff=unix
"缩进相关
set shiftwidth=2
set ts=2
set softtabstop=2
set expandtab 
set autoindent 
vnoremap < <gv
vnoremap > >gv
"打开语法高亮
syntax on
filetype on
filetype plugin on
au BufNewFile,BufRead *.ftl set filetype=html

"背景主题相关
let g:solarized_termcolors=256
set background=dark
colorscheme solarized 
"粘贴相关,设置全局粘贴模式, visual模式修改缩进时不退出该模式,
set pastetoggle=<F2>
vmap <leader>c :w !pbcopy<CR><CR>
nmap <leader>v :r !pbpaste<CR><CR>

"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是; 显示行号,开启光标下划线
set showtabline=1
set laststatus=2
set number
set cursorline
set guifont=Courier:h14
set guifont=Source\ Code\ Pro\ for\ Powerline:h14 

set comments=sl:/*,mb:*,ex:*/

"************** adi's 设置 start ************
"帮助文档中文
set helplang=cn

"缩进提示线关闭
let g:indentLine_enabled = 0

"************** adi's 设置 end **************

"#########快捷键设置###################
" 重新载入配置
map <leader>b :source ~/.vimrc<CR>

"关闭窗口, writeall
map <leader>w :w<CR>
map <leader>s :wall<CR>
map <leader>q :qall<CR>
map <leader>e :wqall<CR>

" 运行nodejs
map <leader>r :!node --harmony %<CR>

"映射Ctrl+F12键为行号的开关
map <leader>d :set number!<CR>

map <leader>g :edit<CR>
"映射ESC 退出
"imap <C-O> <Esc>

nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

"insert mode move cursor
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt


" 设置syntastic_checkers
"let g:syntastic_check_on_open = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_exec = 'tidy'
let g:CSSLint_FileTypeList = ['css', 'less', 'sess']

" jsx
let g:jsx_ext_required = 0

" airline config
" let g:airline_theme="luna" 

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

 "打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
 "我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
 "let g:airline#extensions#tabline#enabled = 1
 "let g:airline#extensions#tabline#buffer_nr_show = 1

 "设置切换Buffer快捷键"
 "nnoremap <C-N> :bn<CR>
 "nnoremap <C-P> :bp<CR>

 " 关闭状态显示空白符号计数,这个对我用处不大"
 let g:airline#extensions#whitespace#enabled = 0
 let g:airline#extensions#whitespace#symbol = '!'


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" NERDTreeTabs
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_open_on_console_startup = 1
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>t <plug>NERDTreeTabsFind<CR>
map <Leader>f <plug>NERDTreeFocusToggle<CR>

" 设置racket颜色
let g:niji_dark_colours = [
    \ [ '81', '#5fd7ff'],
    \ [ '99', '#875fff'],
    \ [ '1',  '#dc322f'],
    \ [ '76', '#5fd700'],
    \ [ '3',  '#b58900'],
    \ [ '2',  '#859900'],
    \ [ '6',  '#2aa198'],
    \ [ '4',  '#268bd2'],
    \ ]

nnoremap <leader>u :call BundlesInit()<CR>
"初始化pathogen插件
let pathogen = $HOME . '/.vim/bundle/vim-pathogen/autoload/pathogen.vim'
execute "source " . pathogen
call pathogen#infect()

"for superttab to cancel completion with 'esc'
"let g:SuperTabNoCompleteAfter = ['^', ',', '\s']
inoremap <expr> <esc> pumvisible() ? "\<c-e>" : "\<esc>"

"初始化所有插件
function! BundlesInit()
    let bundles = {
            \'vim-pathogen' : 'github.com/tpope/vim-pathogen.git',
            \'nerdtree' : 'github.com/scrooloose/nerdtree.git',
            \'snipmate.vim' : 'github.com/dzyhenry/snipmate.vim.git',
            \'syntastic' : 'github.com/scrooloose/syntastic.git',
            \'vim-fugitive' : 'github.com/tpope/vim-fugitive.git',
            \'indentLine' : 'github.com/Yggdroot/indentLine.git',
            \'auto-pairs' : 'github.com/jiangmiao/auto-pairs.git',
            \'vim-nerdtree-tabs' : 'github.com/jistr/vim-nerdtree-tabs.git',
            \'vim-javascript-syntax': 'github.com/jelera/vim-javascript-syntax.git',
            \'vim-jsx': 'github.com/mxw/vim-jsx.git',
            \'nerdcommenter': 'github.com/scrooloose/nerdcommenter.git',
            \'supertab' : 'github.com/ervandew/supertab.git',
            \'bats.vim' : 'github.com/vim-scripts/bats.vim.git',
            \'smartim' : 'github.com/ybian/smartim.git',
            \'vim-instant-markdown': 'github.com/suan/vim-instant-markdown.git',
            \'paredit.vim' : 'github.com/vim-scripts/paredit.vim.git',
            \'vim-niji' : 'github.com/raymond-w-ko/vim-niji.git',
            \'tslime.vim' : 'github.com/sjl/tslime.vim.git',
            \'fonts' : 'github.com/powerline/fonts.git',
            \'vim-airline' : 'github.com/vim-airline/vim-airline.git',
            \'vim-airline-themes' : 'github.com/vim-airline/vim-airline-themes.git',
            \'haskell-vim' : 'github.com/neovimhaskell/haskell-vim.git',
            \'vim-graphql': 'github.com/jparise/vim-graphql.git'
        \}
    let bundleDir = $HOME . '/.vim/bundle/'
    if !isdirectory(bundleDir)
        let output = mkdir(bundleDir)
    endif
    for key in keys(bundles)
        let dir = bundleDir . key
        if !isdirectory(dir)
            let cmd = 'git clone git://' . bundles[key] . ' ' . bundleDir . key
            echo 'fetching ' . key . '...'
            let output = system(cmd)
        endif
    endfor
    if exists(':Helptags')
        :Helptags
    endif
    echo 'all bundles are ready.'
endfunction
