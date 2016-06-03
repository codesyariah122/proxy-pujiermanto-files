#!/bin/bash
read -p 'Masukan User Linux Anda: ' userver
read -sp 'password Linux Anda: ' passserver 
echo "Aku Yakin Kamu pasti bisa" 
echo -e "selamat datang $userver di programku\n"
echo -n "Masukan Nama Anda :"
read nama
echo "Hello $nama"
echo "goodluck $nama"
#filename="puisi.txt"
#while read line
#do
   #print=${line//[-._]/} # menghapus tanda - . _
   #echo $print
echo "|=====================================================|"
echo "|                   Sajak Suara                       |"
echo "|=====================================================|"
echo "|     sesungguhnya suara itu tak bisa diredam         |"
echo "|                mulut bisa dibungkam                 |"
echo "|  namun siapa mampu menghentikan nyanyian bimbang    |" 
echo "|    dan pertanyaan-pertanyaan dari lidah jiwaku      |"
echo "|      suara-suara itu tak bisa dipenjarakan          |"
echo "|          di sana bersemayam kemerdekaan             |"
echo "|           apabila engkau memaksa diam               |"
echo "|       akan kusiapkan untukmu: pemberontakan!        |" 
echo "|                                                     |"
echo "|        sesungguhnya suara itu bukan perampok        |"
echo "|             yang ingin meraih hartamu               |" 
echo "|                 ia ingin bicara                     |" 
echo "|            mengapa kau kokang senjata               |"
echo "|         dan gemetar ketika suara-suara itu          |"
echo "|                menuntut keadilan?                   |"
echo "|                                                     |"
echo "|       sesungguhnya suara itu akan menjadi kata      |"
echo "|          ialah yang mengajari aku bertanya          |"
echo "|          dan pada akhirnya tidak bisa tidak         |" 
echo "|                engkau harus menjawabnya             |"
echo "|            apabila engkau tetap bertahan            |"
echo "|         aku akan memburumu seperti kutukan          |"
echo "|           Wiji Thukul - 1996 (Sajak Suara)          |" 
echo "|=====================================================|"

echo -e "Selamat datang di installasi server, \n"
while true; do
    read -p "Lanjutkan installasi?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Tolong jawab yes atau no";;
    esac
done
apt-get update && apt-get upgrade -y
echo -e "monitoring Proxy yuk"
while true; do
    read -p "Lanjutkan monitoring?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Tolong jawab yes atau no";;
    esac
done
tail -f /var/log/squid/access.log | ccze
#done < $filename

