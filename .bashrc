# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias idev='qsub -I -l nodes=2:ppn=16:native:flash,walltime=03:30:00 -q normal -v Catalina_maxhops=None,QOS=0'
alias ggn='qsub -I -q normal -lnodes=1:ppn=16:native,walltime=1:00:00 -A gue998'
alias gtn='qsub -I -q normal -lnodes=1:ppn=32,walltime=1:00:00 -A gue998'
module load hadoop/1.2.1
export HADOOP_CONF_DIR=/home/$USER/mycluster




#####
export PATH=/home/jpg/opt/comet/bin:$PATH
export PATH=/home/jpg/opt/comet/matlab/2015a/bin:$PATH

color_prompt=yes

# Add git branch if its present to PS1
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
