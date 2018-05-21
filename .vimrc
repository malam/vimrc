set expandtab             " turn tabs into spaces
set shiftwidth=4          " 4 character tab width
set softtabstop=4
set tabstop=4             " real tabs should be double width so they're noticed
set shiftround            " when at 3 spaces, hitting >> should take me to 4, not 5
set nobackup
set showmatch             " show matching {}, (), etc.
set autoindent            " maintain indent based on prev line
set paste
set bs=2
syntax on                 " enable syntax highlighting
set number                " show line numbers
set cmdheight=1           " Make sure command line is 1 line high
set smartcase             " ...unless there's a capital letter
set hlsearch              " Highlight search term in file
set history=200           " Keep a fair amt of history
set visualbell t_vb=
set noerrorbells          " Make no noise
set shell=bash            " Just in case shell cmds are used

" Set font for whether we're in gvim or vim
if has("gui_running")
    if has("gui_gtk2")         " GTK+2 (not GTK+1)
        set gfn=Bitstream\ Vera\ Sans\ Mono\ 10
    elseif has("gui_photon")   " Photon GUI
        set gfn=Bitstream\ Vera\ Sans\ Mono:s10
    elseif has("gui_kde")      " the obsolete kvim
        set gfn=Bitstream\ Vera\ Sans\ Mono/10/-1/5/50/0/0/0/1/0
    else          " other X11 versions (including GTK+1)
        set gfn=-*-lucidatypewriter-medium-r-normal-sans-14-100-*-*-*-*-*-*
    endif
endif

" Remap W, Q, and E comamnds to w, q, and e
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

if has("autocmd")
    au FileType indent on                 " Enable filetype-based indenting
    au FileType plugin on                 " Enable filetype-based plugins
    autocmd BufEnter * silent! lcd %:p:h  " cd into file's directory
    autocmd filetype make setlocal ts=4 sts=4 sw=4 noexpandtab
                                          " use real tabs for makefiles
endif

" Colorscheme settings
colorscheme delek
highlight Search cterm=NONE ctermfg=black ctermbg=grey
highlight Search gui=NONE guifg=black guibg=grey
highlight Visual cterm=NONE ctermfg=black ctermbg=green
highlight Visual gui=NONE guifg=black guibg=green
