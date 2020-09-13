#! /bin/bash

read -p "Enter your name : " NAME
read -p "Enter your age : " AGE
read -p "Enter your department : " DEPT

echo
echo "You have entered the following : "
echo "Name :        $NAME"
echo "Age :         $AGE"
echo "Department :  $DEPT"
echo

CHECK=0
while [ $CHECK -eq 0 ]
do
    echo -n "Is that correct? [y/n] "
    read ANS

    case "$ANS" in 
      "Y"|"y" )
            echo "Name:       $NAME" >> employee.txt
            echo "Age:        $AGE" >> employee.txt
            echo "Department: $DEPT" >> employee.txt
            echo "==================" >> employee.txt
            echo "Your data were saved into employee.txt file."
            echo
            CHECK=1
    	    ;;

      "N"|"n" )
            echo "Run the script again with correct input."
            echo "Your incorrect values were not saved."
            echo
            CHECK=1
	    ;;
        
       * )
            echo "Please enter correct option to proceed."
            echo "Please enter y/n"
            echo
            ;;
      esac  
done          
