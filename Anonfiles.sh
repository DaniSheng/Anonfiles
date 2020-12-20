#!/usr/bin/bash

# Important Variables

txtred='\033[0;31m' # Red
txtgrn='\033[0;32m' # Green
txtylw='\033[0;33m' # Yellow
txtrst='\033[0m'    # Text Reset


GuidedMode() {
echo "Guided Mode"
sleep 0.5
clear

if ! command -v jq &> /dev/null
then
echo -e "${txtred}jq not available${txtrst}
"
apt install jq
exit

fi

if ! command -v lolcat &> /dev/null
then
figlet Anonymousfiles
else
figlet Anonymousfiles | lolcat
fi


echo "                                  Uploader"
echo ""
wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    echo -e "Status : ${txtgrn}[Online]${txtrst}"
else
    echo "This reqiures an active internet connection to work."
    exit
fi

temp=""

read -p "Enter Filename/path to Upload : " gfile
echo ""
if [[ -f "$gfile" ]];then
echo -e "FILE : ${txtgrn}[Available]${txtrst}"
else
echo -e "FILE : ${txtred}[Not Found]${txtrst}"
GuidedMode
fi
echo -e "
e.g if you type ${txtylw}1d${txtrst}, Your file will be deleted after 1 day.

Available options:
${txtylw}h${txtrst} - for hours
${txtylw}d${txtrst} - for days
${txtylw}w${txtrst} - for weeks
${txtylw}m${txtrst} - for months

Max 6 Months
"
read -p "Enter the expiration time for file : " gexpire

if [[ -z "$gexpire" ]];then
GuidedMode
fi

echo -e "
${txtylw}Do you want your file to be indexed in search Engines (Google...).
They'll be publicly available to Search Engines.${txtrst}
"

read -p "Do you want to index file [y/N]: " gindex

if [[ -z $gindex ]];then
GuidedMode
fi

if [[ $gindex == "N" || "n" ]];then
Indexing="false"
else
Indexing="true"
fi

curl -F file=@"${gfile}" -F expires=${gexpire} -F no_index=$Indexing https://api.anonymousfiles.io/ > .temp.txt | echo "
Uploading..."

FILEURL=$(cat temp.txt | jq -r '.url')
FILESIZE=$(cat temp.txt | jq -r '.size')
FILENAME=$(cat temp.txt | jq -r '.name')
echo -e "
${txtgrn}SUCCESSFULLY UPLOADED${txtrst}

File Url : ${txtylw}[${txtrst} ${FILEURL} ${txtylw}]${txtrst}

Size : "${txtgrn}${FILESIZE}${txtrst}" in bytes

Expire After : "${txtylw}${gexpire}${txtrst}"

Indexed : "${txtylw}${Indexing}${txtrst}"

Job : [${txtgrn}Completed${txtrst}]

"

rm temp.txt
echo -e "Press [${txtgrn}Enter${txtrst}] to Exit"
read waste
exit

}

if [[ -z $@ ]];then

GuidedMode

fi

ShowInfo() {

echo -e "
Anonymousfiles.io uploader by Jaxparrow

${txtylw}Anonymity and privacy.${txtrst}
Many file sharing websites track what you do, look at your files and share your data. We value your right to privacy and anonymity and promise never to do this.

${txtylw}Safe to use.${txtrst}
We do not allow any harmful software to be uploaded. All files are scanned for viruses.

${txtylw}Zero logs.${txtrst}
Strict no logs policy. We will never log your IP or referer and we don't store logs.

${txtylw}Zero speed or bandwidth restrictions.${txtrst}
We do not limit your download/upload speeds or the amount of bandwidth you use or charge you for full access.

${txtgrn}Links :-${txtrst}
Site - https://anonymousfiles.io/
About - https://anonymousfiles.io/about.html
Privacy Policy - https://anonymousfiles.io/privacy.html
Terms of Use - https://anonymousfiles.io/terms.html

Note by Dev:-
I do not own Anonymousfiles or It's associated things.
I only created this executable for linux. I am not resposible for things that made to your files.

This is created to make the work easier

"

}

Showhelp() {
echo -e "
Type only the $0 to open the ${txtgrn}Guided Mode${txtrst}.

Usage :

$0 {pathtofile} <options>

Available Options:

--expires <time> .eg ${txtylw}--expires 4d${txtrst} to delete the file after 4 days.
  
  Available Switches for this --expires option :
  
  h - for hours
  d - for days
  w - for weeks
  m - for months
  
  Maximum 6 months

--index - To Enable index of the file on Search Engines
  
--info - see information about anonymousfiles.io
  
--help - to show this help menu

<Example usage:>
$0 mytext.txt --expires 2w --index ${txtylw}or${txtrst} ./Anonfiles.sh /root/mytext.txt --expires 2w --index

The above command make the file expire after 2 weeks and allows to be indexed on Search Engines

${txtylw}Note : Files with whitespaces are not allowed in manual mode. Only in Guided Mode.${txtrst}
"
}

if [[ $1 == "--help" ]];then
Showhelp
exit
fi

if [[ $1 == "--info" ]];then
ShowInfo
exit
fi

# Converting Variables
FILE="$1"

if [[ "$2" == *"--expires"* ]]; then
  Expires="$3"
  else
  Expires="1"
fi


if [[ "$@" == *"--index"* ]]; then
  Indexing="false"
  
  else
  Indexing="true"
fi


# Check file

if [[ -f "$1" ]];then
echo -e "FILE : ${txtgrn}[Available]${txtrst}"
else
echo -e "FILE : ${txtred}[Not Found]${txtrst}"

echo "
Use $0 --help for More information on how to upload"

exit
fi

# Checking filename


Warning() {

echo "
Files with whitespaces cannot be uploaded
"
echo -e "Use ${txtylw}Guided Mode${txtrst} to upload files with Whitespaces

use $0 --help on how to use Guided Mode
"
echo -e "Job : ${txtred}[Failed]${txtrst}"
exit

}



case "$FILE" in  
     *\ * )
           Warning
          ;;
esac



# Checking connection

wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    echo -e "Status : ${txtgrn}[Online]${txtrst}"
else
    echo "This reqiures an active internet connection to work."
    exit
fi

temp=""



ManualMode() {

if [[ $Expires == "1" ]];then

curl --fail -F file=@${FILE} -F no_index=$Indexing https://api.anonymousfiles.io/ > temp.txt | echo -e "
Uploading Please wait"
else
curl --fail -F file=@${FILE} -F expires=${Expires} -F no_index=$Indexing https://api.anonymousfiles.io/ > temp.txt | echo -e "
Uploading Please wait"
fi



# Do after upload


FILEURL=$(cat temp.txt | jq -r '.url')
FILESIZE=$(cat temp.txt | jq -r '.size')
FILENAME=$(cat temp.txt | jq -r '.name')
echo -e "

${txtgrn}SUCCESSFULLY UPLOADED${txtrst}

File Url : ${txtylw}[${txtrst} ${FILEURL} ${txtylw}]${txtrst}

Size : "${txtgrn}${FILESIZE}${txtrst}" in bytes

Job : [${txtgrn}Completed${txtrst}]

"

rm temp.txt

exit

}



ManualMode

# End of Script
