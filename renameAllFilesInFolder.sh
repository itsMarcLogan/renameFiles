

#!/bin/bash
IFS=''

if [[ $1 == "" ]]; then
	echo -e "\033[91mYou need to specify path\033[0m";
	exit;
fi;

if [[ $2 == "" ]]; then
	echo -e "\033[91mYou need to specify the new name\033[0m";
	exit;
fi;

target=$1;
newName=$2;

ls $target > files.txt;

i=0
while read -r line; do
	ext=${line##*.};
	mv ${target}${line} ${target}${newName}_${i}.${ext};
	let "i++";
done < files.txt;
echo -e "Files renamed: ${i}";

rm files.txt
exit;
