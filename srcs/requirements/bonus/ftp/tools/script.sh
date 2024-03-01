#!/bin/bash

# Start vsftpd service
service vsftpd start
sleep 10

# Add FTP user, set password, and add user to vsftpd userlist
adduser $ftp_user --disabled-password --gecos "" --home /home/$ftp_user --shell /bin/bash
echo "$ftp_user:$ftp_pwd" | /usr/sbin/chpasswd
echo "$ftp_user" | tee -a /etc/vsftpd.userlist

mkdir /var/www/html
chgroup $ftp_user /var/www/html
chown $ftp_user: /var/www/html
chmod 755 /var/www/html

# Update vsftpd configuration for file transfer settings
sed -i -r "s/#write_enable=YES/write_enable=YES/1" /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1" /etc/vsftpd.conf

# Append additional settings for file transfer permissions
echo "
local_enable=YES
write_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/var/www/html
pasv_min_port=40000
pasv_max_port=40005
userlist_file=/etc/vsftpd.userlist
anon_upload_enable=YES
anon_mkdir_write_enable=YES" >> /etc/vsftpd.conf

# Stop vsftpd service to apply changes and restart it
service vsftpd stop
/usr/sbin/vsftpd