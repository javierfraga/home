# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
shopt -s nocasematch
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
	export HTTP_PROXY='135.28.13.11:8080'
	export HTTPS_PROXY='135.28.13.11:8080'
fi
