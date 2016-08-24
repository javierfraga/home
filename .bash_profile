# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
shopt -s nocasematch # ignorecase below (i.e. centos)
if [[ $(cat /etc/*-release) =~ Centos ]]; then
	PATH=$PATH:$HOME/bin
	PATH=$PATH:/usr/java/jdk1.6.0_29/bin:/usr/java/jdk1.6.0_29/jre/bin
	export PATH

	JAVA_HOME=/usr/java/jdk1.6.0_29
	export JAVA_HOME

	export M2_HOME=/usr/local/apache-maven
	export M2=$M2_HOME/bin 
	export PATH=$M2:$PATH
	export ATG_HOME=/common/ATG10.2
	export DYNAMO_HOME=/common/ATG10.2/home
	export MAVEN_OPTS='-Xms512m -XX:MaxPermSize=2048m -Xmx2048m'
#	export HTTP_PROXY='135.28.13.11:8080'
#	export HTTPS_PROXY='135.28.13.11:8080'
	moveEbizDir (){
		echo "moving /common/EBizCare.ear"
		mv /ebiz/$1/$2/EBizCare/EBizCareEAR/target/EBizCare.ear/ /common/
	}
	mvEbizEar () {
		read -p "required to enter a release (e.g 1702): " release
		shopt -s nullglob
		branches=(/ebiz/$release/*)
		echo "Which branch?"
		select branch in "${branches[@]##*/}"; do # very cool trick to strip off abs path '##*/'
			if ls /ebiz/$release/$branch/EBizCare/EBizCareEAR/target/EBizCare.ear/ > /dev/null 2>&1; then
				# Control will enter here if $DIRECTORY exists.
				if [ -d "/common/EBizCare.ear" ]; then
					read -p "EBizCare.ear exist in /common please add extention to it now (e.g -1702): " extention
					mv /common/EBizCare.ear /common/EBizCare.ear$extention
					moveEbizDir $release $branch
				else
					moveEbizDir $release $branch
				fi
			else
				echo "EBizCare.ear does not exist in $release/$branch!!!"
				echo "release: $release"
				echo "branch: $branch"
			fi
			break
		done
	}
else
	PATH=$PATH:$HOME/bin
	export PATH
fi
