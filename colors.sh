#!/bin/sh

# colors: display ANSI color table

ESC="\033["
echo "          40m      41m      42m      43m      44m      45m      46m      47m"
for FG in `seq 30 37`; do
  LINE1="   ${FG}m  "
  LINE2=" 1;${FG}m  "
  for BG in `seq 40 47`; do
    LINE1="${LINE1}${ESC}${BG};${FG}m Normal ${ESC}0m "
    LINE2="${LINE2}${ESC}${BG};${FG};1m Bold   ${ESC}0m "
  done
  echo -e "${LINE1}\n${LINE2}"
done

#TEXT='xYz'
#echo -e "\n                40m     41m     42m     43m     44m     45m     46m     47m";
#for FGs in '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m'\
#           '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
#  do FG=${FGs// /}
#  echo -en " $FGs  \033[$FG $TEXT  "
#  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
#    do echo -en "\033[$FG\033[$BG  $TEXT  \033[0m ";
#  done
#  echo;
#done
#echo

#TEXT='xYz'
#echo "                0       1       2       3       4       5       6       7"
#for FG in 0 1 2 3 4 5 6 7
#do
#  echo -en "   ${FG}m $(tput setaf ${FG})  $TEXT  "
#  for BG in 0 1 2 3 4 5 6 7
#  do 
#    echo -en "$(tput setaf ${FG})$(tput setab ${BG})  $TEXT  ";
#    echo -en "$(tput sgr0) "
#  done
#  echo
#  echo -en " 1;${FG}m $(tput bold)$(tput setaf ${FG})  $TEXT  "
#  for BG in 0 1 2 3 4 5 6 7
#  do 
#    echo -en "$(tput bold)$(tput setaf ${FG})$(tput setab ${BG})  $TEXT  ";
#    echo -en "$(tput sgr0) "
#  done
#  echo
#done
#echo
