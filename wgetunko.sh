#!/bin/bash
curl -s https://klis.tsukuba.ac.jp/school_affairs.html|
tr \> \\n|egrep -o "assets/files/.*\.pdf"|
sed 's_^_https://klis.tsukuba.ac.jp_g'|
while read i;do wget $i;done

curl -s "https://klis.tsukuba.ac.jp/syllabus.html"|
egrep -o "assets\/files\/syllabus.*pdf"|sort|uniq|
sed 's_^_https://klis.tsukuba.ac.jp_g'|
while read i;do wget $i;done
