#!/bin/bash
IFS=''

usage(){ echo -e "[\033[92m*\033[0m]\tUsage: ${0} <path> <newname>"; }

target=$1;
newName=$2;

if [[ $1 == "" ]]; then
	echo -e "\033[91mYou need to specify path\033[0m";
	usage;
	exit;
fi;

if [[ $2 == "" ]]; then
	echo -e "\033[91mYou need to specify the new name\033[0m";
	usage;
	exit;
fi;

ls $target > files.txt;

i=0;
while read -r line; do
	if [[ ! -d ${target}${line} ]]; then
		ext=${line##*.};
		mv ${target}${line} ${target}${newName}_${i}.${ext};
		let "i++";
	fi;
done < files.txt;
echo -e "Files renamed: ${i}";

rm files.txt
exit;
