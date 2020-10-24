"###############################################################################
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
filetype plugin indent off  " only use autoindent
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
set textwidth=80            " line length = 80 chars
set colorcolumn=+1          " highlight lines longer than textwidth
set wildignorecase          " enable case insensitive completion
set nowrap                  " do not wrap visually long lines
set ruler                   " show cursor's column and line
set autoindent              " indent automatically with prev indent
set nosmartindent           " disable, hence only autoindent
set nocindent               " disable, hence only autoindent
set mouse=nicr              " don't go in visual mode with mouse drag
set backupcopy=yes          " if backup enabled, write to file and copy " original one
set t_Co=256                " makes vim colorscheme work in tmux
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

" move half page down
nnoremap + ddkP
" move current line down
nnoremap - ddp
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
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType vue        setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType yaml       setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END
augroup TOTYPESCRIPT
    autocmd!
    autocmd BufNewFile,BufRead *.tsx setlocal syntax=typescript sw=2 ts=2 sts=2
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
let g:user_emmet_leader_key = '<C-Z>'
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
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set colorcolumn=+1
set number
set autoindent

inoremap jk <esc>

highlight TrailingWhitespace ctermbg=lightgreen guibg=lightgreen
augroup WHITESPACE
    autocmd!
    autocmd BufWrite * match TrailingWhitespace /\s\+\%#\@<!$/
augroup END

augroup NUMBERTOGGLE
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

augroup TW_WIDE
    autocmd!
    autocmd FileType python setlocal textwidth=120
augroup END

augroup INDENT_SLIM
    autocmd!
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup CURSOR
    autocmd!
    autocmd! VimEnter,InsertLeave *
        \ silent execute '!echo -ne "\e[1 q"' | redraw!
    autocmd! InsertEnter,InsertChange *
        \ if v:insertmode == 'i' |
        \   silent execute '!echo -ne "\e[5 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[3 q"' | redraw! |
        \ endif
    autocmd! VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
augroup END

