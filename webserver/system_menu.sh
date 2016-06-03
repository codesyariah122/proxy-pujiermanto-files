#!/bin/bash
clear
menu=
time=
echo "======================||======================"
echo "~ Hallo Selamat Datang Di System Menu Server ~"
echo "======================||======================"
echo "kalau mau install bmon aplikasi untuk monitoring system-bandwidth"
echo "Ambil dari github ~ silahkan"
echo "cd bmon"
apt-get install build-essential make libconfuse-dev libnl-3-dev libnl-route-3-dev libncurses-dev pkg-config dh-autoreconf
echo "cd bmon/---> ./autogen.sh"
echo "cd bmon/---> ./configure"
echo "cd bmon/--->  make && make install"
echo "1: Lihat hostname Mesin"
echo "2: Lihat Tanggal Dan Jam System"
echo "3: Cek Kapasitas RAM"
echo "4: Cek Kapasitas Hardisk"
echo "5: Cek Untuk Service Lainnya"
echo "6: Lihat Ip Address"
echo "7: Cek Internet Connection (ping ke google.com)"
echo "8: Melihat jumlah waktu pemakaian komputer "
echo "9: User Information Dan Waktu Loggin"
echo "10: Melihat system process and cpu"
echo "11: Lihat Graphic System"
echo "12: Monitoring Proxy-Server"
echo "13: shutdown"
echo "0: Keluar dari Program"
until [ "$menu" = "0" ]; do
echo -n "Pilih Menu Dengan memasukan Nomor Menu>"
read menu
 if [ "$menu" = "0" ]; then
 echo "See you, Bye...." $exit
 fi
  case $menu in
  1 ) hostname ;;
  2 ) date ;;
  3 ) free -m ;;
  4 ) df -h ;;
  5 ) apt-get update && apt-get upgrade -y
      squid -k parse
      squid -k reconfigure
      /etc/init.d/squid restart
      /etc/init.d/squid reload
      # tambahkan untuk program/service yang lain
      service apache2 restart ;;
  6 ) ifconfig ;;
  7 ) ping google.com ;;
  8 ) uptime ;;
  9 ) w ;;
  10 ) top ;;
  11 ) bmon ;;
  12 ) tail -f /var/log/squid/access.log | ccze ;;
  13 ) echo -n "Masukan Waktu/jam dan sesuaikan dengan jam diserver anda,Penulisan waktu/jam dalam format, (jam: 21:45)>"
       read time
       echo " Sesaat Lagi System Linux Akan Dimatikan $time"
       shutdown -h $time ;;
  esac
done
