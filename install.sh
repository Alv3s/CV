#!/bin/bash
input="templates"
while IFS= read -r line
do
  echo "Installing $line..."
  echo "npm install jsonresume-theme-$line"
  npm install jsonresume-theme-$line
done < "$input"

