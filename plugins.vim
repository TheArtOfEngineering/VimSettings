" Plugins and plugin configuration

set nocompatible
let g:platform = GetPlatform()
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Undo/Redo Tree
Plugin 'sjl/gundo.vim'

" Swift highlighting
Plugin 'keith/swift.vim'

" Smarter '.'
Plugin 'tpope/vim-repeat'

" Automatic space alignment
Plugin 'godlygeek/tabular'

" <p>Surround</p>
Plugin 'tpope/vim-surround'

" Ctrl A/X increase/descrease on steroids (for dates, hence speed dating)
Plugin 'tpope/vim-speeddating'

" [ and ] mappings on steroids
Plugin 'tpope/vim-unimpaired'

" Dipatch build/test
Plugin 'tpope/vim-dispatch'

" Fugitive Git Wrapper
Plugin 'tpope/vim-fugitive'

" Git Exploration plugin
Plugin 'gregsexton/gitv'

" Highlighting for json
Plugin 'elzr/vim-json'

" Syntax for JS ES6 and JSX
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
" Plugin 'isRuslan/vim-es6'

" Syntax for TS
" Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'

" Syntax for Scala
Plugin 'derekwyatt/vim-scala'

" Diff signs in gutter for Git index/working diffs
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 1000

" Clang format for C/C++/ObjC
" map to <Leader>cf in C++ code
Plugin 'rhysd/vim-clang-format'
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

" NERDTree for silesystem exploation
Plugin 'scrooloose/nerdtree'
if g:platform == "AIX"
    let NERDTreeDirArrows=0
endif
let NERDTreeShowBookmarks=1

" NERDCommenter for easy commenting
Plugin 'scrooloose/nerdcommenter'

" Syntax checking
Plugin 'scrooloose/syntastic'

" Airline for pretty status/tab lines
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1 " git gutter
if g:platform == "Linux" || g:platform == "SunOS"
    " Use Patched fonts on Linux and Sun
    let g:airline_powerline_fonts = 1
endif

" Makes GVim colorscheme available in the terminal (regular vim)
Plugin 'godlygeek/csapprox'

" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
Plugin 'flazz/vim-colorschemes'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" AIX-Only plugins
if g:platform != "AIX"
    let g:syntastic_error_symbol = '✗✗'
    let g:syntastic_style_error_symbol = '✠✠'
    let g:syntastic_warning_symbol = '∆∆'
    let g:syntastic_style_warning_symbol = '≈≈'
endif

" Linux-Only plugins
if g:platform == "Linux"
    " Autocompletion and semantic completion
    Plugin 'Valloric/YouCompleteMe'
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_path_to_python_interpreter = '/opt/swt/bin/python'
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_always_populate_location_list = 1
    let g:ycm_filetype_specific_completion_to_disable = { 'c': 0, 'cpp': 0 }

    " Show Location list output in airline
    Plugin 'asenac/vim-airline-loclist'
    let g:airline#extensions#loclist#enabled = 1
endif

call vundle#end()
" filetype plugin indent on

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
