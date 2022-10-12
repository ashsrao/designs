#!/bin/sh
for d in *.tex; 
do
	echo ${d};
	latexmk -pdf ${d};
done
latexmk -c
