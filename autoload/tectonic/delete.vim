function! tectonic#delete#delete(...)
	let l:current_buffer = a:0
		\ ? a:1
		\ : '%'

	try
		call delete(expand(l:current_buffer))
		execute 'bwipeout!' l:current_buffer
		echo l:current_buffer "deleted successfully"
	catch
		echoerr "Can't delete" l:current_buffer
	endtry
endfunction
