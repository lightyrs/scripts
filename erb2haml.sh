#!/bin/bash

# Convert all project .erb files to .haml

echo "Finding .erb files in your project"

find . -name '*erb' | \
xargs ruby -e 'ARGV.each { |i| puts "html2haml -r #{i} #{i.sub(/erb$/,"haml")}" }'

echo "Do you want to convert these files to haml?"

select yn in "Yes" "No"; do
    case $yn in
        Yes) find . -name '*erb' | \
				xargs ruby -e 'ARGV.each { |i| puts "html2haml -r #{i} #{i.sub(/erb$/,"haml")}"}' | \
				bash; echo "Files were converted to haml"; break;;
        No) echo "No files were converted"; exit;;
    esac
done