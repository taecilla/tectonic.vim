if exists('g:tectonic_loaded')
	finish
endif
let g:tectonic_loaded = 1

augroup SureToCreateDirectory
	autocmd!
	autocmd BufWritePre * call tectonic#sure_to_create_dir#sure_to_create_dir()
augroup END

command! -nargs=? -complete=buffer Delete call tectonic#delete#delete(<f-args>)

command! -nargs=1 -complete=file Move call tectonic#move_or_rename#move_or_rename(<f-args>, 'move')
command! -nargs=1 -complete=file Rename call tectonic#move_or_rename#move_or_rename(<f-args>, 'rename')
