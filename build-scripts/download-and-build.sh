#!/bin/bash
#set -e
############################### Payra OS ############################### Payra OS ###########################################################
# Author 	: Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website	: https://www.arcolinux.info
# Website	: https://www.arcolinux.com
# Website	: https://www.arcolinuxd.com
# Website	: https://www.arcolinuxb.com
# Website	: https://www.arcolinuxiso.com
# Website	: https://www.arcolinuxforum.com
############################### Payra OS ############################### Payra OS ###########################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
############################### Payra OS ############################### Payra OS ###########################################################
#tput setaf 0 = black 
#tput setaf 1 = red 
#tput setaf 6 = green
#tput setaf 3 = yellow 
#tput setaf 4 = dark blue 
#tput setaf 5 = purple
#tput setaf 6 = cyan 
#tput setaf 7 = gray 
#tput setaf 8 = light blue
############################### Payra OS ############################### Payra OS ###########################################################

echo
echo "############################### Payra OS ################################### "
tput setaf 6
echo "Phase 1 : "
echo "- Setting General parameters"
tput sgr0
echo "############################### Payra OS ################################### "
echo

	#Let us set the desktop"
	#First letter of desktop is small letter

	desktop="gnome"
	dmDesktop="gnome"

	payraosVersion='badblood'

	isoLabel='payraos-'$payraosVersion'-x86_64.iso'

	# setting of the general parameters
	archisoRequiredVersion="archiso 72-1"
	buildFolder=$HOME"/payraos-build"
	outFolder=$HOME"/Payraos-Out"
	archisoVersion=$(sudo pacman -Q archiso)

	echo "############################### Payra OS ################################### "
	echo "Building the desktop                   : "$desktop
	echo "Building version                       : "$payraosVersion
	echo "Iso label                              : "$isoLabel
	echo "Do you have the right archiso version? : "$archisoVersion
	echo "What is the required archiso version?  : "$archisoRequiredVersion
	echo "Build folder                           : "$buildFolder
	echo "Out folder                             : "$outFolder
	echo "############################### Payra OS ################################### "
	
	personalrepo = false

	if [ "$archisoVersion" == "$archisoRequiredVersion" ]; then
		tput setaf 6
		echo "############################### Payra OS ###################################"
		echo "Archiso has the correct version. Continuing ..."
		echo "############################### Payra OS ###################################"
		tput sgr0
	else
	tput setaf 1
	echo "############################### Payra OS ############################### Payra OS ############################################"
	echo "You need to install the correct version of Archiso"
	echo "Use 'sudo downgrade archiso' to do that"
	echo "or update your system"
	echo "############################### Payra OS ############################### Payra OS ############################################"
	tput sgr0
	fi

echo
echo "############################### Payra OS ################################### "
tput setaf 6
echo "Phase 2 :"
echo "- Checking if archiso is installed"
echo "- Saving current archiso version to readme"
echo "- Making mkarchiso verbose"
echo "- Getting Carli key and mirror"
tput sgr0
echo "############################### Payra OS ################################### "
echo

	package="archiso"

	#----------------------------------------------------------------------------------

	#checking if application is already installed or else install with aur helpers
	if pacman -Qi $package &> /dev/null; then

			echo "Archiso is already installed"

	else
			sudo pacman -S --noconfirm archiso

		#checking which helper is installed
		# if pacman -Qi yay &> /dev/null; then

			# echo "############################### Payra OS ########################################"
			# echo "######### Installing with yay"
			# echo "############################### Payra OS ########################################"
			# yay -S --noconfirm $package

		# elif pacman -Qi trizen &> /dev/null; then

			# echo "############################### Payra OS ########################################"
			# echo "######### Installing with trizen"
			# echo "############################### Payra OS ########################################"
			# trizen -S --noconfirm --needed --noedit $package

		# fi

		# Just checking if installation was successful
		if pacman -Qi $package &> /dev/null; then

			echo "############################### Payra OS ########################################"
			echo "#########  "$package" has been installed"
			echo "############################### Payra OS ########################################"

		else

			echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			echo "!!!!!!!!!  "$package" has NOT been installed"
			echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			exit 1
		fi

	fi

	echo
	echo "Saving current archiso version to readme"
	sudo sed -i "s/\(^archiso-version=\).*/\1$archisoVersion/" ../archiso.readme
	echo
	echo "Making mkarchiso verbose"
	sudo sed -i 's/quiet="y"/quiet="n"/g' /usr/bin/mkarchiso

	#----------------------------------------------------------------------------------

	# package="carli-keyring"

	#checking if application is already installed or else install
	# if pacman -Qi $package &> /dev/null; then

			# echo "############################### Payra OS ########################################"
			# echo "Carli keyring is already installed"
			# echo "############################### Payra OS ########################################"

	# else

		# wget https://github.com/arcolinuxiso/carli_repo/raw/master/x86_64/carli-keyring-3.1-2-any.pkg.tar.zst -O /tmp/carli-keyring-3.1-2-any.pkg.tar.zst
		# sudo pacman -U --noconfirm --needed /tmp/carli-keyring-3.1-2-any.pkg.tar.zst
		
	# fi

	# Just checking if installation was successful
	# if pacman -Qi $package &> /dev/null; then

		# echo "############################### Payra OS ########################################"
		# echo "#########  "$package" has been installed"
		# echo "############################### Payra OS ########################################"

	# else

		# echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		# echo "!!!!!!!!!  "$package" has NOT been installed"
		# echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		# exit 1
	# fi

	#----------------------------------------------------------------------------------

	# package="carli-mirrorlist"

	#checking if application is already installed or else install
	# if pacman -Qi $package &> /dev/null; then

		# echo "############################### Payra OS ########################################"
		# echo "Carli mirrorlist is already installed"
		# echo "############################### Payra OS ########################################"

	# else

		# wget https://github.com/arcolinuxiso/carli_repo/raw/master/x86_64/carli-mirrorlist-22.03-01-any.pkg.tar.zst -O /tmp/carli-mirrorlist-22.03-01-any.pkg.tar.zst
		# sudo pacman -U --noconfirm --needed /tmp/carli-mirrorlist-22.03-01-any.pkg.tar.zst
	# fi

	# Just checking if installation was successful
	# if pacman -Qi $package &> /dev/null; then

		# echo "############################### Payra OS ########################################"
		# echo "#########  "$package" has been installed"
		# echo "############################### Payra OS ########################################"

	# else

		# echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		# echo "!!!!!!!!!  "$package" has NOT been installed"
		# echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		# exit 1
	# fi	

echo
echo "############################### Payra OS ################################### "
tput setaf 6
echo "Phase 3 :"
echo "- Deleting the build folder if one exists"
echo "- Copying the Archiso folder to build folder"
tput sgr0
echo "############################### Payra OS ################################### "
echo

	echo "Deleting the build folder if one exists - takes some time"
	[ -d $buildFolder ] && sudo rm -rf $buildFolder
	echo
	echo "Copying the Archiso folder to build work"
	echo
	mkdir $buildFolder
	cp -r ../archiso $buildFolder/archiso

echo
echo "############################### Payra OS ################################### "
tput setaf 6
echo "Phase 4 :"
echo "- Deleting any files in /etc/skel"
echo "- Getting the last version of bashrc in /etc/skel"
echo "- Removing the old packages.x86_64 file from build folder"
echo "- Copying the new packages.x86_64 file to the build folder"
echo "- Changing group for polkit folder"
tput sgr0
echo "############################### Payra OS ################################### "
echo

	echo "Deleting any files in /etc/skel"
	rm -rf $buildFolder/archiso/airootfs/etc/skel/.* 2> /dev/null
	echo

	echo "Getting the last version of bashrc in /etc/skel"
	echo
	wget https://raw.githubusercontent.com/PayraOSDev/payraos-root/main/etc/skel/.bashrc -O $buildFolder/archiso/airootfs/etc/skel/.bashrc

	echo "Removing the old packages.x86_64 file from build folder"
	rm $buildFolder/archiso/packages.x86_64
	echo
	echo "Copying the new packages.x86_64 file to the build folder"
	cp -f ../archiso/packages.x86_64 $buildFolder/archiso/packages.x86_64
	echo
	#echo "Changing group for polkit folder"
	#sudo chgrp polkitd $buildFolder/archiso/airootfs/etc/polkit-1/rules.d
	#is not working so fixing this during calamares installation

echo
echo "############################### Payra OS ################################### "
tput setaf 6
echo "Phase 5 : "
echo "- Changing all references"
echo "- Adding time to /etc/dev-rel"
tput sgr0
echo "############################### Payra OS ################################### "
echo

	#Setting variables

	#profiledef.sh
	oldname1='iso_name="payraos"'
	newname1='iso_name="payraos"'

	oldname2='iso_label="payraos"'
	newname2='iso_label="payraos"'

	oldname3='PayraOS'
	newname3='PayraOS'

	#hostname
	oldname4='PayraOS'
	newname4='PayraOS'

	#sddm.conf user-session
	oldname5='Session=gnome'
	newname5='Session='$dmDesktop

	echo "Changing all references"
	echo
	sed -i 's/'$oldname1'/'$newname1'/g' $buildFolder/archiso/profiledef.sh
	sed -i 's/'$oldname2'/'$newname2'/g' $buildFolder/archiso/profiledef.sh
	sed -i 's/'$oldname3'/'$newname3'/g' $buildFolder/archiso/airootfs/etc/dev-rel
	sed -i 's/'$oldname4'/'$newname4'/g' $buildFolder/archiso/airootfs/etc/hostname
	# sed -i 's/'$oldname5'/'$newname5'/g' $buildFolder/archiso/airootfs/etc/sddm.conf

	echo "Adding time to /etc/dev-rel"
	date_build=$(date -d now)
	echo "Iso build on : "$date_build
	sudo sed -i "s/\(^ISO_BUILD=\).*/\1$date_build/" $buildFolder/archiso/airootfs/etc/dev-rel


echo
echo "############################### Payra OS ###################################"
tput setaf 6
echo "Phase 6 :"
echo "- Cleaning the cache from /var/cache/pacman/pkg/"
tput sgr0
echo "############################### Payra OS ###################################"
echo

	echo "Cleaning the cache from /var/cache/pacman/pkg/"
	yes | sudo pacman -Scc

echo
echo "############################### Payra OS ################################### "
tput setaf 6
echo "Phase 7 :"
echo "- Building the iso - this can take a while - be patient"
tput sgr0
echo "############################### Payra OS ################################### "
echo

	[ -d $outFolder ] || mkdir $outFolder
	cd $buildFolder/archiso/
	sudo mkarchiso -v -w $buildFolder -o $outFolder $buildFolder/archiso/



echo
echo "############################### Payra OS ####################################"
tput setaf 6
echo "Phase 8 :"
echo "- Creating checksums"
echo "- Copying pgklist"
tput sgr0
echo "############################### Payra OS ####################################"
echo

	cd $outFolder

	echo "Creating checksums for : "$isoLabel
	echo "############################### Payra OS ###################################"
	echo
	echo "Building sha1sum"
	echo "########################"
	sha1sum $outFolder/$isoLabel | tee $outFolder/$isoLabel.sha1
	echo "Building sha256sum"
	echo "########################"
	sha256sum $outFolder/$isoLabel | tee $outFolder/$isoLabel.sha256
	echo "Building sha512sum"
	echo "########################"
	sha512sum $outFolder/$isoLabel | tee $outFolder/$isoLabel.sha512
	echo "Building md5sum"
	echo "########################"
	md5sum $outFolder/$isoLabel | tee $outFolder/$isoLabel.md5
	echo
	echo "Moving pkglist.x86_64.txt"
	echo "########################"
	cp $buildFolder/iso/arch/pkglist.x86_64.txt  $outFolder/$isoLabel".pkglist.txt"
	
echo
echo "############################### Payra OS ###################################"
tput setaf 6
echo "Phase 9 :"
echo "- Making sure we start with a clean slate next time"
tput sgr0
echo "############################### Payra OS ################################### "
echo

	echo "Deleting the build folder if one exists - takes some time"
	[ -d $buildFolder ] && sudo rm -rf $buildFolder

echo
echo "############################### Payra OS ###################################"
tput setaf 6
echo "DONE"
echo "- Check your out folder :"$outFolder
tput sgr0
echo "############################### Payra OS ################################### "
echo
