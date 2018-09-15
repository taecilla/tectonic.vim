function! s:show_non_persistant_error(error)
	echohl ErrorMsg
	echomsg a:error
	echohl NONE
endfunction

function! s:delete_from_disk(buffer)
	if filereadable(a:buffer)
		" Attempt to delete the file only if it exists
		if !filewritable(a:buffer)
			" Abort because the file is not writable
			call s:show_non_persistant_error
				\ ("Can't delete " .
				\ a:buffer .
				\ " because it is not writable")
			return -1 " Mimic an unsuccessful call to delete()
		endif

		return delete(a:buffer)
	endif

	return 0 " Mimic a successful call to delete()
endfunction

function! s:delete(buffer, force)
	if getbufvar(a:buffer, '&mod') && !a:force
		call s:show_non_persistant_error
			\ ("Won't delete " .
			\ a:buffer .
			\ " because it has unsaved changes")
		return
	endif

	if s:delete_from_disk(a:buffer) == 0
		execute 'bwipeout!' . a:buffer
		echo a:buffer "deleted successfully"
	endif
endfunction

function! tectonic#delete#delete(force, ...)
	call s:delete(a:0 ? a:1 : expand('%'), a:force)
endfunction
