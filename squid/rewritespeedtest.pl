#!/usr/bin/perl
# @ http://www2.fh-lausitz.de/…/comp/misc/squid/projekt_youtube/
# referensi dan terimakasih khususnya pada MikroTiker N SquidLover-Ces Pun-Syaifudin JW aka Ucok Karnadi
#### var
use IO::File;
$|=1;
STDOUT->autoflush(1);
$debug=0; ## recommended:0
$bypassallrules=0; ## recommended:0
$sucks=""; ## unused
$sucks="sucks" if ($debug>=1);
$timenow="";
$printtimenow=1; ## print timenow: 0|1
my $logfile = '/tmp/rewrite-ruwet.log';

open my $logfh, '>>', $logfile
or die "Couldn't open $logfile for appending: $!\n" if $debug;
$logfh->autoflush(1) if $debug;

while (<>) {
$timenow=time()." " if ($printtimenow);
#print $logfh "$timenow"."in : $_" if ($debug>=1);
#print $logfh "in : $_" if ($debug>=1);
chop; ## strip eol
my $urlku = $_;
#@X = split;
@X = split(" ",$urlku);
$a = $X[0]; ## chanel
$b = $X[1]; ## url
$c = $X[2]; ## ip
$u = $b; ## url

print $logfh "in : $_\n" if ($debug>=1);

if ($bypassallrules){
$out="$u"; ## map 1:1

} elsif ($u=~ m/^http:\/\/.*\/(speedtest\/.*)/) {
$out="OK rewrite-url=http://172.16.0.2:80/$1";

} elsif ($u=~ m/^http:\/\/.*speedtest\.net\/id\/(.*)/) {
$out="OK rewrite-url=http://172.16.0.2:80/speedtest/$1";

} elsif ($u=~ m/^http:\/\/.*api\.ookla\.com\/(.*)/) {
$out="OK rewrite-url=http://172.16.0.2:80/speedtest/$1";

} else {
$out="ERR";
}
print $logfh "out: $a $out\n" if ($debug>=1);
print "$a $out\n";
}
close $logfh if ($debug);