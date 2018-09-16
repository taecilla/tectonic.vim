function! tectonic#non_persistent_error#non_persistent_error(error)
	echohl ErrorMsg
	echomsg a:error
	echohl NONE
endfunction
