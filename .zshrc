export PATH=$HOME/.toolbox/bin:$PATH
export PATH="/usr/local/opt/ruby@2.5/bin:$PATH"

#path related stuff
alias ...="cd ../../.."
alias ....="cd ../../../.."

#git related stuff
alias l="git log"
alias d="git diff"
alias a="git add"
alias a.="git add ."
alias m="git merge"
alias ch="git checkout"
alias br="git branch"
alias co="git commit"
alias s="git status"

alias rest="git restore --staged" #clears staging area
alias re="git restore" #this is for clearing the working directory, this discards local changes

alias st="git stash"
alias sta="git stash apply"
alias stai="git stash apply --index"
alias stl="git stash list"

alias rts="git reset --soft" #wk dir AND index are the same
alias rtm="git reset --mixed" #default option, wk dir is the same
alias rth="git reset --hard" #empty wk dir

alias cl="git clean" #this discards untracked files

#this is for strings
P="AAA"

#this is for brazil
alias bbr="brazil-build release"
alias bb="brazil-build"

#this is for cr
alias cr="cr -o"

	
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




