" Source: https://vimrcfu.com/snippet/162

function! tectonic#auto_mkdir#auto_mkdir()
	let l:required_dir = expand('%:h')

	if !isdirectory(l:required_dir)
		if !confirm
			\ ("Directory '" .
			\ l:required_dir .
			\ "' doesn't exist. Create it?")
			return
		endif

		try
			call mkdir(l:required_dir, 'p')
		catch
			call tectonic#non_persistent_error#non_persistent_error
				\ (v:exception)
			echo ''
			" Without this call the previous message isn't shown
		endtry
	endif
endfunction
