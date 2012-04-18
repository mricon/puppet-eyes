Puppet Eyes
===========
------------------------------------------------------------------
VIM plugin to display an alert when editing a puppet-managed file.
------------------------------------------------------------------

:Author:    konstantin@linuxfoundation.org
:Date:      2012-04-18
:Copyright: The Linux Foundation
:License:   GPLv2+
:Version:   0.1.0

DESCRIPTION
-----------
Have you ever worked in an environment where some files are in puppet,
but not all of them? E.g. when you aren't starting from scratch but have
to "puppetize" an existing infrastructure?

Have you ever had to wonder "wait, is this file in puppet?"

Put puppet-eyes.vim in /root/.vim/plugin (or in
/usr/share/vim/vimfiles/plugin if you want to enable this globally) and
VIM will display an alert when you are trying to edit a file managed by
puppet.

To work, the file definition in puppet must have "checksum = md5".

