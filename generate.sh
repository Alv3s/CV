#!/bin/bash
input="templates"
mkdir -p releases
while IFS= read -r line
do
	echo "Generating $line..."
	
	echo "./node_modules/.bin/resume export resume_$line.html -t $line"
	./node_modules/.bin/resume export releases/resume_$line.html -t $line
	
	echo "Generating PDF of $line..."
	wkhtmltopdf --enable-local-file-access --no-outline --print-media-type --background --disable-smart-shrinking releases/resume_$line.html releases/resume_$line.pdf
done < "$input"
cd releases
tar -zcvf CV_Ricardo_Alves.tar.gz *