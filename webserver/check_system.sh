#! /bin/bash
# unset any variable which system may be using

# clear the screen
clear

while getopts iv name
do
        case $name in
          i)iopt=1;;
          v)vopt=1;;
          *)echo "Invalid arg";;
        esac
done

echo "Hai! Hello World"
echo "Check_system_server by puji ermanto_bonbinnet"

if [[ $# -eq 0 ]]
then
{

# Cek Apakah Koneksi Internet Mati atau Tidak
ping -c 1 google.com &> /dev/null && echo -e '\E[32m'"Internet:  Connected" || echo -e '\E[32m'"Internet:  Disconnected"

# cek type OS
os=$(uname -o)
echo -e '\E[32m'"Operating System Type :"  $os

# Cek Nama Release Version
cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > /tmp/osrelease
echo -n -e '\E[32m'"OS Name :"   && cat /tmp/osrelease | grep -v "VERSION" | cut -f2 -d\"
echo -n -e '\E[32m'"OS Version :"  && cat /tmp/osrelease | grep -v "NAME" | cut -f2 -d\"

# Cek Architecture
architecture=$(uname -m)
echo -e '\E[32m'"Architecture :"  $architecture

# Cek Kernel Release
kernelrelease=$(uname -r)
echo -e '\E[32m'"Kernel Release :"  $kernelrelease

# Cek hostname
echo -e '\E[32m'"Hostname :"  $HOSTNAME

# Cek Internal IP
internalip=$(hostname -I)
echo -e '\E[32m'"Internal IP :"  $internalip

# Cek DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e '\E[32m'"Name Servers :"  $nameservers 

# Cek Logged In Users
who>/tmp/who
echo -e '\E[32m'"Logged In users :"  && cat /tmp/who 

# Cek RAM and SWAP Usages
free -h | grep -v + > /tmp/ramcache
echo -e '\E[32m'"Ram Usages :" 
cat /tmp/ramcache | grep -v "Swap"
echo -e '\E[32m'"Swap Usages :" 
cat /tmp/ramcache | grep -v "Mem"

# Cek Disk Usages
df -h| grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo -e '\E[32m'"Disk Usages :"  
cat /tmp/diskusage

# Cek Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e '\E[32m'"Load Average :"  $loadaverage

# Cek System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e '\E[32m'"System Uptime Days/(HH:MM) :"  $tecuptime

# Remove Temporary Files
rm /tmp/osrelease /tmp/who /tmp/ramcache /tmp/diskusage
}
fi
shift $(($OPTIND -1))
