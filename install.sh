#!/bin/bash


function helpmsg() {
cat <<EOF
	
	warning: this script is remove below directory and files

		$HOME/.zshrc .config/hypr && /nvim /pipewire

	usage: command [options]
	-h, --help: show this help
EOF
}

function help() {
cat <<EOF
	usage: command [options]
	-a, --all, install all packages and symbolic link
	-p, --packages, install packages
	-s, --symboliclink, add symbolic link
	-sp, --symbliclink-pipewire

EOF
}

function success() {
	local logo='
	          -`
                 .o+`
                `ooo/
               `+oooo:
              `+oooooo:
              -+oooooo+:
            `/:-:++oooo+:
           `/++++/+++++++:
          `/++++++++++++++:		b
         `/+++ooooooooooooo/`
        ./ooosssso++osssssso+`
       .oossssso-````/ossssss+`
      -osssssso.      :ssssssso.	for u need the automatic login
     :osssssss/        osssso+++.	change user and command in /etc/greetd/config.toml
    /ossssssss/        +ssssooo/-	example, command="startx" , user = "yourName"
  `/ossssso+/:-        -:/+osssso+-     touchpad setting: cp ~/dotfiles/170-synaptics.conf > /etc/X11/xorg.conf.d/70-synaptics.conf
 `+sso+:-`                 `.-/+oso:
`++:.                           `-/+/
.`                                 `
	 '

	echo -e "${logo}"
	
}
package='hyprland swww waybar rofi neovim zsh zsh-syntax-highlighting zsh-autosuggestions exa fcitx5 fcitx5-mozc fcitx5-configtool papirus-icon-theme starship ttf-hackgen brightnessctl greetd alsa-utils xf86-input-synaptic pavucontrol python-pipx imagemagick pipewire wireplumber pipewire-pulse npm discord obs tree pokemon-colorscripts-git'


function symbolic() {
	src_dir="$HOME/dotfiles"
	dest_dir="$HOME"
	con="$HOME/.config"
	remove_files=(
		"$con/hypr"
		"$con/nvim"
		"$con/brave-flags-conf"
		"/.zshrc"
		"$con/pipewire"
	)
	for f in "${remove_files[@]}"; do
		if [[ -e "$f" ]]; then
			echo "$f is Removing"
			rm -rf "$f"
		else
			echo "$f is No such file or directory"
		fi
	done

	local conf=".config"
	symbolic_files=(
		".zshrc"
		"hypr"
		"nvim"
		"$conf/brave-flags-conf"
		"pipewire"

	)
	for f in "${symbolic_files[@]}"; do
		if [ ! -d "$src_dir/$f" ]; then
			echo "$f create symbolic link"
			ln -sf "$src_dir/$f" "$dest_dir/$f"
		elif [ ! -e "$con/$f" ]; then
			echo "$con/$f create symbolic link"
			ln -sf "$src_dir/$f" "$con"
		else
			echo "$con/$f create directory"
			mkdir -p "$con/$f"
			echo "$con/$f create symbolic link"
			ln -sf "$src_dir/$f" "$con/$f"
		fi
		
	done
	
}

function aurs() {
	pacman -Syu git
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -rf yay
	yay -S $package
	pipx install pywal
}
if [ $# -eq 0 ]; then
	helpmsg
	exit 1
fi


while [ -n "$1" ]; do
	case "$1" in
		--help | -h)
			help
			exit 0
			;;
		--packages | -p)
			aurs
			success
			exit 0
			;;
		--symbolic | -s)
			symbolic	
			success
			exit 0
			;;
		--all | -a)
			aurs
			symbolic
			success
			exit 0
			;;
		--debug | -d)
			set -x
			;;
		*)
			helpmsg
			exit 1
			;;
	esac
	shift
done



