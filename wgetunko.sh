#!/bin/bash
curl -s https://klis.tsukuba.ac.jp/school_affairs.html|
tr \> \\n|
egrep -o "assets/files/.*\.pdf"|while read i;do wget "https://klis.tsukuba.ac.jp/${i}";done

