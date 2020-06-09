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

sum=/tmp/Summary.txt
tot=$(cat $wlist | wc -l)
output=$out

if [[ -f $sum ]]; then

	touch $sum
	flag=$(cat $sum | grep $wlist | wc -l )

fi

if [[ $flag -ge 1 ]]; then

	echo  -e "Error: This wordlist has been used before.\nIf you want to delete the Summary, please use 'rm /tmp/Summary.txt'."

else

	for (( c=1; c<=$tot; c++ ))
	do

		char=$(cat $wlist | sed -n ''$c'p' | wc -m )
		let por=($c * 100 / $tot)

		BAR='####################################################################################################' 

		if [[ $char -gt 8 ]]; then

			cat $wlist | sed -n ''$c'p' >> $output
                	echo -ne "${BAR::$por}"'['$c']               ['$tot' - '$por'%]\r'

		else

			echo -ne "${BAR::$por}"'['$c']               ['$tot' - '$por'%]\r'

		fi

	done

	echo $wlist >> $sum
	echo \n

fi

