""###############################################################################
"# Dalembert's vimrc                                                           #
"#                                                                             #
"# Vim 8.2                                                                     #
"#                                                                             #
"# Plugins:                                                                    #
"# -------------------------------- General ---------------------------------- #
"# - vim-colors-github  (https://github.com/cormacrelf/vim-colors-github)      #
"###############################################################################

"###############################################################################
"# Globals Settings                                                            #
"###############################################################################
syntax enable               " enable syntax highlighting
filetype plugin indent on   " only use autoindent
colorscheme github          " github colorscheme
set backspace=2             " enable common backspace behavour
set formatoptions=rc        " r auto comment, c wrap comments using textwidth
set number			        " enable line numbers
set relativenumber          " enable relative line numbers
set expandtab		        " use spaces instead of tabs
set shiftwidth=4	        " 1 tab = 4 spaces
set tabstop=4               " indenting 1 tab = 4 spaces
set softtabstop=4           " deleting 1 tab = 4 spaces
set shiftround              " indent to a multiple of shiftwidth
set cursorline              " highlight cursor's line
set textwidth=120           " lines length = 80 chars
set colorcolumn=+1          " highlight lines longer than textwidth
set wildignorecase          " enable case insensitive completion
set nowrap                  " do not wrap visually long lines
set ruler                   " show cursor's column and line
set autoindent              " indent automatically with prev indent
set nosmartindent           " disable, hence only autoindent
set nocindent               " disable, hence only autoindent
set mouse=nicr              " don't go in visual mode with mouse drag
set backupcopy=yes          " if backup enabled, write to file and copy
                            " original one
"###############################################################################
"# Mappings                                                                    #
"###############################################################################

" use <leader> as prefix in mappings
let mapleader = ","
" leave inset mode with j-k, J-k, J-K
inoremap jk <esc>
inoremap Jk <esc>
inoremap JK <esc>

" leave visual mode
vnoremap JK <esc>

" source vimrc
nnoremap <leader><space> :source $MYVIMRC<cr>
" move half page down
nnoremap <C-J> <C-D>
" move half page up
nnoremap <C-K> <C-U>
" move current line up
nnoremap + ddkP
" move current line down
nnoremap - ddp
" edit vimrc in split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" split window horizontally
nnoremap <leader>s :split .<CR>
" split window vertically
nnoremap <leader>v :vsplit .<CR>
" maximize current split
nnoremap <leader>m <C-W>_
" equalize size of all splits
nnoremap <leader>= <C-W>=
" increase current split
nnoremap <leader>+ <C-W>15+
" decrease current split
nnoremap <leader>- <C-W>15-
" increase current vsplit
nnoremap <leader>a <C-W>15<
" decrease current vsplit
nnoremap <leader>f <C-W>15>
" shift focus to left
nnoremap <leader>h <C-W>h
" shift focus to right
nnoremap <leader>l <C-W>l
" shift focus to down
nnoremap <leader>j <C-W>j
" shift focus to up
nnoremap <leader>k <C-W>k
" wrap word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

"###############################################################################
"# Indentation 2 spaces                                                        #
"###############################################################################
augroup TWO
    autocmd!
    autocmd FileType css        setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType haskell    setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType html       setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType markdown   setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType scss       setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType vue        setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType yaml       setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END
"###############################################################################
"# Whitespace                                                                  #
"###############################################################################
" define color for trailing whitespace
highlight TrailingWhitespace ctermbg=lightgreen guibg=lightgreen

" highlight trailing whitespace characters
augroup WHITESPACE
  autocmd!
  autocmd BufWrite * match TrailingWhitespace /\s\+\%#\@<!$/
augroup END

" toggle between relative and absolute line numbers according to mode
augroup NUMBERTOGGLE
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"###############################################################################
"# Plugin Settings                                                             #
"###############################################################################
" - EMMET
" key to trigger emmet completion
"let g:user_emmet_leader_key = '<C-Z>'
" - EDITORCONFIG
" print editorconfig messages
"let g:EditorConfig_verbose = 1
" - ISORT
" key to trigger isort sorting
"let g:vim_isort_map = '<C-I>'
" use latest version of python3 to call isort
"let g:vim_isort_python_version = 'python3'


"###############################################################################
"# OSX                                                                         #
"###############################################################################
"if $TERM_PROGRAM == 'iTerm.app'
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"elseif $TERM_PROGRAM == 'Apple_Terminal'
"    let &t_SI.="\e[5 q"
"    let &t_SR.="\e[4 q"
"    let &t_EI.="\e[1 q"
"endif

"###############################################################################
"# Gnome Terminal                                                              #
"###############################################################################
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
