export PATH=$HOME/.toolbox/bin:$PATH
export PATH="/usr/local/opt/ruby@2.5/bin:$PATH"

alias l="git log"
alias d="git diff"
alias a="git add"
alias m="git merge"
alias ch="git checkout"
alias br="git branch"
alias co="git commit"
alias s="git status"
	
#executes before every command
precmd(){
	add_git_info_to_prompt
}

#this changes PS1 or the prompt shown
function add_git_info_to_prompt(){
	#show git info
	export PS1=$'\n'"$PWD"$'\n'"$(git status 2>/dev/null | grep 'On branch' )"$'\n'
}

#this is so we can edit ~/.zshrc easily
function edit(){
	gedit ~/.zshrc &
}

#this is so we can update changes easily
function src(){
	source ~/.zshrc
}




