# Encryption

https://github.com/CyberIntern/Encryption

Click Clone or download option in Green color and Download this Repository Encryption-master as ZIP File

Go to the downloaded ZIP file, right click on it and select the option Extract Here, and the files will be extracted to the Folder Encryption-master (which contain encdec.sh , private_key.pem , public_key.pem , logfile.txt and README.md files)

Go to the terminal, Change Directory into the Folder Encryption-master

Give the correct user access levels to the file encdec.sh [ Command -> chmod 755 encdec.sh ]

And, Execute the shell file encdec.sh [ Command -> ./encdec.sh ]

Then encrypt and decrypt files using symmetric and asymmetric techniques with the help of different algorithms such as AES, DES, 3DES and RC4

When giving the file as user input, just type the filename.extension if it's in the present directory, ie, inside the Encryption-master Folder ; otherwise, specify the file path along with the filename.extension

When giving the file as user input for encryption, Don't forget to give the correct extension [ document1.txt , file1.pdf ]

When encrypting the files, the extension .enc will be added to the original file 
[ when input1.txt is encrypted, the encrypted file is input1.txt.enc ]

When giving the file as user input for decryption, Don't forget to give the correct extension [ document1.txt.enc , file1.pdf.enc ]

When decrypting the encrypted files, the extension .enc will be removed and the file is decrypted
[ when input1.pdf.enc is decrypted, the decrypted file is input1.pdf ]

Keep in mind that the PASS PHRASE for the PRIVATE KEY in the ASYMMETRIC DECRYPTION process is "password"

View the log details in the logfile.txt file


### You can Find more information on this blogspot about the Encryption concepts and how to do them from the beginning in simple steps
### http://cyberinternblog.blogspot.com/
