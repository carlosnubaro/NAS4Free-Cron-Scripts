#  _                 _          _                     _     
# | |_ _ __ __ _ ___| |__   ___| | ___  __ _ _ __ ___| |__  
# | __| '__/ _` / __| '_ \ / __| |/ _ \/ _` | '__/ __| '_ \ 
# | |_| | | (_| \__ \ | | | (__| |  __/ (_| | | _\__ \ | | |
#  \__|_|  \__,_|___/_| |_|\___|_|\___|\__,_|_|(_)___/_| |_|
#                                                           

# A script to get rid of some of the annoying directories that reappear in a CIFS/AFP share's
# root every time NAS4Free reboots.

# Begin the script by emptying the output file and pushing the last successful script complete date to it
echo "Last Script Run Began:" > /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/trashclear_out.txt
date >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/trashclear_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/trashclear_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/trashclear_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/trashclear_out.txt

# Delete the "Network Trash Folder" and "Temporary Items" folders from the datastore root
# BE EXTREMELY CAREFUL WITH THIS! OBVIOUSLY THE RM -RF COMMAND MUST BE USED WITH GREAT CARE.
rm -rf /mnt/mainpool/data/Network\ Trash\ Folder/
rm -rf /mnt/mainpool/data/Temporary\ Items/
rm -rf /mnt/mainpool/data/.AppleDB/
rm -rf /mnt/mainpool/data/.AppleDesktop/

# Terminate the script by clearing up the output file and pushing
# the last successful script complete date to it.
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/trashclear_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/trashclear_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/trashclear_out.txt
echo "Last Script Run Finished:" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/trashclear_out.txt
date >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/trashclear_out.txt
