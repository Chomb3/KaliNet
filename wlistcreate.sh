#!/bin/bash
#
# Create a wordlist filtering all your wordlists just with words pver 8 characters

while getopts 'W:O:h' OPT; do
  case $OPT in
    W)  wlist=$OPTARG;;
    O)  out=$OPTARG;;
    h)  help="yes";;
    *)  unknown="yes";;
  esac
done

HELP="
    usage: $0 -W <Wordlist> -O <Output> -h <help>

        -W  Wordlist path
        -O  Output.txt
        -h  help    Print this help
"
if [ "$hlp" = "yes" -o $# -lt 1 ]; then
        echo "$HELP"
        exit 0
fi

tot=$(cat $wlist | wc -l)
output=$out

for (( c=1; c<=$tot; c++ ))
do

	char=$(cat $wlist | sed -n ''$c'p' | wc -m )

	if [[ $char -gt 8 ]]; then

		cat $wlist | sed -n ''$c'p' >> $output

	fi

done


