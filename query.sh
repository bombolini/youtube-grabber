#!/bin/sh
while read C1 C2
do
wget -O "$C1" "https://www.youtube.com/results?search_query=$C1+&sp=EgJAAQ%253D%253D"
sed -i "s|videoId|\nvideoId|g" "$C1"
grep -A0 "videoId" "$C1" | sed "s|,.*||g" | head -1 | sed "s|videoId\":\"||g" | sed "s|\"||g" > "$C1"_id
rm "$C1"
done<db
exit 0
