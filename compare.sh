#!/bin/sh
while read -r C1 C2
do
cp $C1 control_$C1
./$C2
new=`cat $C1`
old=`cat control_$C1`
if [ ! $new = $old ]
then
mv $C1 control_$C1
fi
done < db
