#!/bin/bash

if [ $# -eq 0 ]; then 
    echo "Missing one argument: the URL to process."
    # use an help function to display doc. 
    exit 1
fi
# le if fi précédent permet de préciser aux user si il n a pas mis d URL qu'il y a une erreur

if [ $# -gt 1 ]; then
    echo "Too many arguments."
    #use an help function to display doc.
    exit 2
fi
#le if fi précédent permet de préciser qu il y a trop d arugments

URL_REGEX='((https?:)?\/\/)?((([a-z0-9\-_]+\.)+[a-z]{2,})|(([0-9]{1,3}\.){3}[0-9]{1,3}))(\/[a-z0-9\-_]+)*\/?'

COUNT=`echo "$1" | grep -i -E -o "$URL_REGEX" | wc -l` 
#-i : insensible a la caste
#-E : permet d éviter la map d adaptation du Regex
#-o : permet de prendre que les parties utiles
#-l : 

if [ $COUNT -eq 0 ]; then
    echo "Not a valid URL."
    exit 3
fi

wget -q -O - "$1" | grep -i -E -o "$URL_REGEX" #wget récupére tous le code source de  la page , et le grep récupére juste les URL
#-q = quiet
#-O = préciser le dossier a ciblé
#$1 = nombre d'arguments ici l URL
