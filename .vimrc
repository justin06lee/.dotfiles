" load plugins with vim-plug
call plug#begin('~/.vim/plugged')

" ── Theme ───────────────────────────────────────────────────
Plug 'morhetz/gruvbox'

" ── UI ──────────────────────────────────────────────────────
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'
Plug 'simnalamburt/vim-mundo'

" ── Navigation ──────────────────────────────────────────────
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'Xuyuanp/nerdtree-git-plugin'

" ── Editing ─────────────────────────────────────────────────
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'mg979/vim-visual-multi'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-sort-motion'
Plug 'chrisbra/NrrwRgn'

" ── Text objects ────────────────────────────────────────────
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-expand-region'

" ── Snippets ────────────────────────────────────────────────
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" ── HTML/CSS ────────────────────────────────────────────────
Plug 'mattn/emmet-vim'

" ── Formatting ──────────────────────────────────────────────
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json',
  \          'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html',
  \          'typescriptreact', 'javascriptreact'] }
Plug 'philj56/vim-asm-indent'


" ── Whiplash ────────────────────────────────────────────────
Plug 'The-Whiplash/runners-kit'
Plug 'The-Whiplash/mach10.vim'
Plug 'The-Whiplash/phosphor-burn'

call plug#end()

colorscheme phosphor-burn

" ── Format to width ─────────────────────────────────────────
function! s:FormatToWidth() abort
	let l:saved = {
		\ 'tw':  &l:textwidth,
		\ 'fo':  &l:formatoptions,
		\ 'ai':  &l:autoindent,
		\ 'si':  &l:smartindent,
		\ 'ci':  &l:cindent,
		\ 'ie':  &l:indentexpr,
		\ 'et':  &l:expandtab,
		\ 'fex': &l:formatexpr,
		\ 'fp':  &l:formatprg,
	\ }
	try
		setlocal textwidth=120
		setlocal noautoindent nosmartindent nocindent indentexpr=
		setlocal formatoptions=tq
		setlocal formatexpr= formatprg=
		setlocal expandtab
		let l:view = winsaveview()
		silent! keepjumps normal! gggqG
		call winrestview(l:view)
		silent! keeppatterns %s/\v(\S) {2,}(\S)/\1 \2/ge
		nohlsearch
	finally
		let &l:textwidth	 = l:saved.tw
		let &l:formatoptions = l:saved.fo
		let &l:autoindent	= l:saved.ai
		let &l:smartindent   = l:saved.si
		let &l:cindent	   = l:saved.ci
		let &l:indentexpr	= l:saved.ie
		let &l:expandtab	 = l:saved.et
		let &l:formatexpr	= l:saved.fex
		let &l:formatprg	 = l:saved.fp
	endtry
endfunction

nnoremap <silent> <leader>dtw :<C-u>call <SID>FormatToWidth()<CR>
