function! tectonic#move_or_rename#move_or_rename(destination_file, action)
	let l:existing_file_dir = expand('%:h')
	let l:existing_file_path = expand('%:p')

	let l:destination = (a:action == 'move'
		\ ? ''
		\ : l:existing_file_dir . '/')
		\ . a:destination_file

	if !empty(glob(l:existing_file_path)) && !filewritable(l:existing_file_path)
		echoerr "Can't " . a:action . ": Current file is not writable"
		return
	end

	if filewritable(l:existing_file_dir) != 2
		echoerr "Can't " . a:action . ": Destination dir is not writable"
		return
	endif

	if filereadable(l:destination)
		if !filewritable(l:destination)
			echoerr "Can't " . a:action . ": Destination file is not writable"
			return
		endif

		if !confirm('"' . l:destination . '"' . ' exists. Overwrite it?')
			return
		endif
	endif

	execute 'saveas!' fnameescape(l:destination)
	bwipeout! #
	call delete(expand('#:p'))
endfunction
