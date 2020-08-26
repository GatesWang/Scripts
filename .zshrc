export PATH=$HOME/.toolbox/bin:$PATH
export PATH="/usr/local/opt/ruby@2.5/bin:$PATH"

function openI(){
	open -a "IntelliJ IDEA" $*
}

#path related stuff
alias ..="cd .."
alias ...="cd ../.."

function cd..(){
	cd ../$1
}
function mk (){
	mkdir $1
	cd $1
}
function mk.. (){
	mkdir ../$1
	cd ../$1
}

alias rm="rm -rf"











#git related stuff
function gls(){
	git ls-files $*
}
alias glsd="gls --deleted"
alias glsm="gls --modified"









#removes everything in git from index, it is removed from wking dir too
function grm(){
	git rm $* -r -f
}
#removes everything from git
function grm.(){
	git rm . -r -f
}

#removes everything in git from cache, still in wking dir 
#use this if we want files to be removed in git, but still want it in our wkdir
function grmc (){
	git rm --cached $* -r -f
}
function grmc. (){
	git rm --cached . -r -f
}





alias l="git log"	
alias l2="git log -2 --oneline" #last log
alias l3="git log -3 --oneline" 
alias l4="git log -4 --oneline" 
alias lo="git log --oneline"	
alias lr="git log --reverse"	

alias s="git status"
alias sp="git status --porcelain"





alias d="git diff"  #compare wk dir to index
alias ds="git diff --staged" # compare stage to head
alias dsu="git diff HEAD" $ #compare staged and unstaged changes






function ch(){
	git checkout $*
}
function chb(){
	git checkout -b $*
}
alias ch.="git checkout ."
function cht (){
	git checkout --theirs $* .
}
function cho (){
	git checkout --ours $* .
}
function cht. (){
	git checkout --theirs $* .
}
function cho. (){
	git checkout --ours $* .
}








function b(){
	git branch $*
}
#new
function bn(){
	echo $* | xargs  -n 1 git branch
}
#rename
alias br="git branch -m" 
#delete
alias bd="git branch -d"
alias bD="git branch -D"
#deletes all merged, if argument change branch
function bd. (){
	if [[ $# == 1 ]]; then
		ch $1
	fi
	git branch -d $(git branch) 2>/dev/null
}
#deletes everything, if argument change branch
fucntion bD.(){
	if [[ $# == 1 ]]; then
		ch $1
	fi
	git branch -D $(git branch) 2>/dev/null
}







function a(){
	git add $*
}
alias ai="git add -i"

alias a.="git add ." #adds everything 
alias a.c="git add . && git commit"
alias a.cm="git add . && git commit -m"

alias ap="git add --patch" #use patch
alias ap.="git add --patch ." #adds everything and use patch

alias at="git add -u" #add tracked only
alias aut="echo -e 'a\n*\nq\n'|git add -i >/dev/null && echo 'untracked files added'" #add untracked only

function c(){
	git commit $*
}
function cm(){
	git commit -m $*
}
function ca(){
	git commit $* --amend
}
function cane(){
	read "files?files: " 
	git commit $files --no-edit --amend	
}
function cam(){
	read "msg?msg: " 
	read "files?files: " 
	git commit $files -m $msg --amend	
}






alias res="git restore --staged" #clears staging area
alias res.="git restore --staged ." #clears staging area for everything
alias re="git restore" # restores changes that are not staged
alias re.="git restore ." #discards local changes that are not staged

alias rts="git reset --soft" #wk dir AND index are the same
alias rts^="git reset --soft HEAD^" #wk dir AND index are the same
alias rt="git reset --mixed" #default option, wk dir is the same
alias rt^="git reset --mixed HEAD^" #default option, wk dir is the same
alias rth="git reset --hard" #empty wk dir
alias rth^="git reset --hard HEAD^" #empty wk dir

alias cl="git clean -xdf" #this discards untracked files




alias st="git stash"
alias sta="git stash apply"
alias stai="git stash apply --index"
alias stl="git stash list"
alias stc="git stash clear"

alias pu="git push"
alias m="git merge"






#this is for brazil
function bvs(){
	brazil ws use --versionset $*
}
function bp(){
	brazil ws use --package $*
}
function cbbr(){
	brazil ws clean;
	brazil ws sync --md;
	brazil-build && brazil-build release;
}
alias bbr="brazil-build release"
alias bb="brazil-build"
alias bc="brazil ws clean"
alias opent="open file:///Users/wangates/simulator/build/LilyRoutingEngineSimulator/LilyRoutingEngineSimulator-1.0/RHEL5_64/DEV.STD.PTHREAD/build/brazil-unit-tests/index.html"

#this is for gk
alias gkf=gk-fix-mv-conflicts

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

function tc(){
	if [ -n "$c_on" ]; then
		c_on=
		echo off
	else
		c_on=true
		echo on
	fi
}









#this is so we can edit ~/.zshrc easily
function e(){
	gedit ~/.zshrc &
}

#this is so we can update changes easily
function sr(){
	source ~/.zshrc
}












function gcl(){
 	grm.
 	cm "removed everything"
	cl
	check_show $*
}

function check_show(){
	if [[ $# == 1 && $1 == "s" ]]; then
		s
	fi
}
#create some changes that are untracked
function ut(){
	echo "untracked" >> untracked.txt
	check_show $*
}
#create some changes that are modified
function tr(){
	echo "tracked" >> tracked.txt
	a tracked.txt	
	git commit tracked.txt -m "commit tracked" -q
	echo "tracked" >> tracked.txt
	check_show $*
}
#create some changes that are in index
function id(){
	echo "index" >> index.txt
	a index.txt	
	git commit index.txt -m "commit index" -q
	echo "index" >> index.txt
	a index.txt
	check_show $*
}
#create some changes that are commited
function co(){
	echo "commited" >> commited.txt
	a commited.txt
	git commit commited.txt -m "new commit"
	check_show $*
}

function restart(){
	sr
	gcl
	clear
	all
}

function all(){
	ut
	tr 
	id 
	co
	s
}


