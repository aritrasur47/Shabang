#! /bin/bash

#Creating a script that will work with parameters.
# -f or --file will provide info about number of lines, words, characters.
# -h or --help will provide usage message

while [ $# -gt 0 ]
do
    case "$1" in
            -h|--help )
                echo "USAGE: $0 [-h] [--help] [-f filename] [--file filename]"
                echo
                shift
                exit 1 
                ;;
            
            -f|--file )
                FILE=$2
                if ! [ -f "$FILE" ]; then  
                    echo "File does not exist."
                    echo
                    exit 2
                fi
                
                LINES=`cat "$FILE" | wc -l`
                WORDS=`cat "$FILE" | wc -w`
                CHARS=`cat "$FILE" | wc -m`


                echo "=====FILE: $FILE====="
                echo "Lines:      $LINES"
                echo "Words:      $WORDS"
                echo "Characters: $CHARS"
                echo
                shift  
                shift
                ;;

            * )
                echo "USAGE: $0 [-h] [--help] [-f filename] [--file filename]"
                echo
                exit 1
                ;;
    esac                
done
