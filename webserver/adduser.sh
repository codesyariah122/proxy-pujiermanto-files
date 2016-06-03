#! /bin/bash
awk 'BEGIN {RS="\n"; }
{system ("useradd -m "$0); }
END{}' < userlist.txt
