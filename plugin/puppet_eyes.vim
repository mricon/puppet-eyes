" vim: set noet sw=4 ts=4 :
"
" Puppet Eyes
" Konstantin Ryabitsev <mricon@kernel.org>
"
" Simple plugin to alert you when you are editing a file managed by puppet.
" Requires that checksum => md5 is set in the puppet recipe.
"

if exists( 'puppet_eyes_loaded' )
	finish
endif
let puppet_eyes_loaded = '1.0'

" }}}
" Defaults for misc settings {{{
"
if !exists( 'g:puppet_eyes_show_alerts' )
        let g:puppet_eyes_show_alerts = 1
endif

if !exists( 'g:puppet_eyes_warning' )
	let g:puppet_eyes_warning = "WARNING: This file is managed by puppet"
endif

if !exists( 'g:puppet_eyes_state_file' )
	let g:puppet_eyes_state_file = '/var/lib/puppet/state/state.yaml'
endif


"}}}
" Puppet_eyes_check() {{{
" Echo a warning message if the file is puppet-managed
"
function! <SID>Check_puppet_eyes()
	if ! filereadable(g:puppet_eyes_state_file)
		return
	endif

	let l:matcher = 'File\[' . expand('%:p') . '\]'
	let l:grepout = system('grep -q ' . shellescape(l:matcher) . ' ' . g:puppet_eyes_state_file)

	if !v:shell_error
		echohl Error
		echon g:puppet_eyes_warning
		echohl Normal
	endif
endfunction

" }}}
" Refresh the rev for the current buffer on reads/writes. {{{
"
if g:puppet_eyes_show_alerts == 1
	autocmd BufReadPost          * call <SID>Check_puppet_eyes()
endif
" }}}

