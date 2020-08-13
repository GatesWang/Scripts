export PATH=$HOME/.toolbox/bin:$PATH
export PATH="/usr/local/opt/ruby@2.5/bin:$PATH"

#path related stuff
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"

function mk.. (){
	..
	mkdir $1
	cd $1
}
function mk (){
	mkdir $1
	cd $1
}

alias rm="rm -rf"

#git related stuff
function gcl(){
 	grm.
 	cm "removed everything"
	cl
	check_show $*
}

#removes from index, it is removed from wking dir too
function grm(){
	git rm $* -r -f
}
#removes everything from git
function grm.(){
	git rm . -r -f
}

#removes from index, still in wking dir 
function grmc (){
	git rm --cached $* -r -f
}
function grmc. (){
	git rm --cached . -r -f
}

alias l="git log"	
alias ll="git log -1 --oneline" #last log
alias lll="git log -2 --oneline" 
alias llll="git log -3 --oneline" #last log
alias lo="git log --oneline"	
alias lr="git log --reverse"	

alias d="git diff"
alias ds="git diff --staged" # compare stage to head
alias dw="git diff HEAD" $ #compare working dir to head
alias du=""

alias a="git add" 
alias a.c="git add . && git commit"
alias a.cm="git add . && git commit -m"
alias au="git add -u" #only adds tracked
alias ap="git add --patch" #use patch
alias a.="git add ." #adds everything 
alias ap.="git add --patch ." #adds everything and use patch
alias au="echo -e 'a\n*\nq\n'|git add -i >/dev/null && echo 'untracked files added'" #add untracked

alias cl="git clean -xdf" #this discards untracked files
alias m="git merge"

alias ch="git checkout"
alias ch.="git checkout ."
alias chb="git checkout -b"
alias cht="git checkout --theirs"
alias cho="git checkout --ours"
function ch.t (){
	git checkout --theirs $* .
}
function ch.o (){
	git checkout --ours $* .
}

alias br="git branch"
alias brd="git branch -d"
alias brm="git branch -m"


function c(){
	git commit $*
}
function cm(){
	git commit -m $*
}
function ca(){
	git commit $* --amend
}
function cam(){
	git commit $* -m --amend
}
	
alias s="git status"
alias sp="git status --porcelain"

alias res="git restore --staged" #clears staging area
alias res.="git restore --staged ." #clears staging area for everything
alias re.="git restore ." #this is for clearing the working directory, this discards local changes

alias st="git stash"
alias sta="git stash apply"
alias stai="git stash apply --index"
alias stl="git stash list"
alias stc="git stash clear"

alias rts="git reset --soft" #wk dir AND index are the same
alias rts^="git reset --soft HEAD^" #wk dir AND index are the same
alias rt="git reset --mixed" #default option, wk dir is the same
alias rt^="git reset --mixed HEAD^" #default option, wk dir is the same
alias rth="git reset --hard" #empty wk dir
alias rth^="git reset --hard HEAD^" #empty wk dir

alias pu="git push"

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
function e(){
	gedit ~/.zshrc &
}

#this is so we can update changes easily
function sr(){
	source ~/.zshrc
}

function check_show(){
	if [[ $# == 1 && $1 == "s" ]]; then
		s
	fi
}
#create some changes that are untracked
function ut(){
	echo "hi" >> untracked.txt
	check_show $*
}
#create some changes that are modified
function tr(){
	echo "hi" >> tracked.txt
	a tracked.txt	
	git commit tracked.txt -m "commit tracked" -q
	echo "hi" >> tracked.txt
	check_show $*
}
#create some changes that are in index
function id(){
	echo "hi" >> index.txt
	a index.txt	
	check_show $*
}
#create some changes that are commited
function co(){
	echo "hi" >> commited.txt
	a commited.txt
	git commit commited.txt -m "new commit"
	check_show $*
}



