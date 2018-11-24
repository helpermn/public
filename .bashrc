case $TERM in
xterm*)
export PS1='\[\033]2;\h\007\][\t] \[\033[32;2m\]\u\[\033[32;0m\]:\[\033[37m\]\w\[\033[0;0m\] \[\033[36m\]$?\[\033[0;0m\]\$ '
;;
*)
export PS1='[\t] \[\033[32;2m\]\u\[\033[32;0m\]:\[\033[37m\]\w\[\033[0;0m\] \[\033[36m\]$?\[\033[0;0m\]\$ '
;;
esac

alias la='ls -lAhF'
alias ll='ls -lhF'
alias less='less -I'
alias rm='rm -i'                                                                                                                                                       
alias cp='cp -i'                                                                                                                                                       
alias mv='mv -i'                                                                                                                                                       

umask 027

function logsession2file {
	[ -d "${HOME}/logs" ] || { mkdir "${HOME}/logs"; chmod 700 "${HOME}/logs"; }
	script -fq "${HOME}/logs/$(date +%Y%m%d_%H%M%S)"
}

function viewlogsession {
	logfile=`whiptail --nocancel --menu --noitem 'logs:' 0 0 0 $(echo 'cancel cancel'; ls -1t ${HOME}/logs/| nl | column -t | sed 's/\([^ ]\+\) \(.*\)/\2 \1/') 3>&1 1>&2 2>&3` && \
	[ "${logfile}" != 'cancel' ] && less -Rr "${HOME}/logs/${logfile}"
	unset logfile
}

function vir {
        [ -f RCS/"$1",v ] && { rcsdiff -q "$1" > /dev/null || { echo 'Ups ups... someone forgot co/ci !!!'; return 1; }; };
        co -l "$1" || { ci "$1"; co -l "$1"; };
        /usr/bin/vim "$1";
        ci -u "$1";
        }

export TMP=~/tmp
export TEMP=~/tmp
export TMPDIR=~/tmp

export HISTTIMEFORMAT="%Y/%m/%d - %H:%M:%S  "
export HISTFILESIZE=10000
export HISTSIZE=10000

{ w | sed 's#\(up[[:space:]]*\)\(.*\)\(,[[:space:]]*[[:digit:]]*[[:space:]]*user\)\(.*load average:[[:space:]]\)\([^[:space:]]*\),#\1\\\\033\[31;1m\2\\\\033\[0;0m\3\4\\\\033\[31;1m\5\\\\033\[0;0m,#' | while read aLine; do echo -e "$aLine"; done; } >&2

