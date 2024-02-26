#!/bin/bash

# Define FTP user and password
ftp_user="your_ftp_user"
ftp_pwd="your_ftp_password"

# Start vsftpd service
service vsftpd start

# Add FTP user, set password, and add user to vsftpd userlist
adduser $ftp_user --disabled-password
echo "$ftp_user:$ftp_pwd" | /usr/sbin/chpasswd
echo "$ftp_user" | tee -a /etc/vsftpd.userlist

# Create FTP directory structure and set permissions
mkdir /home/$ftp_user/ftp
chown nobody:nogroup /home/$ftp_user/ftp
chmod a-w /home/$ftp_user/ftp

mkdir /home/$ftp_user/ftp/files
chown $ftp_user:$ftp_user /home/$ftp_user/ftp/files

# Update vsftpd configuration for file transfer settings
sed -i -r "s/#write_enable=YES/write_enable=YES/1" /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1" /etc/vsftpd.conf

# Append additional settings for file transfer permissions
echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/$ftp_user/ftp
pasv_min_port=40000
pasv_max_port=40005
userlist_file=/etc/vsftpd.userlist
anon_upload_enable=YES
anon_mkdir_write_enable=YES" >> /etc/vsftpd.conf

# Stop vsftpd service to apply changes and restart it
service vsftpd stop
/usr/sbin/vsftpd