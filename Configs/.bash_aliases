# Utils
alias ll="ls -l"
alias la="ls -lah"
alias ..="cd .."
alias ...="cd ../.."

# [Bash]
alias syslog="tail -F /var/log/syslog"
alias htop="htop -d 3"
# pretty printed version of cat for python files
alias pycat="pygmentize -O style=monokai -f console256 -g"  # requires python-setuptools and pygments
# pretty printed version of cat for json files
alias prettyjson="python -m json.tool | pygmentize -l javascript"  # usage: cat file.json | pretty
alias prettypy=pycat
pyless (){
	if [ "$1" == "" ] || [ ! -f "$1" ] ; then
		echo "Invalid filename"
		exit 1
	fi
	pycat "$1" | less -r
}

# [Git]
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gd="git diff"
alias gl="git log --stat --decorate"
alias gll="git log --full-diff -p ."
alias gb="git branch"
alias gbb='for k in `git branch | perl -pe s/^..//`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'
alias gbbb='for k in `git branch -a | perl -pe s/^..//`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done'
alias gf="git fetch --prune"
#alias gbr="for k in `git branch -r | perl -pe 's/^..(.*?)( ->.*)?$/\1/'`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r"
alias gg1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gg3="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'"
git-loglive() {
	while :
	do
		clear
		git --no-pager log --graph --pretty=oneline --abbrev-commit --decorate --all $*
		sleep 1
	done
}
function gbr {
	for k in `git branch -r | perl -pe 's/^..(.*?)( ->.*)?$/\1/'`; do
		echo -e `git show --pretty=format:'%Cgreen%ci %Cblue%cr%Creset' $k -- | head -n 1`\\t$k
	done
	return
}