#!/bin/bash

proba="Ovo je proba"
echo $proba

lista_datoteka=$(ls *)
echo lista_datoteka = $lista_datoteka

proba3="$proba. $proba. $proba. "

a=4
b=3
c=7
d=$(((a+4)*b%c))
echo "a = $a"
echo "b = $b"
echo "c = $c"
echo "d = $d"

broj_rijeci=$(wc -w *.txt | tail -n 1 | awk '{print $1}')
echo "broj_rijeci = $broj_rijeci"

ls ~
