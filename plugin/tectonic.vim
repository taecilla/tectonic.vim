if exists('g:tectonic_loaded')
	finish
endif
let g:tectonic_loaded = 1

augroup AutoMkdir
	autocmd!
	autocmd BufWritePre *
		\ call tectonic#auto_mkdir#auto_mkdir()
augroup END

command! -nargs=? -complete=buffer -bang Delete
	\ call tectonic#delete#delete(<bang>0, <f-args>)

command! -nargs=1 -complete=file -bang Move
	\ call tectonic#move_to#move_to(<f-args>, <bang>0)
command! -nargs=1 -complete=file -bang Rename
	\ call tectonic#move_to#rename_to(<f-args>, <bang>0)
