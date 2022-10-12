#!/bin/bash

set -x
orig_pattern_dir="${PWD}/../kundapur-pattern/"
pattern_dir="${PWD}/patterns/"
cnt=1
i=1
argcnt=$#
rm -f ${pattern_dir}/*.pdf
designid="door"
while [ $i -le ${argcnt} ];
do
	dir_name=$1
	shift 1;
	i=$((i+1))
	if [ $i -gt ${argcnt} ]
	then
		break
	fi	
	fname=$1
	shift 1
	i=$((i+1))
	ln -s ${orig_pattern_dir}/${dir_name}/${fname}.pdf ${pattern_dir}/${cnt}.pdf
	cnt=$((cnt+1))
	designid="${designid}--${dir_name}-${fname}"
done
ls -l ${pattern_dir}
sleep 1
latexmk -pdf figure
mv figure.pdf ${designid}.pdf
latexmk -C
latexmk -c
evince ${designid}.pdf
