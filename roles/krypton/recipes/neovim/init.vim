" vim:foldmethod=marker foldlevel=0

" ## Settings {{{

" map*leader {{{
let mapleader=" "
let maplocalleader="\\"
" }}}

" TTY Performance {{{
set nocompatible
set synmaxcol=300
set ttyfast
set lazyredraw
" }}}

" Backup/swap/undo Directories {{{
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/swaps
set undodir=~/.config/nvim/undo
set undofile
" }}}

" Environment {{{ 
" map */+ registers to macOS pastebuffer
set clipboard=unnamed
" Disable beeps and flashes
set noerrorbells visualbell t_vb=
set encoding=utf-8
" }}}

" Whitespace handling {{{
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:»·,trail:·
" }}}

" Searching {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
" }}}

" Tab completion {{{
set wildmode=list:longest,list:full
" set wildmode=list:longest
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*/tmp/*,*.so,*.swp,*.zip
" }}}

" Gutter Line Numberings {{{
set rnu
set nu
set numberwidth=1
" }}}

" Enable Mouse in TTY {{{
if has("mouse")
  set mouse=a
endif
" }}}

" Timeout configuration for (e.g.) kj insert mode mapping {{{
set notimeout
set ttimeout
set timeoutlen=50
" }}}

" (Miscellaneous Settings) {{{
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set printfont=PragmataPro:h12
set fillchars+=vert:│
set scrolloff=3
set autoindent
set autoread
set showmode
set showcmd
set hidden
set nocursorline
set ruler
set laststatus=2
set concealcursor=""
" write before make
set autowrite
" }}}

" }}}

" NeoVim-specific {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Neovim takes a different approach to initializing the GUI. As It seems some
" Syntax and FileType autocmds don't get run all for the first file specified
" on the command line.  hack sidesteps that and makes sure we get a chance to
" get started. See https://github.com/neovim/neovim/issues/2953
augroup nvim
  au!
  au VimEnter * doautoa Syntax,FileType
augroup END
" }}}

" Syntax Highlighting {{{
if $TERM_BG == "light"
  set background=light
else
  set background=dark
endif
colorscheme nord
" load the plugin and indent settings for the detected filetype
filetype plugin indent on
" }}}

" ## Plugin/Feature Configuration {{{

" Netrw {{{
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" }}}

" Supertab {{{
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1
" }}}

" Tagbar {{{
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

if executable('ripper-tags')
    let g:tagbar_type_ruby = {
                \ 'kinds' : [
                    \ 'm:modules',
                    \ 'c:classes',
                    \ 'f:methods',
                    \ 'F:singleton methods',
                    \ 'C:constants',
                    \ 'a:aliases'
                \ ],
                \ 'ctagsbin':  'ripper-tags',
                \ 'ctagsargs': ['-f', '-']
                \ }
endif
" }}}

" LightLine {{{
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
" }}}

" FZF {{{
" set rtp+=/usr/local/opt/fzf

nnoremap <leader>j :Buffers<cr>
nnoremap <leader><C-p> :Files<cr>
nnoremap <leader><C-s> :GFiles?<cr>
nnoremap <C-p> :GFiles<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>T :BTags<cr>

" Also useful: :Ag, :Marks, :History, :History/, :Commits, :BCommits

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd ColorScheme * call <sid>update_fzf_colors()
augroup END

" set shell=/usr/local/bin/zsh
augroup _term
  autocmd TermOpen term://* set nonu nornu
  " autocmd TermOpen term://* startinsert
augroup END

" }}}

" neosnippet {{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }}}

" }}}

" ## Per-Filetype Configuration {{{

" Makefile {{{
augroup makefile
  au!
  au FileType make set noexpandtab
augroup END
" }}}

" Go {{{
augroup golang
  au!
  au BufNewFile,BufRead *.go set nolist
  au Filetype go set makeprg=go\ build\ ./...
  " au Filetype go nnoremap <buffer> ∫ <Plug>(go-build) " alt+b
  " au Filetype go nnoremap <buffer> ® <Plug>(go-run)   " alt+r

  " alt+b
  au Filetype go nmap <buffer> ∫ <Plug>(go-build)
  " alt+r
  au Filetype go nmap <buffer> ® <Plug>(go-run)
  " alt+t
  au Filetype go nmap <buffer> † <Plug>(go-test)
  " alt+p
  au Filetype go nmap <buffer> π :GoDeclsDir<cr>

  " alt+l
  au Filetype go nmap <buffer> ¬ :GoMetaLinter<cr>

  au Filetype go nmap <buffer> <leader>gac <Plug>(go-alternate-edit)
  au Filetype go nmap <buffer> <leader>gah <Plug>(go-alternate-split)
  au Filetype go nmap <buffer> <leader>gav <Plug>(go-alternate-vertical)

  " alt+9
  au FileType go nmap <buffer> ª :DlvToggleBreakpoint<cr>
  " alt+0
  au FileType go nmap <buffer> º :DlvDebug<cr>

  au FileType go nmap <buffer> √ :GoCoverageToggle<cr>

  au FileType go nmap <buffer> <leader><space> :nohls <bar> :GoSameIdsClear<cr>

  " alt+8
  au FileType go nmap <buffer> • :GoSameIds<cr>

  " alt+f
  " au FileType go nmap <buffer> ƒ :GoReferrers<cr>
  au FileType go nmap <buffer> ƒ :GoCallers<cr>
augroup END

" json tags (:GoAddTags) in snake_case
let g:go_addtags_transform = "snakecase"

let g:go_snippet_engine = "neosnippet"

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" highlight occurrences of local on hover
let g:go_auto_sameids = 0

" type info in statusline
let g:go_auto_type_info = 1

let g:go_fmt_command = "goimports"

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "10s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'errcheck',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
\]
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
    " \ 'gosimple',
" }}}

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Rust {{{
let g:rustfmt_autosave = 1
" }}}

" Pandoc {{{
augroup pandoc
  au!
  au FileType pandoc,markdown set textwidth=100 tabstop=8 concealcursor=""
  au FileType pandoc,markdown let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
  au Syntax pandoc,markdown syntax sync fromstart
augroup END
let g:pandoc#syntax#codeblocks#embeds#langs = ["c", "ruby", "bash=sh", "diff", "dot"]
" }}}

" Ruby {{{
let g:ruby_indent_assignment_style = 'variable'
" }}}

" Miscellaneous (txt,md,lua,js,python,ruby-c) {{{
augroup misc_mode_extras
  au!
  au BufRead,BufNewFile *.lua       set ft=lua
  au BufRead,BufNewFile *.ronn      set ft=markdown
  au BufRead,BufNewFile *.json      set ft=javascript
  au BufRead,BufNewFile Gemfile     set ft=ruby
  au BufRead,BufNewFile Rakefile    set ft=ruby
  au BufRead,BufNewFile Vagrantfile set ft=ruby
  au BufRead,BufNewFile config.ru   set ft=ruby
  au BufRead,BufNewFile *.rbi       set ft=ruby
augroup END

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=80
endfunction

augroup misc_indentation_and_wrapping
  au!
  au BufRead,BufNewFile {*.txt,*.md} call s:setupWrapping()
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
  au BufRead,BufNewFile */ruby/ruby/*.{c,h}    set sw=4 ts=8 softtabstop=8 noet
augroup END
" }}}

" }}}

if has('nvim')
  " Enable deoplete on startup
  let g:deoplete#enable_at_startup = 1
endif

tnoremap <Esc> <C-\><C-n>
tnoremap kj <C-\><C-n>

" Remember last location in file
augroup remember_last_location
  au!
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
augroup END

" % to bounce from do to end etc.
runtime! macros/matchit.vim
nnoremap <tab> %
vnoremap <tab> %

" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"

" ## Mappings {{{

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" ; instead of : {{{
" nnoremap ; :
" <A-;>
nnoremap … ;
" }}}

" Disable F1 {{{
inoremap <f1> <esc>
nnoremap <f1> <esc>
cnoremap <f1> <esc>
" }}}

" Feature/Mode Parity {{{
" like C or D
nnoremap Y yf$
vnoremap . :norm.<cr>
" }}}

" kj = <esc> {{{
inoremap kj <esc>
cnoremap kj <esc>
vnoremap kj <esc>
" }}}

" Navigation {{{
" I don't like the default mappings for H and L, and ^ and $ are hard to type
" for how useful they are.
noremap H ^
noremap L $

" Jumping between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}

" Replace line with contents of yank ring
nnoremap <leader>p Pjddkyy


nnoremap Q @q
" remove trailing space from file
nnoremap <leader>s :%s/ \+$//ge<cr>:noh<cr>
nnoremap <leader>s :syntax sync fromstart<CR>

nnoremap <leader>9 Orequire'pry';binding.pry<esc>

nnoremap <leader><space> :noh<cr>

cnoremap w!! %!sudo tee > /dev/null %

" THANKS NEOVIM
nnoremap <bs> <C-w>h

" wtf even are these {{{
nnoremap ∆ :m+<CR>==
" <A-j>
inoremap ∆ <Esc>:m+<CR>==gi
vnoremap ∆ :m'>+<CR>gv=gv

" <A-k>
nnoremap ˚ :m-2<CR>==
inoremap ˚ <Esc>:m-2<CR>==gi
vnoremap ˚ :m-2<CR>gv=gv
" }}}

" nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
" nnoremap <leader>ev :edit ~/.config/nvim/init.vim<cr>

nnoremap <leader>n <C-^>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
cnoremap %^ <C-R>=expand('%')<cr>

nnoremap <leader>4 :NERDTree<cr>
"nnoremap <leader>5 :GitGutterToggle<cr>
nnoremap <leader>5 :TagbarToggle<cr>

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Align selection by some marker
" e.g. gaip=
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Replace the word under the cursor throughout the file.
nnoremap <leader>6 *#:redraw<cr>:%s/<C-r><C-w>//gc<left><left><left>

" }}}

function! ListWhich()
  let curr = winnr()
  for i in range(1, winnr('$'))
    let wid = win_getid(i)
    let dict = getwininfo(wid)
    if len(dict) > 0 && get(dict[0], 'quickfix', 0) && !get(dict[0], 'loclist', 0)
      return ['q', i]
    elseif len(dict) > 0 && get(dict[0], 'quickfix', 0) && get(dict[0], 'loclist', 0)
      return ['l', i]
    endif
  endfor
  return [0, 0]
endfunction

function! ToggleList()
  let ret = ListWhich()
  let curr = ret[1] == winnr()
  if ret[0] == 'q'
    if curr
      cclose
    else
      copen
    endif
  elseif ret[0] == 'l'
    if curr
      lclose
    else
      lopen
    endif
  endif
endfunction

function! ListNext()
  let ret = ListWhich()
  if ret[0] == 'q'
    cnext
  elseif ret[0] == 'l'
    lnext
  endif
endfunction

function! ListPrev()
  let ret = ListWhich()
  if ret[0] == 'q'
    cprev
  elseif ret[0] == 'l'
    lprev
  endif
endfunction


let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_preview_window = 'right:50%'
let g:fzf_tags_command = 'bash -c "build-ctags"'

let g:fzf_history_dir = '~/.fzf-history'
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --hidden --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  if a:fullscreen
    let options = fzf#vim#with_preview(options)
  endif
  call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" Completely use RG, don't use fzf's fuzzy-matching

set guifont=Iosevka:h11

let NERDTreeMinimalUI=1

map <C-g> :RG<CR>
map <Space>/ :execute 'Rg ' . expand('<cword>')<CR>
map <leader>/ :execute 'Rg ' . input('Rg/')<CR>
" map <C-n> :NERDTreeToggle<CR>



let g:nvim_tree_side = 'right' "left by default
let g:nvim_tree_width = 40 "30 by default, can be width_in_columns or 'width_in_percent%'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_auto_resize = 0 "1 by default, will resize the tree to its saved width when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }


let g:nvim_tree_icons = {
    \ 'default': ' ',
    \ 'symlink': ' ',
    \ 'git': {
    \   'unstaged': "✗ ",
    \   'staged': "✓ ",
    \   'unmerged': " ",
    \   'renamed': "➜ ",
    \   'untracked': "★ ",
    \   'deleted': " ",
    \   'ignored': "◌ "
    \   },
    \ 'folder': {
    \   'arrow_open': " ",
    \   'arrow_closed': " ",
    \   'default': " ",
    \   'open': " ",
    \   'empty': " ",
    \   'empty_open': " ",
    \   'symlink': " ",
    \   'symlink_open': " ",
    \   },
    \   'lsp': {
    \     'hint': " ",
    \     'info': " ",
    \     'warning': " ",
    \     'error': " ",
    \   }
    \ }
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }




nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
highlight NERDTreeOpenable ctermfg=1
highlight NvimTreeFolderIcon guibg=blue

let g:mapleader="\<Space>"
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

let g:dashboard_custom_header = [
    \'',
    \'   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ',
    \'    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
    \'          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ',
    \'           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
    \'          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
    \'   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
    \'  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
    \' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
    \' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ',
    \'      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
    \'       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
    \'',
    \]

let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC c n',
\ 'change_colorscheme' : 'SPC t c',
\ 'find_word'          : 'SPC f a',
\ 'book_marks'         : 'SPC f b',
\ }

" let g:dashboard_custom_shortcut_icon['last_session'] = ' '
" let g:dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
" let g:dashboard_custom_shortcut_icon['find_file'] = ' '
" let g:dashboard_custom_shortcut_icon['new_file'] = ' '
" let g:dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
" let g:dashboard_custom_shortcut_icon['find_word'] = ' '
" let g:dashboard_custom_shortcut_icon['book_marks'] = ' '

" let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1
autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
      \ quit | endif
autocmd BufWinEnter * silent NERDTreeMirror
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" map <C-g> :Rg<CR>
" map <leader>/ :execute 'RG ' . input('Rg/')<CR>
" map <Space>/ :execute 'RG ' . input('Rg/', expand('<cword>'))<CR>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--tiebreak=begin']}), <bang>0)
map <C-t> :Files<CR>





function! ZettelkastenSetup()
  if expand("%:t") !~ '^[0-9]\+'
    return
  endif
  " syn region mkdFootnotes matchgroup=mkdDelimiter start="\[\["    end="\]\]"

  inoremap <expr> <plug>(fzf-complete-path-custom) fzf#vim#complete#path("rg --files -t md \| sed 's/^/[[/g' \| sed 's/$/]]/'")
  imap <buffer> [[ <plug>(fzf-complete-path-custom)

  function! s:CompleteTagsReducer(lines)
    if len(a:lines) == 1
      return "#" . a:lines[0]
    else
      return split(a:lines[1], '\t ')[1]
    end
  endfunction

  inoremap <expr> <plug>(fzf-complete-tags) fzf#vim#complete(fzf#wrap({
        \ 'source': 'bash -lc "zk-tags-raw"',
        \ 'options': '--multi --ansi --nth 2 --print-query --exact --header "Enter without a selection creates new tag"',
        \ 'reducer': function('<sid>CompleteTagsReducer')
        \ }))
  imap <buffer> # <plug>(fzf-complete-tags)
endfunction

" Don't know why I can't get FZF to return {2}
function! InsertSecondColumn(line)
  " execute 'read !echo ' .. split(a:e[0], '\t')[1]
  exe 'normal! o' .. split(a:line, '\t')[1]
endfunction

command! ZKR call fzf#run(fzf#wrap({
        \ 'source': 'ruby ~/.bin/zk-related.rb "' .. bufname("%") .. '"',
        \ 'options': '--ansi --exact --nth 2',
        \ 'sink':    function("InsertSecondColumn")
      \}))

autocmd BufNew,BufNewFile,BufRead ~/Documents/Zettelkasten/*.md call ZettelkastenSetup()

nnoremap ç :call ToggleList()<cr>
nnoremap ∆ :call ListNext()<cr>
nnoremap ˚ :call ListPrev()<cr>

nnoremap <leader>i :wa <bar> make<cr>

