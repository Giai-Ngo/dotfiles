
" General
	set number		" Line numbers
	set mouse=a		" Enable your mouse
	set encoding=utf-8	" The encoding displayed
	
	set lbr!		" wrap in word
	set linespace=6
	set smartindent		" Makes indenting smart
	set backspace=indent,eol,start	" allow backspacing over everything in insert mode
	set autoindent 		" always set autoindenting on
	set copyindent		" copy the previous indentation on autoindenting
	set shiftround		" use multiple of shiftwidth when indenting with '<' and '>'
	set showmatch		" set show matching parenthesis

	set nobackup		" This is recommended by coc
	set nowritebackup	" This is recommended by coc

	set scrolloff=3
	set showmode
	set showcmd
	set hidden		" if hidden is not set, TextEdit might fail.
	set wildmenu
	set wildmode=list:longest
	set ruler
	set laststatus=2
	set undofile

	set cmdheight=1		" Better display for messages

" Searching
	set ignorecase		" ignore case when searching
	set smartcase		" ignore case if search pattern is all lowercase, case-sensitive otherwise
	set smarttab		" insert tabs on the start of a line according to shiftwidth, not tabstop
	set hlsearch		" highlight search terms
	set incsearch		" show search matches as you type

" Marks of formatage
"	set list
"	set listchars=tab:▸\ ,eol:¬	

	set nocompatible

	set modelines=0

	cmap w!! w !sudo tee %	" You can't stop me, write with admin right

" Syntax on switch syntax highlighting on, when the terminal has colors
	if &t_Co > 2 || has("gui_running")
			syntax on
			colorscheme desert
			set guifont=Liberation\ Mono\ 12
			set lines=24 columns=132	
	endif

	filetype plugin indent on

" Status bar
	" hi StatusLine ctermfg=DarkGrey ctermbg=white
	" set statusline=\ [%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ Ligne:%l/%L\ Col:%c\ \ \ %p%%\ 



" Programe for install plugins vim-plug "
"""""""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/vim-plug
" Specify a directory for plugins - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

	" see: https://github.com/iamcco/markdown-preview.nvim
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

	" Status/tabline for vim themes
	Plug 'vim-airline/vim-airline'

	" A solid language pack for Vim.
	Plug 'sheerun/vim-polyglot'

	" :Neoformat
	Plug 'sbdchd/neoformat'

	" :NERDTree + q is close
	Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()


" Plugins config "
""""""""""""""""""

" markdown-preview

	" set to 1, nvim will open the preview window after entering the markdown buffer
	" default: 0
	let g:mkdp_auto_start = 1

	" set to 1, the nvim will auto close current preview window when change
	" from markdown buffer to another buffer
	" default: 1
	let g:mkdp_auto_close = 1

	" set to 1, the vim will refresh markdown when save the buffer or
	" leave from insert mode, default 0 is auto refresh markdown as you edit or
	" move the cursor
	" default: 0
	let g:mkdp_refresh_slow = 0

	" set to 1, the MarkdownPreview command can be use for all files,
	" by default it can be use in markdown file
	" default: 0
	let g:mkdp_command_for_global = 0

	" set to 1, preview server available to others in your network
	" by default, the server listens on localhost (127.0.0.1)
	" default: 0
	let g:mkdp_open_to_the_world = 0

	" use custom IP to open preview page
	" useful when you work in remote vim and preview on local browser
	" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
	" default empty
	let g:mkdp_open_ip = ''

	" specify browser to open preview page
	" default: ''
	let g:mkdp_browser = ''

	" set to 1, echo preview page url in command line when open preview page
	" default is 0
	let g:mkdp_echo_preview_url = 0

	" a custom vim function name to open preview page
	" this function will receive url as param
	" default is empty
	let g:mkdp_browserfunc = ''

	" options for markdown render
	" mkit: markdown-it options for render
	" katex: katex options for math
	" uml: markdown-it-plantuml options
	" maid: mermaid options
	" disable_sync_scroll: if disable snc scroll, default 0
	" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
	"   middle: mean the cursor position alway show at the middle of the preview page
	"   top: mean the vim top viewport alway show at the top of the preview page
	"   relative: mean the cursor position alway show at the relative positon of the preview page
	" hide_yaml_meta: if hide yaml metadata, default is 1
	" sequence_diagrams: js-sequence-diagrams options
	" content_editable: if enable content editable for preview page, default: v:false
	" disable_filename: if disable filename header for preview page, default: 0
	let g:mkdp_preview_options = {
		\ 'mkit': {},
		\ 'katex': {},
		\ 'uml': {},
		\ 'maid': {},
		\ 'disable_sync_scroll': 0,
		\ 'sync_scroll_type': 'middle',
		\ 'hide_yaml_meta': 1,
		\ 'sequence_diagrams': {},
		\ 'flowchart_diagrams': {},
		\ 'content_editable': v:false,
		\ 'disable_filename': 0
		\ }

	" use a custom markdown style must be absolute path
	" like '/Users/username/markdown.css' or expand('~/markdown.css')
	let g:mkdp_markdown_css = ''

	" use a custom highlight style must absolute path
	" like '/Users/username/highlight.css' or expand('~/highlight.css')
	let g:mkdp_highlight_css = ''

	" use a custom port to start server or random for empty
	let g:mkdp_port = ''

	" preview page title
	" ${name} will be replace with the file name
	let g:mkdp_page_title = '「${name}」'

	" recognized filetypes
	" these filetypes will have MarkdownPreview... commands
	let g:mkdp_filetypes = ['markdown']

