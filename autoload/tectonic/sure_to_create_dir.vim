" Source: https://vimrcfu.com/snippet/162

function! tectonic#sure_to_create_dir#sure_to_create_dir()
	let l:required_dir = expand('%:h')

	if !isdirectory(l:required_dir)
		if !confirm("Directory '" . l:required_dir . "' doesn't exist. Create it?")
			return
		endif

		try
			call mkdir(l:required_dir, 'p')
		catch
			echoerr "Can't create \"" . l:required_dir . '"'
		endtry
	endif
endfunction
