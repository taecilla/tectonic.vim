function! s:delete(buffer, force)
	if getbufvar(a:buffer, '&mod') && !a:force
		call tectonic#non_persistent_error#non_persistent_error
			\ ("Won't delete " .
			\ a:buffer .
			\ " because it has unsaved changes")
		return
	endif

	if filereadable(a:buffer)
		" Attempt to delete the file only if it exists
		if !filewritable(a:buffer)
			" Abort because the file is not writable
			call tectonic#non_persistent_error#non_persistent_error
				\ ("Can't delete " .
				\ a:buffer .
				\ " because it is not writable")
			return
		endif

		call delete(a:buffer)
	endif

	execute 'bwipeout!' . bufnr(a:buffer)
	echo a:buffer "deleted successfully"
endfunction

function! tectonic#delete#delete(force, ...)
	call s:delete(a:0 ? a:1 : expand('%'), a:force)
endfunction
