#!/bin/sh
rm db.sql
mkdir old
while read C1 C2
do
new=`cat "$C1"_id`
old=`cat "old/$C1"_id`
echo "new parameter is $new"
sleep 1
echo "old parameter is "$old""
sleep 1
if [ ! "$new" = "$old" ]
then
echo "warning! url changed in youtube channel"
echo "update streams set stream_source = replace ( stream_source, '$old', '$new' ) where id = $C2 ;" >> db.sql
sleep 3
mv "$C1"_id old/"$C1"_id
fi
done < db
sed -i '1iuse $enter_database_name_here;\' db.sql
