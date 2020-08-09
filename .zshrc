export PATH=$HOME/.toolbox/bin:$PATH
export PATH="/usr/local/opt/ruby@2.5/bin:$PATH"

#how to make a temp file
#temp_file=$(mktemp)
#rm ${temp_file}
#rm -R ${temp_dir}
	
#executes before every command
precmd(){
	add_git_info_to_prompt
}

#this changes PS1 or the prompt shown
function add_git_info_to_prompt(){
	#show git info
	export PS1=$'\n'"$PWD"$'\n'"$(git status 2>/dev/null | grep 'On branch' )"$'\n'
}



# git config --global alias.co checkout
# git config --global alias.br branch
# git config --global alias.ci commit
# git config --global alias.st status

#this is to save on typing
function ch(){
	   git checkout $*
}

#this is to save on typing
function br(){
	   git branch $*
}

#this is to save on typing
function co(){
	   git commit $*
}

#this is to save on typing
function s(){
	   git status $*
}

#this is so we can edit ~/.zshrc easily
function edit(){
	gedit ~/.zshrc &
}

#this is so we can update changes easily
function src(){
	source ~/.zshrc
}

#tests to see if given directory is repo
function is_repo(){
    	if git -C  $1 rev-parse --git-dir > /dev/null 2>&1; 
    	then
    		echo "git directory"
    	else
    		echo "not git directory"
    	fi
}



