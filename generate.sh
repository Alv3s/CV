#!/bin/bash
input="templates"
mkdir -p releases
while IFS= read -r line
do
	echo "Generating $line..."
	
	echo "./node_modules/.bin/resume export resume_$line.html -t $line"
	./node_modules/.bin/resume export releases/resume_$line.html -t $line
	
	echo "./node_modules/.bin/resume export resume_$line.pdf -t $line"
	./node_modules/.bin/resume export releases/resume_$line.pdf -t $line
done < "$input"
cd releases
tar -zcvf CV_Ricardo_Alves.tar.gz *
