
#Custom aliases

alias projects="cd ~/Projects"

#Docker
alias dc="docker-compose"
alias ds="docker ps"

alias dpf="docker ps | grep $1 "
alias dcu="docker-compose up"
alias dcd="docker-compose down"


#Git

alias gp="git pull"
alias gs="git fetch && git status"


# Npm alias
alias np='npm'

# Npm install alias
alias npi='npm install'
alias npis='npm install --save'
alias npig='npm install -g'

# Npm update
alias npu='npm update'
alias npug='npm update -g'

# Npm search
alias nps='npm search'


# Composer alias
alias co='composer'

# Composer install and update aliases
alias coi='composer install'
alias cou='composer update'



# Smart ls alias
alias l='ls -lah'

# Make and change directory at once
alias mkcd='_(){ mkdir -p $1; cd $1; }; _'

# fast find
alias ff='find . -name $1'

# change directories easily
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# apt get
alias apt-get='sudo apt-get'


function extract() {

	if [[ "$#" -lt 1 ]]; then
	  echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
	  return 1 #not enough args
	fi

	if [[ ! -e "$1" ]]; then
	  echo -e "File does not exist!"
	  return 2 # File not found
	fi

	DESTDIR="."

	filename=`basename "$1"`

	case "${filename##*.}" in
	  tar)
		echo -e "Extracting $1 to $DESTDIR: (uncompressed tar)"
		tar xvf "$1" -C "$DESTDIR"
		;;
	  gz)
		echo -e "Extracting $1 to $DESTDIR: (gip compressed tar)"
		tar xvfz "$1" -C "$DESTDIR"
		;;
	  tgz)
		echo -e "Extracting $1 to $DESTDIR: (gip compressed tar)"
		tar xvfz "$1" -C "$DESTDIR"
		;;
	  xz)
		echo -e "Extracting  $1 to $DESTDIR: (gip compressed tar)"
		tar xvf -J "$1" -C "$DESTDIR"
		;;
	  bz2)
		echo -e "Extracting $1 to $DESTDIR: (bzip compressed tar)"
		tar xvfj "$1" -C "$DESTDIR"
		;;
      tbz2)
	  	echo -e "Extracting $1 to $DESTDIR: (tbz2 compressed tar)"
	  	tar xvjf "$1" -C "$DESTDIR"
		;;
	  zip)
		echo -e "Extracting $1 to $DESTDIR: (zipp compressed file)"
		unzip "$1" -d "$DESTDIR"
		;;
	  lzma)
	  	echo -e "Extracting $1 : (lzma compressed file)"
		unlzma "$1"
		;;
	  rar)
		echo -e "Extracting $1 to $DESTDIR: (rar compressed file)"
		unrar x "$1" "$DESTDIR"
		;;
	  7z)
		echo -e  "Extracting $1 to $DESTDIR: (7zip compressed file)"
		7za e "$1" -o "$DESTDIR"
		;;
	  xz)
	  	echo -e  "Extracting $1 : (xz compressed file)"
	    unxz  "$1"
	  	;;
	  exe)
	   	cabextract "$1"
	  	;;
	  *)
		echo -e "Unknown archieve format!"
		return
	  	;;
	esac
}