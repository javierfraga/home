links=(
	".alias"
	".bashrc"
	".git-completion.bash"
	".git-prompt.sh"
	".gitrc"
	".mvn-color.sh"
	".mvn-color.sh"
	".vim"
	".vimrc"
	".config/nvim/UltiSnips"
	".config/nvim/init.vim"
	)
# make .config/nvim directory
if [ ! -d "/root/.config/nvim" ]; then
	mkdir -p /root/.config/nvim
	echo "created /root/.config/nvim"
fi
# make links
for i in "${links[@]}"; do
	if [[ ! -e "/root/$i" ]]; then
		ln -s /home/javier/$i /root/$i
		echo "created softlink /root/$i"
	fi
done

