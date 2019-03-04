#!/bin/bash 

url="$(curl -s -F c=@- https://ptpb.pw/?u=1)"
echo "${url}" | xclip -sel c -i
echo "Sucessfuly uploaded to: $url"
