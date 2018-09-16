function! tectonic#move#move_to(destination_file, force)
	let l:current_file_path = expand('%:p')

	if !filewritable(l:current_file_path)
		call tectonic#non_persistent_error#non_persistent_error
			\ (expand('%') . " is not writable")
		return
	endif

	if filereadable(a:destination_file)
		if !a:force
			call tectonic#non_persistent_error#non_persistent_error
			 \ (a:destination_file . " already exists")
			return
		endif

		if !filewritable(a:destination_file)
			call tectonic#non_persistent_error#non_persistent_error
				\ (a:destination_file . " is not writable")
			return
		endif
	endif

	execute 'saveas!' fnameescape(a:destination_file)
	call delete(expand('#:p'))
	bwipeout! #
endfunction

function! tectonic#move#rename_to(destination_file, force)
	let l:new_location = expand('%:h') . '/' . a:destination_file
	call tectonic#move#move_to(l:new_location, a:force)
endfunction
