#!/bin/bash
FIRSTNAME=$1
LASTNAME=$2
SHOW=$3

if [ "$SHOW" = "true" ]; then
   echo "Hello, $FIRSTNAME $LASTNAME"
else
   echo "if you want to see the name, please mark the show option" 
fi


