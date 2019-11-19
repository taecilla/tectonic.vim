function tectonic#delete#delete(...)
	let l:current_buffer = a:0
		\ ? a:1
		\ : '%'

	try
		call delete(expand(l:current_buffer))
		execute 'bdelete!' l:current_buffer
	catch
		echoerr "Can't delete" l:current_buffer
	endtry
endfunction
