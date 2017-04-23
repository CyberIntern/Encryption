#!/bin/bash

GREEN='\033[0;32m'	# Defining of Text Colours for User Understanding
BLUE='\033[0;34m'
RESET='\033[0m'

log="logfile.txt"	# logfile.txt is used to store the user logs to prevent future errors

algorithm_selection()	# Select the suitable algorithm type for encryption and decryption
{
	echo
	echo " PRESS 1 -> aes-256-cbc "		# Advanced Encryption Standard using 256 bit key
	echo " PRESS 2 -> aes-256-ecb "		
	echo " PRESS 3 -> des "			# Data Encryption Standard using 56 bit key
	echo " PRESS 4 -> des3 "		# Triple DES using 168 bit key
	echo " PRESS 5 -> rc4 "			# Rivest Cipher 4 
	echo 
	read -p " Select an Algorithm : " user_selection	

	algorithm=0

	if [ $user_selection == 1 ]; then
		algorithm="-aes-256-cbc"
	elif [ $user_selection == 2 ]; then
	       algorithm="-aes-256-ecb"
       	elif [ $user_selection == 3 ]; then
		algorithm="-des"
	elif [ $user_selection == 4 ]; then
		algorithm="-des3"
	elif [ $user_selection == 5 ]; then
		algorithm="-rc4"
	else
		echo " Please select a valid number"
		exit 1 
	fi

}


select_file()		# Function for getting the input file name and extension with the path 
{
	echo
	echo " Enter the FILE name with the path and file extension"
	echo
	read -p " FILE.Extension : " file_path

	# Check for the existence of the file
	if [ ! -f $file_path ]; then
		echo " Invalid File Name and/or Extension"
		exit 1
	fi
}


symmetric_encryption()	# Encryption Function for Symmetric Technique
{
	
	echo " Please select a suitable Encryption Algorithm"

	algorithm_selection	# Calling function for selecting an algorithm
	select_file		# Calling function for getting the user input file
	echo

	extension=".enc"
	
	# Adding an extension .enc to differentiate the encrypted file from original file
	output_path=$file_path$extension	

	# Encryption Process using the selected algorithm type
	openssl enc $algorithm -e -in $file_path -out $output_path	

	echo
	echo -e " ${GREEN}The FILE $file_path is encrypted to $output_path with $algorithm algorithm ${RESET}"
	echo
	echo -e " \n Symmetric Technique " >> $log	
	echo " The FILE $file_path is encrypted to $output_path with $algorithm algorithm" >> $log

}


symmetric_decryption()	# Decryption Function for Symmetric Technique
{

	echo " Please select a suitable Decryption Algorithm"

	algorithm_selection	# Calling function for selecting an algorithm
	select_file		# Calling function for getting the user input file
	echo

	# Removing the extension .enc which was added during the encryption process
	output_path=${file_path%.*}

	# Decryption Process using the selected algorithm type
	openssl enc $algorithm -d -in $file_path -out $output_path
	
	echo
	echo -e " ${BLUE}The FILE $file_path is decrypted to $output_path with $algorithm algorithm ${RESET}"
	echo
	echo -e " \n Symmetric Technique " >> $log	
	echo " The FILE $file_path is decrypted to $output_path with $algorithm algorithm" >> $log

}


asymmetric_encryption()	# Encryption Function for Asymmetric Technique
{

	echo " Please select a suitable Encryption Algorithm"

	algorithm_selection	# Calling function for selecting an algorithm
	select_file		# Calling function for getting the user input file
	echo

	extension=".enc"

	# Adding an extension .enc to differentiate the encrypted file from original file
	output_path=$file_path$extension

	# Encryption Process using the PUBLIC KEY [public_key.pem]
	openssl rsautl -encrypt -pubin -inkey public_key.pem -in $file_path -out $output_path
	
	echo
	echo -e " ${GREEN}The FILE $file_path is encrypted to $output_path with $algorithm algorithm ${RESET}"
	echo
	echo -e " \n Asymmetric Technique " >> $log
	echo " The FILE $file_path is encrypted to $output_path with $algorithm algorithm" >> $log

}


asymmetric_decryption()	# Decryption Function for Asymmetric Technique
{

	echo " Please select a suitable Decryption Algorithm"

	algorithm_selection	# Calling function for selecting an algorithm
	select_file		# Calling function for getting the user input file
	echo

	# Removing the extension .enc which was added during the encryption process
	output_path=${file_path%.*}

	# Decryption Process using the PRIVATE KEY [private_key.pem]
	openssl rsautl -decrypt -inkey private_key.pem -in $file_path -out $output_path
	
	echo
	echo -e " ${BLUE}The FILE $file_path is decrypted to $output_path with $algorithm algorithm ${RESET}" 
	echo
	echo -e " \n Asymmetric Technique " >> $log	
	echo " The FILE $file_path is decrypted to $output_path with $algorithm algorithm" >> $log

}


echo
echo " Welcome to the Encryption and Decryption Application"
echo



while true
do

echo " Please Choose Your Encryption and Decryption Technique"
echo
echo " PRESS s -> Symmetric Technique"
echo " PRESS a -> Asymmetric Technique"
echo " PRESS q -> QUIT"
echo
read -p " Enter Your Selection : " selection
echo


if [ "$selection" = "s" ]; then

	echo " You have choosed SYMMETRIC Technique for your Encryption and Decryption"
	
	echo " PRESS e -> Encryption"
	echo " PRESS d -> Decryption"
	echo
	read -p " Select : " user_selection

	if [ "$user_selection" = "e" ]; then
		symmetric_encryption		# Calling the Symmetric Encryption Function
	

	elif [ "$user_selection" = "d" ]; then
		symmetric_decryption		# Calling the Symmetric Decryption Function

	else
		echo " Invalid Selection, Please make a correct selection" 
		echo
	fi

elif [ "$selection" = "a" ]; then

	echo " You have choosed Asymmetric Technique for your Encryption and Decryption"
	
	echo " PRESS e -> Encryption"
	echo " PRESS d -> Decryption"
	echo
	read -p " Select : " user_selection

	if [ "$user_selection" = "e" ]; then
		asymmetric_encryption		# Calling the Asymmetric Encryption Function
	

	elif [ "$user_selection" = "d" ]; then
		asymmetric_decryption		# Calling the Asymmetric Decryption Function

	else
		echo " Invalid Selection, Please make a correct selection" 
		echo
	fi

elif [ "$selection" = "q" ]; then

	exit -1

else 
	echo " Invalid Selection, Please make a correct selection" 
	echo

fi

done

