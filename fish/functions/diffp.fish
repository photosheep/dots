function diffp
	command diff --color=always $argv | less -R;
end
