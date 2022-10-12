#/bin/bash

FileName="newfile"
HouZui=".txt"
FileNameS="newfile*"

P_pwd=""
Count=0

if [ -f ${1} ];then
	P_pwd=${1%/*}
fi

if [ -d ${1} ];then
	P_pwd=${1}
fi

cd ${P_pwd}


if [ ! -f ${FileName}${Count}${HouZui} ];then
	touch ${FileName}${Count}${HouZui}
	exit;
fi

for File_val in `ls ${FileNameS}`
do
	Count=$(($Count + 1))
done

touch ${FileName}${Count}${HouZui}