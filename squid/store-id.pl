#!/usr/bin/perl
# faktor yang bisa menyelamatkan adalah mamam
# storeid.pl with debug opt - based on storeurl.pl
# jangan lupa mamam loh
# hati hati telat mamam nanti sakit mah
# BONBIN.NET http://172.16.0.2/
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
 
use IO::File;
$|=1;
STDOUT->autoflush(1);
$debug=0;			## recommended:0
$bypassallrules=0;		## recommended:0
$sucks="";			## unused
$sucks="sucks" if ($debug>=1);
$timenow="";
$printtimenow=1;  		## print timenow: 0|1
my $logfile = '/tmp/storeid.log';

open my $logfh, '>>', $logfile
    or die "Couldn't open $logfile for appending: $!\n" if $debug;
$logfh->autoflush(1) if $debug;

while (<>) {
$timenow=time()." " if ($printtimenow);
print $logfh "$timenow"."in : $_" if ($debug>=1);
chop; 
my $myURL = $_;
@X = split(" ",$myURL);
$a = $X[0]; ## channel id
$b = $X[1]; ## url
$c = $X[2]; ## ip address
$u = $b; ## url

if ($bypassallrules){
 $out="$u"; ## map 1:1

} elsif ($u=~ m/^https?:\/\/.*\.*(vimeo\.com.*\/)(\.?.*).*/) {
	$out="OK store-id=http://vimeo-website.squid.internal/" . $1 . "/" . $2;

} elsif ($u=~ m/^https?\:\/\/.*\.akamaihd\.net\/(.*[0-9]+\w+\d+[^\&\s]*)/) {
	$out="OK store-id=http://vimeo-video1.squid.internal/" . $1;

} elsif ($u=~ m/^https?:\/\/(.*\.vimeocdn\.com\/)(.*\.?\W+)(.*[0-9]+\w+\d+[^\&\s]*).*/) {
	$out="OK store-id=http://vimeo-video2.squid.internal/" . $1 . $2 . "/" . $3 ;

} elsif ($u=~ m/^https?:\/\/.*\.akamaihd\.net\/(.*\.*)(.*[0-9]+\w+\d+[^\&\s]*).*/) {
	$out="OK store-id=http://vimeo-video3.squid.internal/" . $1 . "/" . $2;

} elsif ($u=~ m/^https?:\/\/.*\.vimeocdn\.com(.*\.*)(.*[0-9]+\w+\d+[^\&\s]*).*/) {
	$out="OK store-id=http://vimeo.squid.internal/" . $1 . "/" . $2;

} elsif ($u =~ m/^https?:\/\/.*steampowered\.com\/.*\/([0-9]+\/(.*))/) {
        $out="OK store-id=http://steampowered.squid.internal/" . $1 . "/" . $2;
 
} elsif ($u =~ m/^https?\:\/\/.*steampowered.*\/(client|depot)\/(.*)/) {
     	$out="OK store-id=http://steampowered.squid.internal/" . $1 . "/" . $2;

} elsif ($u =~ m/^https?\:\/\/.*steampowered.*\/(client|depot)\/(.*)\?.*/) {
         $out="OK store-id=http://steampowered.squid.internal/" . $1 . "/" . $2 ;

} elsif ($u=~ m/^https?:\/\/.*\.vimeocdn\.com\/(.*(js|jpg|webp|jpeg|gif|svg|icon|css|html)).*/) {
	$out="OK store-id=http://vimeo-images-assets.squid.internal/" . $1 . "/" . $2;

} elsif ($u=~ m/^https?\:\/\/.*\/(.*\..*(mp4|3gp|flv))\?.*/) {
	$out="OK store-id=http://video-file.squid.internal/" . $1;

} elsif ($u=~ m/^http:\/\/.*\.*mediafire\.com.*\/(.*[0-9]+\w+\d+[^\&\s]*).*/) {
	$out="OK store-id=http://mediafire.download.squid.internal/" . $1;

} elsif ($u=~ m/^http:\/\/.*\.*mediafire\.com.*\/(\w+\d+[0-9]+[^\&\s]*).*/) {
	$out="OK store-id=http://mediafire.download.squid.internal/" . $1;

} elsif ($u=~ m/^https?:\/\/.*\.mediafire\.com\/(.*[0-9]+[^\&\s]*)/) {
	$out="OK store-id=http://mediafire.download.squid.internal/" . $1 ;

} elsif ($u=~ m/^https?:\/\/.*\.(mediafire\.com\/)(.*[0-9]+[^\&\s]*)/) {
	$out="OK store-id=http://mediafire.download.squid.internal/" . $1 . "/" . $2;

} elsif ($u=~ m/http.*\.(fbcdn|akamaihd)\.net\/h(profile|photos).*[\d\w].*\/([\w]\d+x\d+\/.*\.[\d\w]{3}).*/) {
	$out="OK store-id=http://fbcdn.net.squid.internal/" . $1 . $2 . "/" . $3 ;

} elsif ($u=~ m/http.*\.(fbcdn|akamaihd)\.net\/h(profile|photos).*[\d\w].*\/([\w]\d+x\d+\/.*\.[\d\w]{3}).*/) {
	$out="OK store-id=http://fbcdn.net.squid.internal/" . $2 . "/" . $3 ;

} elsif ($u=~ m/^http(.*)static(.*)(akamaihd|fbcdn).net\/rsrc.php\/(.*\/.*\/(.*).(js|css|png|gif))(\?(.*)|$)/) {
	$out="OK store-id=http://fbcdn.net.squid.internal/static/" . $5 . "." . $6 ;

} elsif ($u=~ m/^https?:\/\/[a-zA-Z0-9\-\_\.\%]*(fbcdn|akamaihd)[a-zA-Z0-9\-\_\.\%]*net\/rsrc\.php\/(.*)/) { 
	$out="OK store-id=http://fbcdn.net.squid.internal/" . $2 ;

} elsif ($u=~ m/^https?\:\/\/.*(profile|photo|creative).*\.ak\.fbcdn\.net\/((h|)(profile|photos)-ak-)(snc|ash|prn)[0-9]?(.*)/) {
	$out="OK store-id=http://fbcdn.net.squid.internal/" . $2  . "fb" .  $6 ;

} elsif ($u=~ m/^https?:\/\/.*(profile|photo|creative)*.akamaihd\.net\/((h|)(profile|photos|ads)-ak-)(snc|ash|prn|frc[0-9])[0-9]?(.*)/) {
	$out="OK store-id=http://fbcdn.net.squid.internal/" . $2  . $5 .  $6 ;

} elsif ($u=~ m/^https?\:\/\/video\.(.*)\.fbcdn\.net\/(.*?)\/([0-9_]+\.(mp4|flv|avi|mkv|m4v|mov|wmv|3gp|mpg|mpeg)?)(.*)/) {
	$out="OK store-id=http://video.fbcdn.net.squid.internal/" . $1 ;

} elsif ($u =~ m/^http:\/\/(.*\.*apple\.com\W+\d+[0-9]*[^\&\s]*).*/) {
	$out="OK store-id=http://apple.com.squid.internal/" . $1;

} elsif ($u =~ m/^http:\/\/.*\.apple\.com\/([^\&\s]*).*/) {
	$out="OK store-id=http://apple.com.squid.internal/" . $1;

} elsif ($u =~ m/^http:\/\/(.*\.3kingdom\.net)\/(.*patch.*)/) {
	$out="OK store-id=http://3kingdom.squid.internal/" . $1 . "/" . $2;	

} elsif ($u=~ m/http.*\.(fbcdn|akamaihd)\.net\/h(profile|photos).*[\d\w].*\/([\w]\d+x\d+\/.*\.[\d\w]{3}).*/) {
	$out="OK store-id=http://fbcdn.net.squid.internal/" . $2 . "/" . $3 ;

} elsif ($u=~ m/^http(.*)static(.*)(akamaihd|fbcdn).net\/rsrc.php\/(.*\/.*\/(.*).(js|css|png|gif))(\?(.*)|$)/) {
	$out="OK store-id=http://fbcdn.net.squid.internal/static/" . $5 . "." . $6 ;

} elsif ($u=~ m/^https?\:\/\/.*utm.gif.*/) {
	$out="OK store-id=http://google-analytics.squid.internal/__utm.gif";
 
} elsif ($u=~ m/^https?\:\/\/.*\/(.*\..*(mp4|3gp|flv))\?.*/) {
	$out="OK store-id=http://video-file.squid.internal/" . $1;

} elsif ($u=~ m/^http:\/\/[a-z0-9]{4}\.reverbnation\.com\/.*\/([0-9]*).*/) {
	$out="http://reverbnation.com.squid.internal/" . $1;

} elsif ($u=~ m/^https?\:\/\/c2lo\.reverbnation\.com\/audio_player\/ec_stream_song\/(.*)\?.*/) {
	$out="OK store-id=http://reverbnation.squid.internal/" . $1;
 
} elsif ($u=~ m/^https?\:\/\/.*\.c\.android\.clients\.google\.com\/market\/GetBinary\/GetBinary\/(.*\/.*)\?.*/) {
	$out="OK store-id=http://playstore-android.squid.internal/" . $1;

} elsif ($u =~ m/^http:\/\/([a-z])[0-9]?(\.gstatic\.com.*|\.wikimapia\.org.*)/) {
	$out="OK store-id=http://gstatic.squid.internal/" . $2;

} elsif ($u =~ m/^https?:\/\/.*(googleusercontent.com|blogspot.com)\/(.*)\/([a-z0-9]+)(-[a-z]-[a-z]-[a-z]+)?\/(.*\.(jpg|png))/){
	$out="OK store-id=http://googleusercontent.squid.internal/" . $5;

} elsif ($_ =~ m/^https?:\/\/([a-z0-9.]*)(\.doubleclick\.net|\.quantserve\.com|.exoclick\.com|interclick.\com|\.googlesyndication\.com|\.auditude\.com|.visiblemeasures\.com|yieldmanager|cpxinteractive)(.*)/){
	$out="OK store-id=http://ads.squid.internal/" . $3;

} elsif ($u=~ m/^http\:\/\/.*\.4shared\.com\/download\/(.*)\/.*/) {
	$out="OK store-id=http://4shared.squid.internal/" . $1;

} elsif ($u =~ m/^http:\/\/(www\.ziddu\.com.*\.[^\/]{3,4})\/(.*?)/) {
	$out="OK store-id=http://ziddu.squid.internal/" . $1;

} elsif ($u =~ m/^https:\/\/.*googleapis\.com\/.*\.*\/v2\/code\.google\.com\/([^\&\s]*).*/) {
	$out="OK store-id=http://googlecode-download.squid.internal/" . $1;

} elsif ($u =~ m/^http:\/\/(.*\.*)\W+(aclst\.com).*\.*(mp3.*?)\.*\.*(\w+\d+.*)/) {
	$out="OK store-id=http://yt-mp3converter.squid.internal/" . $1;

} elsif ($u =~ m/^http:\/\/(.*\.*filehippo\.com\/)([^\&\s]*).*/) {
	$out="OK store-id=http://filehippo-download.squid.internal/" . $1;

} elsif ($u =~ m/^http:\/\/(.*?)\.yimg\.com\/(.*?)\.yimg\.com\/(.*?)\?(.*)/) {
	$out="OK store-id=http://cdn.yimg.squid.internal/" . $3;

} elsif ($u=~ m/^https?\:\/\/.*\/speedtest\/(.*\.(jpg|txt)).*/) {
	$out="OK store-id=http://speedtest.squid.internal/" . $1;

} elsif (($u =~ /filehippo/) && (m/^https?:\/\/(.*?)\.(.*?)\/(.*?)\/(.*)\.([a-z0-9]{3,4})(\?.*)?/)) {
	@y = ($1,$2,$4,$5); $y[0] =~ s/[a-z0-9]{2,5}/cdn./;
	$out="OK store-id=http://filehippo.squid.internal/" . $3;
	
} elsif ($u[1] =~ m/^http:\/\/.*dlink__[23]Fdownload_[23]F([\w\d-]+)_3Ftsid.*/) {
	$1 =~ s/_5F/_/g;
	$out="OK store-id=http://4shared.squid.internal/" . $1;

} elsif ($u=~ m/^https?\:\/\/.*youtube.*ptracking.*/){
	@video_id = m/[&?]video_id\=([^\&\s]*)/;
	@cpn = m/[&?]cpn\=([^\&\s]*)/;
	unless (-e "/tmp/@cpn"){
	open FILE, ">/tmp/@cpn";
	print FILE "@video_id";
	close FILE;
	}
	$out="ERR";
 
} elsif ($u=~ m/^https?\:\/\/.*youtube.*stream_204.*/){
	@docid = m/[&?]docid\=([^\&\s]*)/;
	@cpn = m/[&?]cpn\=([^\&\s]*)/;
	unless (-e "/tmp/@cpn"){
	open FILE, ">/tmp/@cpn";
	print FILE "@docid";
	close FILE;
	}
	$out="ERR";
 
} elsif ($u=~ m/^https?\:\/\/.*youtube.*player_204.*/){
	@v = m/[&?]v\=([^\&\s]*)/;
	@cpn = m/[&?]cpn\=([^\&\s]*)/;
	unless (-e "/tmp/@cpn"){
	open FILE, ">/tmp/@cpn";
	print FILE "@v";
	close FILE;
	}
	$out="ERR";

}elsif ($url =~ m/^https?:\/\/.*\.googlevideo\.com\/videoplayback\?.*/) {
        @id = m/[\&?|\%?|\s?]id=([^\&\%\s]+)/;
        @range = m/[\&?|\%?|\s?]range=([^\&\%\s]+)/;
        @itag = m/[\&?|\%?|\s?]itag=([^\&\%\s]+)/;
        @mime = m/[\&?|\%?|\s?]mime=([^\&\%\s]+)/;
        @clen = m/[\&?|\%?|\s?]clen=([^\&\%\s]+)/;
        if ($referer =~ m/^https?\:\/\/www\.youtube\.com\/(watch\?v\=|embed\/|v\/)(.*)/) {
            $v = $2;
        } else { $v = $id[0] }
        $out = "http://youtube.puji-ganteng.com/" . $v . "@range@itag@mime@clen";
 
} elsif ($u=~ m/^https?\:\/\/.*(youtube|googlevideo).*videoplayback.*/){
	@itag = m/[&?](itag\=[0-9]*)/;
	@range = m/[&?](range\=[^\&\s]*)/;
	@cpn = m/[&?]cpn\=([^\&\s]*)/;
	@mime = m/[&?](mime\=[^\&\s]*)/;
	@id = m/[&?]id\=([^\&\s]*)/;
 
	if (defined(@cpn[0])){
		if (-e "/tmp/@cpn"){
		open FILE, "/tmp/@cpn";
		@id = <FILE>;
		close FILE;}
	}
	$out="OK store-id=http://video-srv.squid.internal/id=@id@mime@range@referer";

} else {
	$out="ERR";
}
	print $logfh "$timenow"."out: $a $out\n" if ($debug>=1);
	print "$a $out\n";
}
if ($out =~ m/^http:\/\/.*/) {
    print $puji, "OK store-id=$out\n";
} else {
    print $puji, "ERR\n";
close $logfh if ($debug);
}