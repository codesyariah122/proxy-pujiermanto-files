#!/usr/bin/perl
# =====================================================
# = DSI store-id sample youtube 2016
# = https://www.facebook.com/R.dhani.dhanu
# = http://www.dokter-squid.com/
# =====================================================
 
$|=1;
while (<>) {
chomp;
 
my $puji = "";
if (s/^(\d+\s+)//o) { $puji = $1; }
 
@X = split;
if (@X[0] =~ m/^(exit|quit|x|q)/) {
print STDERR "quiting helper quietly\n";
exit 0;
}
$url = $X[0];
$referer = $X[1];
 
# youtube.com
if ($url =~ m/^https?:\/\/.*\.googlevideo\.com\/videoplayback\?.*/) {
        @id = m/[\&?|\%?|\s?]id=([^\&\%\s]+)/;
        @range = m/[\&?|\%?|\s?]range=([^\&\%\s]+)/;
        @itag = m/[\&?|\%?|\s?]itag=([^\&\%\s]+)/;
        @mime = m/[\&?|\%?|\s?]mime=([^\&\%\s]+)/;
        @clen = m/[\&?|\%?|\s?]clen=([^\&\%\s]+)/;
        if ($referer =~ m/^https?\:\/\/www\.youtube\.com\/(watch\?v\=|embed\/|v\/)(.*)/) {
            $v = $2;
        } else { $v = $id[0] }
        $out = "http://youtube.puji-ganteng.com/" . $v . "@range@itag@mime@clen";
 
 
# ytimg.com
} elsif ($url =~ m/^https?:\/\/.*\.ytimg\.com(.*\.(webp|jpg|gif))/) {
    $out = "http://ytimg.puji-ganteng.com/$1";
 
} else  {
    $out = "ERR";
}
if ($out =~ m/^http:\/\/.*/) {
    print $dsi, "OK store-id=$out\n";
} else {
    print $dsi, "ERR\n";
}
}