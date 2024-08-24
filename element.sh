#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

input=$1
if [[ -z $input ]]
then
  echo  Please provide an element as an argument.
else    

if [[ $input =~ ^[0-9]+$ ]]
then
  atomic_number=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $input")

  if [[ -z $atomic_number ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$atomic_number" | while IFS=\| read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done         
  fi          
fi    
  if [[ ! $input =~ ^[0-9]+$ ]]
  then
    atomic_number=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name LIKE '$input%' ORDER BY atomic_number LIMIT 1")
    if [[ -z $atomic_number ]]
    then
        echo "I could not find that element in the database."
      else
        echo "$atomic_number" | while IFS=\| read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
        do
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done         
    fi
  fi   
fi