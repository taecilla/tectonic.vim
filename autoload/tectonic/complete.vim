function! tectonic#complete#rename_complete(arg_lead, l, p)
	let l:files = split(globpath(expand('%:h'), '**/*'), '\n')
	let l:tails = map(l:files, { idx, tail
		\ -> fnamemodify(tail, ':t') })
	return filter(l:tails, 'v:val =~ "^'. a:arg_lead .'"')
endfunc
