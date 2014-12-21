function! s:WithoutBundles()
endfunction

function! s:LoadBundles()
	NeoBundle 'Shougo/neobundle.vim'
endfunction

function! s:InitNeoBundle()
	if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		filetype plugin indent off
		if has('vim_starting')
			set runtimepath+=~/.vim/bundle/neobundle.vim/
		endif
		try
			call neobundle#begin(expand('~/.vim/bundle/'))
			call s:LoadBundles()
			call neobundle#end()
			colorscheme molokai
		catch
			call s:WithoutBundles()
		endtry
	else
		call s:WithoutBundles()
	endif

	filetype indent plugin on
	syntax on
endfunction

call s:InitNeoBundle()

se cindent
se hidden
se tabstop=4
se softtabstop=4
se shiftwidth=4
se number
se hlsearch
se expandtab
se list
se listchars=tab:^\ ,trail:_
se laststatus=2
se fenc=utf-8
se enc=utf-8
se nobackup
se swapfile
