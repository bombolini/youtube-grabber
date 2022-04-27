#!/bin/sh
echo "Enter Channel Name:"
read q
echo "Welcome ${q}!"
wget -O yenitvyoutube "https://www.youtube.com/results?search_query=${q}+live"
wget -O new "https://www.youtube.com/results?search_query=Channeltv+live"
sed -i "s|videoId|\nvideoId|g" new
grep -A0 "videoId" new | sed "s|,.*||g" | head -1 | sed "s|videoId\":\"||g" | sed "s|\"||g" > new_id
cp new_id 0new_id
exit 0
