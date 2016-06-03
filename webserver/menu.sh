#!/bin/bash
declare -i jml7;
declare -i jml8;
declare -i jml9;
declare -i bayar1;
declare -i bayar2;
declare -i bayar3;
declare -i bayar4;
declare -i bayar5;
declare -i bayar6;
declare -i bayar7;
declare -i bayar8;
declare -i bayar9;
declare -i to;
declare -i kembalian;
declare -i tob;
a=5000;
b=15000;
c=20000;
d=8000;
clear
echo "fia's chedai";
echo "";
echo "~Menu Makanan~";
echo "1. Kentang Goreng";
echo "2. Nasi + Ayam Goreng";
echo "3. Nasi + Ayam Bakar";
echo "4. Nasi Goreng";
echo "";
echo "~Menu Minuman~";
echo "5. Teh Hangat";
echo "6. Es Teh";
echo "8. Es Campur";
echo "9. Jus jambu";
echo "10. Exit";
read -p "Pilihan Anda : " pil;
if [ $pil = 1 ];

then
pesan1="Kentang Goreng ,"
echo -n "Banyak Porsi :";
read jml1
echo "total bayar : ";
let bayar1=$jml1\*$a;
echo "Harga : Rp $bayar1";
elif [ $pil = 2];

then 
pesan2="Nasi + Ayam Goreng , "
echo -n "banyak porsi :";
read jml2
echo "total bayar : ";
let bayar2=jml2\*$b;
echo "Harga : Rp $bayar2";
elif [ $pil = 3 ];

then 
pesan3="Ayam Bakar , "
echo -n "Banyak Porsi :";
read jml3
echo "total bayar : ";
let bayar3=jml3\*$c;
echo "Harga : Rp $bayar3;
elif [ $pil = 4 ];

then 
pesan4="Nasi Goreng , "
echo -n "Banyak Porsi :";
read jml4
let bayar4=jml4\*$d;
echo "Harga : Rp $bayar4;
elif [ $pil = 5 ];

then 
pesan5="Teh Hangat , "
echo "Banyak Gelas :";
read jml5
let bayar5=jml5\*$e;
echo "Harga : Rp $bayar5;
elif [ $pil = 6 ];

then 
pesan6="Es Teh , "
echo "Banyak Gelas :";
read jml6
let bayar6=jml6\*$f;
echo "Harga : Rp $bayar6;
elif [ $pil = 7 ];

then 
pesan7="Es Campur , "
echo "Banyak Gelas :";
read jml7
let bayar7=jml7\*$g;
echo "Harga : Rp $bayar7;
elif [ $pil = 8 ];

then 
pesan8="Es Jeruk , "
echo "Banyak Gelas :";
read jml7
let bayar8=jml8\*$a;
echo "Harga : Rp $bayar8;
elif [ $pil = 9 ];

then 
pesan9="Jus Jambu , "
echo "Banyak Gelas :";
read jml9
let bayar9=jml9\*$h;
echo "Harga : Rp $bayar9;
elif [ $pil = 0 ];

then 
pesan9="Es Jambu , "
echo "Banyak Gelas :";
read jml9
let bayar9=jml9\*$h;
echo "Harga : Rp $bayar9;
elif [ $pil = 10 ];
then
 
exit 0;

else 

echo "maaf pilihan tidak ada :D"

fi 

echo "Terima Kasih";
echo -n "Apakah ada lagi ? (y/t) :";
read lagi;
echo "Makanan/Minuman yang telah anda beli : $pesan1 $pesan2 $pesan3 $pesan4 $pesan5 $pesan6 $pesan7 $pesan8 $pesan9";
echo "Total Yang harus Anda Bayar : $pesan1 $pesan2 $pesan3 $pesan4 $pesan5 $pesan6 $pesan7 $pesan8 $pesan9"; 
let to=bayar1+bayar2+bayar3+bayar4+bayar5+bayar6+bayar7+bayar8+bayar9
echo "$to"

#untuk validasi input
while [ $lagi != 'y' ] && [ $lagi != 'y' ] && [ $lagi != 't' ] && [ $lagi != 't' ]

do 

echo "silahkan isi dengan benar";
echo -n "pilih lagi (y/t) : ";