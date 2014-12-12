#                              _         _                       _
#                             (_)       (_)                     | |
#    _ __   ___ _ __ _ __ ___  _ ___ ___ _  ___  _ __  ___   ___| |__
#   | '_ \ / _ \ '__| '_ ` _ \| / __/ __| |/ _ \| '_ \/ __| / __| '_ \
#   | |_) |  __/ |  | | | | | | \__ \__ \ | (_) | | | \__ \_\__ \ | | |
#   | .__/ \___|_|  |_| |_| |_|_|___/___/_|\___/|_| |_|___(_)___/_| |_|
#   | |
#   |_|

# A script to be scheduled with cron that will ensure the UNIX permissions of specified
# files and directories in shares are maintained how they should be.

# Begin the script by clearing up the output file and pushing
# the last successful script begin date to it
echo "Script beginning to run at" `date`
echo "Last Script Run Began:" > /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/permissions_out.txt
date >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/permissions_out.txt

# Maintain ownership and readership of main data dir
chown root:wheel /mnt/mainpool/data/
chmod 775 /mnt/mainpool/data/

# Recursively maintain ownership on main archive dir
chown -R root:asdfarc /mnt/mainpool/data/arc/

# Since the whole archive is to be 775 we might as well 
# maintain the readership recursively here
chmod -R 775 /mnt/mainpool/data/arc/

# Do as above, but for the categories dir
chown -R root:asdfarc /mnt/mainpool/data/cat/
chmod -R 775 /mnt/mainpool/data/cat/

# Maintain permissions of private top-level directories
chown root:wheel /mnt/mainpool/data/priv/
chmod 775 /mnt/mainpool/data/priv/

# Recursively maintain permissions of user directories
# TAKE CARE TO USE THE RIGHT VALUES HERE
chown -R asdf:asdfarc /mnt/mainpool/data/priv/A/
chmod -R 770 /mnt/mainpool/data/priv/A/
chown -R gelrii:gelrii /mnt/mainpool/data/priv/Gelrii/
chmod -R 770 /mnt/mainpool/data/priv/Gelrii/
chmod -R owncloud:owncloud /mnt/mainpool/data/priv/ownCloud/
chmod -R 770 /mnt/mainpool/data/priv/ownCloud/

# Maintain permissions for the misc dir
chown -R root:wheel /mnt/mainpool/data/misc/
chmod -R 777 /mnt/mainpool/data/misc/

# Recursively maintain permissions for my home dir
chown -R asdf:asdfarc /mnt/home1/home1/
chmod -R 770 asdf:asdfarc /mnt/home1/home1/

# Maintain open permissions for VMware ESXi datastore for ease of management
# (Not a security risk providing the SAN is on a completely isolated subnet)
chown -R root:wheel /mnt/esxi/datastore/
chmod -R 777 /mnt/esxi/datastore/

# Terminate the script by clearing up the output file and pushing
# the last successful script complete date to it
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/permissions_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/permissions_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/permissions_out.txt
echo "Last Script Run Finished:" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/permissions_out.txt
date >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/permissions_out.txt
echo "Script completed at" `date`
echo "This text is here for testing purposes"
echo "if you can see it but no prompt below it means the script"
echo "has completed but is not exiting"
exit
