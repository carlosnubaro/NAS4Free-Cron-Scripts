#        _ _     _                                     _
#       | (_)   | |                                   | |
#     __| |_ ___| | ___   _ ___  __ _  __ _  ___   ___| |__
#    / _` | / __| |/ / | | / __|/ _` |/ _` |/ _ \ / __| '_ \
#   | (_| | \__ \   <| |_| \__ \ (_| | (_| |  __/_\__ \ | | |
#    \__,_|_|___/_|\_\\__,_|___/\__,_|\__, |\___(_)___/_| |_|
#                                      __/ |
#                                     |___/

# A script to be scheduled with cron that will periodically output information about the 
# disk usage of various directories on the NAS.

# Begin the script by emptying the output file and pushing the last successful script complete date to it
echo "Last Script Run Began:" > /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
date >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt

# Note that the script is unable to use the correct SI units for measurement
echo "Please note that due to limitations of the FreeBSD version of 'du', all of" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "the following are presented in non-SI units (powers of 1024 instead of 1000):" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt

# Print the total pool usage
echo "Filesystem     Type      Size    Used   Avail Capacity  Mounted on" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
df -hT | grep '/mnt/mainpool/data' >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt

# Add some blank line formatting
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt

# Print size of archive folders
du -hs /mnt/mainpool/data/arc/Anime >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
du -hs /mnt/mainpool/data/arc/Documentaries >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
du -hs /mnt/mainpool/data/arc/Music >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
du -hs /mnt/mainpool/data/arc/Movies >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
du -hs /mnt/mainpool/data/arc/TV >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt

# Add some blank line formatting
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt

# Print the size of the private folders to the output file.
# This is useful since they can't be measured unless as root.
du -hs /mnt/mainpool/data/priv/A >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
du -hs /mnt/mainpool/data/priv/Gelrii >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt

# Terminate the script by clearing up the output file and pushing
# the last successful script complete date to it.
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
echo "Last Script Run Finished:" >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
date >> /mnt/mainpool/data/cat/Other/Server\ Script\ Outputs/diskusage_out.txt
